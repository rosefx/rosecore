local describe, it, expect = lust.describe, lust.it, lust.expect



if (ROSE_ENV == "development") then 
  describe("FileSystem Test Suite", function () 
    it("should be able to check if file exists", function ()
      local result = file:exists(GetResourcePath(CONSTANTS.RESOURCE_NAME).."/spec/resources/test-file.txt")
      expect(result).to.equal(true);
    end);

    it("should be not able to return true if file not exists", function ()
      local result = file:exists(GetResourcePath(CONSTANTS.RESOURCE_NAME).."/spec/resources/test-123455.txt")
      expect(result).to.equal(false);
    end);


    it("should be able to open and read exists file", function () 
      local result = file:read(GetResourcePath(CONSTANTS.RESOURCE_NAME).."/spec/resources/test-file.txt")
      expect(result).to.equal("Hello World;");
    end);

    it("should be able to delete existing file", function () 
      local __path = GetResourcePath(CONSTANTS.RESOURCE_NAME).."/spec/resources/test-1234.txt";
      local result = file:write(__path, "Thats Awesome!");

      local delete = file:delete(__path);
      expect(delete).to.equal(true)
    end);

    it("should be able to create and write a file", function () 
      local __path = GetResourcePath(CONSTANTS.RESOURCE_NAME).."/spec/resources/test-temp.txt";
      local result = file:write(__path, "Thats Awesome!");
      expect(result).to.equal(true);

      local exists = file:exists(__path);
      expect(result).to.equal(true);

      local delete = file:delete(__path);
      expect(delete).to.equal(true)
    end);

    
  end);
end