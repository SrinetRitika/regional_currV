CSCrun <- T
vPREBAS = "master"   #### choose PREBAS version to run the model  "master" "v0.2.x" "newVersion"
load("input/pPRELES_calPcurrV.rdata")
load("input/pCROBAS_calPcurrV.rdata")
r_no = regions = 1 ### forest center ID
nSetRuns = 10 #number of set runs
nSitesRun = 20000
harvScen = "Base" ### c("Low","MaxSust","NoHarv","Base","Mitigation", "MitigationNoAdH","adapt","protect")
harvInten = "Base"
regSets <- "maakunta" ### "forCent", "maakunta"
minDharvX <- 15
rcps <- "CurrClim" ##name of clim files "CurrClim" "CanESM2.rcp26" "CanESM2.rcp45" "CanESM2.rcp85"
deadWoodCalc <- T
HSIruns <- F
