(ql:quickload :clog)

(defpackage #:multipage-greenscreen
  (:use #:cl #:clog)
  (:export start-multipage-greenscreen))

(in-package :multipage-greenscreen)

(defun create-chroma-key-page (body text-content)
  (let ((style-block (create-style-block body)))
    (add-style style-block :element "body"
               '(("background-color" "#00FF00")  ;; Light green background
                 ("color" :white)                ;; White text color
                 ("font-size" "800%")            ;; Increase the font size to 300%
                 ("text-shadow"                  ;; Black text outline
                  "2px 2px 0 #000, -2px -2px 0 #000, -2px 2px 0 #000, 2px -2px 0 #000")))
    (create-div body :content text-content)))

(defun on-whatever1 (body)
  (create-chroma-key-page body "Whatever #1"))

(defun on-whatever2 (body)
  (create-chroma-key-page body "Whatever #2"))

(defun on-whatever3 (body)
  (create-chroma-key-page body "Whatever #3"))

(defun start-multipage-greenscreen ()
  "Start the multipage greenscreen example."
  (initialize 'on-whatever1)  ;; Default route to whatever1
  ;; Setup routes for each page -- so we can actually go to it.
  (set-on-new-window 'on-whatever1 :path "/whatever1")
  (set-on-new-window 'on-whatever2 :path "/whatever2")
  (set-on-new-window 'on-whatever3 :path "/whatever3")
  (open-browser))

(start-multipage-greenscreen)

