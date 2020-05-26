#!/bin/bash
set -euo pipefail


PROJECT_DIR="$(pwd)"
TEMP_DIR="/tmp/pptx2md_test"  # this dir will be wiped!
TESTDATA_DIR="$PROJECT_DIR"/testdata
GOLDEN_DIR="$TESTDATA_DIR"/golden

rm -rf "$TEMP_DIR"
mkdir -p "$TEMP_DIR"
cd "$TEMP_DIR"

"$PROJECT_DIR"/pptx2md "$TESTDATA_DIR"/presentation.pptx

set +x
echo "Testing file structure."
diff <(find "$TEMP_DIR" -name \* -printf "%P\n" | sort)  \
     <(find "$GOLDEN_DIR" -name \* -printf "%P\n" | sort)

for file in $(find "$GOLDEN_DIR" -name \*  -printf "%P\n"); do
  echo "Diffing $file."
  diff -w -u "$TEMP_DIR/$file" "$GOLDEN_DIR/$file"
done

echo "Output as expected!"