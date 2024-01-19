<?php

require_once 'config.php';

$db_users = $env['db_users'];
$rds_old = $env['rds_old'];
$rds_new = $env['rds_new'];

$mysql1_credentials = "-h {$rds_old['host']} -u {$rds_old['user']} --password='{$rds_old['pass']}'";
$mysql2_credentials = "-h {$rds_new['host']} -u {$rds_new['user']} --password='{$rds_new['pass']}'";

$total = count($db_users);
foreach ($db_users as $i => $db_user) {
    $index = $i + 1;
    eco("#{$index} of {$total}");

    $db_name = $db_user['db_name'];
    $dump_filename = "{$db_name}.sql";

    eco("Dumping database: {$db_name}");
    $cmd = "mysqldump {$mysql1_credentials} -f {$db_name} > {$dump_filename}";
    exec_cmd($cmd);

    eco("Create database if not exists: {$db_name}");
    $mysql_cmd = "CREATE DATABASE IF NOT EXISTS {$db_name};";
    $cmd = "mysql {$mysql2_credentials} -e \"{$mysql_cmd}\"";
    exec_cmd($cmd);

    eco("Importing database: {$db_name}");
    $cmd = "mysql {$mysql2_credentials} -f {$db_name} < {$dump_filename}";
    exec_cmd($cmd);

    // Creating user...
    $db_username = $db_user['db_user'];
    $db_pass = $db_user['db_pass'];
    eco ("Creating user: {$db_username} for the database {$db_name}");

    $mysql_cmd = "CREATE USER {$db_username} IDENTIFIED BY \"{$db_pass}\"; ";
    $mysql_cmd .= "GRANT ALL ON {$db_name}.* TO {$db_username}; ";
    $cmd = "mysql $mysql2_credentials -e '{$mysql_cmd}'";
    exec_cmd($cmd);



    eco('---');
}