" Automatically generated packer.nvim plugin loader code

if !has('nvim')
  finish
endif

lua << END
local plugins = {
  ["dart-vim-plugin"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/krispy/.local/share/nvim/site/pack/packer/opt/dart-vim-plugin"
  },
  ["packer.nvim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/krispy/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["vim-javascript"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/krispy/.local/share/nvim/site/pack/packer/opt/vim-javascript"
  },
  ["vim-markdown"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/krispy/.local/share/nvim/site/pack/packer/opt/vim-markdown"
  },
  ["vim-markdown-folding"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/krispy/.local/share/nvim/site/pack/packer/opt/vim-markdown-folding"
  },
  ["vim-vue"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/krispy/.local/share/nvim/site/pack/packer/opt/vim-vue"
  },
  vimtex = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/krispy/.local/share/nvim/site/pack/packer/opt/vimtex"
  }
}

local function handle_bufread(names)
  for _, name in ipairs(names) do
    local path = plugins[name].path
    for _, dir in ipairs({ 'ftdetect', 'ftplugin', 'after/ftdetect', 'after/ftplugin' }) do
      if #vim.fn.finddir(dir, path) > 0 then
        vim.cmd('doautocmd BufRead')
        return
      end
    end
  end
end

_packer_load = nil

local function handle_after(name, before)
  local plugin = plugins[name]
  plugin.load_after[before] = nil
  if next(plugin.load_after) == nil then
    _packer_load({name}, {})
  end
end

_packer_load = function(names, cause)
  local some_unloaded = false
  for _, name in ipairs(names) do
    if not plugins[name].loaded then
      some_unloaded = true
      break
    end
  end

  if not some_unloaded then return end

  local fmt = string.format
  local del_cmds = {}
  local del_maps = {}
  for _, name in ipairs(names) do
    if plugins[name].commands then
      for _, cmd in ipairs(plugins[name].commands) do
        del_cmds[cmd] = true
      end
    end

    if plugins[name].keys then
      for _, key in ipairs(plugins[name].keys) do
        del_maps[key] = true
      end
    end
  end

  for cmd, _ in pairs(del_cmds) do
    vim.cmd('silent! delcommand ' .. cmd)
  end

  for key, _ in pairs(del_maps) do
    vim.cmd(fmt('silent! %sunmap %s', key[1], key[2]))
  end

  for _, name in ipairs(names) do
    if not plugins[name].loaded then
      vim.cmd('packadd ' .. name)
      if plugins[name].config then
        for _i, config_line in ipairs(plugins[name].config) do
          loadstring(config_line)()
        end
      end

      if plugins[name].after then
        for _, after_name in ipairs(plugins[name].after) do
          handle_after(after_name, name)
          vim.cmd('redraw')
        end
      end

      plugins[name].loaded = true
    end
  end

  handle_bufread(names)

  if cause.cmd then
    local lines = cause.l1 == cause.l2 and '' or (cause.l1 .. ',' .. cause.l2)
    vim.cmd(fmt('%s%s%s %s', lines, cause.cmd, cause.bang, cause.args))
  elseif cause.keys then
    local keys = cause.keys
    local extra = ''
    while true do
      local c = vim.fn.getchar(0)
      if c == 0 then break end
      extra = extra .. vim.fn.nr2char(c)
    end

    if cause.prefix then
      local prefix = vim.v.count and vim.v.count or ''
      prefix = prefix .. '"' .. vim.v.register .. cause.prefix
      if vim.fn.mode('full') == 'no' then
        if vim.v.operator == 'c' then
          prefix = '' .. prefix
        end

        prefix = prefix .. vim.v.operator
      end

      vim.fn.feedkeys(prefix, 'n')
    end

    -- NOTE: I'm not sure if the below substitution is correct; it might correspond to the literal
    -- characters \<Plug> rather than the special <Plug> key.
    vim.fn.feedkeys(string.gsub(string.gsub(cause.keys, '^<Plug>', '\\<Plug>') .. extra, '<[cC][rR]>', '\r'))
  elseif cause.event then
    vim.cmd(fmt('doautocmd <nomodeline> %s', cause.event))
  elseif cause.ft then
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeplugin', cause.ft))
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeindent', cause.ft))
  end
end

-- Runtimepath customization

-- Pre-load configuration
-- Post-load configuration
-- Config for: nvim-web-devicons
loadstring("\27LJ\1\2O\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0")()
-- Config for: lightline.vim
loadstring("\27LJ\1\2\v\0\0\1\0\0\0\1G\0\1\0\0")()
-- Config for: gruvbox
loadstring('\27LJ\1\2i\0\0\2\0\4\0\t4\0\0\0007\0\1\0%\1\2\0>\0\2\0014\0\0\0007\0\1\0%\1\3\0>\0\2\1G\0\1\0& let g:gruvbox_color_column="bg3"\24colorscheme gruvbox\bcmd\bvim\0')()
-- Conditional loads
-- Load plugins in order defined by `after`
END

function! s:load(names, cause) abort
call luaeval('_packer_load(_A[1], _A[2])', [a:names, a:cause])
endfunction


" Command lazy-loads

" Keymap lazy-loads

augroup packer_load_aucmds
  au!
  " Filetype lazy-loads
  au FileType js ++once call s:load(['vim-javascript'], { "ft": "js" })
  au FileType vue ++once call s:load(['vim-vue'], { "ft": "vue" })
  au FileType md ++once call s:load(['vim-markdown-folding', 'vim-markdown'], { "ft": "md" })
  au FileType tex ++once call s:load(['vimtex'], { "ft": "tex" })
  au FileType html ++once call s:load(['vim-vue'], { "ft": "html" })
  au FileType dart ++once call s:load(['dart-vim-plugin'], { "ft": "dart" })
  " Event lazy-loads
augroup END
