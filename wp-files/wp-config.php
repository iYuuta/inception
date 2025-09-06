<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'inception_db' );

/** Database username */
define( 'DB_USER', 'yuuta' );

/** Database password */
define( 'DB_PASSWORD', 'yuuta' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

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
define( 'AUTH_KEY',          '$z^7NnYg&CBfJJ~MlD^e;[#tLjjr>n0t%p/,8J #sCOD@KU jSB.U,.rh1XZ:< 4' );
define( 'SECURE_AUTH_KEY',   'm;|9RJom+rj!uF@aU)<2i33qp1S86!Ku]0<#2U9.N3V}a!-3h4]M 7!?-+ #J5:m' );
define( 'LOGGED_IN_KEY',     '$h=SZ9:%(9r4j+($A+]Sm?m)F6LpmHD{ot-mU: ?;Fmpg!RD:?~nHxryJ| S{A|E' );
define( 'NONCE_KEY',         'r[1WH{4W 1 y.{~_gEr$,4UYJn!CqAI)0sK>{9S~;kW4=4F!&OP43H!rj#m{-MRH' );
define( 'AUTH_SALT',         '`!cSAhH3HudY_L,^])p_FKxo8v_I8@ui<tz)U[Y~@g<rf$3a@<9n#^<%wHXSX._l' );
define( 'SECURE_AUTH_SALT',  '=^0}!] d4TA!iUSVk(+2#6,1MV[9j~J?8,h;{M@KX9iwUYg5tv5O5pzG`w,vzJ<G' );
define( 'LOGGED_IN_SALT',    'e=lEk$s=,GP)P>CB@iX|b1^ozm Y4jOR>.)6g>y*]E:nRVJbX`wRmSk8PkK|[6X8' );
define( 'NONCE_SALT',        '^$I6b_{.o4=DA=X35.x*ky;[Cr(Q}TZ@ ;@UvU5 `.EL;kt0cXe|0p>b_^sz ^^T' );
define( 'WP_CACHE_KEY_SALT', 'rv^u[*=MPw%77QdW^rFE/-.pQ/I9Q|.Ka0L _{)vSA%<%z6QNu7KNE5=7N.1S0DZ' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



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
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

define( 'WP_REDIS_HOST', 'redis' );
define( 'WP_REDIS_PORT', '6379' );
/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
