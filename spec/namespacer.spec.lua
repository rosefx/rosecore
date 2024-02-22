local describe, it, expect = lust.describe, lust.it, lust.expect


function PrintTable(tbl, depth, n)
  n = n or 0;
  depth = depth or 5;

  if (depth == 0) then
      print(string.rep(' ', n).."...");
      return;
  end

  if (n == 0) then
      print(" ");
  end

  for key, value in pairs(tbl) do
      if (key and type(key) == "number" or type(key) == "string") then
          key = string.format("[\"%s\"]", key);

          if (type(value) == "table") then
              if (next(value)) then
                  print(string.rep(' ', n)..key.." = {");
                  PrintTable(value, depth - 1, n + 4);
                  print(string.rep(' ', n).."},");
              else
                  print(string.rep(' ', n)..key.." = {},");
              end
          else
              if (type(value) == "string") then
                  value = string.format("\"%s\"", value);
              else
                  value = tostring(value);
              end

              print(string.rep(' ', n)..key.." = "..value..",");
          end
      end
  end

  if (n == 0) then
      print(" ");
  end
end
if (ROSE_ENV == "development") then 
  describe("Namespacer Test Suite", function () 
    it("should be able to create a namespace", function () 
      local namespace = namespace:create("test-namespace");
      expect(namespace).to.be.a("table");
    end)

    it("should be able to destroy a namespace", function () 
      local result = namespace:destroy("test-namespace");
      expect(result).to.equal(true);
    end);



    it("should be able to create a class", function ()
      local namespace = class:create("test-namespace");
      expect(namespace).to.be.a("table");
    end);
  
    it("should not be able to create a class with an existing name", function () 
      local namespace1 = class:create("test-namespace1");
      local namespace2 = class:create("test-namespace1");
  
      expect(namespace1).to.be.a("table");
      expect(namespace2).to.equal(false);
    end);
  
    it("should be able to call methods", function () 
      local namespace = class:create("test-methods");
      namespace.public.test = true;
      namespace.private.test = false;
  
      expect(namespace.public.test).to.equal(true);
      expect(namespace.private.test).to.equal(false);
    end);
  end);  
end