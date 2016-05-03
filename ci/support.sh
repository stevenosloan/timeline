mktempd() {
    echo $(mktemp -d 2>/dev/null || mktemp -d -t tmp)
}

host() {
  case "$TRAVIS_OS_NAME" in
    linux)
      echo x86_64-unknown-linux-gnu
      ;;
    osx)
      echo x86_64-apple-darwin
      ;;
  esac
}

architecture() {
  case $1 in
    x86_64-unknown-linux-gnu|x86_64-unknown-linux-musl)
      echo amd64
      ;;
    i686-unknown-linux-gnu)
      echo i386
      ;;
    arm*-unknown-linux-gnueabihf)
      echo armhf
      ;;
    *)
      die "architecture: unexpected target $TARGET"
      ;;
  esac
}
