mgksh
=====
This is a combination of
[`oksh`](https://github.com/ibara/oksh), the portable OpenBSD `ksh(1)`
with [`mg`](https://github.com/ibara/mg), the portable OpenBSD `mg(1)`.

`mgksh(1)` has `mg` embedded within the `ksh` shell.
When built statically, `mgksh` allows you to visually edit text files
when in single-user mode.

Why?
----
Because learning [`ed(1)`](https://github.com/ibara/oed) is difficult.

Supported systems
-----------------
`mgksh` should run everywhere that `oksh` and `mg` run.

Building
--------
```
$ ./build.sh
```
This will build a statically linked binary ready to be installed into
`/bin`.

**DO NOT RUN `make` DIRECTLY!**

You may have to edit `configure`, `Makefile`, `mg_config.h`, and
`pconfig.h` to match your system. The default is for OpenBSD.

Bugs
----
There are still a number of outstanding bugs, particularly related to
subsequent invocations of `mg`. Patches welcome!

License
-------
The main Korn shell files are public domain (see `LEGAL`).
Mg is also public domain.
Portability files are BSD or ISC licensed; see individual file headers
for details.
Ncurses has its own MIT-style license.
