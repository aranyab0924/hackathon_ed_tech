# Bare-bones GitHub Pages site

Minimal static site intended for GitHub Pages.

Files included:
- index.html
- style.css
- Makefile
- .github/workflows/deploy.yml

Local preview:
- Run `make serve` and open http://localhost:8000

Deployment:
- Push to the `main` branch. The GitHub Actions workflow will upload and deploy the repository root to GitHub Pages.

Notes:
- No Jekyll or external theme is used.
- No additional build steps or dependencies are required for the site itself.
