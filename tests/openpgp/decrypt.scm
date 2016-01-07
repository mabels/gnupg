#!/usr/bin/env gpgscm

(load (in-srcdir "defs.scm"))

(for-each-p
 "Checking decryption of supplied files"
 (lambda (name)
   (tr:do
    (tr:open (in-srcdir (string-append name ".asc")))
    (tr:gpg "" '(--yes))
    (tr:assert-identity name)))
 plain-files)

(for-each-p
 "Checking decryption of supplied DSA encrypted file"
 (lambda (name)
   (tr:do
    (tr:open (in-srcdir (string-append name "-pgp.asc")))
    (tr:gpg "" '(--yes))
    (tr:assert-identity name)))
 (list (car plain-files)))
