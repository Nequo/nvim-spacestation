return {
    {
        'Nequo/hades-nvim',
        dev = true,
    },
    {
        'Nequo/windrunner-nvim',
        dev = false,
        config = function()
            vim.cmd.colorscheme("windrunner")
        end
    },
}
