# Setup and Developer Guide

This repository is a Jekyll-based site. This document explains the project setup process that we used and lists the  dependencies and tools.

## Quick summary
1. Run `bundle install`, then run `make` to view the site at http://localhost:4000.

## What this repository contains (key files)
- `Gemfile` — declares Ruby gems; currently includes `jekyll` (~> 4.2).
- `_config.yml` — Jekyll site configuration (title, exclude rules, etc.).
- `Makefile` — convenience commands: `make setup` and `make serve`. `make` defaults to `serve`.
- `requirements.txt` — Python requirements (currently empty / not needed for the static site itself).
- `scripts/init.sh` — bootstrap script that creates a Python venv and installs bundles (calls `gem install` and `bundle install`). It uses sudo for GEM_HOME in current form.
- `scripts/githooks.sh` — configures local git hooks (`.githooks` -> `core.hooksPath`).
- `_posts/`, `_layouts/`, etc. — Jekyll site content and templates.
- `vendor/bundle/` — vendored gems (present in repo) which indicates a local vendor bundle is already available.
- `_site/` — built site (generated) — should not be committed in sources for active development, but exists here.

## Inventory: languages, frameworks, tools used
- Ruby (Jekyll). Gemfile uses `jekyll ~> 4.2`. The vendor folder contains many gems for Jekyll.
- Jekyll static site generator.
- Python 3 used only for `python -m http.server` fallback and the repo includes a venv-based bootstrap script; `requirements.txt` is empty.
- Makefile for convenience commands.

## Recommended environment (safe & reproducible)
Prefer a per-user Ruby manager rather than system gems with `sudo`:
- rbenv (recommended) or asdf + ruby plugin. This avoids needing `sudo` to install gems.
- Ruby 3.3.x (vendor references show 3.3.0 artifacts). Confirm exact version by your ruby manager.
- Bundler 2.6.x (the repo references bundler 2.6.9 in `scripts/init.sh`).
- Jekyll 4.2 (Gemfile) — Bundler will install the proper version.
- Python 3.8+ (for the venv and optional fallback server).

Optional useful tools:
- Node.js + npm — only needed if you add JS toolchains or asset pipelines.
- `htmlproofer` (Ruby gem) — for link and HTML checks in CI.
- `github-pages` gem is not currently used; do not add unless publishing on GitHub Pages with that exact stack.

## Setup order (detailed steps)
Follow these steps in order; use the easiest option for you (rbenv approach recommended):

1) Set up Ruby (recommended: rbenv)

- Install rbenv and ruby-build (platform-specific). Example (Ubuntu):

```bash
# install dependencies (example for Debian/Ubuntu):
sudo apt update && sudo apt install -y build-essential libssl-dev libreadline-dev zlib1g-dev
# follow rbenv install instructions (or use distro packages)
# then:
rbenv install 3.3.0
rbenv local 3.3.0
ruby -v # verify
```

2) Install Bundler and the gems (project-local)

```bash
# install a matching bundler
gem install bundler -v 2.6.9
# install gems into vendor/bundle (Makefile/setup uses bundle install)
bundle _2.6.9_ install --path vendor/bundle
```

Or simply run the Makefile convenience command:

```bash
make setup
```

If `vendor/bundle` is already present (committed), Bundler may reuse it.

3) (Optional) Python venv

If you want the repository's Python venv for any additional scripts:

```bash
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
```

4) Run git hooks setup (optional but recommended):

```bash
# ensure scripts are executable and configure hooks
chmod +x scripts/githooks.sh
./scripts/githooks.sh
```

5) Serve the site locally

```bash
make serve
# or directly:
bundle exec jekyll serve --livereload --port 4000
# fallback to python server if no Gemfile present:
# python3 -m http.server 8000
```

Then open http://localhost:4000.

## Verification / smoke tests
- After `bundle exec jekyll build` or `make serve`, confirm `_site/` exists and contains HTML files.
- Visit `http://localhost:4000` and confirm top-level pages render (index/home).
- Exit codes: `echo $?` should be 0 after successful build.

## Troubleshooting notes
- Permission errors installing gems: avoid `sudo` by using rbenv/asdf or configure a user GEM_HOME. The current `scripts/init.sh` uses `sudo mkdir -p "$GEM_HOME"` and `chmod 777` which is not ideal; prefer per-user installs.
- Bundler version mismatch: use the bundler version pinned (2.6.9) or the version reported by `bundle -v`.
- If `make serve` complains about missing gems even though `vendor/bundle` exists, run `bundle install --path vendor/bundle` again.

## Security & best practices
- Do not commit `_site/` for active development; it's a generated artefact — consider adding it to `.gitignore` if you plan to regenerate on each build.
- Avoid `chmod 777` and running `gem install` with `sudo` in shared or CI environments. Use per-user installs.
- Pin `Gemfile.lock` (if you want deterministic builds) and commit it; currently `Gemfile.lock` is excluded in `_config.yml` and appears missing—consider generating and committing one if reproducibility is required.

## Suggested additions (low-risk improvements)
- Add a `.ruby-version` with the targeted Ruby version (e.g., `3.3.0`) for rbenv/asdf.
- Consider adding a lightweight GitHub Actions workflow to build and optionally run `htmlproofer`.
- Add `Gemfile.lock` to repo if you want reproducible gem versions; remove it from the `_config.yml` exclude list first if needed.
- Add a small `Makefile` target `check` that runs link checks.

### Sample GitHub Actions (suggested)
Add `.github/workflows/jekyll.yml` with the following minimal job to build the site:

```yaml
name: Jekyll Build
on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Set up Ruby
        uses: ruby/setup-ruby@v1
        with:
          ruby-version: '3.3'
          cache-bundler: true
      - name: Install dependencies
        run: |
          gem install bundler -v 2.6.9
          bundle _2.6.9_ install --jobs 4 --retry 3
      - name: Build
        run: bundle exec jekyll build --verbose
      - name: Optional: HTML proof
        run: |
          gem install html-proofer
          htmlproofer ./_site --check-html --empty_alt_ignore
```

## Small contract (inputs / outputs / error modes)
- Inputs: repository files and developer environment (Ruby, Bundler). `Gemfile` defines gems.
- Outputs: generated site in `_site/`, dev server at localhost:4000.
- Error modes: missing Ruby/Bundler, permission errors installing gems, bundler version mismatches, missing `Gemfile.lock` causing unexpected gem versions.

## Edge cases
- `vendor/bundle` is checked in: that can speed up local builds but can also cause platform mismatches if contributors use different OS/architecture.
- `requirements.txt` is empty: Python venv is optional; nothing to install for site itself.

## Assumptions made
- The project is a standard Jekyll site; no additional build step (webpack/rollup) is currently present.
- Ruby version inferred from vendor artifacts (3.3.0). If you use another Ruby, adjust accordingly.

---
If you'd like, I can also:
- Add the `.github/workflows/jekyll.yml` file in the repo.
- Add `.ruby-version` and a `Gemfile.lock` (by running `bundle lock`) and commit them.
- Tighten `scripts/init.sh` to use rbenv/asdf instead of sudo and make it idempotent.
