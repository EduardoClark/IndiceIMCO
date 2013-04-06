### RUN ALL for IMCO reclasification proyect

##Load Libraries
source("src/LoadLibraries.R")
remove(list=ls())

## Start with Derecho subvariables
source("src/SetupDerecho.R") #Setup 
source("src/ImputacionDerecho.R") #IM

## Economia subvariables
##Not Run
#source("src/SetupDerecho.R") #Setup 
#source("src/ImputacionDerecho.R") #IM

## Gobierno subvariables
source("src/SetupGobierno.R") #Setup 
source("src/ImputacionGobierno.R") #IM

## Innovación subvariables
source("src/SetupInnovacion.R") #Setup 
source("src/ImputacionInnovacion.R") #IM

## Medio Ambiente subvariables
source("src/SetupMedioAmbiente.R") #Setup 
source("src/ImputacionMedioAmbiente.R") #IM

## Precursos subvariables






