
;; dumps.el -- utility functions to process dumps from combox and terminal.
;;
;;    Copyright (C) 2015 Siddharth Ravikumar <sravik@bgsu.edu>
;;
;;   This program is free software: you can redistribute it and/or
;;   modify it under the terms of the GNU General Public License as
;;   published by the Free Software Foundation, either version 3 of the
;;   License, or (at your option) any later version.
;;
;;   This program is distributed in the hope that it will be useful,
;;   but WITHOUT ANY WARRANTY; without even the implied warranty of
;;   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;;   General Public License for more details.
;;
;;   You should have received a copy of the GNU General Public License
;;   along with this program (see COPYING).  If not, see
;;   <http://www.gnu.org/licenses/>.


(defun regex-matches-to-list(regex region-start region-end &optional num)
  "Returns a list of strings, in region,  matching the REGEX.

The optional argument NUM specifies the parenthesized expression
in the regex. If NUM is specified, then only the parenthesized
expression identified by NUM is taken.

This function is meant to be used from a function that reads the
region.
"
  (let ((buffer (current-buffer))
        (num (if (not num) 0 num))
        (match-list (list)))
    (with-current-buffer buffer
      (save-excursion
        (save-restriction
          (narrow-to-region region-start region-end)
          (beginning-of-buffer)
          (while (re-search-forward regex nil t)
            (setq match-list (cons (match-string num) match-list))))))
    match-list))


(defun slurp-sae-times(region-start region-end)
  "Slurps 'split and encrypt' times from region and dumps it to *Messages* buffer.

As a side effect it returns the 'split and encrypt' times as a list.
"
  (interactive "r")
  (let ((regex "\\([[:digit:]]+\\.[[:digit:]]+\\) ms")
        (sae-times (list)))
    (dolist (match (regex-matches-to-list
                    regex region-start region-end 1))
      (message match)
      (setq sae-times (cons (string-to-number match) sae-times)))
    sae-times))


(defun sae-times-avg(region-start region-end)
  "Writes the average of 'split and encrypt' times from region to *Message* buffer.

As side effect it:
         - It prints the 'split and encrypt' times in the *Message* buffer.
         - Returns the average 'split and encrypt' time.
"
  (interactive "r")
  (let ((avg-sae-time)
        (sae-times)
        (sae-sum 0))
    (setq sae-times (slurp-sae-times region-start region-end))
    (dolist (sae-time sae-times)
      (setq sae-sum (+ sae-sum sae-time)))
    (setq avg-sae-time (/ sae-sum (length sae-times)))
    (message (format "Avg split and encrypt time: %f [ %d files ]" avg-sae-time
                     (length sae-times)))
    avg-sae-time))


(defun slurp-file-sizes(region-start region-end)
  "Slurps file sizes from region and dumps it to *Messages* buffer.

As a side effect it returns files sizes as a list.
"
  (interactive "r")
  (let ((regex "^\\([[:digit:]]+\\)")
        (file-sizes (list)))
    (dolist (match (regex-matches-to-list
                    regex region-start region-end 1))
      (message match)
      (setq file-sizes (cons (string-to-number match) file-sizes)))
    file-sizes))


(defun file-sizes-avg(region-start region-end)
  "Writes the average of file sizes from region to *Message* buffer.

Along with the average file size, the no. of files and the total
size of all files are also written to *Messages* buffer.

As side effect it:
         - It prints the file sizes to the *Message* buffer.
         - Returns the average file size.
"
  (interactive "r")
  (let ((avg-file-size)
        (mb-in-bytes 1048576.0)
        (file-sizes)
        (file-size-sum 0))
    (setq file-sizes (slurp-file-sizes region-start region-end))
    (dolist (file-size file-sizes)
      (setq file-size-sum (+ file-size-sum file-size)))
    (setq avg-file-size (/ file-size-sum (length file-sizes)))
    (message (format "Avg file size: %f bytes (%fMiB) [ %d files ] [ %f bytes (%fMiB) total ]"
                     avg-file-size (/ avg-file-size mb-in-bytes)
                     (length file-sizes)
                     file-size-sum (/ file-size-sum mb-in-bytes)))
    avg-file-size))
