<?php

require_once 'config.php';

$rds_old = $env['rds_old'];
$rds_new = $env['rds_new'];

$host1 = $rds_old['host'];
$host2 = $rds_new['host'];

eco('Search for files with the old HOSTNAME');
$cmd = "grep --include '*.php' --include '.env' {$host1}' /var/www -RIFl > replace-list.txt";
exec_cmd($cmd);