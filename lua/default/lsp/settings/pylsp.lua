return {
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = {'E128','E251','E261', 'E265', 'E302', 'E402','E305', 'E501','E701', 'W293'},
				},

				jedi_completion = {
					enabled = true,
					cache_for = {"pandas", "numpy", "tensorflow", "matplotlib", "torch"},
				},

				jedi_definition = {
					enabled = true,
				}
			}
		}
	}
}
