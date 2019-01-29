# Coursera Data Science: Exploratory Data Analysis
# Course project 2: Plot4
#
# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999–2008?
################################################################################

# Load the data
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# Merch 2 data sets
NEISCC <- merge(NEI, SCC, by="SCC")

# Load ggplot2
library(ggplot2)

# fetch all NEIxSCC records with Short.Name (SCC) Coal
coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subsetNEISCC <- NEISCC[coalMatches, ]

# Aggregate data
aggregatedTotalByYearAndType <- aggregate(Emissions ~ year, subsetNEISCC, sum)

# Plot 4
g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
    xlab("year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total Emissions from Coal Combustion Sources from 1999 to 2008')
print(g)

# Save png
dev.copy(png, file = "plot4.png", width=640, height=480)
dev.off()