# This is a justfile. See https://github.com/casey/just

package:
	yarn install
	BUILD_TYPE=canary yarn build
	BUILD_TYPE=canary yarn workspace @affine/electron generate-assets
	BUILD_TYPE=canary yarn workspace @affine/native build
	BUILD_TYPE=canary yarn workspace @affine/server build
	BUILD_TYPE=canary yarn build:infra
	BUILD_TYPE=canary yarn build:plugins
	BUILD_TYPE=canary yarn workspace @affine/storage build
	BUILD_TYPE=canary yarn workspace @affine/monorepo build
	BUILD_TYPE=canary yarn workspace @affine/electron build
	BUILD_TYPE=canary yarn workspace @affine/electron make
	open ./packages/frontend/electron/out/canary/AFFiNE-canary-darwin-arm64
