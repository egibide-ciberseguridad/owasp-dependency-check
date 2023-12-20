#!/bin/sh

NVD_API_KEY=$(cat "$(dirname "$0")/.nvd-api-key")

DC_VERSION="latest"
DC_DIRECTORY=$HOME/OWASP-Dependency-Check
DC_PROJECT="dependency-check scan: $(pwd)"
DATA_DIRECTORY="$DC_DIRECTORY/data"
CACHE_DIRECTORY="$DC_DIRECTORY/data/cache"

if [ ! -d "$DATA_DIRECTORY" ]; then
  echo "Initially creating persistent directory: $DATA_DIRECTORY"
  mkdir -p "$DATA_DIRECTORY"
fi
if [ ! -d "$CACHE_DIRECTORY" ]; then
  echo "Initially creating persistent directory: $CACHE_DIRECTORY"
  mkdir -p "$CACHE_DIRECTORY"
fi

# Make sure we are using the latest version
docker pull --platform linux/amd64 owasp/dependency-check:$DC_VERSION

docker run --rm \
  --platform linux/amd64 \
  -e user=$USER \
  -u $(id -u ${USER}):$(id -g ${USER}) \
  --volume $(pwd):/src:z \
  --volume "$DATA_DIRECTORY":/usr/share/dependency-check/data:z \
  --volume $(pwd)/odc-reports:/report:z \
  owasp/dependency-check:$DC_VERSION \
  --nvdApiKey "$NVD_API_KEY" \
  --scan /src \
  --enableExperimental \
  --format "ALL" \
  --project "$DC_PROJECT" \
  --out /report
# Use suppression like this: (where /src == $pwd)
# --suppression "/src/security/dependency-check-suppression.xml"
