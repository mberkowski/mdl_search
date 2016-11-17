# React Active Item

**EXPERIMENTAL**

A react [Higher Order Component](https://medium.com/@franleplant/react-higher-order-components-in-depth-cf9032ee6c3e#.bexwe8ttm) that keeps track of a list of objects and provides an API to find focus items, set focused items, and get the index value of a focused item.


## Installation

The easiest way to use react-active-item is to install it from NPM and include it in your own React build process (using [Browserify](http://browserify.org), [Webpack](http://webpack.github.io/), etc).

You can also use the standalone build by including `dist/react-active-item.js` in your page. If you use this, make sure you have already included React, and it is available as a global variable.

```
npm install git:+git@github.com:UMNLibraries/react-active-item.git --save
```

### Demo

Demo and example implementation may be found here: https://github.com/UMNLibraries/react-citation

### Properties

* Items - an array of objects, each containing a `focus` key.

### API


In the context of your wrapped component:
* this.props.getActiveItem() - get the item currently in focus
* this.props.getActiveItemIndex() - get the index value of the actively focused item
* this.props.setActiveItem(i) - pass in an index value to set the focus of an item


## Development (`src`, `lib` and the build process)

**NOTE:** The source code for the component is in `src`. A transpiled CommonJS version (generated with Babel) is available in `lib` for use with node.js, browserify and webpack. A UMD bundle is also built to `dist`, which can be included without the need for any build system.

To build, watch and serve the examples (which will also watch the component source), run `npm start`. If you just want to watch changes to `src` and rebuild `lib`, run `npm run watch` (this is useful if you are working with `npm link`).

## License

MIT Pending Copyright (c) 2016 University of Minnesota