CWD=$(pwd)
RENV_STARTUP_DIAGNOSTICS=TRUE R -e 'tick <- Sys.time(); sandpaper::validate_lesson("lsn"); Sys.time() - tick' 2>&1 | tee inside_renv.txt

RENV_STARTUP_DIAGNOSTICS=TRUE cd lsn && R -e 'tick <- Sys.time(); sandpaper::validate_lesson("."); Sys.time() - tick' 2>&1 | tee ../outside_renv.txt

cd ${CWD}
