#!/bin/sh
set -eu

TARGET="${1:-.}"

if [ ! -d "$TARGET" ]; then
  echo "Target directory does not exist: $TARGET" >&2
  exit 2
fi

prohibited='fonts\.googleapis|fonts\.gstatic|use\.typekit|p\.typekit|cdn\.jsdelivr|unpkg\.com|cdnjs\.cloudflare'

matches=$(find "$TARGET" \
  -path '*/.git' -prune -o \
  -path '*/node_modules' -prune -o \
  -path '*/dist' -prune -o \
  -path '*/build' -prune -o \
  -type f \
  \( -name '*.html' -o -name '*.htm' -o -name '*.css' -o -name '*.js' -o -name '*.mjs' -o -name '*.cjs' -o -name '*.ts' -o -name '*.tsx' -o -name '*.jsx' \) \
  -exec grep -nE "$prohibited" {} + 2>/dev/null || true)

if [ -n "$matches" ]; then
  echo "Prohibited external font/CDN asset references found:" >&2
  printf '%s\n' "$matches" >&2
  exit 1
fi

# Only enforce font file presence in repos that look like a MarinOS app/UI/template repo.
if [ -f "$TARGET/BRAND_VERSION" ] || [ -f "$TARGET/shared/app-brand.css" ] || [ -f "$TARGET/marin.yml" ]; then
  missing=''
  if [ ! -f "$TARGET/vendor/fonts/open-sans/OpenSans-VariableFont_wdth,wght.woff2" ]; then
    missing="$missing
vendor/fonts/open-sans/OpenSans-VariableFont_wdth,wght.woff2"
  fi
  if [ ! -f "$TARGET/vendor/fonts/open-sans/OFL.txt" ]; then
    missing="$missing
vendor/fonts/open-sans/OFL.txt"
  fi
  if [ ! -f "$TARGET/vendor/fonts/Jost-wght.ttf" ]; then
    missing="$missing
vendor/fonts/Jost-wght.ttf"
  fi
  if [ -f "$TARGET/shared/app-brand.css" ] && ! grep -q 'OpenSans-VariableFont_wdth,wght.woff2' "$TARGET/shared/app-brand.css"; then
    echo "shared/app-brand.css does not reference the local Open Sans WOFF2 file." >&2
    exit 1
  fi
  if [ -n "$missing" ]; then
    echo "Required local font files are missing:" >&2
    printf '%s\n' "$missing" | sed '/^$/d' >&2
    exit 1
  fi
fi

echo "MarinOS font policy check passed."
