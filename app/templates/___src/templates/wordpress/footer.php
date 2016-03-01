  <footer class="appFooter">
    PAGE FOOTER
  </footer>
</div>

  <?php wp_footer(); ?>
  <!-- Javascripts -->
  <script src="<?php bloginfo('template_url'); ?>/assets/js/app.min.js?ver=<?php echo filemtime(get_stylesheet_directory() . '/assets/js/app.min.js'); ?>"></script>

  <% if (projectUrl != 'http://...') { %>
  <!-- BrowserSync -->
  <script type='text/javascript' id="__bs_script__">//<![CDATA[
    document.write("<script async src='http://HOST:3000/browser-sync/browser-sync-client.2.11.11.js'><\/script>".replace
    ("HOST", location.hostname));
    //]]></script>
  <% } %>

</body>
</html>


