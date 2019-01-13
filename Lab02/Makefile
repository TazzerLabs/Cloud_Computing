.PHONY: golang mysql minibank images
  
curr_dir := $(shell pwd)

# Build the go & mysql docker container images
golang:
        docker build -t minibank:golang ./go

mysql: 
        docker build -t minibank:mysql ./mysql/


# Compile the minibank app with the go docker image from prev
minibank:
        docker run -d --name minibankCreate -v $(curr_dir)/minibank/src/minibank/:/go/src/minibank -w /go/ minibank:golang sh -c "go get -t -v minibank && go build -v minibank" 
        docker wait minibankCreate
        docker cp minibankCreate:/go/bin/minibank ./minibank/
        docker rm minibankCreate
        docker build -t minibank:app ./minibank
        rm ./minibank/minibank

images:
        docker run -d --name minibankDB -e MYSQL_ROOT_PASSWORD=password --net testnet minibank:mysql
        sleep 30
        docker run -d -t --name minibankApp -p 8080:8080 --net testnet minibank:app /var/bin/minibank

clean:
        docker kill minibankdb minibankapp
        docker rm minibankdb minibankapp
