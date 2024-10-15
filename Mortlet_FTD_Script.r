# Morlet Wavelet Coherence Graphing Tool On Financial Failed-To-Deliver and closing stock price. 
# By: James Grandoff 
# Notes
# Change read_xlsx("") with whatever dataset you want compared 
# Line 1 of your data file should contain the labels for the dataset for cohesion testing
# Please follow along smaller dataset format when dealing with big data sets(1G+)
# par() function is used for wavelet coherence and phase difference and finally make room for the color bar on the right side.
# The cbind(1:x, column_name) will vary depending on how many columns you have loaded. We are now clustering the data, which can be done an exponential amount of times. 
# nrands is the amount of simulations you want the dataset to endure. nrands should be large (>= 1000) for respectable results.
# abline is the function for plotting the graph with lines, the v = seq(x, n, x) will represent the time of the data(i.e., Length) 4 = 1 Month 52 = 1 Year 
# On the X-Axis should define the time period that should plot. 
#
# [*Future fix]: Why doesn't the X-Axis plot the timeline (Janury 2024, Febuary 2024)

library(biwavelet)
library(readxl)

help("biwavelet")

Data <- read_xlsx("U:\\Mortlet\\GME_OUT_3_Bigger.xlsx") #Change to your file path
attach(Data)

t1 = cbind(1:61, Close) 
t2 = cbind(1:61, GmeVolume)

nrands = 1000 

wtc.AB = wtc(t1, t2, nrands = nrands)
par(oma = c(0, 0, 0, 1), mar = c(5,4,5,5) + 0.3)
plot(wtc.AB, plot.phase = TRUE, lty.coi = 1, col.coi = "gray", lwd.coi = 2, lwd.sig = 2, arrow.lwd = 0.03, arrow.len = 0.12, ylab = "Period", xlab = "Time", plot.cb = TRUE, main = "GameStop Close vs FNDA FTD Volume 2024 ", xaxt = "n")
n = length(t1[,1])
#Square Plotting Of Time 
abline(v = seq(12, n,12), h = 1:16, col = "black", lty = 1, lwd = 1)
#define X-Axis
axis(side = 3, at = c(seq(0, n, 260)), labels = c(seq(2024, 2024, 2)))

