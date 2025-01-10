# ort-scan-hedera

This project contains the configuration to scan the Hiero / Hedera codebase using the [OSS Review Toolkit](https://oss-review-toolkit.org/ort/).

## hiero-sdk-go

| License (SPDX)     | state |
| ------------------ | ----- |

## hedera-sdk-swift

| License (SPDX)     | state |
| ------------------ | ----- |

## hiero-sdk-tck

| License (SPDX)     | state |
| ------------------ | ----- |
| 0BSD               | :white_check_mark: |
| Apache-2.0         | :white_check_mark: |
| BSD-2-Clause       | :white_check_mark: |
| BSD-3-Clause       | :white_check_mark: |
| ISC                | :white_check_mark: |
| MIT                | :white_check_mark: |
| Python-2.0         | :white_check_mark: |
| Unlicense          | ? |


## hedera-sdk-js

| License (SPDX)     | state |
| ------------------ | ----- |

## hiero-sdk-cpp

| License (SPDX)     | state |
| ------------------ | ----- |

## hedera-sdk-java

| License (SPDX)     | state |
| ------------------ | ----- |
| Apache-2.0         | :white_check_mark: |
| BSD-3-Clause       | :white_check_mark: |
| EPL-1.0            | :white_check_mark: |
| EPL-2.0            | :white_check_mark: |
| MIT                | :white_check_mark: |

## hedera-sdk-rust

| License (SPDX)     | state |
| ------------------ | ----- |
| 0BSD               | :white_check_mark: |
| Apache-2.0         | :white_check_mark: |
| BSD-1-Clause       | ? |
| BSD-2-Clause       | :white_check_mark: |
| BSD-3-Clause       | :white_check_mark: |
| ISC                | :white_check_mark: |
| MIT                | :white_check_mark: |
| MPL-2.0            | :white_check_mark: |
| Unicode-3.0        | ? |

Unknown license: https://github.com/briansmith/ring/blob/main/LICENSE

## solo

| License (SPDX)     | state |
| ------------------ | ----- |
| 0BSD               | :white_check_mark: |
| Apache-2.0         | :white_check_mark: |
| BSD-2-Clause       | :white_check_mark: |
| BSD-3-Clause       | :white_check_mark: |
| BlueOak-1.0.0      | :white_check_mark: |
| ISC                | :white_check_mark: |
| MIT                | :white_check_mark: |
| Python-2.0         | :white_check_mark: |
| Unlicense          | ? |

## hedera-local-node

| License (SPDX)     | state |
| ------------------ | ----- |
| 0BSD               | :white_check_mark: |
| Apache-2.0         | :white_check_mark: |
| BSD-2-Clause       | :white_check_mark: |
| BSD-3-Clause       | :white_check_mark: |
| BlueOak-1.0.0      | :white_check_mark: |
| ISC                | :white_check_mark: |
| MIT                | :white_check_mark: |
| Python-2.0         | :white_check_mark: |
| Unlicense          | ? |

## hedera-json-rpc-relay

| License (SPDX)     | state |
| ------------------ | ----- |

## hedera-mirror-node

| License (SPDX)     | state |
| ------------------ | ----- |
| 0BSD               | :white_check_mark: |
| Apache-2.0         | :white_check_mark: |
| BSD-2-Clause       | :white_check_mark: |
| BSD-3-Clause       | :white_check_mark: |
| BlueOak-1.0.0      | :white_check_mark: |
| CC0-1.0            | :red_circle: |
| CDDL-1.0           | :white_check_mark: |
| CDDL-1.1           | :white_check_mark: |
| EPL-1.0            | :white_check_mark: |
| EPL-2.0            | :white_check_mark: |
| ISC                | :white_check_mark: |
| LGPL-2.1-only      | :red_circle: |
| LGPL-2.1-or-later  | :red_circle: |
| Public Domain      | :white_check_mark: |
| MIT                | :white_check_mark: |
| MIT-0              | ? |
| MPL-2.0            | :white_check_mark: |
| Python-2.0         | :white_check_mark: |

Info: 
- The LGPL-2.1-only license is not needed at runtime and can be refactored
- Hibernate is licensed LGPL-2.1-or-later
- We depend on "Maven:org.tukaani:xz:1.9" that should be updated to 1.10 to be under BSD0. For the given verdsion no license is defined
- 

Problem at license check: invalid: send@0.19.1 /tmp/tmp.cO0My85xIU/hedera-mirror-node/hedera-mirror-rest/node_modules/swagger-stats/node_modules/send

## hedera-mirror-node-explorer

| License (SPDX)     | state |
| ------------------ | ----- |
| 0BSD               | :white_check_mark: |
| Apache-2.0         | :white_check_mark: |
| BSD-2-Clause       | :white_check_mark: |
| BSD-3-Clause       | :white_check_mark: |
| CC-BY-4.0          | :white_check_mark: |
| ISC                | :white_check_mark: |
| LGPL-3.0-only      | :red_circle: |
| MIT                | :white_check_mark: |
| MPL-2.0            | :white_check_mark: |
| Unlicense          | ? |
| Zlib               | :white_check_mark: |

Info:
- The LGPL-3.0-only license is because of https://github.com/web3/web3.js?tab=readme-ov-file

## hedera-block-node

| License (SPDX)     | state |
| ------------------ | ----- |
| Apache-2.0         | :white_check_mark: |
| BSD-2-Clause       | :white_check_mark: |
| BSD-3-Clause       | :white_check_mark: |
| CDDL-1.0           | :white_check_mark: |
| EPL-1.0            | :white_check_mark: |
| EPL-2.0            | :white_check_mark: |
| GPL-2.0-only WITH Classpath-exception-2.0 | ? |
| LGPL-2.1-only      | :red_circle: |
| MIT                | :white_check_mark: |
| MPL-2.0            | :white_check_mark: |

Info:
- The "GPL-2.0-only WITH Classpath-exception-2.0" license is because of "Maven:com.google.errorprone:javac-shaded:9-dev-r4023-3"
- The "LGPL-2.1-only" license is because of "Maven:com.github.spotbugs:spotbugs-annotations:4.7.3" that is not needed at runtime

## hedera-services

| License (SPDX)     | state |
| ------------------ | ----- |

## hedera-docs

| License (SPDX)     | state |
| ------------------ | ----- |

## did-method

| License (SPDX)     | state |
| ------------------ | ----- |

## did-sdk-js

| License (SPDX)     | state |
| ------------------ | ----- |
| 0BSD               | :white_check_mark: |
| Apache-2.0         | :white_check_mark: |
| BSD-3-Clause       | :white_check_mark: |
| ISC                | :white_check_mark: |
| MIT                | :white_check_mark: |
| Unlicense          | ? |


## did-sdk-java

| License (SPDX)     | state |
| ------------------ | ----- |

## hedera-protobufs

| License (SPDX)     | state |
| ------------------ | ----- |

## hedera-improvement-proposal

| License (SPDX)     | state |
| ------------------ | ----- |