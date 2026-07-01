<?php
/**
 * Plugin Name:       Repofolio
 * Plugin URI:        https://github.com/matthummel-pa/repofolio
 * Description:       Turn your GitHub repositories and website projects into a living portfolio. Connect with GitHub via OAuth, choose exactly what to display, drop a live repo grid anywhere, and build project case-study pages from ready-made patterns.
 * Version:           1.0.0
 * Requires at least: 6.2
 * Requires PHP:      8.0
 * Author:            Matt Hummel
 * Author URI:        https://matthummel.com
 * License:           GPL-2.0-or-later
 * License URI:       https://www.gnu.org/licenses/gpl-2.0.html
 * Text Domain:       repofolio
 *
 * @package Repofolio
 */

namespace Repofolio;

defined( 'ABSPATH' ) || exit;

define( 'REPOFOLIO_VERSION', '1.0.0' );
define( 'REPOFOLIO_FILE', __FILE__ );
define( 'REPOFOLIO_DIR', plugin_dir_path( __FILE__ ) );
define( 'REPOFOLIO_URL', plugin_dir_url( __FILE__ ) );
define( 'REPOFOLIO_BASENAME', plugin_basename( __FILE__ ) );

/**
 * Simple PSR-ish require loader (no Composer dependency, keeps the plugin drop-in).
 */
require_once REPOFOLIO_DIR . 'includes/helpers.php';
require_once REPOFOLIO_DIR . 'includes/class-github-client.php';
require_once REPOFOLIO_DIR . 'includes/class-oauth.php';
require_once REPOFOLIO_DIR . 'includes/class-settings.php';
require_once REPOFOLIO_DIR . 'includes/class-block.php';
require_once REPOFOLIO_DIR . 'includes/class-projects.php';
require_once REPOFOLIO_DIR . 'includes/class-plugin.php';

/**
 * Boot.
 */
function repofolio_boot() {
	static $instance = null;
	if ( null === $instance ) {
		$instance = new Plugin();
		$instance->boot();
	}
	return $instance;
}
add_action( 'plugins_loaded', __NAMESPACE__ . '\\repofolio_boot' );

/**
 * Activation: set sane defaults, flag a rewrite flush.
 */
register_activation_hook( __FILE__, function () {
	$defaults = Settings::default_options();
	$existing = get_option( Settings::OPTION_KEY, array() );
	update_option( Settings::OPTION_KEY, wp_parse_args( $existing, $defaults ) );
} );
