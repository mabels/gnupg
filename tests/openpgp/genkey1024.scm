#!/usr/bin/env gpgscm

(load (in-srcdir "defs.scm"))

(define (genkey config)
  (pipe:do
   (pipe:defer (lambda (sink) (display config (fdopen sink "w"))))
   (pipe:spawn `(,@GPG' --quiet --batch --gen-key))))

(info "Checking batch key generation")
(genkey "Key-Type: DSA
Key-Length: 1024
Subkey-Type: ELG
Subkey-Length: 1024
Name-Real: Harry H.
Name-Comment: test key
Name-Email: hh@@ddorf.de
Expire-Date: 1
%no-protection
%transient-key
%commit
")

(if (have-pubkey-algo? "RSA")
    (genkey "Key-Type: RSA
Key-Length: 1024
Key-Usage: sign,encrypt
Name-Real: Harry A.
Name-Comment: RSA test key
Name-Email: hh@@ddorf.de
Expire-Date: 2
%no-protection
%transient-key
%commit
"))
