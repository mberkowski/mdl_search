import React from 'react';
import PropTypes from 'prop-types';

const Transcript = (props) => {
  const texts = props.transcript.texts;
  return (
    <div>
      {texts.map((text, i) =>
        <div key={`transcript-${i}`} className="transcript">{text}</div>,
      )}
    </div>
  );
};

Transcript.propTypes = {
  transcript: PropTypes.object.isRequired,
};

export default Transcript;
