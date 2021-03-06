avgWeight = require"avgWeight"
local factor = 0.1 -- use 10% of new value and 90% of current value
local data = {}
local result
local testPass = true

file = arg[1] or "test\\dataFile.txt"
autoVerify = arg[2] or false

dataFile = io.open(file, "r")
if (autoVerify) then
  resultFile = io.open("test\\resultFile.txt", "r")
end

repeat
  str = dataFile:read()
  if str then
    local i=0
    for val in string.gmatch(str, '([^ ]+)') do
	  data[i] = tonumber(val)
	  i=i+1
	end
	if not avgWeightFilter then
      avgWeightFilter = avgWeight.new(factor, data[1])
	  init=false
	else
	  result = avgWeightFilter:update(data[1])
	  if (autoVerify) then
	    resultStr = resultFile:read()
	    if (math.abs(result-tonumber(resultStr))>0.00000001) then
		  print("Test Failed: Result=", result," Expected:",resultStr)
		  testPass = false
		end
	  else
	    print(result)
	  end
	end
  end
until not str
if (autoVerify and testPass) then
    print("Test Passed")
end
	
