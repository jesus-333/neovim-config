-- Keymaps to work with registers

local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Yank to registers
keymap("n", "<leader>ya","V\"ay", opts)
keymap("n", "<leader>yb","V\"by", opts)
keymap("n", "<leader>yc","V\"cy", opts)
keymap("n", "<leader>yd","V\"dy", opts)
keymap("n", "<leader>ye","V\"ey", opts)
keymap("n", "<leader>yf","V\"fy", opts)
keymap("n", "<leader>yg","V\"gy", opts)
keymap("n", "<leader>yh","V\"hy", opts)
keymap("n", "<leader>yi","V\"iy", opts)
keymap("n", "<leader>yj","V\"jy", opts)
keymap("n", "<leader>yk","V\"ky", opts)
keymap("n", "<leader>yl","V\"ly", opts)
keymap("n", "<leader>ym","V\"my", opts)
keymap("n", "<leader>yn","V\"ny", opts)
keymap("n", "<leader>yo","V\"oy", opts)
keymap("n", "<leader>yp","V\"py", opts)
keymap("n", "<leader>yq","V\"qy", opts)
keymap("n", "<leader>yr","V\"ry", opts)
keymap("n", "<leader>ys","V\"sy", opts)
keymap("n", "<leader>yt","V\"ty", opts)
keymap("n", "<leader>yu","V\"uy", opts)
keymap("n", "<leader>yv","V\"vy", opts)
keymap("n", "<leader>yw","V\"wy", opts)
keymap("n", "<leader>yx","V\"xy", opts)
keymap("n", "<leader>yy","V\"yy", opts)
keymap("n", "<leader>yz","V\"zy", opts)

-- Past from register
keymap("n", "<leader>pa", "\"ap", opts)
keymap("n", "<leader>pb", "\"bp", opts)
keymap("n", "<leader>pc", "\"cp", opts)
keymap("n", "<leader>pd", "\"dp", opts)
keymap("n", "<leader>pe", "\"ep", opts)
keymap("n", "<leader>pf", "\"fp", opts)
keymap("n", "<leader>pg", "\"gp", opts)
keymap("n", "<leader>ph", "\"hp", opts)
keymap("n", "<leader>pi", "\"ip", opts)
keymap("n", "<leader>pj", "\"jp", opts)
keymap("n", "<leader>pk", "\"kp", opts)
keymap("n", "<leader>pl", "\"lp", opts)
keymap("n", "<leader>pm", "\"mp", opts)
keymap("n", "<leader>pn", "\"np", opts)
keymap("n", "<leader>po", "\"op", opts)
keymap("n", "<leader>pp", "\"pp", opts)
keymap("n", "<leader>pq", "\"qp", opts)
keymap("n", "<leader>pr", "\"rp", opts)
keymap("n", "<leader>ps", "\"sp", opts)
keymap("n", "<leader>pt", "\"tp", opts)
keymap("n", "<leader>pu", "\"up", opts)
keymap("n", "<leader>pv", "\"vp", opts)
keymap("n", "<leader>pw", "\"wp", opts)
keymap("n", "<leader>px", "\"xp", opts)
keymap("n", "<leader>py", "\"yp", opts)
keymap("n", "<leader>pz", "\"zp", opts)
