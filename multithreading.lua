--[[ 
Coroutines allow you to write asynchronous, non-blocking code that can run in parallel with other parts of your script. 
Here's a simple example of how you could use coroutines in FiveM:
]]--

local function robbery()
  Citizen.CreateThread(function()
    -- Perform the ATM robbery
    -- ...

    -- Wait for the cooldown period
    Citizen.Wait(5 * 60 * 60 * 1000)
  end)
end

-- Register an event to trigger the robbery
RegisterNetEvent("startRobbery")
AddEventHandler("startRobbery", function()
  robbery()
end)

--[[
In this example, the robery function is run in a separate thread using Citizen.CreateThread. The function performs the ATM robbery, and then waits for the cooldown period using Citizen.Wait.
By using coroutines in this way, you can ensure that your FiveM script remains responsive even when processing long-running tasks, such as the ATM robbery. 
Additionally, by running each task in a separate thread, you can improve the performance and scalability of your script, allowing it to handle multiple requests and tasks simultaneously.
It's important to note that multithreading can also introduce new challenges, such as race conditions and synchronization issues. 
Careful planning and testing is required to ensure that your script remains stable and performant when using coroutines.
]]--


local function performRobbery()
  Citizen.CreateThread(function()
    -- Perform the ATM robbery
    -- ...
  end)
end

local function handleRequest(request)
  Citizen.CreateThread(function()
    -- Process the request
    -- ...
  end)
end

local function waitForRequests()
  while true do
    Citizen.Wait(0)

    -- Check for new requests
    -- ...

    -- If a new request is available, handle it
    if request then
      handleRequest(request)
    end
  end
end

-- Start the coroutines
Citizen.CreateThread(function()
  performRobbery()
  waitForRequests()
end)

--[[
In this example, we have three coroutines running in parallel: performRobbery, handleRequest, and waitForRequests.

The performRobbery coroutine performs the ATM robbery as described in the previous example.

The handleRequest coroutine processes individual requests. In this case, it could be a request from a player to rob an ATM, or any other type of request that needs to be handled by your script.

The waitForRequests coroutine is responsible for checking for new requests and dispatching them to the handleRequest coroutine. 
This coroutine runs in a loop and waits for requests using Citizen.Wait(0), which yields control to other parts of the script while still allowing the coroutine to be resumed later.

By using coroutines in this way, you can ensure that your FiveM script remains responsive even when processing multiple requests and tasks simultaneously. 
Additionally, you can easily manage and organize the different tasks and requests that need to be handled by your script, making it easier to maintain and scale over time.
]]--


