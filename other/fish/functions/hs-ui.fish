function hs-ui --description 'Open the Hindsight web UI (starts Hindsight first if needed)'
    hs-up; or return 1
    open http://localhost:9999
end
