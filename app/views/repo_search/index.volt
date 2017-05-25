<div class="page-header">
    <h1>Recent Github repo lookups</h1>
</div>

<div>
    {{ link_to('index', 'Back') }}
</div>

<ul>
    {% for lastSearch in lastSearches %}
    <li>
        <span class="search-string">{{ lastSearch.repo }}</span>
        <span class="repo-link"><a href="https://github.com/{{ lastSearch.repo }}">https://github.com/{{ lastSearch.repo }}</a></span>
        <span class="search-time">{{ date('D M j G:i:s T Y', strtotime(lastSearch.created_at)) }}</span>
    </li>
    {% endfor %}
</ul>