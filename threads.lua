local Threads = require 'threads'

Threads.serialization('threads.sharedserialize')

local workers = Threads(8, function()
  require 'torch'
end)

local result = workers:addjob(function()
  return torch.Tensor(1000000):fill(1)
end):get()

print(result:sum())

--[[
the code is using the threads library to create 8 worker threads. 
The workers:addjob function is used to add a job to the worker threads, 
in this case the creation of a large tensor filled with ones and its sum calculation. 
The :get() function is used to retrieve the result from the worker thread. 
The use of multithreading allows for parallel processing and can greatly improve performance, 
particularly when dealing with complex computations or tasks that take a long time to complete.
]]--
