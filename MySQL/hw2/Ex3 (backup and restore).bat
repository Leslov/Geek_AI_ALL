if not exist C:\DbDumps mkdir C:\DbDumps
cd C:\DbDumps
if exist example.dump del /f example.dump

cd C:\Program Files\MySQL\MySQL Server 8.0\bin
mysqldump -u root -p example > C:\DbDumps\example.dump

mysql -e "drop database if exists sample; create database sample; use sample;"
mysql sample < C:/DbDumps/example.dump

pause