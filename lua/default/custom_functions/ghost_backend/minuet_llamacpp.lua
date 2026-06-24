local make = require("default.custom_functions.ghost_backend._minuet")
local b = make("llama.cpp (minuet)", "llamacpp")
b.key = "minuet_llamacpp"
b.order = 2
return b
