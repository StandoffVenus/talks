---
author: Liam Mueller
paging: "%d/%d"
---

# Installing dependencies is hard

## How to better manage yours (and others) dependencies

---

# Contents

- Common package managers
- The pitfalls of most common package managers
- Alternatives
- The package manager to rule them all

---

# Common package managers

## Debian/Ubuntu/Mint/Pop!_OS

- dpkg
- apt
- aptitude

## Fedora/CentOS/OpenSUSE

- rpm
- yum

## Arch

- pacman

## Alpine

- apk

## General Linux

- flatpak
- snap

## MacOS/OSX

- brew
- macports

## Windows

- choco
- winget
- scoop

---

# What can they not do?

- Multiple versions of packages (some exceptions)
- Difficult to patch/sideload
- Non-deterministic builds/installs

---

# Why do you need these capabilities?

## Multiple versions of packages

- Software is built around versioning
- Backwards-compatibility, regressions, deprecation
- Testing multiple versions is tedious

## Patching and sideloading

- Security
- Outdated, unmaintained, unsupported dependencies
- Customizing installations

## Non-deterministic builds/installs

- "It works on my machine"
- Inconsistent builds, tests, runs
- Developers have to manage dependencies in a non-standardized but similar way
- Automation is difficult to keep consistent

---

# Solutions

---

# Solution: scripting ❌

## Good
- Simple
- No extra dependencies*

## Bad
- Non-deterministic: can leave system in weird states if failures happen at different spots
- Scripts for everything
- Scripts grow very large due to compatibility shims, OS quirks
- *: sh? bash? zsh? csh? ksh? ash? dash? fish?
    - cmd? powershell? wsl?
- Some OS’s (cough cough Windows) are a bit painful to get these same scripts/environments setup

---

# ~~~Solution: VM's~~~ ❌

---

# Solution: containers 🆗

## Good
- Patch-able
- Deterministic

## Bad
- Multiple versions are controlled at the image level
- OS, arch, system compatibility
- Lots of space and resource
- Build from source when not available

---

# Solution: nvm? gvm? rvm? 🆗

## Good
- Multiple versions
- Kind of deterministic

## Bad
- Patching is mostly impossible
- What if manager doesn’t exist for language/tool?
- Syntax, idiosyncrasies, configuration
- So many managers…

---

# Solution: consolidated tool managers? ✅

## Good
+ Multiple versions
+ Deterministic
+ Extensible
+ Usually patching is easier than alternatives

## Bad
- Verbosity

---

# Consolidated tool managers

## [sdkman](https://sdkman.io/)
## [asdf](https://asdf-vm.com/)
## [rtx](https://github.com/jdx/rtx)

---

# But we can do better

## [Nix package manager](https://nixos.org/) 🔥

## Good
+ Multiple versions
+ Deterministic
+ Overlays (sophisticated patching)

## Bad
- Really esoteric
- Steep learning curve
- The name sucks

---

# Nix demo

* Disclaimer: Nix in a Docker container is somewhat different than the native experience

---

# Reproducible, deterministic operating systems? 👀

## [NixOS](https://nixos.org/)
## [GNU Guix](https://guix.gnu.org/)
