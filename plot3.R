# Coursera Data Science: Exploratory Data Analysis
# Course project 2: Plot3
#
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999 2008 for Baltimore City? 
# Which have seen increases in emissions from 1999 2008? 
# Use the ggplot2 plotting system to make a plot answer this question.
# Baltimore City - fips = 24510
################################################################################

# Load the data
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# Load ggplot2
library(ggplot2)

# Subset data
subsetNEI <- subset(NEI, fips == "24510")

# Aggregate data
aggregatedTotalByYearAndType <- aggregate(Emissions ~ year + type, subsetNEI, sum)

# Plot 3
g <- ggplot(aggregatedTotalByYearAndType, aes(year, Emissions, color = type))
g <- g + geom_line() +
    xlab("year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total Emissions in Baltimore City, MD (fips == "24510") from 1999 to 2008')
print(g)

# Save png
dev.copy(png, file = "plot3.png", width=640, height=480)
dev.off()