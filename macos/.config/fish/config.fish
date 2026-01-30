set SHELL fish
set EDITOR hx

eval "$(/opt/homebrew/bin/brew shellenv)"

set PATH "/opt/homebrew/bin:/opt/homebrew/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
set PATH "/Users/sxrose/.local/bin:$PATH"
set PATH "/opt/homebrew/opt/llvm/bin:$PATH"
set PATH "/opt/homebrew/opt/openjdk@21/bin:$PATH"
set PATH "/Users/sxrose/go/bin:$PATH"

set LDFLAGS "-L/opt/homebrew/opt/llvm/lib -L/opt/homebrew/lib"
set CPPFLAGS "-I/opt/homebrew/opt/llvm/include -I/opt/homebrew/include"

if status is-interactive
    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end
end
