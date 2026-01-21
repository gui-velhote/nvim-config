local cmp = require('cmp')
local util = require("lspconfig/util")

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = {
        { 
          name = 'nvim_lsp',
          ---@param entry cmp.Entry
          ---@param ctx cmp.Context
          entry_filter = function(entry, ctx)
            if ctx.filetype ~= 'vue' then
              return true
            end

            local cursor_before_line = ctx.cursor_before_line
            if cursor_before_line:sub(-1) == '@' then
              return entry.completion_item.label:match('^@')
            elseif cursor_before_line:sub(-1) == ':' then
              return entry.completion_item.label:match('^:') and not entry.completion_item.label:match('^:on%-')
            else
              return true
            end
          end
        },
        { name = 'look' },
        { name = 'buffer' },
        {
          name = 'ctags',
          option = {
            executable = "ctags",
            trigger_characters = {"."},
            trigger_characters_ft = {},
          }
        }
    }
})

cmp.event:on('menu_closed', function()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.b[bufnr]._vue_ts_cached_is_in_start_tag = nil
end)

local capabilities = require('cmp_nvim_lsp').default_capabilities()
    vim.lsp.config('harper_ls', {
        capabilities = capabilities
    })
    vim.lsp.config('pyright', {
        capabilities = capabilities
    })
    vim.lsp.config('rust_analyzer', {
        capabilities = capabilities
    })
    vim.lsp.config('lua_ls', {
        cmd = { 'lua-language-server' },
        filetypes = { 'lua' },
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            }
          }
        },
        capabilities = capabilities
    })
    -- vim.lsp.config('stylua', {
    --     capabilities = capabilities
    -- })
    vim.lsp.config('gopls', {
        capabilities = capabilities
    })
    vim.lsp.config('gopls', {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = {"gopls"},
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
            gopls = {
                completeUnimported = true,
                usePlaceholders = true,
                analyses = {
                    unusedparams = true,
                },
            },
        },
    })
    -- require('lspconfig')['eslint'].setup {
    --     capabilities = capabilities
    -- }
    vim.lsp.config('eslint', {
        capabilities = capabilities,
        filetypes = {'js'}
    })
    vim.lsp.config('vtsls', {
        -- capabilities = capabilities,
        -- filetypes = {'js', 'ts', 'vue'}
        settings = {
          vtsls = {
            tsserver = {
              globalPlugins = {
                {
                  name = '@vue/typescript-plugin',
                  location = '/home/gvelhote/.config/nvim/node_modules/@vue/language-server',
                  languages = { 'vue' },
                  configNamespace = 'typescript',
                }
              },
            },
          },
        },
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    })
    vim.lsp.config('jsonls', {
        capabilities = capabilities
    })
    -- require('lspconfig')['angularls'].setup {
    --     capabilities = capabilities
    -- }
    -- vim.lsp.config('html', {
    --     capabilities = capabilities
    -- })
    vim.lsp.config('emmet_ls', {
        capabilities = capabilities
    })
    vim.lsp.config('html', {
      capabilities = capabilities,
      filetypes = {'html', 'jsp'}
    })

    vim.lsp.config('jdtls', {
      capabilities = capabilities,
      filetypes = {'java', 'class'}
    })

    vim.lsp.config('vue_ls', {
      on_init = function(client)
        client.handlers['tsserver/request'] = function(_, result, context)
          local ts_clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = 'ts_ls' })
          local vtsls_clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = 'vtsls' })
          local clients = {}

          vim.list_extend(clients, ts_clients)
          vim.list_extend(clients, vtsls_clients)

          if #clients == 0 then
            vim.notify('Could not find `vtsls` or `ts_ls` lsp client, `vue_ls` would not work without it.', vim.log.levels.ERROR)
            return
          end
          local ts_client = clients[1]

          local param = unpack(result)
          local id, command, payload = unpack(param)
          ts_client:exec_cmd({
            title = 'vue_request_forward', -- You can give title anything as it's used to represent a command in the UI, `:h Client:exec_cmd`
            command = 'typescript.tsserverRequest',
            arguments = {
              command,
              payload,
            },
          }, { bufnr = context.bufnr }, function(_, r)
            local response = r and r.body
            -- TODO: handle error or response nil here, e.g. logging
            -- NOTE: Do NOT return if there's an error or no response, just return nil back to the vue_ls to prevent memory leak
            local response_data = { { id, response } }

            ---@diagnostic disable-next-line: param-type-mismatch
            client:notify('tsserver/response', response_data)
          end)
        end
      end,
      -- capabilities = capabilities,
      -- filetypes = {'vue'}
    })

    vim.lsp.enable('vtsls')
    vim.lsp.enable('harper_ls')
    vim.lsp.enable('pyright')
    vim.lsp.enable('rust_analyzer')
    -- vim.lsp.enable('stylua')
    vim.lsp.enable('lua_ls')
    vim.lsp.enable('gopls')
    vim.lsp.enable('jsonls')
    vim.lsp.enable('html')
    vim.lsp.enable('emmet_ls')
    vim.lsp.enable('html')
    vim.lsp.enable('eslint')
    vim.lsp.enable('jdtls')
    vim.lsp.enable('vue_ls')
    -- vim.lsp.enable('java_language_server')
