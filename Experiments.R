#########################################################################################################################
### Project  : 
### Script   : 
### Contents : 
#########################################################################################################################

#########################################################################################################################
### Setting up Environment
#########################################################################################################################

# Load library and functions
library(DJL)
source("dm.dynamic.et.R")

# Load data
df.b.bg <- read.csv(url("http://bit.ly/Budget4Iranbank"), header = T)
df.b.2d <- read.csv(url("http://bit.ly/Data4Iranbank"),   header = T)
df.b.3d <- simplify2array(by(df.b.2d[, -c(1)], df.b.2d$Period, as.matrix))

# Parameter
id.t <- c(7)
id.x <- c(1:2)
id.y <- c(4:6)
id.z <- c(3)
rts  <- "vrs"


#########################################################################################################################
### Iran Bank
#########################################################################################################################

# Table 1. Efficiency score
res.b.et <- dm.dynamic.et(df.b.3d[, id.x, ], df.b.3d[, id.y, ], df.b.3d[, id.z, ], df.b.bg[, 3], rts)
table.2  <- t(cbind(res.b.et$eff.t, res.b.et$eff))
table.2

# From Table 6. Virtual bank: B01 + B06 + B10
df.v.bg <- read.csv(url("http://bit.ly/VBudget4Iranbank"), header = T)
df.v.2d <- read.csv(url("http://bit.ly/Virtual4Iranbank"), header = T)
df.v.3d <- simplify2array(by(df.v.2d[, -c(1)], df.v.2d$Period, as.matrix))
res.v.et <- dm.dynamic.et(df.v.3d[, id.x, ], df.v.3d[, id.y, ], df.v.3d[, id.z, ], df.v.bg[, 3], rts)
table.2  <- t(cbind(res.v.et$eff.t, res.v.et$eff))
table.2
