start:
	docker-compose up

status:
	git status 
	cd ./provisions && terraform plan && cd ../

push:
	git push origin master
	terraform apply
