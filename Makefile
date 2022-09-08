build:
	docker build -t massdrivercloud/phoenix-chat-example:latest .

run:
	docker compose up

stop:
	docker compose down