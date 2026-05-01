# config.nu
#
# Installed by:
# version = "0.109.1"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R
#
#

$env.config = {
  # ... other settings
  shell_integration: {
    osc133: false
  }
}



# This shows the specific folder name (e.g. "C:" or "Romitha")
$env.PROMPT_COMMAND = { || 
    let folder_name = ($env.PWD | path basename)
    if ($folder_name | is-empty) { 
        $env.PWD # Fallback for root C:\
    } else { 
        $folder_name 
    }
}

# This removes the ~> arrow and adds a space
$env.PROMPT_INDICATOR = { || " " }


# Displays the full absolute path
$env.PROMPT_COMMAND = { || $env.PWD }

# Removes the ~> and adds a space for typing
$env.PROMPT_INDICATOR = { || " " }

# Removes the 'right prompt' (timestamp) if you want it clean
$env.PROMPT_COMMAND_RIGHT = { || "" }
