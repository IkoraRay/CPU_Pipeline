view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 500ps -dutycycle 50 -starttime 0ps -endtime 5000ps sim:/cpu/Clock 
wave create -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 5000ps sim:/cpu/Resetn 
wave modify -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 500ps Edit:/cpu/Resetn 
WaveCollapseAll -1
wave clipboard restore
