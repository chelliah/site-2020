module.exports = {
    publicPath: './',
    css: {
        loaderOptions: {
            sass: {
                prependData: `@import "@/styles/global-styles.scss";`
            }
        }
    },
    chainWebpack: config => {
        // GraphQL Loader
        config.module
            .rule('glsl')
            .test(/\.glsl$/)
            .use('webpack-glsl-loader')
            .loader('webpack-glsl-loader')
            .end()
    }
};