local present, null_ls = pcall(require, 'null-ls')
if not (present or present2) then
   return
end

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.completion.spell,
  },
})
