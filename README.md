# site-2020

## Project setup
```
npm install
```

### Compiles and hot-reloads for development
```
npm run serve
```

### Compiles and minifies for production
```
npm run build
```

### Lints and fixes files
```
npm run lint
```

### Deployment Steps
```
nvm use 16
npm run build
```

Then take the dist folder and upload it [here](https://us-east-1.console.aws.amazon.com/s3/buckets/erincthomas.com?region=us-east-1&bucketType=general&tab=objects).
You may need to invalidate some caches [here](https://us-east-1.console.aws.amazon.com/cloudfront/v4/home?region=us-east-1#/distributions/E2G8OI8EM6VO5M) and [here](https://dash.cloudflare.com/83614696e89efe97d9f0c5d1fd7471f1/erincthomas.com/caching/configuration)

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).
