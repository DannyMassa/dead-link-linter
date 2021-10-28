set -xe

: "${LINTER_VERSION:="1.0.2"}"
: "${OS_TYPE:="linux"}"
: "${ARCHITECTURE:="amd64"}"

URL="https://github.com/DannyMassa/dead-link-linter/releases/download/${LINTER_VERSION}/dead-link-linter-${LINTER_VERSION}-${OS_TYPE}-${ARCHITECTURE}.tar.gz"
TAR_BALL="dead-link-linter-${LINTER_VERSION}-${OS_TYPE}-${ARCHITECTURE}.tar.gz"

wget ${URL}
tar -xvf ${TAR_BALL}
./dead-link-linter

status=$?
[ $status -eq 0 ] && \
  echo "Dead Link Linter Passed" && \
  rm ${TAR_BALL} && \
  rm dead-link-linter && \
  exit 0 \
  || \
  echo "Dead Link Linter Failed" && \
  rm ${TAR_BALL} && \
  rm dead-link-linter && \
  exit 1
