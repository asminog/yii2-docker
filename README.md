# yii2-docker
Docker images for mac development suitable for yii2

## Docker compose:
    your-name-php:
        image: asminog/yii2-php:7.4-fpm
        environment:
            - GITHUB_API_TOKEN=your-github-tocken-for-composer
            - PHP_USER_ID=501
            - PHP_ENVIRONMENT=dev # dev or prod php enviroment
            - PHP_ENABLE_XDEBUG=0 # enable xdebug
        restart: always
        volumes:
            - ./www/your-name:/app:delegated
        networks:
            - your-network
