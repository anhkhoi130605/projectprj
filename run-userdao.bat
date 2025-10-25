@echo off
echo Running UserDao with proper classpath...
cd build/web/WEB-INF/classes
java -cp ".;../lib/*" userDAO.UserDao
cd ../../..
pause
