return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = true,
  enabled = false,
  opts = {
    copilot_node_command = os.getenv("HOME") .. "/.nvm/versions/node/v18.19.0/bin/node",
  },
}
