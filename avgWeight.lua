------------
-- Average Weight Filter
-- This file contains a lua class for an Average Weight Filter.
-- @module avgWeight
-- @author Troy Manary
-- @copyright ExceleratedDesign 2015
--
local avgWeight = {}
avgWeight.__index = avgWeight

function avgWeight.new(factor, value)
  value = value or 0
  local self = setmetatable({}, avgWeight)
  self.x = value
  self.weight = factor
 return self
end

function avgWeight.reset(self, value)
  value = value or 0
  self.x = value
end

function avgWeight.update(self, value)
  self.x = (self.x * (1-self.weight) + value * self.weight)
  return self.x
end

function avgWeight.getValue(self)
  return self.x
end

function avgWeight.print(self)
  print(self.x)
end

function avgWeight.printState(self)
  print(self.x, self.weight)
end

return avgWeight