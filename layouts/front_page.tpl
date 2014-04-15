<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head>
  {% include "html-head" %}
  <meta property="og:url" content="{{ site.url }}">
  <meta property="og:title" content="{{ site.name }}">
  <meta property="og:description" content="{{ page.description }}">
  <meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fbimage }}"><!-- TODO: Add image location data tag -->

  <link rel="stylesheet" href="/assets/admin/tools/0.1.0/edicy-tools.css">
</head>

<body class="front-page">
  <a class="js-body-bg-settings" data-bg-image="{{ page.data.background_image }}" data-bg-color="{{ page.data.background_color }}"></a>
  <div class="container">

    {% include "header" %}

    <main class="content" role="main">
      <a class="js-cover-bg-settings" data-bg-image="{{ page.data.cover_image }}" data-bg-color="{{ page.data.cover_color }}"></a>
      <div class="bg-color js-cover-color" style="background-color: {{ page.data.cover_color }}; opacity: 0.5;"></div><!-- TODO: Opacity?? -->
      <div class="content-inner js-cover-image" style="background-image: url('{{ page.data.cover_image }}');">
        <section class="content-formatted">
          {% content %}
        </section>
      </div>
    </main>

    {% include "footer" %}
  </div>

  {% include "javascripts" %}
  <script src="{{ javascripts_path }}/autogrow.js"></script>
  <script src="{{ javascripts_path }}/ajaxForm.js"></script>
  <script>
    $('.form_field_textarea').autogrow();
    $(".content-formatted form").edicyAjaxForm();
  </script>
  <!-- TODO: Add body background picker -->
  {% include "bgpicker-cover" %}
</body>
</html>
