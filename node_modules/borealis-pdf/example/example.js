import React from 'react';
import ReactDOM from 'react-dom';
import BorealisPDF from '../src/borealis-pdf';

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