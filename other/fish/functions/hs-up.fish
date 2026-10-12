function hs-up --description 'Ensure the Hindsight sandbox and server are running (localhost:8888)'
    # 1. Already answering? Nothing to do.
    curl -fsS --max-time 2 http://localhost:8888/health >/dev/null 2>&1; and return 0

    # 2. The sandbox must exist (created once in setup step 3).
    if not sbx ls 2>/dev/null | string match -qr '^hindsight\s'
        echo "hs-up: no sandbox named 'hindsight' exists (setup step 3)" >&2
        return 1
    end

    # 3. Start it: sbx exec starts a stopped sandbox, then starts the container inside.
    echo "hs-up: starting Hindsight..." >&2
    if not sbx exec hindsight -- docker start hindsight >/dev/null
        echo "hs-up: could not start the 'hindsight' container inside the sandbox" >&2
        return 1
    end

    # 4. Wait until the API answers on the published port.
    for i in (seq 60)
        curl -fsS --max-time 2 http://localhost:8888/health >/dev/null 2>&1; and return 0
        sleep 1
    end
    echo "hs-up: Hindsight did not answer on localhost:8888 within 60 s" >&2
    return 1
end
