# rebar3.mk

This is a tool to help your Erlang projects either use the existing rebar3
that's already installed in your system or build a new one just for a specific
project.

## Getting Started

### Step 1

There are two possible appraoches of step 1:
  * The more secure method, but less automated method
  * The more automated method, but less secure method.

#### Step 1a - Secure approach

*This approach requires less trust than the more automated approach because
you're manually downloading `rebar3.mk` and adding it to your repository.*

Download The latest `rebar3.mk` and add it to the root of your Erlang
application's directory.  Don't forget to add it to git (or source control of
your choice first).

```bash
curl -o https://raw.githubusercontent.com/choptastic/rebar3.mk/master/rebar3.mk
```

Once this is finished, add the following rule to your `Makefile`

```make
include rebar3.mk
```

#### Step 1b - Automated/trusting approach

*(Pre-note: I recommend looking at the contents of `https://rebar3.mk/init.mk`
first before running this script. That said, it does not actually run a remote
script, but instead just appends text to your Makefile.)*

Note: This approach trusts the `rebar3.mk` repository and domain name more, and
is therefore less secure (the more you have to trust something, the less secure
it is). It is recommended to **always** verify the code of a script you're
about to download and run from the internet.

Run the following to automatically modify your `Makefile` to add the
`rebar3.mk` rules.

```bash
curl -s -L https://rebar3.mk/init.mk > temp.mk && \
echo "9406b0ee0db6589b91d21fc9cf89759e8a7625678bc2874cfba6a67bd287b8fc  temp.mk" | \
sha256sum -c --quiet && cat temp.mk >> Makefile && rm temp.mk
```

*(this little snippet downloads the text to add to your Makefile, verifies its
hash, then appends it to your Makefile.  This is a little safer because the
hash verification can protect you from [rebar3.mk](https://rebar3.mk) getting
hijacked)*


### Step 2 (Updating some necessary Makefile rules)

1. Update any rebar3 related targets in your `Makefile` to add the `rebar3` dependency.
2. Update any invocations of `rebar3` or `./rebar3` to instead invoke `$(REBAR)`

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

### Step 3 (Celebrate!)

Now every time you run `make compile`, it will check for the presence of
rebar3, and if it's not found, download and compile it first.

## Updating `rebar3.mk`

You can update the version of `rebar3.mk` that's installed in your app by running:

```make
make update_rebar3_mk
```

## What should I add to my version control system (git/hg/svn/fossil/etc)?

* If you used the secure method, then add `Makefile` and `rebar3.mk` to your
  repository.

* If you used the automated method, then just add `Makefile` to your
  repository.

## Author

Copyright 2023-2024 Jesse Gumm

MIT Licensed
