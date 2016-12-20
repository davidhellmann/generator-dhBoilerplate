<!DOCTYPE html>
<html class="" lang="de_DE">
<head>

    <title>{% block appTitle %}DEVELOPMENT &mdash; dhBoilerplate{% endblock %}</title>
    <?php require_once('_partials/_global/_preloader.php'); ?>
    <?php require_once('_partials/_header/_meta.php'); ?>
    <?php require_once('_partials/_header/_scripts.php'); ?>
    <?php require_once('_partials/_header/_favicons.php'); ?>
    <?php wp_head(); ?>

</head>
<body <?php body_class( $class ); ?>>



<script type="text/javascript">
  var templateDir = "<?php bloginfo('template_directory') ?>";
</script>



<div class="c-appWrapper">
  <div class="c-appHeader">
    PAGE HEADER
  </div>



