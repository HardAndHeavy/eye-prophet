build:
	docker build -t hardandheavy/eye-prophet . -m 4g

publish-docker:
	docker image tag telegram:latest hardandheavy/eye-prophet:latest
	docker push hardandheavy/eye-prophet:latest

publish-heroku:
	heroku container:push web --app eye-prophet
	heroku container:release web --app eye-prophet

run:
	docker run --rm -p 4000:80 hardandheavy/eye-prophet
