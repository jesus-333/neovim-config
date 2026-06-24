-- completion/minuet_preset/ollama.lua
return {
  name = "ollama",
  config = {
    provider = "openai_fim_compatible",
    provider_options = {
      openai_fim_compatible = {
        name = "Ollama",
        api_key = "TERM",
        end_point = "http://localhost:11434/v1/completions",
        model = "qwen2.5-coder:7b",
      },
    },
  },
}
