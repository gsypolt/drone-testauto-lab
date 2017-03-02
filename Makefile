APP=$(shell basename $(CURDIR))

# Global Go modules for CI
BUILD_DEPS=github.com/golang/lint/golint


# Install deps, run the server
default: run

# Build
build:
	go build -o build/${APP}

# Installing build dependencies. You will need to run this once manually when you clone the repo
install:
	go get -v $(BUILD_DEPS)

# Run go lint and complain if there are issues
lint:
	for pkg in $$(go list ./... |grep -v /vendor/); do \
		golint $$pkg; \
		if [ -n "$$(golint $${pkg})" ]; then \
			exit 1; \
		fi; \
	done

#Run tests
test:
	@$(TEST_ENV) go test *.go -v

# Run local server
run:
	if [ -f build/${APP} ]; then \
		build/${APP}; \
	else \
		go run main.go; \
	fi;
