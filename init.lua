for _, source in ipairs {
    "astronvim.bootstrap",
    "astronvim.options",
    "astronvim.lazy",
    "astronvim.autocmds",
    "astronvim.mappings",
} do
    local status_ok, fault = pcall(require, source)
    if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
end

if astronvim.default_colorscheme then
    if not pcall(vim.cmd.colorscheme, astronvim.default_colorscheme) then
        require("astronvim.utils").notify(
            "Error setting up colorscheme: " .. astronvim.default_colorscheme,
            vim.log.levels.ERROR
        )
    end
end
-- local dap = require("dap")
-- dap.adapters.rustgdb = {
--     type = 'executable',
--     command = 'rust-gdb',
--     name = "rust-gdb"
-- }
-- dap.adapters.lldb = {
--     type = "executable",
--     command = 'codelldb',
--     name = 'lldb'
-- }
-- dap.configurations.rust = {
--     {
--         name = 'Launch Debug',
--         type = 'lldb',
--         request = "launch",
--         program = '${workspaceFolder}/target/debug/${workspaceFolder}',
--         cwd = '${workspaceFolder}',
--         stopOnEntry = false,
--         args = {},
--         initCommand = {},
--         runInTerminal = false
--     },
-- }
vim.cmd("colorscheme kanagawa")

require("astronvim.utils").conditional_func(astronvim.user_opts("polish", nil, false), true)
