# `before_deploy` phase: here we package the build artifacts

set -ex

. $(dirname $0)/support.sh

mk_tarball() {
  # create a "staging" directory
  local td=$(mktempd)
  local out_dir=$(pwd)

  cp target/$TARGET/release/${PROJECT_NAME} $td

  pushd $td

  # release tarball will look like 'timeline-v1.2.3-x86_64-unknown-linux-gnu.tar.gz'
  tar czf $out_dir/${PROJECT_NAME}-${TRAVIS_TAG}-${TARGET}.tar.gz *

  popd
  rm -r $td
}

mk_tarball
