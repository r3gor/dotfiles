return {
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "[b", "<cmd>BufferLineMovePrev<cr>", desc = "Move prev buffer" },
      { "]b", "<cmd>BufferLineMoveNext<cr>", desc = "Move next buffer" },
    },
    opts = {
      options = {
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "center",
          },
          {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "center",
          },
        },
        separator_style = "slant",
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      enabled = true,
      timeout = 10000,
      render = "wrapped-compact",
      stages = "fade_in_slide_out",
      top_down = false,
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        view = "cmdline",
      },
      popupmenu = {
        enabled = true,
        ---@type 'nui'|'cmp' -- con cmp hay un error de que solo funciona la primera vez
        backend = "nui",
      },
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    },
  },
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    priority = 1200,
    opts = {
      highlight = {
        groups = {
          InclineNormal = { guibg = "#9A1B67", guifg = "#FFD580" },
          InclineNormalNC = { guifg = "#5B6E74", guibg = "#1A1B26" },
        },
      },
      window = { margin = { vertical = 0, horizontal = 1 } },
      hide = {
        cursorline = true,
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        if vim.bo[props.buf].modified then
          filename = "[+] " .. filename
        end

        local icon, color = require("nvim-web-devicons").get_icon_color(filename)
        return { { icon, guifg = color }, { " " }, { filename } }
      end,
    },
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
                  ______________                                
            ,===:'.,            `-._                            
                  `:.`---.__         `-._                       
                    `:.     `--.         `.                     
                      \.        `.         `.                   
              (,,(,    \.         `.   ____,-`.,                
          (,'     `/   \.   ,--.___`.'                          
      ,  ,'  ,--.  `,   \.;'         `                          
        `{D, {    \  :    \;                                    
          V,,'    /  /    //                                    
          j;;    /  ,' ,-//.    ,---.      ,                    
          \;'   /  ,' /  _  \  /  _  \   ,'/                    
                \   `'  / \  `'  / \  `.' /                     
                `.___,'   `.__,'   `.__,'                       
                                                                
                        @rogrp6                                 

      ]]

      local logo2 = [[
                                            ________
    ______________ _______ _________________ __  ___/
    __  ___/_  __ \__  __ `/__  ___/___  __ \_  __ \ 
    _  /    / /_/ /_  /_/ / _  /    __  /_/ // /_/ / 
    /_/     \____/ _\__, /  /_/     _  .___/ \____/  
                  /____/           /_/              

      ]]

      local logo4 = [[

      ~ reggi6 ~

      ]]

      logo = string.rep("\n", 8) .. logo4 .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
  {
    "karb94/neoscroll.nvim",
    opts = {
      easing_function = "quadratic",
    },
    config = true,
  },
}
