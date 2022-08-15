const path = require('path');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const { WebpackManifestPlugin } = require('webpack-manifest-plugin');

module.exports = (env) => {

    return {
        entry: {
            app: './src/app.js',
            main: './src/styles/main.scss',
            vendor: './src/styles/vendor.scss'
        },
        mode: "development",
        devtool: 'inline-source-map',
        devServer: {
            client: {
                overlay: true,
            },
            static: {
                directory: path.resolve(__dirname, 'templates'),
            },
            allowedHosts: 'all',
            headers: {
                'Access-Control-Allow-Origin': '*'
            },
        },
        plugins: [
            new WebpackManifestPlugin({
                writeToFileEmit: true
            }),
            new MiniCssExtractPlugin({
                filename: "[name].[contenthash].css",
            })
        ],
        optimization: {
            runtimeChunk: 'single',
        },
        output: {
            filename: '[name].[contenthash].bundle.js',
            path: path.resolve(__dirname, 'web/assets'),
            publicPath: env.publicPath,
            clean: true,
        },
        module: {
            rules: [
                {
                    test: /\.css$/i,
                    use: ['style-loader', 'css-loader'],
                },
                {
                    test: /\.s[ac]ss$/i,
                    use: [
                        {
                            loader: MiniCssExtractPlugin.loader,
                            options: {
                                publicPath: '../assets/' // path to director where assets folder is located
                            }
                        },

                        // Translates CSS into CommonJS
                        "css-loader",
                        // Bootstrap requirements
                        'postcss-loader',
                        // Compiles Sass to CSS
                        "sass-loader",
                    ],
                },
                {
                    test: /\.(png|svg|jpg|jpeg|gif)$/i,
                    type: 'asset/resource',
                },
            ],
        },
    }
};