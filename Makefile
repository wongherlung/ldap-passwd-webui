REPO="${ECR}/infra/ldap-passwd-webui"
VER=1.2

.PHONY: all build push

all: init build docker push clean

init:
	go mod tidy
	
build:
	GOOS=linux go build -o ldap-pass-webui main.go

docker:
	@echo "Building docker image"
	docker build -t ${REPO}:${VER} -t ${REPO}:latest .

push: 
	@echo "Pushing to dockerhub"
	docker push ${REPO}:${VER} 
	docker push ${REPO}:latest

clean:
	rm -rf ldap-pass-webui
