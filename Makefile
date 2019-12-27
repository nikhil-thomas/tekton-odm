#.PHONY: odm-run
#odm-docker-run:
#	docker run -it --rm \
#		-v "$(pwd)/images:/code/images:z" \
#		-v "$(pwd)/odm_orthophoto-fast:/code/odm_orthophoto:z" \
#		opendronemap/odm --time --min-num-features 1000 --skip-3dmodel --mesh-size 20000 --fast-orthophoto

.PHONY: install-tekton
install-tekton:
	kubectl apply -f 01_setup/tekton-pipelines-v0.9.2.yaml
	#latest releases are available here: https://github.com/tektoncd/pipeline/releases

.PHONY: add-odm-task
add-odm-task:
	kubectl apply -f 02-task/01_orthophoto-task.yaml

.PHONY: run-odm-task
run-odm-task:
	kubectl create -f 04-taskrun/01-orthophoto-taskrun.yaml
