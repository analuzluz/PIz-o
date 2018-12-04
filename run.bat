@echo off
pushd %~d0
start "PHP" environment\php\php.exe -S 0.0.0.0:80 
start "MySQL" environment\mysql\bin\mysqld.exe --console