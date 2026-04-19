#!/bin/bash
set -e

echo "开始初始化数据库..."

# 等待 MySQL 服务启动
until mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "SELECT 1" > /dev/null 2>&1; do
    echo "等待 MySQL 服务启动..."
    sleep 1
done

echo "MySQL 服务已启动，开始执行初始化脚本..."

# 执行 SQL 脚本
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "source $WORK_PATH/$FILE_0;"
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "source $WORK_PATH/$FILE_1;"

echo "数据库初始化完成！"
