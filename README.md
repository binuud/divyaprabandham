# divyaprabandham
Collection of Tamil songs

Hugo is used as a templating system. Static files build by hugo will be pushed to CDN on cloud flare.


## Reference Only

### Create new hugo project

```
docker run --rm -it -v ./src:/home/circleci/project -p 1313:1313 cibuilds/hugo:0.148.2 hugo
```

In the new terminal
```
hugo new site [name]
```