TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = SiriusHls
# ArduinoEthernet.dbd will be created and installed
DBD += SiriusHls.dbd

# ArduinoEthernet.dbd will be made up from these files:
SiriusHls_DBD += base.dbd
SiriusHls_DBD += asyn.dbd
SiriusHls_DBD += stream.dbd           
SiriusHls_DBD += drvAsynIPPort.dbd


# Include dbd files from all support applications:
#ArduinoEthernet_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#ArduinoEthernet_LIBS += xxx

# ArduinoEthernet_registerRecordDeviceDriver.cpp derives from ArduinoEthernet.dbd
SiriusHls_SRCS += SiriusHls_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
SiriusHls_SRCS_DEFAULT += SiriusHlsMain.cpp
SiriusHls_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#ArduinoEthernet_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
SiriusHls_LIBS += $(EPICS_BASE_IOC_LIBS)
SiriusHls_LIBS += stream asyn calc

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

