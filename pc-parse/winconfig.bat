if exist %1config.h attrib -r %1config.h
copy %1config.DOS %1config.h >nul
exit 0