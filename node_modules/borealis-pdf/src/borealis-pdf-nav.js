import React from 'react';
import Thumbnail from './thumbnail';
import PropTypes from 'prop-types';

const BorealisPDFNav = (props) => {
  return (
    <div className="borealis-pdf-nav">
      {props.values.map((value, i) =>
        <Thumbnail key={`pdf-nav-${i}`} to={`/pdf/${i}`} thumbnail={value.thumbnail} />
      )}
    </div>
  );
};

BorealisPDFNav.propTypes = {
  values: PropTypes.array.isRequired,
};

export default BorealisPDFNav;