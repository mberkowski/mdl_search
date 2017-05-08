import React from 'react'
import ReactDOM from 'react-dom'
import ReactCitation  from 'react-citation'

let date = new Date();

var App = React.createClass({
	render () {
    const items =
        [
          {
            focus: true,
            type: 'details',
            label: 'Details',
            fields:
              [
                {
                  label: 'Title',
                  field_values: [
                    {text: 'Daemon', url: 'https://www.amazon.com/DAEMON-Daniel-Suarez/dp/0451228731'}
                  ]
                },
                {
                  label: 'Creator',
                  field_values: [
                    {text: 'Daniel Suarez'}
                  ]
                },
                {
                  label: 'Flergh',
                  delimiter: '<br />',
                  field_values: [
                    {text: 'Blerch', url: 'https://glerpflergdrpdrp.com'},
                    {text: 'Thwap', url: 'http://thwapperspthhddthhter.com'}
                  ]
                },
                {
                  label: 'Fiscal Sponsor',
                  field_values: [
                    {text: 'Grant provided to the Minnesota Digital Library Coalition through the Library Services and Technology Act (LSTA) and the State Library Services and School Technology unit of the Minnesota Department of Education'}
                  ]
                }
              ]
            },
          {
            focus: false,
            type: 'citation',
            label: 'Citation',
            fields:
              {
                mappings: [{}],
                field_values:
                  {
                    creator: 'Fred',
                    ref_name: 'University of Minnesota',
                    creation_date: '09/01/2001',
                    title: 'Fred and his dog',
                    type: 'image',
                    description: 'A boy and his dog',
                    subject: ['dogs', 'cats'],
                    contributing_organization: 'Fred and co',
                    url: 'http://www.example.com/fred',
                    current_date: Date.now()
                  }
              }
            },
            {
              focus: false,
              type: 'download',
              label: 'Download',
              fields:
                [
                  {
                    thumbnail: 'http://lib-mdl-dev.oit.umn.edu/thumbnails/penn:89',
                    sources: [
                      {
                        label: 'Download (75x75)',
                        src: 'http://reflections.mndigital.org/digital/iiif/penn/89/full/75,75/0/default.jpg'
                      },
                      {
                        label: 'Download (150x150)',
                        src: 'http://reflections.mndigital.org/digital/iiif/penn/89/full/150,150/0/default.jpg'
                      },
                      {
                        label: 'Download (800x800)',
                        src: 'http://reflections.mndigital.org/digital/iiif/penn/89/full/800,800/0/default.jpg'
                      }
                    ]
                  },
                  {
                    thumbnail: 'http://lib-mdl-dev.oit.umn.edu/thumbnails/penn:152',
                    sources: [
                      {
                        label: 'Download (75x75)',
                        src: 'http://reflections.mndigital.org/digital/iiif/penn/152/full/75,75/0/default.jpg'
                      },
                      {
                        label: 'Download (150x150)',
                        src: 'http://reflections.mndigital.org/digital/iiif/penn/152/full/150,150/0/default.jpg'
                      },
                      {
                        label: 'Download (800x800)',
                        src: 'http://reflections.mndigital.org/digital/iiif/penn/152/full/800,800/0/default.jpg'
                      }
                    ]
                  },
                  {
                    thumbnail: 'http://lib-mdl-dev.oit.umn.edu/thumbnails/nemhc:4971',
                    sources: [
                      {
                        label: 'Download (75x75)',
                        src: 'http://reflections.mndigital.org/digital/iiif/nemhc/4971/full/75,75/0/default.jpg'
                      },
                      {
                        label: 'Download (150x150)',
                        src: 'http://reflections.mndigital.org/digital/iiif/nemhc/4971/full/150,150/0/default.jpg'
                      },
                      {
                        label: 'Download (800x800)',
                        src: 'http://reflections.mndigital.org/digital/iiif/nemhc/4971/full/800,800/0/default.jpg'
                      }
                    ]
                  }
                ]
              },
              {
                focus: false,
                type: 'transcript',
                label: 'Transcript',
                transcript: 'This is a transcript of something or other'
              }
          ]
		return (<div><ReactCitation items={items} /></div>
		);
	}
});

ReactDOM.render(<App />, document.getElementById('app'));
