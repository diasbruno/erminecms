(pushnew (uiop:getcwd) ql:*local-project-directories*)

(ql:quickload '(:erminecms))

(erminecms:defcontroller home-page "/" :GET (request response)
  (declare (ignore request))
  (wst.routing:ok-response t response :content "ok"))


(erminecms:defcontroller a-page "/a" :GET (request response)
  (declare (ignore request))
  (wst.routing:ok-response t response :content "a"))
