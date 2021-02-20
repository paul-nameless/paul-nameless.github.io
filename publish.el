(require 'package)
(package-initialize)
(require 'ox-publish)
(require 'htmlize)

(setq org-html-validation-link nil)
(setq org-export-with-date nil)

(defun org-blog-postamble (plist)
  "Post-amble for whole blog."
  (concat
  "To get in touch, email me at <a href=\"mailto:reacsdas@gmail.com\">reacsdas@gmail.com</a> <br /><br />
Discuss and comment in <a href=\"https://t.me/reacsdas\">Telegram</a> | <a href=\"https://github.com/paul-nameless\">Github</a> | <a href=\"https://twitter.com/paul_nameless\">Twitter</a><br/>
<br/>
<form action=\"https://42emails.com/api/email\">
  <input type=\"text\" name=\"email\" placeholder=\"Email\" />
  <input type=\"hidden\" name=\"form_id\" value=\"08796a82e266426c8d202b135d25a274\" />
  <input type=\"submit\" value=\"Subscribe\" /><br/>
</form>

<!-- Cloudflare Web Analytics -->
<script defer src='https://static.cloudflareinsights.com/beacon.min.js' data-cf-beacon='{\"token\": \"2c0ad197c226461eaccf6861b45f1cf8\"}'>
</script>
<!-- End Cloudflare Web Analytics -->"
  ))

(setq org-publish-project-alist
      '(

        ("posts"
         :base-directory "~/Documents/blog/org/"
         :base-extension "org"
         :publishing-directory "~/Documents/blog/docs/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :auto-preamble t
         :htmlized-source t
         :html-preamble nil
         :html-postamble org-blog-postamble
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
         :html-head "<link rel='stylesheet' type='text/css' href='css/style.css' />
<link rel='icon' type='image/png' href='/favicon.png'>"
         )

        ("static"
         :base-directory "~/Documents/blog/static/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/Documents/blog/docs/"
         :recursive t
         :publishing-function org-publish-attachment
         )

        ("all" :components ("posts" "static"))

        ))
