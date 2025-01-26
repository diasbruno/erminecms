(asdf:defsystem #:erminecms
  :author "Bruno Dias"
  :version "0.0.1"
  :serial t
  :depends-on (#:serapeum
	       #:clack
	       #:woo
	       #:wst.routing
	       #:wst.web-server.woo)
  :components ((:file "package")))
