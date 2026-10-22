# Checking ignored build files

## Ignore policy

The .gitignore file contains these entries:

```gitignore
out/
*.log
```

The out/ rule ignores generated build output. The *.log rule ignores
log files. Ignore rules do not remove files that Git already tracks.

## Automated verification

Run from the repository root:

```bash
make check-ignore
```

This target runs scripts/check-ignore.sh, which checks that:

- A representative output path is ignored.
- A representative log path is ignored.
- No files under out/ and no .log files are tracked.

The check exits with a nonzero status if any condition fails.
It does not create or delete test files.

Expected successful output:

```text
PASS: Output and log paths are ignored; none are tracked.
```

## Build verification

Run both checks before merging:

```bash
make check-ignore
make ci
```

The check-ignore target is separate from the existing ci target.

## Manual inspection

To see the matching ignore rules:

```bash
git check-ignore -v out/example.txt lab04-check.log
```

To check for tracked output and logs:

```bash
git ls-files -- 'out/*' '*.log'
```

The final command should produce no output.
