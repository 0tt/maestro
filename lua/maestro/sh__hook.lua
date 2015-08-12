--being ULX without actually being ULX
maestro.hooks = maestro.hooks or {}
function maestro.hook(name, id, func)
    local n = hook.GetTable()[name]
    if not n or not n.maestro_hook then
        maestro.hooks[name] = {}
        hook.Add(name, "maestro_hook", function(...)
            for i = 1, #maestro.hooks[name] do
                local ret = {xpcall(maestro.hooks[name][i].func, ErrorNoHalt, ...)}
                if ret[1] then
                    table.remove(ret, 1)
                    if ret[1] ~= nil then
                        return unpack(ret)
                    end
                end
            end
        end)
    end
    table.insert(maestro.hooks[name], {id = id, func = func})
end
function maestro.hookremove(name, id)
    if not maestro.hooks[name] then return end
    for i = 1, #maestro.hooks[name] do
        local h = maestro.hooks[name][i]
        if i.id == id then
            table.remove(maestro.hooks[name], i)
            return
        end
    end
end
