# Mountebank

A docker image for [mountebank](https://www.mbtest.org/).

## Run

Run the image as follows replacing PORT with the port of your imposter(s)

	docker run -p 2525:2525 [-p PORT:PORT] -d andyrbell/mountebank

Alternatively, use --net=host to use the host network and avoid need to specify all the imposter ports upfront

    docker run --net=host -d andyrbell/mountebank
