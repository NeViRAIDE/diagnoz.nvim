local wk = require('which-key')
local icon = require('stigmata.utils').icon

return function(client, bufnr)
  wk.add({
    buffer = bufnr,
    mode = { 'n' },
    { '<leader>d', group = 'Diagnostics', icon = icon('', 'pulse') },
    {
      '<leader>dw',
      '<cmd>Telescope diagnostics severity_bound=ERROR<cr>',
      desc = 'Workspace diagnostics',
    },
    {
      '<leader>dl',
      rhs = function()
        vim.diagnostic.open_float(nil, {
          focusable = true,
          border = vim.g.b,
        })
      end,
      desc = 'Show diagnostic on line',
    },
    {
      '<leader>dp',
      '<cmd>lua vim.diagnostic.goto_prev({float=false})<cr>',
      desc = 'Jump to previous diagnostic node',
    },
    {
      '<leader>dn',
      '<cmd>lua vim.diagnostic.goto_next({float=false})<cr>',
      desc = 'Jump to next diagnostic node',
    },
    -- TODO: move to debugging module
    { '<leader>dd', group = 'DAP' },
    {
      '<leader>ddb',
      '<cmd>DapToggleBreakpoint<cr>',
      desc = 'Toggle breakpoint',
    },
    { '<leader>ddr', '<cmd>DapContinue<cr>', desc = 'Run debug' },
    { '<leader>ddt', '<cmd>DapTerminate<cr>', desc = 'Terminate DAP' },
    { '<leader>dds', group = 'steps' },
    { '<leader>ddsO', '<cmd>DapStepOut<cr>', desc = 'Out' },
    { '<leader>ddso', '<cmd>DapStepOver<cr>', desc = 'Over' },
    { '<leader>ddsi', '<cmd>DapStepInto<cr>', desc = 'Into' },
    { '<leader>ddL', group = 'Set log level ' },
    { '<leader>ddLw', '<cmd>DapSetLogLevel WARN<cr>', desc = 'Warning' },
    { '<leader>ddLi', '<cmd>DapSetLogLevel INFO<cr>', desc = 'Information' },
    { '<leader>ddLd', '<cmd>DapSetLogLevel DEBUG<cr>', desc = 'Debug' },
    { '<leader>ddLe', '<cmd>DapSetLogLevel ERROR<cr>', desc = 'Error' },
    { '<leader>ddLt', '<cmd>DapSetLogLevel TRACE<cr>', desc = 'Trace' },
    { '<leader>ddl', '<cmd>DapShowLog<cr>', desc = 'Show log' },
    { '<leader>ddR', '<cmd>DapToggleRepl<cr>', desc = 'Toggle REPL' },
  })
end
