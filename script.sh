CWD=$(pwd)

RENV_WATCHDOG_DEBUG=TRUE R -e 'tick <- Sys.time(); sandpaper::validate_lesson("lsn"); Sys.time() - tick' 2>&1 | tee inside_renv.txt

cd lsn && RENV_WATCHDOG_DEBUG=TRUE R -e 'tick <- Sys.time(); sandpaper::validate_lesson("."); Sys.time() - tick' 2>&1 | tee ../outside_renv.txt

cd ${CWD}

RENV_WATCHDOG_ENABLED=FALSE R -e 'tick <- Sys.time(); sandpaper::build_lesson("lsn", quiet = FALSE, preview = FALSE); Sys.time() - tick' 2>&1 | tee build_lesson_no_watchdog.txt

RENV_WATCHDOG_DEBUG=TRUE R -e 'tick <- Sys.time(); sandpaper::build_lesson("lsn", quiet = FALSE, preview = FALSE); Sys.time() - tick' 2>&1 | tee build_lesson_watchdog.txt

