# Divyaprabandham
Collection of Tamil songs

Hugo is used as a templating system. Static files build by hugo will be pushed to CDN on cloud flare.

## Local Development
When making changes to the content, users might want to view the output before deployment.

Run the following command, to launch the hugo development server as a docker container.
Docker container as choosen, to prevent issues with hugo installations and versions.
```
make run
```
Launch browser to [http://localhost:1313]

## Reference Only

### Create new hugo project

```
docker run --rm -it -v ./src:/home/circleci/project -p 1313:1313 cibuilds/hugo:0.148.2 hugo
```

In the new terminal
```
hugo new site [name]
```