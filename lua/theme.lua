-- Hide ~ from end of lines.
vim.opt.fillchars = { eob = " " }

-- Add icons for lsp diagnostics sings
vim.cmd
[[
sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsSignError linehl= numhl=
sign define LspDiagnosticsSignWarning text= texthl=LspDiagnosticsSignWarning linehl= numhl=
sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation linehl= numhl=
sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsSignHint linehl= numhl=
]]

vim.g.tokyonight_style = "night" -- styles: storm, night and day.
vim.cmd("colorscheme onedark")

require('onedark').setup  {
    -- Main options --
    style = 'deep', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false,  -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    -- toggle theme style ---
    toggle_style_key = '<leader>ts', -- Default keybinding to toggle
    toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },

    -- Custom Highlights --
    colors = {}, -- Override default colors
    highlights = {}, -- Override highlight groups

    -- Plugins Config --
    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true,   -- use undercurl instead of underline for diagnostics
        background = true,    -- use background color for virtual text
    },
}
require('onedark').load()

function _G.make_codeart_transparent()
  vim.cmd("highlight Normal guibg=NONE guifg=NONE")
  vim.cmd("highlight NormalNc guibg=NONE guifg=NONE")
  vim.cmd("highlight LineNr guibg=NONE guifg=NONE")
  vim.cmd("highlight CursorLineNr guibg=NONE guifg=NONE")
  vim.cmd("highlight SignColumn guibg=NONE guifg=NONE")
  vim.cmd("highlight EndOfBuffer guibg=NONE guifg=NONE")


  vim.cmd("highlight NvimTreeNormal guibg=NONE guifg=NONE")
  vim.cmd("highlight NvimTreeNormalNc guibg=NONE guifg=NONE")
  vim.cmd("highlight NvimTreeEndOfBuffer guibg=NONE guifg=NONE")


  vim.cmd("highlight BufferLineFill guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineDiagnostics guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineTab guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineTabSelected guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineTabClose guibg=NONE guifg=NONE")

  vim.cmd("highlight BufferLineBackground guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineCloseButton guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineCloseButtonSelected	 guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineCloseButtonVisible	 guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineBufferVisible guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLinePick guibg=NONE")
  vim.cmd("highlight BufferLinePickSelected guibg=NONE")
  vim.cmd("highlight BufferLineSeperator guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineGroupSeperator guibg=NONE guifg=NONE")
  vim.cmd("highlight bufferlineseperatorvisible guibg=none guifg=none")
  vim.cmd("highlight BufferLineSeparatorSelected guibg=none")
  vim.cmd("highlight BufferLineSeparator guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineIndicatorSelected	 guibg=NONE")
  vim.cmd("highlight BufferLineBufferSelected guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineDiagnostic	 guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineDevIconLuaSelected	 guibg=NONE")
  vim.cmd("highlight BufferLineDevIconDefaultInactive	 guibg=NONE")

  vim.cmd("highlight BufferLineError guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineErrorVisible guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineErrorDiagnosticVisible guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineErrorSelected guibg=NONE")
  vim.cmd("highlight BufferLineErrorDiagnostic guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineErrorDiagnosticSelected guibg=NONE")
  vim.cmd("highlight BufferLineErrorDiagnosticSelected guibg=NONE")

  vim.cmd("highlight BufferLineWarning guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineWarningVisible guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineWarningDiagnosticVisible guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineWarningSelected guibg=NONE")
  vim.cmd("highlight BufferLineWarningDiagnostic guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineWarningDiagnosticSelected guibg=NONE")
  vim.cmd("highlight BufferLineWarningDiagnosticSelected guibg=NONE")

  vim.cmd("highlight BufferLineInfo guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineInfoVisible guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineInfoDiagnosticVisible guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineInfoSelected guibg=NONE")
  vim.cmd("highlight BufferLineInfoDiagnostic guibg=NONE guifg=NONE")
  vim.cmd("highlight BufferLineInfoDiagnosticSelected guibg=NONE")
  vim.cmd("highlight BufferLineInfoDiagnosticSelected guibg=NONE")

  vim.cmd("highlight BufferLineModified guibg=NONE")
  vim.cmd("highlight BufferLineModifiedSelected guibg=NONE")
  vim.cmd("highlight BufferLineModifiedVisible guibg=NONE guifg=NONE")

  vim.cmd("highlight DiagnosticVirtualTextError guibg=NONE")
  vim.cmd("highlight DiagnosticVirtualTextWarn guibg=NONE")
  vim.cmd("highlight DiagnosticVirtualTextHint guibg=NONE")
  vim.cmd("highlight DiagnosticVirtualTextInfo guibg=NONE")

  vim.cmd("highlight NormalFloat guibg=NONE")
  vim.cmd("highlight FloatBorder guibg=#15161E")
  vim.cmd("highlight WhichKeyFloat guibg=NONE")
end
