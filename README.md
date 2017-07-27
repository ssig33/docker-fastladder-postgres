# Docker Image of Fastladder
## Deploy
F.Y.I. https://devcenter.heroku.com/articles/getting-started-with-rails5
### with Docker
``` bash
$ docker run -d --restart=always --name=fastladder -e DATABASE_URL=#{your postgres} -e SECRET_KEY_BASE=#{some string} -p 5000:5000 ssig33/fastladder
```

### Deploy on Heroku
``` bash
$ heroku container:push -a #{your heroku app}
$ heroku config:set DATABASE_URL=#{your postgres} SECRET_KEY_BASE=#{some string} -a #{your heroku app}
$ heroku scale web=1 -a #{your heroku app}
```

Detail is [here](https://devcenter.heroku.com/articles/container-registry-and-runtime)

## Crawler
### Demonize
``` bash
$ docker run -d --restart=always --name=fastladder-crawler -e DATABASE_URL=#{your postgres} -e SECRET_KEY_BASE=#{some string} -p 5000:5000 ssig33/fastladder foreman start web=0,crawler=1
```

### on Heroku
Please set the following command in the heroku scheduler

``` bash
$ ./bin/rails runner script/crawl_at_once.rb
```
