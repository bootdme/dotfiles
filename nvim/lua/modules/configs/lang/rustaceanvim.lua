return function()
    vim.g.rustaceanvim = {
        tools = {},
        server = {
            on_attach = function(client, bufnr)
                vim.keymap.set('n', '[a', vim.diagnostic.goto_prev)
                vim.keymap.set('n', ']a', vim.diagnostic.goto_next)
            end,

            settings = {
                ['rust-analyzer'] = {
                    diagnostics = { enable = true },
                    assist = {
                        importEnforceGranularity = true,
                        importPrefix = 'crate',
                    },
                    cargo = {
                        allFeatures = true,
                    },
                    checkOnSave = {
                        -- default: `cargo check`
                        command = 'clippy',
                    },
                    nlayHints = {
                        chainingHints = {
                            bindingModeHints = {
                                enable = true,
                            },
                            chainingHints = {
                                enable = true,
                            },
                            closingBraceHints = {
                                enable = true,
                                minLines = 25,
                            },
                            closureCaptureHints = {
                                enable = true,
                            },
                            closureReturnTypeHints = {
                                enable = 'always', -- "never"
                            },
                            closureStyle = 'impl_fn',
                            discriminantHints = {
                                enable = 'always', -- "never"
                            },
                            expressionAdjustmentHints = {
                                hideOutsideUnsafe = false,
                                mode = 'prefix',
                            },
                            implicitDrops = {
                                enable = true,
                            },
                            lifetimeElisionHints = {
                                enable = 'always', -- "never"
                                useParameterNames = true,
                            },
                            maxLength = 25,
                            parameterHints = {
                                enable = true,
                            },
                            rangeExclusiveHints = {
                                enable = true,
                            },
                            renderColons = {
                                enable = true,
                            },
                            typeHints = {
                                enable = true,
                                hideClosureInitialization = false,
                                hideNamedConstructor = false,
                            },
                        },
                    },
                    lens = {
                        enable = true,
                    },
                },
            },
        },
    }
end
