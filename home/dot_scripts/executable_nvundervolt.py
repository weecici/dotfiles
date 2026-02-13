#!/usr/bin/env python
from ctypes import byref

from pynvml import *

nvmlInit()

device = nvmlDeviceGetHandleByIndex(0)
nvmlDeviceSetGpuLockedClocks(device, 210, 2100)
# nvmlDeviceSetPowerManagementLimit(device, 315000)

info = c_nvmlClockOffset_t()
info.version = nvmlClockOffset_v1
info.type = NVML_CLOCK_GRAPHICS
info.pstate = NVML_PSTATE_0
info.clockOffsetMHz = 200

nvmlDeviceSetClockOffsets(device, byref(info))

nvmlShutdown()
