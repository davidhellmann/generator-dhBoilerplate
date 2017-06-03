<?php get_header(); ?>

<div class="m-appContent">

    <% if (projectVue) { %>
    <div id="app" class="vue">
        <hello></hello>
    </div>
    <% } %>

  <?php if (have_posts()) :
    while (have_posts()) : the_post(); ?>

      <h1><?php the_title(); ?></h1>

      <?php the_content(); ?>

    <?php endwhile;
  endif; ?>
</div>

<?php get_footer(); ?>
