## rebar3.mk
## Version 0.1.0
## Copyright 2023 Jesse Gumm
## MIT License
##
## This is a tool to help you either use the existing rebar3 in the system or
## build a new one just for a specific project.
## 
## How to use:
##  1) include it in your Makefile with:
##
##         include rebar3.mk
##
##  2) Update any rules in your makefile so that rebar3 is required, and then
##     change the rebar3 calls to use "$(REBAR)" instead of "rebar3" or "./rebar3"
##
##     For example, change this:
##
##         compile:
##             rebar3 compile
##     
##     To This:
##
##         compile: rebar3
##             $(REBAR) compile

REBAR_MK_VERSION=0.1.0

REBAR_PATH = $(shell which rebar3)

ifeq ($(REBAR_PATH),)
REBAR = ./rebar3
RANDOM_STRING := rebar3_$(shell openssl rand -hex 16)
rebar3:
	@echo "Fetching and compiling rebar3 for this local project..."
	@(cd /tmp && \
	git clone https://github.com/erlang/rebar3 $(RANDOM_STRING) && \
	cd $(RANDOM_STRING) && \
	./bootstrap)
	@echo "Installing rebar3 into your project's directory..."
	@(mv /tmp/$(RANDOM_STRING)/rebar3 .)
	@echo "Cleaning up..."
	@(rm -fr /tmp/$(RANDOM_STRING))
else
REBAR = rebar3
rebar3:
endif

update_rebar3_mk:
	curl -O https://raw.githubusercontent.com/choptastic/rebar3.mk/master/rebar3.mk
