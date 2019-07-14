Docker GUI
==========
An example of [one possible approach] for running [X11 GUI] applications from
within a [Docker] container. **This example is NOT focused on security**, but
instead on minimizing the amount of dependencies on the _host_ machine.
[Docker Compose] is needed for running the example script as is, but it is not
mandatory for following this approach.

Usage
-----
```bash
$ bin/xeyes.sh
```

How does it work?
-----------------
Before launching the GUI application we generate a custom `.Xauthority` file
with a [FamilyWild connection family]. This will allow any connection access to
the current X server session. **Special care should be taken to avoid leaking
this file to untrusted parties**. Afterwards we launch the application passing
along the current `DISPLAY` environment variable. We also mount
`/tmp/.X11-unix/` and our custom `.Xauthority` file as read-only volumes.

[Docker]: https://www.docker.com/
[Docker Compose]: https://docs.docker.com/compose/
[FamilyWild connection family]: https://www.x.org/archive/current/doc/man/man7/Xsecurity.7.xhtml#heading4
[X11 GUI]: https://en.wikipedia.org/wiki/X_Window_System
[one possible approach]: https://stackoverflow.com/questions/16296753/can-you-run-gui-applications-in-a-docker-container/25280523#25280523
