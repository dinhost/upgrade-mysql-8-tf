<?php

$env = include '.env.php';

// Ensure we have everything we need properly filled on env file
$verify = [
    'rds_old' => [
        'host',
        'user',
        'pass',
    ],
    'rds_new' => [
        'host',
        'user',
        'pass',
    ],
    'db_users' => [
        [
            'db_name',
            'db_user',
            'db_pass',
        ],
    ]
];
ensure_not_empty($verify, $env);
function ensure_not_empty($verify, $env)
{
    // Checks for the presence of the item and ensure it's not empty
    foreach ($verify as $k => $v) {
        if (!is_array($v)) {
            if (!(array_key_exists($v, $env) && !empty($env[$v]))) {
                die('Expected value on env.php, item: ' . $v);
            }
        } // If it's an array, we check it's children
        else {
            if (!(array_key_exists($k, $env) && !empty($env[$k]))) {
                die('Expected value on env.php, item: ' . $k);
            }

            ensure_not_empty($v, $env[$k]);
        }
    }
}

function eco($string)
{
    echo $string . PHP_EOL;
}

function exec_cmd($cmd)
{
    eco("Executing command: {$cmd}");
    exec($cmd);
    eco("Done");
}