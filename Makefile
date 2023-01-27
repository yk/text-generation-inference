install-server:
	cd server && make install

build-client:
	cd router/client && cargo build	

install-router: build-client
	cd router && cargo install --path .

install-launcher:
	cd launcher && cargo install --path .

install: install-server install-router install-launcher

server-dev:
	cd server && make run-dev

router-dev:
	cd router && cargo run

run-bloom-560m:
	text-generation-launcher --model-name bigscience/bloom-560m --num-shard 2

run-bloom-560m-quantize:
	text-generation-launcher --model-name bigscience/bloom-560m --num-shard 2 --quantize

download-bloom:
	text-generation-server download-weights bigscience/bloom

run-bloom:
	text-generation-launcher --model-name bigscience/bloom --num-shard 8

run-bloom-quantize:
	text-generation-launcher --model-name bigscience/bloom --num-shard 8 --quantize