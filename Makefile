build:
	docker build -t hardandheavy/eye-prophet . -m 4g

publish:
	docker push hardandheavy/eye-prophet

run:
	docker run -p 4000:80 hardandheavy/eye-prophet --rm