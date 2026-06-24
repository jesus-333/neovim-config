local make = require("default.custom_functions.ghost_backend._minuet")
local b = make("Ollama (minuet)", "ollama")
b.key = "minuet_ollama"
b.order = 4
return b
