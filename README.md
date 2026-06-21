<div align="center">

# 🍺 MimicOS Homebrew Tap

**Install [MimicOS](https://github.com/ayushmaninbox/mimic-os) with one command — no Gatekeeper headaches.**

[![MimicOS](https://img.shields.io/badge/app-MimicOS-black?logo=apple)](https://github.com/ayushmaninbox/mimic-os)
[![Homebrew Cask](https://img.shields.io/badge/brew-cask-orange?logo=homebrew&logoColor=white)](#install)
[![macOS 14+](https://img.shields.io/badge/macOS-14%2B-black?logo=apple)](https://www.apple.com/macos)

</div>

> **MimicOS** lets you fully control your Android phone from your Mac — mirror the screen, transfer files, automate taps, sync clipboards, and more. No apps on the phone, no root.

---

## Install

```sh
brew install --cask ayushmaninbox/mimic-os/mimicos
```

That's it. Homebrew downloads the latest release, installs **MimicOS.app** to `/Applications`, and **strips the macOS quarantine flag** — so the app opens immediately with no *"Apple could not verify…"* Gatekeeper prompt.

> 💡 **Why this is nicer than the DMG:** MimicOS is ad-hoc signed (not notarized with a paid Apple Developer ID). A manually downloaded `.dmg` gets quarantined by macOS and blocked on first launch. Installing through this tap removes that quarantine automatically, so you skip the right-click → Open dance entirely.

---

## Update

```sh
brew update
brew upgrade --cask mimicos
```

## Uninstall

```sh
brew uninstall --cask mimicos          # remove the app
brew uninstall --zap --cask mimicos    # also wipe preferences & saved state
```

---

## Prefer the DMG?

You can still grab `MimicOS-vX.Y.dmg` from [**Releases**](https://github.com/ayushmaninbox/mimic-os/releases). If macOS blocks it, strip the quarantine manually:

```sh
xattr -dr com.apple.quarantine /Applications/MimicOS.app
```

---

## For maintainers — cutting a new release

When a new `MimicOS-vX.Y.dmg` is published to [Releases](https://github.com/ayushmaninbox/mimic-os/releases):

1. **Get the DMG's SHA256** (GitHub computes it — no download needed):
   ```sh
   gh release view vX.Y --repo ayushmaninbox/mimic-os \
     --json assets --jq '.assets[].digest'
   ```
2. **Bump** `version` and `sha256` in [`Casks/mimicos.rb`](Casks/mimicos.rb).
3. **Commit & push.** Users get it on their next `brew update`.

Check that the cask points at the newest release at any time:

```sh
brew livecheck mimicos
```

The cask's `livecheck` stanza watches the GitHub Releases page, so this reports whenever the cask is behind.

---

<div align="center">
<sub>Tap for <a href="https://github.com/ayushmaninbox/mimic-os">MimicOS</a> · MIT Licensed</sub>
</div>
