build:
	docker build -t hardandheavy/eye-prophet . -m 4g

run:
	docker run -p 4000:80 hardandheavy/eye-prophet --rm