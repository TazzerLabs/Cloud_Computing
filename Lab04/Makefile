.PHONY: golang fibonacci Test Remove-fibonacci Tag benchmark

#Get my current directory shorthand in curr
curr := $(shell pwd)	

golang:
	docker build -t lab04-go  golang/

fibonacci:
	docker run -d --name create_lab04 -v $(curr)/fibonacci/src:/go/src/go/go-fibonacci -w /go/ lab04-go sh -c "go get -t -v go-fibonacci && go build -v go-fibonacci"
	docker wait create_lab04 
	docker cp create_lab04:/go/bin/go-fibonacci ./fibonacci
	docker rm create_lab04
	docker build -t lab04-go ./fibonacci
	rm ./fibonacci/go-fibonacci

Test:
	docker run -d --name fibonacci -p 8080:8080 lab04-go
	docker run -d --name gcr_fibonacci -p 8081:8080 gcr.io/$(GCP_ID)/fibonacci

Remove-fibonacci:
	docker rmi -f fibonacci gcr_fibonacci

Tag:
# GCP_ID is the project id (for John: encoded-stage-214622)
	docker tag lab04-go gcr.io/$(GCP_ID)/fibonacci:latest
	gcloud auth configure-docker
	gcloud docker -- push gcr.io/$(GCP_ID)/fibonacci:latest

benchmark:
#How many $(REQUESTS) -> how many reqs, $(CONC_LEVEL) -> How many simultaneous connections
	ab -p payload.json -T application/json -m POST -n $(REQUESTS) -c $(CONC_LEVEL) -s 100 -r http://$(KUBE_IP):8080/fibonacci

clean:
# Clean up the containers and the images
    docker rmi $(docker images)
    docker rm $(docker ps -a)clean:

