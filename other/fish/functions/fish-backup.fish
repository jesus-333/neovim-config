function fish-backup --description 'Mirror the fish config into ~/.config/nvim/other/fish'
    argparse h/help n/dry-run v/with-variables -- $argv; or return 1
    if set -q _flag_help
        echo "usage: fish-backup [-n|--dry-run] [-v|--with-variables]"
        echo "  -n  show what would change, copy nothing"
        echo "  -v  also copy fish_variables (may contain tokens set with set -U)"
        return 0
    end

    set -l src $__fish_config_dir      # normally ~/.config/fish
    set -l dst ~/.config/nvim/other/fish

    if not test -d (dirname $dst)
        echo "fish-backup: "(dirname $dst)" does not exist" >&2
        return 1
    end

    # -a keeps structure and timestamps; --delete removes files you deleted from fish
    set -l opts -a --delete
    set -q _flag_with_variables; or set -a opts --exclude fish_variables
    set -q _flag_dry_run; and set -a opts -n -v

    mkdir -p $dst
    rsync $opts $src/ $dst/; or return 1

    if set -q _flag_dry_run
        echo "(dry run, nothing copied)"
        return 0
    end

    # The backup ends up on GitHub: warn about anything that looks like a secret.
    set -l suspicious (grep -rIliE '(api[_-]?key|token|secret|password)[[:space:]]*[=:]|sk-[A-Za-z0-9_-]{16,}' $dst)
    if test (count $suspicious) -gt 0
        echo "fish-backup: check these files before pushing, they may contain secrets:" >&2
        printf '  %s\n' $suspicious >&2
    end

    echo "copied $src -> $dst"
    git -C ~/.config/nvim status --short -- other/fish 2>/dev/null
end
