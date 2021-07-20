# rootlesscontainers.proto

This directory contains `rootlesscontainers.proto`, which is used for preserving emulated file owner information as `user.rootlesscontainers` xattr values.

## Compile

```bash
protoc-c --c_out=. rootlesscontainers.proto
```
