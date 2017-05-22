import { MemoryRouter } from 'react-router-dom';
import React from 'react';
import renderer from 'react-test-renderer';
import BorealisPDF from '../src/borealis-pdf-route';

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
describe('For the first item', () => {
  it('should render a pdf correctly', () => {
    const component = renderer.create(
    <MemoryRouter initialEntries={['/pdf/0']} initialIndex={1} >
      <BorealisPDF config={config} values={values} />
    </MemoryRouter>);
    const jsonComponent = component.toJSON();
    expect(jsonComponent).toMatchSnapshot();
  });

  it('should render a transcript correctly', () => {
    const component = renderer.create(
    <MemoryRouter initialEntries={['/pdf/transcript/0']} initialIndex={1} >
      <BorealisPDF config={config} values={values} />
    </MemoryRouter>);
    const jsonComponent = component.toJSON();
    expect(jsonComponent).toMatchSnapshot();
  });
});

describe('For the second item', () => {
  it('should render a pdf correctly', () => {
    const component = renderer.create(
    <MemoryRouter initialEntries={['/pdf/1']} initialIndex={1} >
      <BorealisPDF config={config} values={values} />
    </MemoryRouter>);
    const jsonComponent = component.toJSON();
    expect(jsonComponent).toMatchSnapshot();
  });

  it('should render a transcript correctly', () => {
    const component = renderer.create(
    <MemoryRouter initialEntries={['/pdf/transcript/1']} initialIndex={1} >
      <BorealisPDF config={config} values={values} />
    </MemoryRouter>);
    const jsonComponent = component.toJSON();
    expect(jsonComponent).toMatchSnapshot();
  });
});
