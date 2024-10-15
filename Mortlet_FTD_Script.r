# Load required libraries
library(biwavelet)  # for wavelet coherence analysis
library(readxl)     # for reading Excel files

# Display help documentation for biwavelet package
help("biwavelet")

# Read in data from Excel file (update file path as needed)
Data <- read_xlsx("U:\\Mortlet\\GME_OUT_3_Bigger.xlsx")

# Attach the data to the R environment
attach(Data)

# Create time series data frames for Close and GmeVolume
t1 = cbind(1:61, Close)  # time series with Close values
t2 = cbind(1:61, GmeVolume)  # time series with GmeVolume values

# Set number of random permutations for wavelet coherence analysis
nrands = 1000

# Perform wavelet coherence analysis on t1 and t2
wtc.AB = wtc(t1, t2, nrands = nrands)

# Set plot parameters
par(oma = c(0, 0, 0, 1), mar = c(5,4,5,5) + 0.3)

# Plot wavelet coherence results
plot(wtc.AB, 
     plot.phase = TRUE,  # plot phase arrows
     lty.coi = 1,  # line type for coherence contours
     col.coi = "gray",  # color for coherence contours
     lwd.coi = 2,  # line width for coherence contours
     lwd.sig = 2,  # line width for significance contours
     arrow.lwd = 0.03,  # line width for phase arrows
     arrow.len = 0.12,  # length of phase arrows
     ylab = "Period",  # y-axis label
     xlab = "Time",  # x-axis label
     plot.cb = TRUE,  # plot color bar
     main = "GameStop Close vs FNDA FTD Volume 2024",  # plot title
     xaxt = "n")  # suppress default x-axis

# Get length of time series
n = length(t1[,1])

# Add grid lines to plot
abline(v = seq(12, n,12), h = 1:16, col = "black", lty = 1, lwd = 1)

# Define custom x-axis labels
axis(side = 3, at = c(seq(0, n, 260)), labels = c(seq(2024, 2024, 2)))
