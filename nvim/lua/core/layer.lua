--- Layer management
-- @module core.layer

local plug = require("core.plug")
local reload = require("core.reload")
local log = require("core.log")

local layer = {}

layer.layers = {}

--- Register a layer to be loaded
--
-- @tparam string name The layer module path
function layer.add_layer(name)
  table.insert(
    layer.layers,
    {
      name = name,
      module = require(name),
    }
  )
end

local function err_handler(err)
  return {
    err = err,
    traceback = debug.traceback(),
  }
end

local function call_on_layers(func_name)
  for _, v in ipairs(layer.layers) do
    local ok, err = xpcall(v.module[func_name], err_handler)
    if not ok then
      log(" ")
      log.set_highlight("WarningMsg")
      log("Error while loading layer " .. v.name .. " / " .. func_name)
      log("================================================================================")
      log.set_highlight("None")
      log(err.err)
      log(" ")
      log.set_highlight("WarningMsg")
      log("Traceback")
      log("================================================================================")
      log.set_highlight("None")
      log(err.traceback)
      log(" ")
    end
  end
end

--- Start initializing all registered layers
function layer.finish_layer_registration()
  call_on_layers("register_plugins")
  plug.finish_plugin_registration()
  reload.update_package_path()
  call_on_layers("init_config")
end

return layer
