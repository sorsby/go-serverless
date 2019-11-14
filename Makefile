build-golang:
	cd golang && docker build -t sorsby/go-serverless .

push-golang:
	docker push sorsby/go-serverless