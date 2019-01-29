# Coursera Data Science: Exploratory Data Analysis
# Course project 2: Plot2
#
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# (fips=="24510") from 1999 to 2008? Use the base plotting system to make a 
# plot answering this question.
################################################################################

# Load the data
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

# Subset data
subsetNEI <- subset(NEI, fips == "24510")

# Aggregate data
aggregatedTotalByYear <- aggregate(Emissions ~ year, data=subsetNEI, sum)

# Plot 2
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))

# Save png
dev.copy(png, file = "plot2.png")
dev.off()
