PROTOS := proto/*.proto

.PHONY: generate clean

generate: proto/task proto/user
	protoc --go_out=proto/task --go-grpc_out=proto/task --go_opt=paths=source_relative --go-grpc_opt=paths=source_relative proto/task.proto
	protoc --go_out=proto/user --go-grpc_out=proto/user --go_opt=paths=source_relative --go-grpc_opt=paths=source_relative proto/user.proto

proto/task:
	mkdir -p proto/task

proto/user:
	mkdir -p proto/user

clean:
	find proto/task -name "*.pb.go" -delete || true
	find proto/user -name "*.pb.go" -delete || true