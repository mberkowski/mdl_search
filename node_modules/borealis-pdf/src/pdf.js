import React from 'react';
import PropTypes from 'prop-types';

const PDF = (props) => {
  const { height, width, src, thumbnail } = props;
  return (
    <div>
      <object data={src} type="application/pdf" width={width} height={height}>
        <img alt="thumbnail" src={thumbnail} />
        <a href={src}><span className="glyphicon glyphicon-download-alt" />{src}</a>
      </object>
    </div>
  );
};

PDF.defaultProps = {
  height: 500,
  width: 800,
};

PDF.propTypes = {
  src: PropTypes.string.isRequired,
  height: PropTypes.number,
  width: PropTypes.number,
  thumbnail: PropTypes.string,
};

export default PDF;
