# 1. Basic UI Setup
$env.config.show_banner = false
$env.EDITOR = "nvim"

# 2. Left Prompt (The Path)
def create_left_prompt [] {
    let home = $nu.home-path
    let dir = (
        if ($env.PWD | path expand) == ($home | path expand) {
            "~"
        } else {
            ($env.PWD | str replace $home "~" | str replace --all '\' '/')
        }
    )
    ($dir | str trim)
}

# 3. The "Kill Newlines" configuration
$env.PROMPT_COMMAND = { || create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = ""

# These are the ones usually adding the extra blank line
$env.PROMPT_INDICATOR = { "> " }
$env.PROMPT_INDICATOR_VI_INSERT = { ": " }
$env.PROMPT_INDICATOR_VI_NORMAL = { "> " }
$env.PROMPT_MULTILINE_INDICATOR = { "::: " }

# 4. Final Spacing Fix
$env.config.render_right_prompt_on_last_line = true
