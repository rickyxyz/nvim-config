local M = {}

local state = {
  term_buf = -1,
  term_win = -1,
}

function M.toggle_terminal()
  -- If terminal window is open and valid, close it
  if vim.api.nvim_win_is_valid(state.term_win) then
    vim.api.nvim_win_close(state.term_win, true)
    return
  end

  -- Reuse terminal buffer if it exists
  if not vim.api.nvim_buf_is_valid(state.term_buf) then
    vim.cmd("botright split") -- Open split at bottom
    vim.cmd("resize 15") -- Set height of terminal
    vim.cmd("terminal") -- Create new terminal
    state.term_win = vim.api.nvim_get_current_win()
    state.term_buf = vim.api.nvim_get_current_buf()
  else
    vim.cmd("botright split")
    vim.cmd("resize 15")
    vim.api.nvim_win_set_buf(0, state.term_buf)
    state.term_win = vim.api.nvim_get_current_win()
  end

  -- Optional: Enter insert mode in terminal
  vim.cmd("startinsert")
end

vim.api.nvim_create_user_command("Terminalpane", M.toggle_terminal, {})

return M
