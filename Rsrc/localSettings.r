CSCrun = T
load("input/pPRELES_calPcurrV.rdata")
load("input/pCROBAS_calPcurrV.rdata")
r_no = regions = 1 ### forest center ID
nSetRuns = 10 #number of set runs
harvScen = "Base" ### c("Low","MaxSust","NoHarv","Base","Mitigation", "MitigationNoAdH","adapt","protect")
harvInten = "Base"
regSets <- "maakunta" ### "forCent", "maakunta"
minDharvX <- 15
rcps <- "CurrClim" ##name of clim files