CREATE USER 'dbadmin'@'localhost' IDENTIFIED BY '741235896';
CREATE USER 'dbadmin'@'%' IDENTIFIED BY '741235896';
grant all privileges on *.* to 'dbadmin'@'localhost' identified by '741235896';
grant all privileges on *.* to 'dbadmin'@'%' identified by '741235896';
