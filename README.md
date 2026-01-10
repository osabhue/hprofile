# Prerequisites
#####
- JDK 11
- Maven 3
- MySQL 8 

# Technologies 
- Spring MVC
- Spring Security
- Spring Data JPA
- Maven
- JSP
- MySQL


# Package Installation:

### 1) Update OS packages

```bash
sudo yum update -y
sudo yum install -y java-11-amazon-corretto-devel maven git unzip
java -version
mvn -version
git --version
mvn clean verify

# Clean + run tests + build WAR
mvn clean package -DskipTests

ls -lh target/
```bash

# Run locally for testing (Jetty via Maven)
```bash
mvn jetty:run
```bash

## Typical access:
http://<EC2_PUBLIC_IP>:8080/














# Database
Here,we used Mysql DB 
MSQL DB Installation Steps for Linux ubuntu 14.04:
- $ sudo apt-get update
- $ sudo apt-get install mysql-server

Then look for the file :
- /src/main/resources/db_backup.sql
- db_backup.sql file is a mysql dump file.we have to import this dump to mysql db server
- > mysql -u <user_name> -p accounts < db_backup.sql
