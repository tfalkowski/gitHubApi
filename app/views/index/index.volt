<div class="page-header">
    <h1>Github contributor lookup</h1>
</div>

<div>
    <a href="{{ lastSearches }}">Recent repo searches</a>
</div>
<br>

{{ form() }}
{{ text_field('repository') }}
{{ submit_button('Look up contributors') }}
{{ end_form() }}


{% if request.isPost() and contributors is empty %}
       <div>Repo not found</div>
{% endif  %}


<ul class="contributors">
    {% for contributor in contributors %}
    <li class="contributor">
        <a>
            <img src="{{ contributor.getAvatarUrl() }}">
            <span class="contributor-name">{{ contributor.getLogin() }}</span>
            <span class="contributor-contributions">{{ contributor.getContributions() }}</span>
        </a>
    </li>
    {% endfor %}
</ul>
