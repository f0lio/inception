<?php
/**
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

define( 'DB_NAME', 'database_name_here' );
define( 'DB_USER', 'username_here' );
define( 'DB_PASSWORD', 'password_here' );
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '/t2L/Uz^SN8k6I$5G- 3fkJ4(3M{P6Eo*yCShj`DURd_3w^XfxUTbNS%noSfU}nx');
define('SECURE_AUTH_KEY',  '6,PsKa|}LhA2LEb ->9A 2&1sU.b3;m67RnAGqzeqksk-rQox9@qYA3g2f@_1}[6');
define('LOGGED_IN_KEY',    '!zM:J~U2~,(,5&EqYeQT>D<$C/fuZ]1)yiharpf>$-BiQT=3OP8%^[l<jIpcV@R]');
define('NONCE_KEY',        'iUD;4<oyU0zqp!42O)`a._E1dvlH>i/qRTyhR@0wg[~+IhwSg>0CBMH@)6WG%TH^');
define('AUTH_SALT',        'BM},rs2Cw5d$-87,pS&8*e;`{9rDO!crB[1Gt{uO^__eKxAFH{Z2Mq(Xa)h`X8-T');
define('SECURE_AUTH_SALT', ';.T|suQfSMPQe9qf8bTIR:ic;=6pAKdgS(CuaTo&K|[Cj0CCV)c)s|p6Lr5n3Wl+');
define('LOGGED_IN_SALT',   'BAq2+$k~)&qDV#IfxL@(Rw^-(UHt?`m[sk;dg]gopn]%o*B]:/.,`DE)|C):H|Er');
define('NONCE_SALT',       'rV_2L#C,X-Dks`-CA|s.ckX.n/H6yv@EA0U&A2:IX.O A_,EgKm#VdcKgQ-}J(Q&');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
