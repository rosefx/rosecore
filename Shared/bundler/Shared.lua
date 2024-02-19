local bundler = bundler:import()

bundler.private:createBuffer("imports", _, [[
    if (not rose) then
        rose = {};
        ]]..bundler.private:createModule("namespace")..[[
        ]]..bundler.private:createUtils()..[[
        rose.imports = {
            resourceName = "rosecore",
            type = type,
            pairs = pairs,
            pcall = pcall,
            assert = assert,
            setmetatable = setmetatable,
            string = string,
            table = table
        };
    end
]])