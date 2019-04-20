(require 'ox-publish)

(setq org-publish-project-alist
      '(

       ;; ... all the components ...

        ("org-notes"
         :base-directory "~/Documents/blog/org/"
         :base-extension "org"
         :publishing-directory "~/Documents/blog/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4             ; Just the default for this project.
         :auto-preamble t
         )

        ("org-static"
         :base-directory "~/Documents/blog/org/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/Documents/blog/"
         :recursive t
         :publishing-function org-publish-attachment
         )

        ("org" :components ("org-notes" "org-static"))

        ))
