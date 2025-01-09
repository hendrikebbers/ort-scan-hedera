#!/bin/bash

# Funktion für den gesamten Prozess: Repository auschecken, kopieren, analysieren und Bericht erstellen
run_analysis() {
  local repo_url=$1
  local config_file=$2

  # Erstelle einen temporären Ordner
  temp_dir=$(mktemp -d)
  repo_name=$(basename "$repo_url" .git)  # Der Repository-Name

  echo "Cloning $repo_url into $temp_dir..."
  git clone "$repo_url" "$temp_dir/$repo_name"

  # Kopiere die Konfigurationsdatei in das temporäre Repository
  cp "ort-config/$config_file" "$temp_dir/$repo_name/.ort.yml"

  rm "$temp_dir/$repo_name/Cargo.lock"
  rm "$temp_dir/$repo_name/package-lock.json"
  rm "$temp_dir/$repo_name/pnpm-lock.yaml"

  # Analyse durchführen
  /root/ort/bin/ort --info -P ort.analyzer.allowDynamicVersions=true analyze -i "$temp_dir/$repo_name" -o "ort-output/$repo_name"

  # Bericht erstellen
  /root/ort/bin/ort --info report -i "ort-output/$repo_name/analyzer-result.yml" -o "ort-output/$repo_name" --report-formats=WebApp,StaticHTML

  # Temp-Verzeichnis löschen (optional)
  rm -rf "$temp_dir"
}

# Liste der Repositories (URLs) und zugehörigen Konfigurationsdateien
repos=(
  "https://github.com/hashgraph/hedera-sdk-swift.git|hedera-sdk-swift.yml"
  "https://github.com/hashgraph/hedera-sdk-java.git|hedera-sdk-java.yml"
  "https://github.com/hashgraph/hedera-sdk-rust.git|hedera-sdk-rust.yml"
  "https://github.com/hashgraph/hedera-sdk-js.git|hedera-sdk-js.yml"
  "https://github.com/hashgraph/solo.git|solo.yml"
  "https://github.com/hashgraph/hedera-local-node.git|hedera-local-node.yml"
  "https://github.com/hashgraph/hedera-json-rpc-relay.git|hedera-json-rpc-relay.yml"
  "https://github.com/hashgraph/hedera-mirror-node.git|hedera-mirror-node.yml"
  "https://github.com/hashgraph/hedera-mirror-node-explorer.git|hedera-mirror-node-explorer.yml"
  "https://github.com/hashgraph/hedera-block-node.git|hedera-block-node.yml"
  "https://github.com/hashgraph/hedera-services.git|hedera-services.yml"
  "https://github.com/hashgraph/did-method.git|did-method.yml"
  "https://github.com/hashgraph/did-sdk-js.git|did-sdk-js.yml"
  "https://github.com/hashgraph/did-sdk-java.git|did-sdk-java.yml"
  "https://github.com/hiero-ledger/hiero-sdk-tck.git|hedera-sdk-tck.yml"
  "https://github.com/hiero-ledger/hiero-sdk-go.git|hedera-sdk-go.yml"
  "https://github.com/hiero-ledger/hiero-sdk-cpp.git|hedera-sdk-cpp.yml"
)

rm -rf ort-output

# Alle Repositories durchlaufen und Funktion aufrufen
for repo in "${repos[@]}"; do
  IFS="|" read -r repo_url config_file <<< "$repo"
  run_analysis "$repo_url" "$config_file"
done

# Ausgabe-Verzeichnis kopieren
rm -rf /var/www/files/*
cp -r ort-output /var/www/files

echo "Alle Analysen abgeschlossen!"
