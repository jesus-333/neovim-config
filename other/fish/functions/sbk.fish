function sbk --description 'Delete an agent sandbox: sbk <claude|codex|pi> [dir]'
    if not set -q argv[1]
        echo "usage: sbk <claude|codex|pi> [dir]" >&2
        return 1
    end
    set -l dir $PWD
    set -q argv[2]; and set dir (realpath $argv[2])
    sbx rm -f (basename $dir)-$argv[1]
end
