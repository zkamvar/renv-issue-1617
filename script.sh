RENV_STARTUP_DIAGNOSTICS=TRUE R -e 'sandpaper::build_lesson("lsn", preview = FALSE)' 2>&1 | tee out.txt
