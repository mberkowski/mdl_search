const webpack = require('webpack');
const path = require('path');
const merge = require('webpack-merge');

const TARGET = process.env.npm_lifecycle_event;
const minimize = process.argv.indexOf('--minimize') > 0;
const build = process.argv.indexOf('--build') > 0;

const common = {
  module: {
    loaders: [
      {
        test: /\.js?$/,
        loader: 'react-hot-loader',
        include: path.join(__dirname, 'src'),
      },
      {
        test: /\.js$/,
        exclude: /(node_modules|bower_components)/,
        loader: 'babel-loader',
        query: {
          presets: ['react', 'es2015', 'stage-0'],
        },
      },
      {
        test: /\.css$/,
        loaders: ['style-loader', 'css-loader'],
      },
      {
        test: /\.less$/,
        loaders: ['style-loader', 'css-loader'],
      },
    ],
  },
  plugins: [
    new webpack.HotModuleReplacementPlugin(),
  ],
};

if (build) {
  if (minimize) {
    common.plugins.push(new webpack.optimize.UglifyJsPlugin());
    var config =
      {
        entry: './src/borealis-pdf.js',
        output: {
          path: path.join(__dirname, 'dist'),
          filename: 'borealis-pdf-min.js',
          library: 'borealis-pdf',
          libraryTarget: 'umd',
          umdNamedDefine: true
        },
      };
  } else {
    var config =
      {
        devtool: 'source-map',
        entry: './src/borealis-pdf.js',
        output: {
          path: path.join(__dirname, 'dist'),
          filename: 'borealis-pdf.js',
          library: 'borealis-pdf',
          libraryTarget: 'umd',
          umdNamedDefine: true,
        },
      };
  }
  module.exports = merge(common, config);
}

if (TARGET === 'start') {
  module.exports = merge(common, {
    devtool: 'source-map',
    entry: './example/example.js',
    output: {
      path: path.join(__dirname, 'docs'),
      filename: 'example.js',
    },
  });
}