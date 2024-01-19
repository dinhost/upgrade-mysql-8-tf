<?php

require_once 'config.php';

$rds_old = $env['rds_old'];
$rds_new = $env['rds_new'];

$host1 = $rds_old['host'];
$host2 = $rds_new['host'];

eco('Replace the old HOSTNAME with new on files listed on replace-list.txt');
$cmd = "cat replace-list.txt | xargs sed -e 's:{$host1}:{$host2}:g' -i";
exec_cmd($cmd);
