import React from 'react';
import PropTypes from 'prop-types';
import PDF from './pdf';
import Transcript from './transcript';
import TranscriptNav from './transcript-nav';
import BorealisPDFNav from './borealis-pdf-nav';

export default class BorealisPDFViewer extends React.Component {
  constructor(props) {
    super(props);
    this._pdf = this._pdf.bind(this);
    this._id = this._id.bind(this);
    this._viewer = this._viewer.bind(this);
    this.hasTranscript = this._hasTranscript.bind(this);
  }

  _id() {
    return parseInt(this.props.match.params.id, 10)
  }

  _pdf() {
    return this.props.values[this._id()];
  }

  _viewer() {
    return (this.props.match.path === '/pdf/:id') ? PDF : Transcript;
  }

  _hasTranscript() {
    return this._pdf().transcript.texts.length > 0;
  }

  render() {
    const pdf = this._pdf();
    const Viewer = this._viewer();
    const hasTranscript = this._hasTranscript();
    const label = pdf.transcript.label;
    const id = this._id();
    const values = this.props.values;
    return (
      <div>
        <BorealisPDFNav values={values} />
        <TranscriptNav
          hasTranscript={hasTranscript}
          label={label}
          id={id}
        />
        <Viewer {...this.props.config} {...pdf} />
      </div>
    )
  }
}

BorealisPDFViewer.propTypes = {
  match: PropTypes.object.isRequired,
  config: PropTypes.object.isRequired,
  values: PropTypes.array.isRequired,
};