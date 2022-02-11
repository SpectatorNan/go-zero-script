v = 0.0.1
m =
t =
filenameExists = $(wildcard $(filename))
filename = services/$(m)/$(t)/Dockerfile
build-test-target = registry.cn-shenzhen.aliyuncs.com/gfn/gfn:test.v${v}-${m}-$(t)
build-prod-target = registry.cn-shenzhen.aliyuncs.com/gfn/gfn:prod.v${v}-${m}-$(t)

define checkModule
	@if [ "$(m)" != "" ]; then $(call checkType, ${1}); else echo module name is empty, please input m=module-name; fi
endef
define checkType
	if [ "$(t)" != "" ]; then $(call checkDockerfile, ${1}); else echo type is empty, please input t=rpc or t=api; fi
endef
define checkDockerfile
	if [ $(filenameExists) ]; then ${1}; else echo target Dockerfile not exists, please check your module name or this module contain Dockerfile, filepath=$(filename); fi
endef

build-prod:
	$(call checkModule, make prod-run)

build-test:
	$(call checkModule, make test-run)

prod-run:
	@docker build -f ${filename} -t ${build-prod-target} ./
	@docker push ${build-prod-target}

test-run:
	docker build -f ${filename} -t ${build-test-target} ./
	docker push ${build-test-target}

build-store-rpc:
	GOOS=linux GOARCH=amd64 go build -o enviroment/local/store_rpc/store-rpc services/store/rpc/store.go

build-store-api:
	GOOS=linux GOARCH=amd64 go build -o enviroment/local/store_api/store-api services/store/api/storebackend.go
build-address-rpc:
	GOOS=linux GOARCH=amd64 go build -o enviroment/local/address_rpc/address-rpc services/address/rpc/address.go


#.PHONY: build
