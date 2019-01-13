.PHONY: golang http-server

curr := $(shell pwd)

golang:
	docker build -t lab03:golang ./golang/

http-server:
	docker run -d --name Create_http -v $(curr)/go-http-server/src/:/go/src/go-http-server -w /go/ lab03:golang sh -c "go get -t -v go-http-server && go build -v go-http-server"
	docker wait Create_http
	docker cp Create_http:/go/bin/go-http-server ./go-http-server
	docker rm Create_http
	docker build -t lab03:http_server ./go-http-server
	rm ./go-http-server/go-http-server

Run:
	docker run -d --name http -p 80:80 lab03:http_server 
