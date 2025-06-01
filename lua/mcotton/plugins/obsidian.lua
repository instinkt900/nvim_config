return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = false,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre /mnt/mcotton/ObsidianVault/*.md",
  --   "BufNewFile /mnt/mcotton/ObsidianVault/*.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require('obsidian').setup({
      notes_subdir = "notes",
      new_notes_location = "notes_subdir",
      open_notes_in = "vsplit",

      workspaces = {
        {
          name = "personal",
          path = "/home/mcotton/Development/ObsidianVault",
        },
      },

      picker = {
        -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
        name = "telescope.nvim",
        -- Optional, configure key mappings for the picker. These are the defaults.
        -- Not all pickers support all mappings.
        note_mappings = {
          -- Create a new note from your query.
          new = "<C-x>",
          -- Insert a link to the selected note.
          insert_link = "<C-l>",
        },
        tag_mappings = {
          -- Add tag(s) to current note.
          tag_note = "<C-x>",
          -- Insert a tag at the current location.
          insert_tag = "<C-l>",
        },
      },

      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ""
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.time()) .. "-" .. suffix
      end,
    })

    vim.keymap.set("n", "<leader>on", ":ObsidianNew<cr>", { desc = "Create new obsidian note." })
    vim.keymap.set("n", "<leader>os", ":ObsidianSearch<cr>", { desc = "Search obsidian notes." })
    vim.keymap.set("n", "<leader>ot", ":ObsidianTags<cr>", { desc = "Search obsidian tags." })
    vim.keymap.set("n", "<leader>oo", ":ObsidianOpen<cr>", { desc = "Open obsidian notes." })
  end
}
