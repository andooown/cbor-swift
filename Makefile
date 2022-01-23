BUILD_CONFIGURATION := release

TOOLS_PACKAGE_PATH := Tools
TOOLS_PATH := ${TOOLS_PACKAGE_PATH}/.build/release

SWIFT_FORMAT_TARGETS := Sources Tests Tools/*.swift

.PHONY: build-tools
build-tools:
	@swift build -c release --package-path ${TOOLS_PACKAGE_PATH} --product swift-format

.PHONY: lint
lint:
	@${TOOLS_PATH}/swift-format lint --configuration .swift-format --recursive ${SWIFT_FORMAT_LINT_ADDITIONAL_OPTIONS} ${SWIFT_FORMAT_TARGETS}

.PHONY: lint-strict
lint-strict: SWIFT_FORMAT_LINT_ADDITIONAL_OPTIONS = --strict
lint-strict: lint

.PHONY: format
format:
	@${TOOLS_PATH}/swift-format format --in-place --configuration .swift-format --recursive ${SWIFT_FORMAT_TARGETS}

.PHONY: build
build:
	@swift build -c ${BUILD_CONFIGURATION}

.PHONY: test
test:
	@swift test
