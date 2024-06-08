CSCrun = T
load("input/pPRELES_calPcurrV.rdata")
load("input/pCROBAS_calPcurrV.rdata")
r_no = regions = 5 ### forest center ID
nSetRuns = 10 #number of set runs
nSitesRun = 20000
harvScen = "NoHarv" ### c("Low","MaxSust","NoHarv","Base","Mitigation", "MitigationNoAdH","adapt","protect")
harvInten = "Base"
regSets <- "maakunta" ### "forCent", "maakunta"
minDharvX <- 15
rcps <- "CurrClim" ##name of clim files
deadWoodCalc <- T
HSIruns <- F