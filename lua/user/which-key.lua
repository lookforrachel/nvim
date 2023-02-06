local which_key_status_ok, which_key = pcall(require, "which-key")
if not which_key_status_ok then
  return
end

vim.o.timeout = true
vim.o.timeoutlen = 300

which_key.setup()
