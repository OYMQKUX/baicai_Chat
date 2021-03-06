local skynet = require "skynet"
local pb = require "pbmanager"

skynet.start(function()
  pb.register_file("messages.pb")
  local db = skynet.newservice("db")
  local res1 = skynet.call(db, "lua", "SET", "hello", "world")
  local res2 = skynet.call(db, "lua", "GET", "hello")
  if not res1 then
    res1 = "nil"
  end
  print("SET : "..res1.."\n")
  print("GET : "..res2.."\n")

require "skynet.manager"
end)