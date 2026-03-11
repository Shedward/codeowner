# codeowner

CLI tool to look up the owner of a file from a `CODEOWNERS_HH` file in its git repository.

## Usage

```
codeowner <path>
```

The path can be absolute or relative to the current directory. The file does not need to exist on disk.

```
$ codeowner Features/Applicant/Product/ApplicantCalls/SomeFile.swift
combine-ios (apps_calls)
```

The tool resolves the git repository root from the provided path, reads `CODEOWNERS_HH` at that root, and prints the owning team and function tag.

## CODEOWNERS_HH format

Standard GitHub CODEOWNERS format with an optional `hh-func:` annotation:

```
Features/Applicant/Product/ApplicantCalls/.* @hhru/combine-ios # hh-func: apps_calls
```

Output is `<team> (<func>)`, or just `<team>` if no `hh-func:` tag is present.

## Environment

| Variable | Description |
|---|---|
| `CODEOWNERS_FILE` | Override the path to the CODEOWNERS file |

## Installation


### Brew

```bash
brew install hhru/tap/Codeowner
```

Also to install Quick Action
```
ln -sf /opt/homebrew/opt/codeowner/share/codeowner/codeowner.workflow ~/Library/Services/
```

### Manual

```bash
make install
```

Installs `codeowner` to `/usr/local/bin` and the macOS Quick Action to `~/Library/Services`.

To install to a custom prefix:

```bash
make install PREFIX=/opt/homebrew
```

To uninstall:

```bash
make uninstall
```

## macOS Quick Action

The `Services/codeowner.workflow` Automator Quick Action lets you right-click any file in Finder and select **codeowner** from the Quick Actions menu. The result is shown in a dialog.

To use it, install via `make install`, then enable it in **System Settings → Privacy & Security → Extensions → Finder Extensions**.

It also works from Xcode: right-click any file in the Project Navigator, then **Services → codeowner**.
