<?php
/**
 * Redirect theme requests to frontend.
 *
 * @author WebDevStudios
 * @package wds-headless-theme
 * @since 1.0.0
 */

header( 'Location:' . $_ENV['HEADLESS_FRONTEND_URL'], true, 303 );
