# tmo-hello-world-nodejs

## This Repo

- Simply a lab repo for a scan test

## Credit

[Original Code](https://github.com/kevinpollet/typescript-docker-multi-stage-build)

Sample node app that runs a simple webserver on port 3000 - Includes a third party libraries scanning demonstration purposes.

## Run the app

1. Install dependencies: `npm install`
2. Start the app: `npm start`
3. Call the greeting endpoint:

```shell
curl http://localhost:3000/greeting\?name\=John

{"id":"76ac792c-c1a9-4fc5-ba75-39652a06b381","message":"Hello, John!"}
```

## Build the Docker image

To build the Docker image, use the `docker build` command:

```shell
docker build . -t greeting-service:latest
```

To stop the build on a specific stage, use the `target` option:

```shell
docker build --target builder -t greeting-service:latest .
```

## Run the Docker image

To run the Docker image, use the `docker run` command:

```shell
docker run -p 3000:3000 --rm greeting-service:latest
```

Then, you can invoke the greeting service running in a Docker container with:

```shell
curl http://localhost:3000/greeting\?name\=Docker

{"id":"7af0385b-99dc-4d47-a423-f6ab18ea7f1c","message":"Hello, Docker!"}
```

## Contributing

Contributions are welcome!

Submit an [issue][2] or a [pull request][3] if you want to contribute some code.

## License

[MIT][4]

[2]: https://github.com/kevinpollet/typescript-docker-multi-stage-build/issues/new
[3]: https://github.com/kevinpollet/typescript-docker-multi-stage-build/pulls
[4]: ./LICENSE.md
