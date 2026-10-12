function hs-backup --description 'Snapshot Hindsight data to ~/sbx-hindsight/backups'
    set -l ts (date +%Y%m%d-%H%M%S)
    set -l out ~/sbx-hindsight/backups
    mkdir -p $out
    # Stop the server so the database files are consistent, archive the volume, restart.
    sbx exec hindsight -- bash -lc "docker stop hindsight >/dev/null && \
        docker run --rm --entrypoint tar -v hindsight-data:/d -v /tmp:/out \
          ghcr.io/vectorize-io/hindsight:latest czf /out/hs-$ts.tgz -C /d . ; \
        docker start hindsight >/dev/null"
    or return 1
    sbx cp hindsight:/tmp/hs-$ts.tgz $out/
    and sbx exec hindsight -- rm -f /tmp/hs-$ts.tgz
    and echo "saved $out/hs-$ts.tgz"
end
