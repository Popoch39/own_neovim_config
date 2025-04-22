return {
  {
    -- lsp loading infos !
    "j-hui/fidget.nvim",
    opts = {
      -- options
    },
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "intelephense",
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.intelephense.setup({
        capabilities = capabilities,
        init_options = {
          ["language_server_phpstan.enabled"] = true, -- Active PHPStan
          ["language_server_psalm.enabled"] = false,  -- Désactive Psalm
        },
        settings = {
          intelephense = {
            stubs = {
              "apache", "bcmath", "bz2", "calendar", "com_dotnet", "Core", "ctype", "curl",
              "date", "dba", "dom", "enchant", "exif", "fileinfo", "filter", "fpm", "ftp",
              "gd", "gettext", "gmp", "hash", "iconv", "imap", "intl", "json", "ldap", "libxml",
              "mbstring", "mcrypt", "meta", "mysqli", "oci8", "odbc", "openssl", "pcntl", "pcre",
              "PDO", "pdo_ibm", "pdo_mysql", "pdo_pgsql", "pdo_sqlite", "pgsql", "Phar", "posix",
              "pspell", "readline", "recode", "Reflection", "regex", "session", "shmop", "SimpleXML",
              "snmp", "soap", "sockets", "sodium", "SPL", "sqlite3", "standard", "superglobals",
              "sysvmsg", "sysvsem", "sysvshm", "tidy", "tokenizer", "xml", "xmlreader", "xmlrpc",
              "xmlwriter", "xsl", "Zend OPcache", "zip", "zlib",
              "laravel" -- Important : ajoute le support des stubs Laravel
            },
            files = {
              maxSize = 5000000
            },
            environment = {
              includePaths = {
              }
            },
            completion = {
              insertUseDeclaration = true,
              fullyQualifyGlobalConstantsAndFunctions = false,
              triggerParameterHints = true,
              maxItems = 100
            },
            format = {
              enable = true
            }
          }
        }
      })
      lspconfig.gopls.setup({
        capabilities = capabilities,
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
      })
      lspconfig.cssls.setup({
        capabilities = capabilities,
        settings = {
          css = {
            validate = true,
            lint = {
              unknownAtRules = "ignore",
            }
          },
          scss = {
            validate = true,
            lint = {
              unknownAtRules = "ignore",
            }
          },
          less = {
            validate = true,
            lint = {
              unknownAtRules = "ignore",
            }
          },
        },
      })
      lspconfig.html.setup({
        capabilities = capabilities
      })

      lspconfig.rust_analyzer.setup({
        capabilities = capabilities
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      vim.keymap.set({ 'n' }, "<leader>ca", vim.lsp.buf.code_action, {})
    end
  },
}
