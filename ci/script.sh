# `script` phase: you usually build, test and generate docs in this phase

set -ex

. $(dirname $0)/utils.sh

main() {
  cargo build --target $TARGET --release --verbose
}

main
