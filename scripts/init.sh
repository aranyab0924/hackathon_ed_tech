python3 -m venv .venv

source .venv/bin/activate

pip install --upgrade pip

pip install -r requirements.txt

gem install bundler -v 2.6.9

bundle _2.6.9_ install

bundle _2.6.9_ exec jekyll build

chmod +x scripts/githooks.sh

scripts/githooks.sh