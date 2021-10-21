# yii2-docker
Docker images for mac development suitable for yii2

Docker Hub https://hub.docker.com/repository/docker/asminog/yii2-php

### Available versions for `asminog/yii2-docker`

```
latest-fpm, 8-fpm, 8.0-fpm, 8.0.11-fpm
7-fpm, 7.4-fpm, 7.4.24-fpm
7.3-fpm, 7.3.31-fpm
```

#### Deprecated or EOL versions

```
7.2-fpm, 7.2.34-fpm
7.1-fpm, 7.1.33-fpm
7.0-fpm, 7.0.33-fpm
5-fpm, 5.6-fpm, 5.6.40-fpm
5.5-fpm, 5.5.38-fpm
```

### Docker compose:
    your-name-php:
        image: asminog/yii2-php:7.4-fpm
        environment:
            - GITHUB_API_TOKEN=your-github-token-for-composer
            - PHP_USER_ID=501
            - PHP_ENVIRONMENT=dev # dev or prod php enviroment
            - PHP_ENABLE_XDEBUG=0 # enable xdebug
        restart: always
        volumes:
            - ./www/your-name:/app:delegated
        networks:
            - your-network
