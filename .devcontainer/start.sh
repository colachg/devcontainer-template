#!/bin/fish

# Initialize Starship prompt (only if not already configured)
if not grep -q 'starship init fish' ~/.config/fish/config.fish 2>/dev/null
    echo 'eval "$(starship init fish)"' >> ~/.config/fish/config.fish
end
