

## environment install

### protobuf download page
`
https://github.com/protocolbuffers/protobuf/releases
`

download and then: 
-  step 1
```shell
cd bin
```
- step 2
```shell
mv protoc $GOPATH/bin
```
- step 3: valid install result
```shell
protoc --version
```


### port description
- rpc service use prefix 90
- api service use prefix 80



### Structure

```tree
.
├── Makefile
├── README.md
│
├── go.mod
├── go.sum
├── services
│   ├── address
│   │   ├── model
│   │   │   ├── city_model.go
│   │   │   ├── county_model.go
│   │   │   ├── province_model.go
│   │   │   └── vars.go
│   │   └── rpc
│   │       ├── Dockerfile
│   │       ├── address
│   │       │   └── address.go
│   │       ├── address.go
│   │       ├── address.proto
│   │       ├── etc
│   │       │   ├── address-local-test.yaml
│   │       │   └── address.yaml
│   │       ├── internal
│   │       │   ├── config
│   │       │   │   └── config.go
│   │       │   ├── logic
│   │       │   │   └── query_provinces_logic.go
│   │       │   ├── server
│   │       │   │   └── address_server.go
│   │       │   └── svc
│   │       │       └── service_context.go
│   │       └── pb
│   │           └── address.pb.go
│   │       
│   ├── store
│   │   ├── api
│   │   │   ├── Dockerfile
│   │   │   ├── etc
│   │   │   │   ├── store_backend.yaml
│   │   │   │   └── store_local.yaml
│   │   │   ├── internal
│   │   │   │   ├── config
│   │   │   │   │   └── config.go
│   │   │   │   ├── handler
│   │   │   │   │   └── update_store_imgs_handler.go
│   │   │   │   ├── logic
│   │   │   │   │   └── update_store_imgs_logic.go
│   │   │   │   ├── svc
│   │   │   │   │   └── service_context.go
│   │   │   │   └── types
│   │   │   │       └── types.go
│   │   │   ├── readme.md
│   │   │   ├── store.api
│   │   │   └── storebackend.go
│   │   ├── model
│   │   │   ├── stores_model.go
│   │   │   └── vars.go
│   │   └── rpc
│   │       ├── Dockerfile
│   │       ├── etc
│   │       │   └── store.yaml
│   │       ├── internal
│   │       │   ├── config
│   │       │   │   └── config.go
│   │       │   ├── logic
│   │       │   │   └── update_store_imgs_logic.go
│   │       │   ├── server
│   │       │   │   ├── mq_server.go
│   │       │   │   └── store_backend_server.go
│   │       │   └── svc
│   │       │       └── service_context.go
│   │       ├── readme.md
│   │       ├── store
│   │       │   └── store.pb.go
│   │       ├── store.go
│   │       ├── store.proto
│   │       └── storebackend
│   │           └── store_backend.go
│   └── user
│       ├── api
│       │   ├── etc
│       │   │   └── user.yaml
│       │   ├── internal
│       │   │   ├── config
│       │   │   │   └── config.go
│       │   │   ├── handler
│       │   │   │   └── user_info_handler.go
│       │   │   ├── logic
│       │   │   │   └── user_info_logic.go
│       │   │   ├── svc
│       │   │   │   └── service_context.go
│       │   │   └── types
│       │   │       └── types.go
│       │   ├── readme.md
│       │   ├── user.api
│       │   └── user.go
│       ├── model
│       │   ├── readme.md
│       │   ├── users_model.go
│       │   └── vars.go
│       └── rpc
│           ├── etc
│           │   └── user.yaml
│           ├── internal
│           │   ├── config
│           │   │   └── config.go
│           │   ├── logic
│           │   │   └── user_update_password_logic.go
│           │   ├── server
│           │   │   └── user_server.go
│           │   └── svc
│           │       └── service_context.go
│           ├── readme.md
│           ├── user
│           │   └── user.pb.go
│           ├── user.go
│           ├── user.proto
│           └── userclient
│               └── user.go
└── test
    └── etcd.rest
```


### build command
- test rpc environment
  ```shell
  make rpc-test m=<module name> v=<version> # v=1.0.0
  ```
- test api environment
  ```shell
  make api-test m=<module name> v=<version>
  ```
- prod rpc environment
  ```shell
  make rpc-prod m=<module name> v=<version>
  ```
- prod api environment
  ```shell
  make api-prod m=<module name> v=<version>
  ```
#### params description
- module name: the name of the folder on the service folder
- version: current version num, eg: 1.0.0