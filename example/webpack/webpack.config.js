const WebpackAssetsManifest = require("webpack-assets-manifest");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");

const path = require('path');

const { NODE_ENV } = process.env;
const isProd = NODE_ENV === "production";

module.exports = {
  mode: isProd ? "production" : "development",
  entry: {
    "site": "./source/javascript/site.js",
  },
  output: {
    path: path.resolve(__dirname, 'source/packs'),
    publicPath: "/packs/",
    filename: "[name]-[hash].js"
  },
  module: {
    rules: [
      {
        test: /\.scss$/,
        use: [MiniCssExtractPlugin.loader, "css-loader", "sass-loader"]
      },
      {
        test: /\.(:?png|jpg)$/,
        loader: "file-loader",
        options: {
          name: '[folder]/[name]-[hash].[ext]',
        },
      }
    ]
  },
  plugins: [
      new WebpackAssetsManifest({
        publicPath: true
      }),
      new MiniCssExtractPlugin({
        filename: "[name]-[hash].css"
      }),
  ]
};
