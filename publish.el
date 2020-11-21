;; (require 'package)
;; (package-initialize)

;; (require 'sh-script)
;; (require 'python)

(require 'ox-publish)
;; (require 'org)
;; (require 'ox-publish)
;; (require 'ox-html)
;; (require 'org-element)

;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/elpa/htmlize-1.55/"))
(require 'htmlize)

(setq org-html-validation-link nil)
;; (setq org-src-fontify-natively t)
(setq org-export-with-date nil)

(setq org-publish-project-alist
      '(

       ;; ... all the components ...

        ("posts"
         :base-directory "~/Documents/blog/org/"
         :base-extension "org"
         :publishing-directory "~/Documents/blog/public/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :auto-preamble t
         :htmlized-source t
         :html-preamble nil
         :html-postamble nil
         :html-link-home "/"
         :html-link-up "/"
         :html-home/up-format  "<div id=\"org-div-home-and-up\">
                               <a accesskey=\"H\" href=\"%s\">Home</a>
                               </div>"

         :auto-sitemap t
         :sitemap-filename "sitemap.org"
         :sitemap-title ""
         :sitemap-style list
         :sitemap-sort-files anti-chronologically
         :sitemap-file-entry-format "%d - %t"
         :sitemap-format-entry
         (lambda (entry style project)
           (cond ((not (directory-name-p entry))
                  (format "%s [[file:%s][%s]]"
                          (format-time-string
                           "%Y-%m-%d"
                        (org-publish-find-date entry project))
                          entry
                          (org-publish-find-title entry project)))
                 ((eq style 'tree)
                  ;; Return only last subdir.
                  (file-name-nondirectory (directory-file-name entry)))
                 (t entry)))

         :with-toc    nil
         :with-author nil
         :section-numbers nil
         :with-email nil
         :with-creator nil
         :with-date t
         ;; :with-timestamps nil

         :html-doctype "html5"
         :html-html5-fancy t
         :html-head "<link rel='stylesheet' type='text/css' href='css/style.css' />"
         )

        ("static"
         :base-directory "~/Documents/blog/static/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/Documents/blog/public/"
         :recursive t
         :publishing-function org-publish-attachment
         )

        ("all" :components ("posts" "static"))

        ))
