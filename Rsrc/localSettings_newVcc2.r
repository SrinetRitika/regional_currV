CSCrun <- T
vPREBAS = "newVersion"   #### choose PREBAS version to run the model  "master" "v0.2.x" "newVersion"
load("input/pPRELES_newVcalP_CN.rdata")
load("input/pCROBAS_newVcalP_CN.rdata")
r_no = regions = 1 ### forest center ID
nSetRuns = 10 #number of set runs
nSitesRun = 20000
harvScen = "Base" ### c("Low","MaxSust","NoHarv","Base","Mitigation", "MitigationNoAdH","adapt","protect")
harvInten = "Base"
regSets <- "maakunta" ### "forCent", "maakunta"
minDharvX <- 15
rcps <- "CanESM2.rcp85" ##name of clim files "CurrClim" "CanESM2.rcp26" "CanESM2.rcp45" "CanESM2.rcp85"
deadWoodCalc <- F
HSIruns <- F
forceSaveInitSoil <- TCSCrun = T