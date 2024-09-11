from nicotb import *
from seven import Seven
from PyQt5.QtWidgets import QApplication
import time

ITER = 1200
TIME_UNIT = 0.01
UNIT_PER_SIM = 10
CYCLE_PER_SLEEP = 1000

def main():
	ck_ev = CreateEvent("ck_ev")
	keys, hexs = CreateBuses([
		(("dut", "KEY"),),
		(
			("dut", "HEX7"),
			(None , "HEX6"),
			(None , "HEX5"),
			(None , "HEX4"),
			(None , "HEX3"),
			(None , "HEX2"),
			(None , "HEX1"),
			(None , "HEX0"),
		),
	])

	# QT related
	app = QApplication([""])
	seven = Seven()
	seven.show()
	for i in range(ITER):
		for j in range(UNIT_PER_SIM):
			time.sleep(TIME_UNIT)
			app.processEvents()
		keys.value[0] = 0
		for k in range(4):
			keys.value[0] = keys.value[0] << 1
			if not seven.buttons[3-k].isDown():
				keys.value[0] = keys.value[0] | 1
		keys.Write()
		hexs.Read()
		for i in range(CYCLE_PER_SLEEP):
			yield ck_ev
		for i, h in enumerate(seven.hexs):
			h.updateSignal(hexs.values[i][0], hexs.xs[i][0])
		if not seven.isVisible():
			break
	seven.close()
	FinishSim()

RegisterCoroutines([
	main(),
])
