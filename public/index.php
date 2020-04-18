<?php
// error_reporting(E_ALL);
// ini_set('display_errors', 1);
if (PHP_SAPI == 'cli-server') {
    // To help the built-in PHP dev server, check if the request was actually for
    // something which should probably be served as a static file
    $url  = parse_url($_SERVER['REQUEST_URI']);
    $file = __DIR__ . $url['path'];
    if (is_file($file)) {
        return false;
    }
}

require __DIR__ . '/../vendor/autoload.php';
if (strpos($_SERVER['SCRIPT_FILENAME'], $_SERVER['DOCUMENT_ROOT']) === false) {
    $_SERVER['SCRIPT_NAME'] = $_SERVER['SCRIPT_FILENAME'];
    $_SERVER['SCRIPT_FILENAME'] = $_SERVER['DOCUMENT_ROOT'] . '/' . $_SERVER['SCRIPT_NAME'];// substr($_SERVER['SCRIPT_FILENAME'], strlen(rtrim($_SERVER['DOCUMENT_ROOT'], DIRECTORY_SEPARATOR)));
}

// Instantiate the app
$settings = require __DIR__ . '/../src/settings.php';
$app = new \Slim\App($settings);
$app->add(new \Slim\Middleware\Session([
    'name' => 'app_session',
    'autorefresh' => true,
    'lifetime' => '2 hour'
]));
$app->getContainer()->router->setBasePath("");
session_start();
// Set up dependencies
$dependencies = require __DIR__ . '/../src/dependencies.php';
$dependencies($app);

// Register middleware
$middleware = require __DIR__ . '/../src/middleware.php';
$middleware($app);

// Register routes
$routes = require __DIR__ . '/../src/routes.php';
$routes($app);

// Run app
$app->run();
