<?php
 
class RepoSearchController extends BaseController
{
    public function indexAction()
    {
        $this->view->lastSearches = RepoSearch::find(["order" => "created_at DESC"]);
    }
}
