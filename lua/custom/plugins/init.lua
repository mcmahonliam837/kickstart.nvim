-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    commit = 'e76cb03',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    init = function()
      local harpoon = require 'harpoon'

      -- REQUIRED
      harpoon:setup {}
      -- REQUIRED

      vim.keymap.set('n', '<C-e>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Open harpoon window' })

      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end, { desc = 'Add harpoon' })

      -- vim.keymap.set('n', '<C-e>', function()
      --   harpoon.ui:toggle_quick_menu(harpoon:list())
      -- end)

      for i = 1, 10 do
        local num = i % 10
        vim.keymap.set('n', '<leader>' .. num, function()
          harpoon:list():select(num)
        end, { desc = 'Select harpoon ' .. num })
      end

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set('n', '<C-S-P>', function()
        harpoon:list():prev()
      end, { desc = 'Previous harpoon' })
      vim.keymap.set('n', '<C-S-N>', function()
        harpoon:list():next()
      end, { desc = 'Next harpoon' })
    end,
  },
  {
    'supermaven-inc/supermaven-nvim',
    config = function()
      require('supermaven-nvim').setup {}
    end,
  },
  {
    'imNel/monorepo.nvim',
    config = function()
      require('monorepo').setup {}
    end,
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
    init = function()
      vim.keymap.set('n', '<leader>wp', function()
        require('telescope').extensions.monorepo.monorepo()
      end, { desc = 'Monorepo' })

      vim.keymap.set('n', '<leader>wP', function()
        require('monorepo').toggle_project()
      end, { desc = 'Monorepo add' })
    end,
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    init = function()
      require('neo-tree').setup {}
      vim.keymap.set('n', '<C-n>', function()
        vim.cmd 'Neotree toggle'
      end, { desc = 'Toggle neo-tree' })
    end,
  },
}
