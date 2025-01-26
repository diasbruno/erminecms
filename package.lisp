(defpackage #:erminecms
  (:use #:common-lisp)
  (:export
   #:defcontroller
   #:start
   #:stop))

(in-package :erminecms)

(defmacro defcontroller (name path method args &body body)
  "Declare NAME controller with ARGS. Errors are already handled by a
 error->response."
  `(progn
     (defun ,name ,args
       ,@body)
     (wst.routing:remove-route ',name)
     (wst.routing:add-route ',name ,path ,method
			    (lambda (rq rs)
			      (funcall ',name rq rs)))))

(defparameter *app*
  (lambda (env)
    (serapeum:~>
     (wst.routing.woo:woo-env->request env)
     (wst.routing:dispatch-route _)
     (wst.routing.woo:response->woo-response _))))

(defparameter *handler* nil)

(defun start (config)
  (setf *handler*
	(clack:clackup
	 *app*
	 :debug (getf config :debug nil)
	 :silent nil
	 :server :woo
	 :port (getf config :port 6000))))

(defun stop ()
  (clack:stop *handler*))
