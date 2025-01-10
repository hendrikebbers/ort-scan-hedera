#!/bin/bash

# Funktion für den gesamten Prozess: Repository auschecken, kopieren, analysieren und Bericht erstellen
run_analysis() {
  local repo_url=$1
  local config_file=$2
  local run_scanner=$3

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

  mkdir -p ort-output/$repo_name

  # Analyse durchführen
  /root/ort/bin/ort --info -P ort.analyzer.allowDynamicVersions=true analyze -i "$temp_dir/$repo_name" -o "$temp_dir/$repo_name/out"

  # Scanner ausführen, wenn konfiguriert
  if [[ "$run_scanner" == "true" ]]; then
    /root/ort/bin/ort --info -P ort.scanner.skipExcluded=true scan -i "$temp_dir/$repo_name/out/analyzer-result.yml" -o [scanner-output-dir]
    /root/ort/bin/ort --info report -i "$temp_dir/$repo_name/out/scan-result.yml" -o "$temp_dir/$repo_name/out" --report-formats=WebApp,StaticHTML
  else
    /root/ort/bin/ort --info report -i "$temp_dir/$repo_name/out/analyzer-result.yml" -o "$temp_dir/$repo_name/out" --report-formats=WebApp,StaticHTML
  fi


  cp -r $temp_dir/$repo_name/out/* ort-output/$repo_name/

  # Temp-Verzeichnis löschen (optional)
  rm -rf "$temp_dir"
}

# Liste der Repositories (URLs) und zugehörigen Konfigurationsdateien
repos=(
  "https://github.com/hashgraph/hedera-sdk-swift.git|hedera-sdk-swift.yml|true"
  "https://github.com/hashgraph/hedera-sdk-java.git|hedera-sdk-java.yml|false"
  "https://github.com/hashgraph/hedera-sdk-rust.git|hedera-sdk-rust.yml|false"
  "https://github.com/hashgraph/hedera-sdk-js.git|hedera-sdk-js.yml|false"
  "https://github.com/hashgraph/solo.git|solo.yml|false"
  "https://github.com/hashgraph/hedera-local-node.git|hedera-local-node.yml|false"
  "https://github.com/hashgraph/hedera-json-rpc-relay.git|hedera-json-rpc-relay.yml|false"
  "https://github.com/hashgraph/hedera-mirror-node.git|hedera-mirror-node.yml|false"
  "https://github.com/hashgraph/hedera-mirror-node-explorer.git|hedera-mirror-node-explorer.yml|false"
  "https://github.com/hashgraph/hedera-block-node.git|hedera-block-node.yml|false"
  "https://github.com/hashgraph/hedera-services.git|hedera-services.yml|false"
  "https://github.com/hashgraph/did-method.git|did-method.yml|false"
  "https://github.com/hashgraph/did-sdk-js.git|did-sdk-js.yml|false"
  "https://github.com/hashgraph/did-sdk-java.git|did-sdk-java.yml|false"
  "https://github.com/hashgraph/hedera-docs.git|hedera-docs.yml|false"
  "https://github.com/hashgraph/hedera-protobufs.git|hedera-protobufs.yml|false"
  "https://github.com/hashgraph/hedera-improvement-proposal.git|hedera-improvement-proposal.yml|false"
  "https://github.com/hiero-ledger/hiero-sdk-tck.git|hedera-sdk-tck.yml|false"
  "https://github.com/hiero-ledger/hiero-sdk-go.git|hedera-sdk-go.yml|true"
  "https://github.com/hiero-ledger/hiero-sdk-cpp.git|hedera-sdk-cpp.yml|false"
  "https://github.com/nadineloepfe/hedera_sdk_python.git|hedera-sdk-python.yml|false"
  "https://github.com/OpenElements/hedera-solo-action.git|hedera-solo-action.yml|false"
)

rm -rf ort-output

# Alle Repositories durchlaufen und Funktion aufrufen
for repo in "${repos[@]}"; do
  IFS="|" read -r repo_url config_file run_scanner <<< "$repo"
  run_analysis "$repo_url" "$config_file" "$run_scanner"
done

# Erstelle die ZIP-Datei innerhalb des `ort-output`-Verzeichnisses
zip_file_name="ort-output-$(date +%Y-%m-%d_%H-%M-%S).zip"
echo "Erstelle ZIP-Datei: ort-output/$zip_file_name"
cd ort-output && zip -r "$zip_file_name" . && cd ..

# Ausgabe-Verzeichnis kopieren
rm -rf /var/www/files/*
cp -r ort-output/* /var/www/files/

echo "Alle Analysen abgeschlossen!"
