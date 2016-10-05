wifi.setmode(wifi.STATION)
    wifi.sta.config("siska","siska144siska144")
    print(wifi.sta.getip())
led1 = 3
led2 = 4
gpio.mode(led1, gpio.OUTPUT)
gpio.mode(led2, gpio.OUTPUT)
responseHeader = function(code, type)
  return "HTTP/1.1 " .. code .. "\r\nConnection: close\r\nServer: Lua\r\nContent-Type: " .. type .. "\r\n\r\n";
end
srv=net.createServer(net.TCP)
srv:listen(999,function(conn)
    conn:on("receive", function(client,request)
       -- local buf = "";
        local _, _, method, path, vars = string.find(request, "([A-Z]+) (.+)?(.+) HTTP");
        if(method == nil)then
            _, _, method, path = string.find(request, "([A-Z]+) (.+) HTTP");
        end
        local _GET = {}
        if (vars ~= nil)then
            for k, v in string.gmatch(vars, "(%w+)=(%w+)&*") do
                _GET[k] = v
            end
        end
local name=string.sub(path, 2) 
if (name=="" or file.list()[name] == nil)then
name="index.html"
 end
print("Start sending: ", name)
local continue = true
   local size = file.list()[name]
   local bytesSent = 0
   local chunkSize = 1024
   client:send(responseHeader("200 OK","text/html"));
   while continue do
      collectgarbage()
      file.open(name)
      file.seek("set", bytesSent)
      local chunk = file.read(chunkSize)
      file.close(name)
      client:send(chunk)
      bytesSent = bytesSent + #chunk
      chunk = nil
      print("Sent: " .. bytesSent .. " of " .. size)
      if bytesSent == size then continue = false end
   end
   print("Finished sending: ", name)
    
     --   buf = buf.."<h1> ESP8266 Web Server</h1>";
     --   buf = buf.."<p>GPIO0 <a href=\"?pin=ON1\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF1\"><button>OFF</button></a></p>";
     --   buf = buf.."<p>GPIO2 <a href=\"?pin=ON2\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF2\"><button>OFF</button></a></p>";
        local _on,_off = "",""
        if(_GET.pin == "ON1")then
              gpio.write(led1, gpio.LOW);
        elseif(_GET.pin == "OFF1")then
              gpio.write(led1, gpio.HIGH);
        elseif(_GET.pin == "ON2")then
              gpio.write(led2, gpio.LOW);
        elseif(_GET.pin == "OFF2")then
              gpio.write(led2, gpio.HIGH);
        end
   --     client:send(buf);
  print("GET ",  _GET.pin);
        client:close();
        collectgarbage();
    end)
end)
