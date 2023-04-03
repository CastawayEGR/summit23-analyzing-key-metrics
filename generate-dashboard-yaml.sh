#!/bin/bash
# Generate Grafana Operator dashboard yaml files from local .json files

BASE_URL="https://raw.githubusercontent.com/CastawayEGR/summit23-analyzing-key-metrics/main"

for f in $(find ./grafana-dashboards -name '*.json');
do
	FILENAME=$(basename -- $f .json)
	NAME=$FILENAME-dashboard
	FOLDER=$(basename $(dirname $f))
	URL=$BASE_URL${f#.}
	JSON=$(cat $f)
	TEMPLATE=$(cat << EOF
apiVersion: integreatly.org/v1alpha1
kind: GrafanaDashboard
metadata:
  labels:
    app: grafana
  name: ${NAME}
  namespace: o11y
spec:
  customFolderName: "${FOLDER}"
  json: |
${JSON}
EOF
)
    echo "$TEMPLATE" > "./02-provision-grafana-dashboards/$FILENAME.yaml"
    sed -i '11,$ s/^/    /' "./02-provision-grafana-dashboards/$FILENAME.yaml"
done;
