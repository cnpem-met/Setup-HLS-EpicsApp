#!../../bin/linux-x86_64/SiriusHls

## You may have to change SiriusHls to something else
## everywhere it appears in this file

< envPaths
< config

epicsEnvSet("BL","${EPICS_HOSTNAME}")
epicsEnvSet("STREAM_PROTOCOL_PATH", "$(TOP)/db")

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/SiriusHls.dbd"
SiriusHls_registerRecordDeviceDriver pdbbase

# Multiple records (channel features)
dbLoadTemplate "../config/${BL}/devSiriusHls.substitions"

## Load Unique record instances
dbLoadRecords("db/dbSiriusHls.db","BL=$(BL),PORT=AE")

drvAsynIPPortConfigure ("AE", "$(IP_HLS):$(PORT_HLS) tcp", 0, 0, 0)     # used when a serial-Ethernet device is connected to the IOC

## Set this to see messages from mySub
#var mySubDebug 1

## Run this to trace the stages of iocInit
#traceIocInit

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncExample, "user=root"
