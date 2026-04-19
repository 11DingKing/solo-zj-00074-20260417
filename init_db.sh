#!/bin/bash
set -e

echo "开始初始化数据库..."

# 等待 MySQL 服务启动
until mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "SELECT 1" > /dev/null 2>&1; do
    echo "等待 MySQL 服务启动..."
    sleep 1
done

echo "MySQL 服务已启动，开始执行初始化脚本..."

# 修改 root 用户的认证插件为 mysql_native_password
echo "修改 root 用户认证插件..."
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '$MYSQL_ROOT_PASSWORD';"
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$MYSQL_ROOT_PASSWORD';"
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"

# 执行 SQL 脚本
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "source $WORK_PATH/$FILE_0;"
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "source $WORK_PATH/$FILE_1;"

echo "数据库初始化完成！"
