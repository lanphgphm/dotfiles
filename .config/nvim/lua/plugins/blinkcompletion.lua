-- blinkcompletion.lua
return {
    "Saghen/blink.cmp",
    version = "v0.*",
    opts = {
        keymap = { preset = "enter" },
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },
        -- REDUCE NOISE HERE
        completion = {
            -- Only show the menu when you actually start typing (min 2 chars)
            -- or trigger it manually to keep the screen clean.
            menu = {
                border = "single", -- Adds a clean, thin border
                draw = {
                    columns = { { "label", "label_description", gap = 1 }, { "kind_icon" } },
                },
            },
            -- Disable virtual text "ghosting" if you find it distracting
            ghost_text = { enabled = false },
            
            -- Documentation window (the side popup)
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500, -- Don't pop up instantly; wait 0.5s
                window = { border = "single" },
            },
        },
        sources = {
            -- Prioritize LSP (Project/Package symbols) over Buffer words
            default = { "lsp", "path", "snippets", "buffer" },
            providers = {
                lsp = {
                    min_keyword_length = 2, -- Don't suggest for 1-letter variables
                    score_offset = 100,     -- Ensure LSP results always appear first
                },
            },
        },
    },
}
