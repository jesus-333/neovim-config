-- completion/minuet_preset/mlx.lua
return {
  name = "mlx",
  config = {
    provider = "openai_compatible",
    provider_options = {
      openai_compatible = {
        name = "mlx-lm",
        api_key = "TERM",
        end_point = "http://localhost:8080/v1/chat/completions",
        model = "your-mlx-model",
      },
    },
  },
}
