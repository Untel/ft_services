<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wpadda' );

/** MySQL database username */
define( 'DB_USER', 'addasil' );

/** MySQL database password */
define( 'DB_PASSWORD', 'addasil' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'HPGL< A[D3&:x+AYq+TY0Wzt6E]OZQ,l|/h1>09|^+[-C.I<nm~IHw}A>.;x8kE%');
define('SECURE_AUTH_KEY',  '}>Ed{*b,| [+|qD18#LUnYThM;*6>@zE4kUI|ib$wsSR,yk]5=5)G<42M-{|G>|r');
define('LOGGED_IN_KEY',    'j meWo#H7t@7Kc*^{3?[bs1:$|Ikn9n,U&Wh*)MY1IA$y}YF)OIB,#^Hb(UxTd0J');
define('NONCE_KEY',        'gri|a*x:cUoXn)m^80I!lCtH5V$N8~|/{F/Wv:TG%oKg9oJc+mXG_;+.s>m<Mu.G');
define('AUTH_SALT',        '93+j[}Fow>E$ZQI#k]ZP*7`FnP.=Kp+.1k,k<rw:pz/EqN!2<|Coj!DUH5+xm<1|');
define('SECURE_AUTH_SALT', '-}}y~hrTOa_s53*mM2+EKr`9hQWo9SxwTQ[5Q1S=+IGG4NSSD+e2La)yu-K/h=&!');
define('LOGGED_IN_SALT',   'MUHo|x//jCyc5RsrA,(#>i>;Z;;|0@G!J%lf^l{sj/q+pZY.U]M!bma y(--Q3,q');
define('NONCE_SALT',       'BB3@s@ 4JTT%rrq[o.%dx>8Iu6pjI+t-d1kdu^%sP0+3t=A1>W/tss6BHM=+Z:@O');

/**#@-*/

/**
 * WordPress Database Table prefix.
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

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';