CREATE USER coreprotect IDENTIFIED BY 'coreprotect';
CREATE DATABASE `coreprotect`;
GRANT ALL PRIVILEGES ON `coreprotect`.* TO coreprotect IDENTIFIED BY 'coreprotect';