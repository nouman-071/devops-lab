# Checking ignored build files

The repository already ignores generated output in out/ and files
ending in .log. These rules prevent new matching files from appearing
as untracked files.

Check which rules apply:

```bash
git check-ignore -v out/example.txt lab04-check.log
```

Check for tracked log files:

```bash
git ls-files '*.log'
```

Run the existing pipeline to verify that the build still works:

```bash
make ci
```
