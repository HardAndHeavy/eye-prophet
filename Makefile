build:
	docker build -t eye-prophet:$(tag) .

publish:
	docker image tag eye-prophet:$(tag) hardandheavy/eye-prophet:$(tag)
	docker push hardandheavy/eye-prophet:$(tag)
	docker image tag eye-prophet:$(tag) hardandheavy/eye-prophet:latest
	docker push hardandheavy/eye-prophet:latest

dev:
	docker run -it --rm -p 4000:80 eye-prophet:$(tag)
