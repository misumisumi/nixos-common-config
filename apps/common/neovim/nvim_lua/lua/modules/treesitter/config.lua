local config = {}
local g, fn, api = vim.g, vim.fn, vim.api


function config.vim_illuminate()
    local opt = {
        providers = {
            'lsp',
            'treesitter',
            'regex',
        },
        delay = 100,
        -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
        filetypes_denylist = {
            "alpha",
            "dashboard",
            "fugitive",
            "help",
            "norg",
            "NvimTree",
            "NeoTree",
            "Outline",
            "packer",
            "toggleterm"
        },
        under_cursor = false,
        }

    require("illuminate").configure(opt)
end

function config.neodim()
    local normal_background = api.nvim_get_hl_by_name("Normal", true).background
    local blend_color = normal_background ~= nil and ("#%06x").format(normal_background) or "#000000"
    local opt = {
        alpha = 0.5,
        blend_color = blend_color,
        update_in_insert = {
            enable = true,
            delay = 100,
        },
        hide = {
            visual_text = true,
            signs = false,
            underline = false
        }
    }

    require("neodim").setup(opt)
end

function config.nvim_treesitter()
    local keymap = require("modules.lazy_keymap")
    local opt = {
        ensure_installed = {
            "bash",
            "c",
            "cpp",
            "css",
            "dart",
            "diff",
            "dockerfile",
            "go",
            "gomod",
            "html",
            "javascript",
            "json",
            "latex",
            "latex",
            "lua",
            "make",
            "markdown",
            "nix",
            "perl",
            "python",
            "rust",
            "toml",
            "typescript",
            "vue",
            "yaml",
        },
        autotag = {
            enable = true,
        },
        context_commentstring = {
            enable = true,
            enable_autocmd = true
        },
        highlight = {
            enable = true,
            disable = {
                "vim"
            },
            additional_vim_regex_highlighting = false,
        },
        textobject = {
            select = {
                enable = true,
                keymaps = keymap.select
            },
            move = {
                enable = true,
                set_jumpse = true,
                goto_next_start = keymap.move.goto_next_start,
                goto_next_end = keymap.move.goto_next_end,
                goto_previous_start = keymap.move.goto_previous_start,
                goto_previous_end = keymap.move.goto_previous_end,
            }
        },
        rainbow = {
            enable = true,
            extended_mode = true,
            max_file_lines = 2000,
        },
        matchup = {
            enable = true
        }
    }
end

