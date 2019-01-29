# Coursera Data Science: Exploratory Data Analysis
# Course project 2: Plot6
#
# Compare emissions from motor vehicle sources in Baltimore City with emissions 
# from motor vehicle sources in Los Angeles County, CA. Which city has seen greater changes over time in motor vehicle emissions?
# Baltimore City fips=="24510", Los Angeles - fips=="06037"
################################################################################

# Load the data
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# Load ggplot2
library(ggplot2)

# Subset data
subsetNEI <- subset(NEI, (fips=="24510"|fips=="06037") & type == "ON-ROAD")

# Aggregate data
aggregatedTotalByYearAndFips <- aggregate(Emissions ~ year + fips, subsetNEI, sum)
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="24510"] <- "Baltimore, MD"
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="06037"] <- "Los Angeles County, CA"

# Plot 6
g <- ggplot(aggregatedTotalByYearAndFips, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
    xlab("year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total Emissions from Motor Vehicle Sources from 1999 to 2008 in Baltimore City, MD vs Los Angeles County, CA')
print(g)

# Save png
dev.copy(png, file = "plot6.png", width=1040, height=480)
dev.off()