# rebar3.mk

This is a tool to help you either use the existing rebar3 that's already
installed in your system or build a new one just for a specific project.

## How to use:

1. Download it to the location where your Makefile lives:

   ```bash
   curl -O https://raw.githubusercontent.com/choptastic/rebar3.mk/master/rebar3.mk
   ```

2. include it in your Makefile with:

   ```make
   include rebar3.mk
   ```

3. Update any rules in your makefile so that rebar3 is required, and then
   change the rebar3 calls to use `$(REBAR)` instead of `rebar3` or `./rebar3`

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

4. Celebrate!

## Update

You can update the version of `rebar3.mk` that's installed in your app by running:

```make
make update_rebar3_mk
```

## Author

Copyright 2023 Jesse Gumm

MIT Licensed
