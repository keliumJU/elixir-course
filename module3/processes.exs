#Processes
#chracteristics: 
# 1. Isolated from each other
# 2. run concurrent to one another
# 3. communicate via message passing
# 4. Are extremely lightweight in terms of memory and CPU(tens or even hundreds of thusands of processes running simultaneously)

#Spawn
#Note: Basic mechanism for spawning new processes spawn/1
IO.puts("Spawn")
IO.inspect(spawn(fn->1+2 end))
#Returns PID(process identifier)
IO.puts("At this point, the process spawned is very likely dead")
IO.puts("The process execute the given function and exit after the funciton is done")
pid = spawn(fn -> 1+2 end)
IO.inspect(pid)
IO.inspect(Process.alive?(pid))
IO.puts("current process live")
IO.puts("self() -> #{inspect(self())}")
IO.inspect(Process.alive?(self()))

#send and receive messages
IO.puts("")
IO.puts("send and receive")
IO.inspect(send(self(),{:hello,"world"}))
receivedo=receive do
  {:hello,msg} -> msg
  {:world, _msg} -> "won't match"
end
IO.inspect(receivedo)
#Notes: when a message is sent to a process, the message is stored in the process mailbox.
IO.puts("send messages between processes: ")
parent=self()
IO.inspect(parent)
IO.inspect(spawn(fn -> send(parent,{:hello, self()}) end))
#Note self() -> PID of current process
receivedo = receive do
  {:hello, pid} -> "Got hello from #{inspect(pid)}"
end
IO.inspect(receivedo)
IO.puts("flush/0 it flushes and prints all the messages in the mailbox")
IO.puts("only works in the shell ...")
#send(self(), :hello)
#flush()

#Links
IO.puts("")
IO.puts("Links")
#Note: if we want the failure in one process to propagate to another one, we should link them.
IO.inspect(self())
IO.puts("spawn_link(fn->raise\"oops\" end) -> error in current process and the caller process")
#Notes: 
# 1. Process and links play an important role when building fault-tolerant systems
# 2. Links allow processes to establish a relationship in case of failure.
# 3. "Failing fast" -> supervisors to properly restart our systems.

#Task
#:=> abstractions that build on top of spawn/1 and spawn_link/1
IO.puts("")
IO.puts("Tasks")
IO.puts("provide better error reports and instrospection")
IO.puts("Task.start(fn -> raise \"oops\" end)\" -> {:ok, PID}")

#State
#process that save data - maintain state
IO.puts("")
IO.puts("state")
defmodule KV do
  def start_link do
    Task.start_link(fn -> loop(%{}) end)
  end

  defp loop(map) do
    receive do
      {:get, key, caller} ->
        send caller, Map.get(map,key)
        loop(map)
      {:put, key, value} ->
        loop(Map.put(map,key,value))
    end
  end
end
#explanation, start a process with task.start_link then with an infinite loop wait for some clause to match (pattern matching)
#if it matches the tuple of the atom :get the value of the map is returned based on the key to the process that sent the caller message,
#if it is with the atom tuple :put an element is inserted to the map
IO.puts("try by running")
{:ok, pid} = KV.start_link()
IO.inspect({:ok, pid})
send(pid, {:put, :hello, :world})
send(pid, {:get, :hello, self()})
#flush() in the shell

#Register process
IO.puts("")
IO.puts("Register process through PID")
#Note: allowing everyone that knows the name to send it messages
IO.inspect(Process.register(pid, :kv))
IO.inspect(send(:kv, {:get, :hello, self()}))
#flush() in the shell

#Agents
IO.puts("")
IO.puts("Agents")
IO.puts("simple abstraction around state")
IO.inspect({:ok, pid} = Agent.start_link(fn -> %{} end))
IO.inspect(pid)
IO.inspect(Agent.update(pid, fn map -> Map.put(map, :hello, :world) end))
IO.inspect(Agent.get(pid, fn map -> Map.get(map, :hello) end))
#Explanation: through an Agent we create a process that initializes an empty map, 
#then we use the update functions to add an element to the map ":hello, :world" key, value 
#and then we use the get function to obtain the element that we previously added to the process.
