#.PHONY: odm-run
#odm-docker-run:
#	docker run -it --rm \
#		-v "$(pwd)/images:/code/images:z" \
#		-v "$(pwd)/odm_orthophoto-fast:/code/odm_orthophoto:z" \
#		opendronemap/odm --time --min-num-features 1000 --skip-3dmodel --mesh-size 20000 --fast-orthophoto

.PHONY: setup
setup: install-tekton add-odm-task result-server

.PHONY: install-tekton
install-tekton:
	kubectl apply -f 01_setup/
	#latest releases are available here: https://github.com/tektoncd/pipeline/releases

.PHONY: add-odm-task
add-odm-task:
	kubectl apply -f 02-task/
	kubectl apply -f 03-datasets-pipelineresources/

.PHONY: result-server
result-server:
	kubectl apply -f 05-results-server/

.PHONY: create-new-taskrun
create-new-taskrun:
	kubectl create -f 04-tastrun/01-orthophoto-taskrun-with-tiles.yaml
