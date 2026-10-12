function sb --description 'Start or re-attach a sandboxed agent: sb <claude|codex|pi> [dir]'
    # --- arguments -----------------------------------------------------------
    if not set -q argv[1]
        echo "usage: sb <claude|codex|pi> [dir]" >&2
        return 1
    end
    set -l agent $argv[1]
    if not contains -- $agent claude codex pi
        echo "sb: unknown agent '$agent' (use claude, codex or pi)" >&2
        return 1
    end
    set -l dir $PWD
    if set -q argv[2]
        set dir (realpath $argv[2]); or return 1
    end

    # --- settings (override with: set -Ux SB_CPUS 2, set -Ux SB_MEMORY 4g, ...)
    set -l kits_dir ~/sbx-hindsight/kits
    set -q SBX_KITS; and set kits_dir $SBX_KITS
    set -l cpus 4
    set -q SB_CPUS; and set cpus $SB_CPUS
    set -l mem 6g
    set -q SB_MEMORY; and set mem $SB_MEMORY

    # --- refuse to start without the memory server ---------------------------
    if not hs-up
        echo "sb: Hindsight is not running, agent NOT started." >&2
        echo "    Check with: sbx ls   and   sbx exec hindsight -- docker logs --tail 50 hindsight" >&2
        return 1
    end

    # --- kits ----------------------------------------------------------------
    set -l kits --kit $kits_dir/hindsight-memory
    set -l workload $agent
    if test "$agent" = pi
        set -a kits --kit $kits_dir/pi
        set workload shell
    end

    sbx run --name (basename $dir)-$agent --cpus $cpus --memory $mem $kits $workload $dir
end
