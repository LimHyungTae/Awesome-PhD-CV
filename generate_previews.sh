#!/usr/bin/env bash
# Regenerate README preview PNGs from the first page of each resume PDF.
# Usage: ./generate_previews.sh
# Requires: ImageMagick v7+ (magick)

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
ASSETS_DIR="$REPO_DIR/assets"
mkdir -p "$ASSETS_DIR"

convert_pdf() {
  local label="$1"
  local src="$2"
  local dst="$3"

  if [ ! -f "$src" ]; then
    echo "  [SKIP] $label — PDF not found: $src"
    return
  fi

  echo "  [GEN]  $label"
  magick -density 150 "$src[0]" -quality 90 -trim "$dst"
}

echo "Generating preview PNGs..."
convert_pdf "Jake's format"    "$REPO_DIR/jakes-format/resume.pdf"  "$ASSETS_DIR/jakes-preview.png"
convert_pdf "Deedy format"     "$REPO_DIR/deedy-format/resume.pdf"  "$ASSETS_DIR/deedy-preview.png"
convert_pdf "Awesome-CV format" "$REPO_DIR/research-cv/cv.pdf"      "$ASSETS_DIR/research-cv-preview.png"
echo "Done. PNGs written to assets/."
