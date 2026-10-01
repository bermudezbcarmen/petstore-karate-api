function fn() {

    var env = karate.env || 'dev';

    var config = {};

    if (env == 'dev') {
        config.baseUrl =
            'https://petstore.swagger.io/v2';
    }

    return config;
}