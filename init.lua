require 'core.options'
require 'core.keymaps'
require 'core.autocommands'

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup {
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).

  { 'MAC427/guess-indent.nvim', opts = {} }, -- Detect tabstop and shiftwidth automatically
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `opts` key (recommended), the configuration runs
  -- after the plugin has been loaded as `require(MODULE).setup(opts)`.

  { 'mason-org/mason.nvim', opts = { PATH = 'append' } },
  { 'j-hui/fidget.nvim', opts = {} },
  require 'plugins.gitsigns',
  require 'plugins.neotree',
  require 'plugins.which-key',
  require 'plugins.telescope',
  require 'plugins.todo-comments',
  require 'plugins.mini',
  require 'plugins.treesitter',
  require 'plugins.conform',
  require 'plugins.blink',
  --  require 'plugins.lazydev',
  {
    require 'plugins.catppuccin',
  },
}
require 'core.lsp'

-- vim: ts=2 sts=2 sw=2 et
