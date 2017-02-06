<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="robots" content="index,follow" />

<meta name="twitter:card" value="summary_large_image" />
<meta name="twitter:url" value="<?php bloginfo('home' ); ?>" />
<meta name="twitter:title" value="<?php wp_title(); ?>" />
<meta name="twitter:description" value="<?php wp_title(); ?>" />
<meta name="twitter:image" value="<?php bloginfo('template_directory' ); ?>/assets/images/bitmap/YOURIMAGE.jpg" />
<meta name="twitter:site" value="@davidhellmann" />
<meta name="twitter:creator" value="@davidhellmann" />

<meta property="og:title" content="<?php wp_title(); ?>"/>
<meta property="og:image" content="<?php bloginfo('template_directory' ); ?>/assets/images/bitmap/YOURIMAGE.jpg"/>
<meta property="og:site_name" content="<?php wp_title(); ?>"/>
<meta property="og:description" content="<?php wp_title(); ?>"/>

<title>
    <?php
    if (function_exists('is_tag') && is_tag()) {
        echo 'Tag Archive for &quot;'.$tag.'&quot; - '; }
    elseif (is_archive()) {
        wp_title(''); echo ' Archive &mdash; '; }
    elseif (is_search()) {
        echo 'Search for &quot;'.wp_specialchars($s).'&quot; &mdash; '; }
    elseif (is_page('start')) { }
    elseif (!(is_404()) && (is_single()) || (is_page())) {
        wp_title(''); echo ' &mdash; '; }
    elseif (is_404()) {
        echo 'Not Found &mdash; '; }
    if (is_home()) {
        bloginfo('name'); echo ' &mdash; '; bloginfo('description'); }
    else { bloginfo('name'); }
    ?>
</title>
