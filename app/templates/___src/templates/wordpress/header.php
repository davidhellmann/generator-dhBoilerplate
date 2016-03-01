<!doctype html>
<html class="no-js" lang="de_DE">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
  <meta name="robots" content="index,follow" />

  <!-- Google Fonts -->
  <script type="text/javascript">
    WebFontConfig = {
      google: { families: [
        'Vollkorn:400,700italic,700,400italic:latin',
        'Lato:400,300,300italic,700,400italic,700italic,900,900italic,100,100italic:latin'
      ]}
    };
    (function() {
      var wf = document.createElement('script');
      wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
        '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
      wf.type = 'text/javascript';
      wf.async = 'true';
      var s = document.getElementsByTagName('script')[0];
      s.parentNode.insertBefore(wf, s);
    })();
  </script>

  <!-- humans.txt — http://humanstxt.org -->
  <link type="text/plain" rel="author" href="humans.txt" />

  <!-- Pingback -->
  <link rel="pingback" href="<?php bloginfo('pingback_url'); ?>" />

  <!-- CSS -->
  <link rel="stylesheet" href="<?php bloginfo('template_url'); ?>/assets/css/app.min.css?ver=<?php echo filemtime(get_stylesheet_directory() . '/assets/css/app.min.css'); ?>">

  <!-- Modernizr -->
  <script src="<?php bloginfo('template_directory' ); ?>/assets/js/vendor/modernizr-custom.min.js"></script>

  <!-- Favicon -->
  <link rel="apple-touch-icon-precomposed" sizes="57x57" href="<?php bloginfo('template_directory' ); ?>/assets/images/favicon/apple-touch-icon-57x57.png" />
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<?php bloginfo('template_directory' ); ?>/assets/images/favicon/apple-touch-icon-114x114.png" />
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<?php bloginfo('template_directory' ); ?>/assets/images/favicon/apple-touch-icon-72x72.png" />
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<?php bloginfo('template_directory' ); ?>/assets/images/favicon/apple-touch-icon-144x144.png" />
  <link rel="apple-touch-icon-precomposed" sizes="60x60" href="<?php bloginfo('template_directory' ); ?>/assets/images/favicon/apple-touch-icon-60x60.png" />
  <link rel="apple-touch-icon-precomposed" sizes="120x120" href="<?php bloginfo('template_directory' ); ?>/assets/images/favicon/apple-touch-icon-120x120.png" />
  <link rel="apple-touch-icon-precomposed" sizes="76x76" href="<?php bloginfo('template_directory' ); ?>/assets/images/favicon/apple-touch-icon-76x76.png" />
  <link rel="apple-touch-icon-precomposed" sizes="152x152" href="<?php bloginfo('template_directory' ); ?>/assets/images/favicon/apple-touch-icon-152x152.png" />
  <link rel="icon" type="image/png" href="<?php bloginfo('template_directory' ); ?>/assets/images/favicon/favicon-196x196.png" sizes="196x196" />
  <link rel="icon" type="image/png" href="<?php bloginfo('template_directory' ); ?>/assets/images/favicon/favicon-96x96.png" sizes="96x96" />
  <link rel="icon" type="image/png" href="<?php bloginfo('template_directory' ); ?>/assets/images/favicon/favicon-32x32.png" sizes="32x32" />
  <link rel="icon" type="image/png" href="<?php bloginfo('template_directory' ); ?>/assets/images/favicon/favicon-16x16.png" sizes="16x16" />
  <link rel="icon" type="image/png" href="<?php bloginfo('template_directory' ); ?>/assets/images/favicon/favicon-128.png" sizes="128x128" />
  <meta name="application-name" content="Adventskalender — Die Roten Bullen"/>
  <meta name="msapplication-TileColor" content="#FFFFFF"
  <meta name="msapplication-TileImage" content="<?php bloginfo('template_directory' ); ?>/assets/images/favicon/mstile-144x144.png" />
  <meta name="msapplication-square70x70logo" content="<?php bloginfo('template_directory' ); ?>/assets/images/favicon/mstile-70x70.png" />
  <meta name="msapplication-square150x150logo" content="<?php bloginfo('template_directory' ); ?>/assets/images/favicon/mstile-150x150.png" />
  <meta name="msapplication-wide310x150logo" content="<?php bloginfo('template_directory' ); ?>/assets/images/favicon/mstile-310x150.png" />
  <meta name="msapplication-square310x310logo" content="<?php bloginfo('template_directory' ); ?>/assets/images/favicon/mstile-310x310.png" />

  <meta name="twitter:card" value="summary_large_image" />
  <meta name="twitter:url" value="<?php bloginfo('home' ); ?>" />
  <meta name="twitter:title" value="YOUR TITLE" />
  <meta name="twitter:description" value="YOUR DESCRIPTION" />
  <meta name="twitter:image" value="<?php bloginfo('template_directory' ); ?>/assets/images/YOURIMAGE.jpg" />
  <meta name="twitter:site" value="@davidhellmann" />
  <meta name="twitter:creator" value="@davidhellmann" />

  <meta property="og:title" content="YOUR TITLE"/>
  <meta property="og:image" content="<?php bloginfo('template_directory' ); ?>/assets/images/YOURIMAGE.jpg"/>
  <meta property="og:site_name" content="YOUR TITLE"/>
  <meta property="og:description" content="YOUR DESCRIPTION"/>

  <?php wp_head(); ?>
</head>
<body <?php body_class( $class ); ?>>
<script type="text/javascript">
  var templateDir = "<?php bloginfo('template_directory') ?>";
</script>

<!-- WebsiteWrapper -->
<div class="appWrapper">
  <div class="appHeader">
    PAGE HEADER
  </div>



