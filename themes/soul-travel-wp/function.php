<?php
// Включаем поддержку различных возможностей темы
add_theme_support('title-tag');
add_theme_support('post-thumbnails');
add_theme_support('html5', ['search-form', 'comment-form', 'gallery', 'caption']);

register_nav_menus([
    'main-menu' => __('Главное меню', 'soultravel'),
]);


// Подключаем стили темы
function soultravel_enqueue_assets() {
    wp_enqueue_style(
        'soultravel-main',
        get_template_directory_uri() . '/styles/index.css',
        [],
        filemtime(get_template_directory() . '/styles/index.css')
    );
}

add_action('wp_enqueue_scripts', 'soultravel_enqueue_assets');
