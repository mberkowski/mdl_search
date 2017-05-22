# borealis-pdf

An **EXPERIMENTAL** React component to display multiple PDFs along with a corresponding transcript for each PDF.

To build the examples locally, run:

```
git clone https://github.com/UMNLibraries/borealis-pdf.git
cd borealis-pdf
npm install
npm start
```

Then open [`localhost:8000/example/pdf/0`](http://localhost:8000/example/pdf/0) in a browser.

## Installation

The easiest way to use borealis-pdf is to install it from NPM and include it in your own React build process (e.g. using [Browserify](http://browserify.org), [Webpack](http://webpack.github.io/), etc).

You can also use the standalone build by including `dist/borealis-pdf.js` in your page. If you use this, make sure you have already included React, and it is available as a global variable.


To install via NPM, add react-openseadragon to your application package.js dependencies:

```JSON
  ...
  "dependencies": {
    "react": "^0.14.0",
    "react-dom": "^0.14.0",
    "borealis-pdf": "git+https://github.com/UMNLibraries/borealis-pdf.git#specify_a_commit_hash_here_to_make_yarn_happy"
  }
  ...
```
Or install it directly.

```
npm install https://github.com/UMNLibraries/borealis-pdf.git
```

## Quickstart`


```JavaScript
import React from 'react'
import ReactDOM  from 'react-dom'
import OpenseadragonViewer from 'borealis-pdf'

const config =
  {
    height: 800,
  };

const values =
  [
    {
      src: 'http://cdm16022.contentdm.oclc.org/utils/getfile/collection/p16022coll52/id/16/filename',
      thumbnail: 'http://lib-mdl-dev.oit.umn.edu/thumbnails/p16022coll52:16',
      transcript: {
        texts: ['1 Cecelia Boone Narrator Sara Ring Interviewer June 9, 2011 Minitex Oral History Project Minneapolis, Minnesota SR: Tell us how you got started working at Minitex. How did you end up in the job you are doing right now? CB: As always, there is a story. blah blah'],
        label: 'PDF',
      },
    },
    {
      src: 'http://cdm16022.contentdm.oclc.org/utils/getfile/collection/p16022coll52/id/17/filename',
      thumbnail: 'http://lib-mdl-dev.oit.umn.edu/thumbnails/p16022coll52:17',
      transcript: {
        texts: ['blah blah blah, second pdf here'],
        label: 'PDF',
      },
    },
  ];

const App = () => <BorealisPDF config={config} values={values} basename="/example" />;

ReactDOM.render(<App />, document.getElementById('app'));
```

## Development (`src`, `lib` and the build process)

**NOTE:** The source code for the component is in `src`.

To build, watch and serve the examples (which will also watch the component source), run `npm start`. Run 'npm run build' to transpile and provide a CommonJS module version of the code in src.

## License

University of Minnesota (MIT Pending)
