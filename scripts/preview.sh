#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

# macOS ships an older Ruby; prefer a Homebrew Ruby when installed.
for ruby_bin in /opt/homebrew/opt/ruby@3.3/bin /usr/local/opt/ruby@3.3/bin /opt/homebrew/opt/ruby/bin /usr/local/opt/ruby/bin; do
  if [[ -x "$ruby_bin/ruby" ]]; then
    export PATH="$ruby_bin:$PATH"
    break
  fi
done

exec bundle exec jekyll serve \
  --config _config.yml,_config_local.yml \
  --host 127.0.0.1 --port 4000 --livereload "$@"
