<?php
/**
 * Uninstall cleanup for Repofolio.
 *
 * Removes options, the stored token, and any cached GitHub transients.
 *
 * @package Repofolio
 */

defined( 'WP_UNINSTALL_PLUGIN' ) || exit;

$options = array(
	'repofolio_options',
	'repofolio_access_token',
	'repofolio_viewer',
);
foreach ( $options as $option ) {
	delete_option( $option );
}

// Delete cached API transients (prefix repofolio_).
global $wpdb;
$like = $wpdb->esc_like( '_transient_repofolio_' ) . '%';
$keys = $wpdb->get_col( $wpdb->prepare( "SELECT option_name FROM {$wpdb->options} WHERE option_name LIKE %s", $like ) );
foreach ( (array) $keys as $key ) {
	delete_option( $key );
	delete_option( str_replace( '_transient_', '_transient_timeout_', $key ) );
}
