<?php

class IndexController extends BaseController
{

    public function indexAction()
    {
        $contributors = [];

        if ($post = $this->request->getPost()) {
            $contributors = $this->getContributorsData($post);
        }

        $this->view->contributors = $contributors;
        $this->view->lastSearches = $this->url->get('repo_search/index');
    }

    private function getContributorsData(array $post)
    {
        $githubConfig = $this->getDI()->get('config')->github;
        @list($owner, $repo) = explode('/', $post['repository']);

        try {
            $client = new GitHubClient();
            $client->setCredentials($githubConfig->username, $githubConfig->password);
            $contributors = $client->repos->listContributors($owner, $repo);
            RepoSearch::saveByAttributes(['repo' => $post['repository']]);
        } catch (GitHubClientException $e) {
            $contributors = [];
        }

        return $contributors;
    }
}

