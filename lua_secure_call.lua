-- Forked from Pyseph (https://v3rmillion.net/showthread.php?tid=1029945)

local toProtect = {};
local oldTraceback;

-- locals $$$
local getrenv = getrenv
local debug = debug
local table = table
local clonef=clonefunction or clonefunc or function(...)return ... end

local gfn = clonef(game.GetFullName)

local setthreadcontext = setidentity or setthreadidentity or set_thread_identity or setthreadcontext or set_thread_context or (syn and syn.set_thread_identity) or function() end
local getthreadcontext = getidentity or getthreadidentity or get_thread_identity or getthreadcontext or get_thread_context or (syn and syn.get_thread_identity) or function() return 8 end

-- retarded code but w/e
local function isProtectedCaller(Function)
	for i = 0, 30 do
		local stackInfo = debug.getinfo(i);
		if stackInfo then
			if Function == stackInfo.func then
				return true;
			end;
		else
			break;
		end;
	end;
	return false;
end;

oldTraceback = hookfunction(debug.traceback, function()
	local stackTrace = oldTraceback();
	for Function, spoofedTrace in next, toProtect do
		if isProtectedCaller(Function) then

			-- enumerate through all lines and store in table, for easier replacing.
			local Lines = {};
			stackTrace:gsub('[^\n\r]+', function(Line)
				--replace exploit trace with spoofed trace
				Lines[#Lines + 1] = Line:gsub('^@:', spoofedTrace);
			end);

			-- Remove exploit traceback lines.
			table.remove(Lines, 1);
			table.remove(Lines, #Lines - 1);
			
			return table.concat(Lines, '\n') .. '\n';
		end;
	end;

	-- pattern match to remove first line, which would be this hookfunction hook.
	return stackTrace:match'[^\n\r]*\n?(.*)';
end);

getgenv().cus_secure_call = newcclosure(function(Function, Script, ...)
	--[[
		localize the current environment to restore 
		for later.
	]]--
	local old_env = getfenv();
	toProtect[Function] = gfn(Script) .. ':';
	--[[
		grab environment of script through getsenv.
		If it's nil then that means it has no
		globals or unique variables (or isn't running), 
		in which case switch to getrenv(), which is 
		the default environment of all roblox scripts.
	]]--
	local spoof_env = select(2, pcall(getsenv, Script));
	spoof_env = (type(spoof_env) == 'string' or not spoof_env) and getrenv() or spoof_env;
	spoof_env.script = spoof_env.script or Script;

	--[[
		spoof environment to match the script's, prevents 
		checks such as getfenv(2).decompile.
	]]--
	
	setthreadcontext(2); -- make sure to also spoof security context inbefore people do if game.HttpGet then
	local Level = 0;
	while true do
		if not pcall(setfenv, Level + 2, spoof_env) then
			break;
		end;
		Level = Level + 1;
	end;
	local securityContext = getthreadcontext()
	--// call the function, and pack the return into a table.
	local ret = table.pack( Function(...) ); 
	
	--[[
		restore the environment to the exploit's, 
		no need keep it spoofed as the function 
		has already been called.
	]]--
	for i = 0, Level do
		setfenv(i, old_env);
	end;

	setthreadcontext(securityContext) -- change security context back to default
	--// unpack the function's returns.
	return unpack(ret);
end);
--[[
	secure_call(function Function, script Script, FunctionArgs ...)
]]--
