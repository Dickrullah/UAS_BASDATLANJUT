<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->get('/', 'Posts::index');
$routes->get('posts', 'Posts::index');
$routes->get('posts/create', 'Posts::create'); // Halaman form untuk tambah data
$routes->post('posts/store', 'Posts::store'); // Proses simpan data baru
$routes->get('posts/edit/(:num)', 'Posts::edit/$1'); // Halaman form edit
$routes->post('posts/update/(:num)', 'Posts::update/$1'); // Proses update data
$routes->get('posts/show/(:num)', 'Posts::show/$1'); // Menampilkan detail data
$routes->get('posts/delete/(:num)', 'Posts::delete/$1'); // Proses hapus data
