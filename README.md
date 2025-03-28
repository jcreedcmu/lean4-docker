# lean4-docker

A small Dockerfile to allow working on a particular lean4 development inside emacs inside a docker container.

To use:

```shell
make build
make run
```

This starts an emacs with lean4-mode available.

Mathlib4 is precompiled during container build.

Host `${HOME}/proj/lean` is bound to guest `/lean-code` so lean code can go in there.

The other volume mount of note is `${HOME}/tmp/eln-cache`, which is bound to the container's native compilation
cache. Mysteriously, I can't seem to turn off native compilation in the container, so the volume mount is there
to make sure the cost is only incurred once across many invocations of `make run`.
