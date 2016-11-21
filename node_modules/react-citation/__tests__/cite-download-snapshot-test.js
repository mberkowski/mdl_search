import React from 'react'
import renderer from 'react-test-renderer'
import CitationDownload from '../src/cite-download'

describe('CitationDownload Tests', () => {
  it("produces download links", function(){  

    const fields = 
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
        }
      ]

    let component = renderer.create(<CitationDownload fields={fields} />)
    let tree = component.toJSON()
    expect(tree).toMatchSnapshot()
  })
})