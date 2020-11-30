view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 500ps -dutycycle 50 -starttime 0ps -endtime 2800ps sim:/cpu/Clock 
wave create -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 2800ps sim:/cpu/Resetn 
wave modify -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 500ps Edit:/cpu/Resetn 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 500ps -dutycycle 50 -starttime 0ps -endtime 28000ps Edit:/cpu/Clock 
wave modify -driver freeze -pattern constant -value 1 -starttime 500ps -endtime 28000ps Edit:/cpu/Resetn 
wave modify -driver freeze -pattern clock -initialvalue 1 -period 500ps -dutycycle 50 -starttime 0ps -endtime 28000ps Edit:/cpu/Clock 
WaveCollapseAll -1
wave clipboard restore
