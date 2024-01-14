# Changelog

## 0.3.0

* Added some simpler initialization (modifying the makefile with a script
  rather than copy-paste in the instructions).
* Added more customizable variables to determine which rebar3 will be cloned
  and built.
* Changed the version lookup to not rely on `jq` (which isn't necessarily
  always installed).
* Added an example `Makefile` in the examples dir.
* Reworked the prompts to show that rebar3.mk is talking, and to give
  instructions on how to customize the build source.


## 0.2.0

* Silence some git noise
* Add an install rebar rule

## 0.1.0

* Initial Working Version
