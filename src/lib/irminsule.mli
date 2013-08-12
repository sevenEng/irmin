(*
 * Copyright (c) 2013 Thomas Gazagnaire <thomas@gazagnaire.org>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *)

(** Base irminsule datatypes *)

(** Basic types *)
module Types: sig

  (** Keys *)
  type key = K of string

  (** Blobs *)
  type blob = B of string

  (** Revisions *)
  type revision = {
    parents : key list;
    contents: key;
  }

  (** Values *)
  type value =
    | Blob of blob
    | Revision of revision

  (** Tags *)
  type tag = T of string

end

open Types

(** Keys *)
module Key: API.KEY with type t = key

(** Values *)
module Value: API.VALUE with type t = value

(** Blobs *)
module Blob: API.BASE with type t = blob

(** Revisions *)
module Revision: API.BASE with type t = revision