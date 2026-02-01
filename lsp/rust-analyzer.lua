return {
  cmd = { 'rust-analyzer' },
  root_markers = { 'Cargo.toml', 'Cargo.lock', 'build.rs' },
  filetypes = { 'rust' },
  settings = {
    ['rust-analyzer'] = {
      check = {
        command = 'clippy',
      },
      diagnostics = {
        enable = true,
      },
    },
  },
}
