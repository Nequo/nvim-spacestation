local blink = require("blink.cmp")
return {
  cmd = { "rust-analyzer" },
  root_markers = { "Cargo.lock" },
  filetypes = { "rust" },
  settings = {
    ["rust-analyzer"] = {
      check = {
        command = "clippy",
      },
      diagnostics = {
        enable = true,
      },
    },
  },
}
