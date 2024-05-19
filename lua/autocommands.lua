---@type NeviraideUtils
local util = require('neviraide.utils')

local config = require('config')
local mappings = require('mappings')

util.autocmd('NeViRAIDE_diagnostics', 'LspAttach', {
  callback = function(args)
    ---The buffer where the lsp attached
    ---@type number
    local buffer = args.buf

    ---Language server
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client then
      config()
      mappings(client, buffer)

      if vim.g.l_d_soh then
        -- auto show diagnostics float window
        util.autocmd('NeViRAIDE_auto_diag_float', 'CursorHold', {
          buffer = buffer,
          callback = function()
            vim.diagnostic.open_float(nil, {
              focusable = false,
              close_events = {
                'BufLeave',
                'CursorMoved',
                'InsertEnter',
                'FocusLost',
              },
              border = vim.g.b,
              source = 'if_many',
              prefix = ' ',
              scope = 'cursor',
            })
          end,
        })
      end
    end
  end,
})
