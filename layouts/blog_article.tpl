<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head>
  {% include "html-head" %}
  <meta property="og:url" content="{{ site.url }}">
  <meta property="og:title" content="{{ site.name }}">
  <meta property="og:description" content="{{ page.description }}">
  <meta property="og:image" content="{{ site.url }}{{ photos_path }}/{{ page.data.fbimage }}"><!-- TODO: Add image location data tag -->
</head>

<body class="post-page js-bgpicker-body-image">

  <div class="container">
    {% include "header" %}

    <main class="content" role="main">
      {% include "tags-post" %}
      <div class="content-inner">
        <article class="post">
          <header class="post-header">
            <h2 class="post-title">{% editable article.title %}</h2>
            <div class="post-header-inner">
              <span class="post-author">{{ article.author.name }}</span>
              <span class="separator">-</span>
              <time class="post-date" datetime="{{ article.created_at | date : "%Y-%m-%d" }}">{{ article.created_at | date : "%B %d, %Y" }}</time>
            </div>
          </header>

          <section class="post-content">
            <div class="post-excerpt content-formatted">{% editable article.excerpt %}</div>
            <div class="post-body content-formatted">{% editable article.body %}</div>
          </section>
        </article>
      </div>
    </main>

    <section class="comments content-formatted">
      {% case article.comments_count %}{% when 0 %}{% else %}<h2 class="comments-title">{{ "comments_for_count" | lc }}: <span class="edy-site-blog-comments-count">{{article.comments_count}}</span></h2>{% endcase %}

      <div class="comment-messages">
        {% for comment in article.comments reversed %}
          <div class="comment edy-site-blog-comment">{{ comment.body_html }} ({{ comment.author }}, {{ comment.created_at | date : "%b %d, %Y" }}) {% removebutton %}</div>
        {% endfor %}
      </div>

      {% include "comment-form" %}
    </section>

    {% include "footer" %}
  </div>

  {% include "javascripts" %}
  <script>site.initArticlePage();</script>
</body>
</html>
