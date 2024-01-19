<?php

// Copy this file to .env.php so you can fill it properly with your secrets and settings

return [
    'rds_old' => [ // Credentials for the origin RDS to copy databases from
        'host' => '',
        'user' => '',
        'pass' => '',
    ],
    'rds_new' => [ // Credentials for the destination RDS to copy databases to
        'host' => '',
        'user' => '',
        'pass' => '',
    ],
    'db_users' => [ // Credentials for the RDS used by applications
        [
            'db_name' => 'my_database1',
            'db_user' => 'my_user1',
            'db_pass' => 'my_password1',
        ],
        [
            'db_name' => 'my_database2',
            'db_user' => 'my_user2',
            'db_pass' => 'my_password2',
        ], // and so on...
    ]
];