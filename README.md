

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

### module list
- address
  - rpc
- store
  - rpc
  - api

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
