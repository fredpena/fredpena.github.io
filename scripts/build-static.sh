#!/usr/bin/env bash
set -euo pipefail

# bash scripts/build-static.sh
# python -m http.server 8080 --directory _site

# ROQ static generation runs when the app starts in batch mode.
# This flag is build-time fixed, so it must be set during packaging.
mvn -DskipTests \
  -Dquarkus.profile=prod \
  -Dquarkus.roq.generator.batch=true \
  -Dquarkus.roq.generator.output-dir=roq \
  package

# Start the packaged app once so ROQ generates target/roq and exits.
java -jar target/quarkus-app/quarkus-run.jar

if [ ! -d target/roq ]; then
  echo "Missing generated site in target/roq" >&2
  exit 1
fi

rm -rf _site
mkdir -p _site

cp -R target/roq/* _site/

if [ -d target/classes/META-INF/resources/assets ]; then
  mkdir -p _site/assets
  cp -R target/classes/META-INF/resources/assets/* _site/assets/
fi

if [ -d target/classes/public ]; then
  cp -R target/classes/public/* _site/
fi
