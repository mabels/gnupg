#!/usr/bin/env gpgscm

;; Copyright (C) 2016 g10 Code GmbH
;;
;; This file is part of GnuPG.
;;
;; GnuPG is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3 of the License, or
;; (at your option) any later version.
;;
;; GnuPG is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, see <http://www.gnu.org/licenses/>.

;; GnuPG through 2.1.7 would incorrect mark packets whose size is
;; 2^32-1 as invalid and exit with status code 2.

(load (with-path "defs.scm"))

(if (= 0 (call `(,@GPG --list-packets ,(in-srcdir "4gb-packet.asc"))))
  (info "Can parse 4GB packets.")
  (error "Failed to parse 4GB packet."))
