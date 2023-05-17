# lean4-docker

A small Dockerfile to allow working on a particular lean4 development inside emacs inside a docker container.

To use:

```shell
make build
make run
```

Running populates `/tmp/math-puzzles-in-lean4` with a clone of https://github.com/dwrensha/math-puzzles-in-lean4.git,
and mounts exactly the file `/tmp/math-puzzles-in-lean4/MathPuzzles/UpperLowerContinuous.lean` in a suitable place in 
the container. Everything else (including mathlib4) is precompiled during container build.

The other volume mount of note is `${HOME}/tmp/eln-cache`, which is bound to the container's native compilation
cache. Mysteriously, I can't seem to turn off native compilation in the container, so the volume mount is there
to make sure the cost is only incurred once across many invocations of `make run`.
