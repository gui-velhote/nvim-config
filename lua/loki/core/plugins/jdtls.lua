local jdtls = require('jdtls')
local jdtls_dir = vim.fn.stdpath('data') .. '/mason/packages/jdtls'
local config_dir = jdtls_dir .. '/config_linux'
local plugins_dir = jdtls_dir .. '/plugins'
local path_to_jar = plugins_dir .. '/org.eclipse.equinox.launcher_1.7.100.v20251111-0406.jar'

-- local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local current_directory = vim.api.nvim_buf_get_name(0);
local project_name = vim.fn.fnamemodify(current_directory, ':p:h:t')
local workspace_dir = vim.fn.stdpath('data') .. '/site/java/workspace-root' .. project_name
os.execute('mkdir' .. workspace_dir)

local java_projects_directories = {
  vim.fn.expand("~") .. '/usp/tomcat',
  vim.fn.expand("~") .. '/usp/spring'
}

if not vim.tbl_contains(java_projects_directories, vim.fn.fnamemodify(current_directory, ':h')) then
  return
end

print("starting jdtls")

local config = {
  cmd = {
    '/usr/lib/jvm/java-25-openjdk/bin/java',
    '-javaagent:/home/gvelhote/.local/share/nvim/mason/packages/jdtls/lombok.jar', -- Must be before jdtls jar
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1G',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', path_to_jar, -- The jdtls jar
    '-configuration', config_dir,
    '-data', workspace_dir,
  },

  root_dir = root_dir,
  settings = {
    java = {
      home = '/usr/lib/jvm/java-25-openjdk',
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = 'interactive',
        runtimes = {
          {
            name = 'JavaSE-25',
            path = '/usr/lib/jvm/java-25-openjdk',
            default = true,
          },
          {
            name = 'JavaSE-1.8',
            path = '/usr/lib/jvm/java-8-openjdk',
          },
        },
        maven = {
          downloadSources = true,
        },
        implementationsCodeLens = {
          enabled = true,
        },
        referencesCodeLens = {
          enabled = true,
        },
        references = {
          includeDecompiledSources = true,
        },
        format = {
          enabled = true,
          settings = {
            url = vim.fn.stdpath("config") .. "/lang-servers/intellij-java-google-style.xml",
            profile = 'GoogleStyle'
          },
        },
      },

      signatureHelp = { enabled = true },

      completion = {
        favoriteStaticMembers = {
        },
        importOrder = {
          'java',
          'javax',
          'com',
          'org',
          'br'
        },
      },

      sources = {
        organizeImports = {
          startThreshol = 9999,
          staticStartThreshold = 9999,
        },
      },

      flags = {
        allow_incremental_sync = true,
      },
      init_options = {
        bundles = {},
      },
    }
  }
}

jdtls.start_or_attach(config);

