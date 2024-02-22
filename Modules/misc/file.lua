local file = class:create("file")
file.public.validPointers = {
  rootDir = "~/",
  localDir = "@/"
}

function file.public:exists(path)
  if not path or (type(path) ~= "string") then return false end
  local file = io.open(path, "r")

  if (file) then
      io.close(file)
      return true
  else
      return false
  end
end

function file.public:delete(path)
  if not file.public:exists(path) then return false end
  return os.remove(path)
end

function file.public:read(path)
  if not file.public:exists(path) then return false end
  local cFile = io.open(path, "r")
  if not cFile then return false end
  local data = cFile:read("*a")
  io.close(cFile);
  return data
end

function file.public:write(path, data)
  if not path or (type(path) ~= "string") or not data then return false end
  local cFile = io.open(path, "w+");
  if not cFile then return false end
  cFile:write(data)

  io.close(cFile)
  data = nil
  collectgarbage()
  return true
end