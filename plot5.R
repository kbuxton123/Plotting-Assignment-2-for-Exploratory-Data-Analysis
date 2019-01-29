# Coursera Data Science: Exploratory Data Analysis
# Course project 2: Plot5
#
# How have emissions from motor vehicle sources changed 
# from 1999–2008 in Baltimore City? 
# Baltimore City fips = 24510
################################################################################

# Load the data
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# Load ggplot2
library(ggplot2)

# Subset data
subsetNEI <- subset(NEI, fips == "24510" & type == "ON-ROAD")

# Aggregate data
aggregatedTotalByYearAndType <- aggregate(Emissions ~ year, subsetNEI, sum)

# Plot 5
g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity", fill = "lightblue", color = "darkblue") +
    xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total Emissions from Motor Vehicle Sources from 1999 to 2008 in Baltimore City, MD')
print(g)

# Save png
dev.copy(png, file = "plot5.png", width=840, height=480)
dev.off()