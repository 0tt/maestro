maestro.command("spawn", {"player:target"}, function(caller, targets)
	if not targets or #targets == 0 then
		return true, "Query matched no players."
	end
	for _, ply in pairs(targets) do
		ply:Spawn()
	end
	return false, "spawned %1"
end, [[
Forces a player to respawn.]])
