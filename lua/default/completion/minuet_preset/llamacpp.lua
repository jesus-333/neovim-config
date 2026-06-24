-- completion/minuet_preset/llamacpp.lua
return {
  name = "llamacpp",
  config = {
    provider = "openai_fim_compatible",
    provider_options = {
      openai_fim_compatible = {
        name = "llama.cpp",
        api_key = "TERM",
        end_point = "http://localhost:8012/v1/completions",
        model = "qwen2.5-coder",
      },
    },
  },
}
