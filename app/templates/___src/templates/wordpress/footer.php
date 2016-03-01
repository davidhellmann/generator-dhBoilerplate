  <footer class="appFooter">
    PAGE FOOTER
  </footer>
</div>

  <?php wp_footer(); ?>
  <!-- Javascripts -->
  <script src="<?php bloginfo('template_url'); ?>/assets/js/plugins.min.js?ver=<?php echo filemtime(get_stylesheet_directory() . '/assets/js/plugins.min.js'); ?>"></script>
  <script src="<?php bloginfo('template_url'); ?>/assets/js/app.min.js?ver=<?php echo filemtime(get_stylesheet_directory() . '/assets/js/app.min.js'); ?>"></script>

<?php
$host = $_SERVER['HTTP_HOST'];
if($host == "localhost" or $host == "yourwebsite.dev") {
  ?>
  <!-- BrowserSync -->
  <script type='text/javascript' id="__bs_script__">//<![CDATA[
    document.write("<script async src='http://HOST:3000/browser-sync/browser-sync-client.2.10.0.js'><\/script>".replace("HOST", location.hostname));
    //]]></script>
<?php } ?>

</body>
</html>
