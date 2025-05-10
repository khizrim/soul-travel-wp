<?php
// Включаем поддержку миниатюр и других функций темы
add_theme_support('title-tag');
add_theme_support('post-thumbnails');

// Подключаем стили
function your_theme_enqueue_styles() {
    wp_enqueue_style('main-style', get_stylesheet_uri());
}
add_action('wp_enqueue_scripts', 'your_theme_enqueue_styles');
