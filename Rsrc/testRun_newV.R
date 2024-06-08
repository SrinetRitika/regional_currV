# define the settings
CSCrun <- T
setwd("/scratch/project_2000994/srinetri/regional/regional_newV")
load("input/pPRELES_newVcalP_CN.rdata")
load("input/pCROBAS_newVcalP_CN.rdata")
r_no <- regions <- 1 ### forest center ID
nSetRuns <- 10 #number of set runs
harvScen <- "Base" ### c("Low","MaxSust","NoHarv","Base","Mitigation", "MitigationNoAdH","adapt","protect")
harvInten <- "Base"
regSets <- "maakunta" ### "forCent", "maakunta"
minDharvX <- 15
rcpfile <- rcps <- "CurrClim"#CanESM2.rcp26" ##name of clim files ("CanESM2.rcp45.rdata","CanESM2.rcp85.rdata")#c("CurrClim","CanESM2.rcp26.rdata")#,"CanESM2.rcp45.rdata","CanESM2.rcp85.rdata")
# climIDName <- "clim1800" ### climIDs for ISIMIP resolutions and clim files
# outType <- "testRun"
deadWoodCalc <- F
HSIruns <- F
# forceSaveInitSoil <- T

# pcrobas <- pCROB
# pcrobas[1:53,1:3] <- pCROBAS_calPcurrV[, 1:3]
# pCROBAS_calPcurrV <- pcrobas
# save(pCROBAS_calPcurrV, file="input/pCROBAS_calPcurrV.rdata") 

##load general settings
source("Rsrc/settings_newV.r")
##load functions
source("Rsrc/functions_newV.r")

setX <- 1
nSitesRun = 10
nSamples <- ceiling(dim(data.all)[1]/nSitesRun)
sampleID <- split(1:nSamples,             # Applying split() function
                  cut(seq_along(1:nSamples),
                      nSetRuns,
                      labels = FALSE))[[setX]]

set.seed(1)
ops <- split(data.all, sample(1:nSamples, nrow(data.all), replace=T))

for (i in c(1:5)){
  sampleX <- ops[[i]]
  start_time <- Sys.time()
  ####run the model with base scenario and initialize the soilC
  modRun_Base <- runModel(sampleID[[i]], outType="dTabs", harvScen=harvScen, harvInten=harvInten, sampleX = sampleX)
  #gc() # Release memory
  ### HOW LOG IT TOOK TO RUN THE CODE
  end_time <- Sys.time()
  execution_time <- end_time - start_time
  execution_time_mins <- as.numeric(execution_time, units = "mins")
  cat("Script's execution time was ",round(execution_time_mins,1), " minutes.",sep="")
}

### -----------------------------------------------------------------
### CHECK RESUTS
### -----------------------------------------------------------------
modRun_Base1800 <- modRun_Base$region$multiOut
dailyPRELES_Base1800 <- modRun_Base$region$dailyPRELES
save(modRun_Base1800, dailyPRELES_Base1800, file="outputDT/outputs_1800.rdata")
# 
# 
# modRun_Base300 <- modRun_Base$region$multiOut
# dailyPRELES_Base300 <- modRun_Base$region$dailyPRELES
# save(modRun_Base300, dailyPRELES_Base300, file="outputDT/outputs_300.rdata")
# 
# modRun_Base90 <- modRun_Base$region$multiOut
# dailyPRELES_Base90 <- modRun_Base$region$dailyPRELES
# save(modRun_Base90, dailyPRELES_Base90, file="outputDT/outputs_90.rdata")

varX <- c(11,12,13,14,17,30,24,33)
varNam <- c("H","D","BA","Hc_base","Ntree","V","Wbranch","Wfoliage")

for (i in 1:length(varX)){
  plot(modRun_Base1800[1,,varX[i],1,1], type = "l", lty= 1, ylab = varNam[i], ylim= range(modRun_Base1800[1,,varX[i],1:3,1]))
  lines(modRun_Base1800[1,,varX[i],2,1], lty= 2)
  lines(modRun_Base1800[1,,varX[i],3,1], lty= 3)
  
  # lines(modRun_Base300[1,,varX[i],1,1], lty= 1, col=2)
  # lines(modRun_Base300[1,,varX[i],2,1], lty= 2, col=2)
  # lines(modRun_Base300[1,,varX[i],3,1], lty= 3, col=2)
  # 
  # lines(modRun_Base90[1,,varX[i],1,1], lty= 1, col=3)
  # lines(modRun_Base90[1,,varX[i],2,1], lty= 2, col=3)
  # lines(modRun_Base90[1,,varX[i],3,1], lty= 3, col=3)
}


plot(dailyPRELES_Base1800[1,,1], type = "l", lty= 1)
# lines(dailyPRELES_Base300[1,,1], lty= 2,col=2)
lines(dailyPRELES_Base90[1,,1], lty= 3, col=3)