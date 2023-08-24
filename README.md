# rebar3.mk

This is a tool to help your Erlang projects either use the existing rebar3
that's already installed in your system or build a new one just for a specific
project.

## How to use:

1. At the top of your `Makefile` add this:

   ```make
   # Check if rebar3.mk exists, and if not, download it
   ifeq ("$(wildcard rebar3.mk)","")
   $(shell curl -O https://raw.githubusercontent.com/choptastic/rebar3.mk/master/rebar3.mk)
   endif

   # rebar3.mk adds a new rebar3 rule to your Makefile
   # (see https://github.com/choptastic/rebar3.mk) for full info
   include rebar3.mk
   ```

2. Update any rules in your `Makefile` that currently depend on the rebar3
   executable being present, to add the `rebar3` rule, and change any `rebar3`
   (or `./rebar3`) invocations to `$(REBAR)`.

   For example, change this:

   ```make
   compile:
       rebar3 compile
   ```

    To This:

    ```make
    compile: rebar3
        $(REBAR) compile
    ```

3. Celebrate! Now every time you run `make compile`, it will check for the
   presence of rebar3, and if it's not found, download and compile it first.

## Updating `rebar3.mk`

You can update the version of `rebar3.mk` that's installed in your app by running:

```make
make update_rebar3_mk
```

## What should I add to my version control system (git/hg/svn/fossil/etc)?

* Just the `Makefile` is sufficient enough to add to your VCS's repository.

* I would *not* add `rebar3` directly to the repo because that can break
  portability with future (or previous) versions of Erlang.

* You *may* add `rebar3.mk` to your repository, but it's likely unnecessary,
  but obviously if you end up updating your `rebar3.mk` file, it will end up
  needing to be updated here as well.

## Author

Copyright 2023 Jesse Gumm

MIT Licensed
