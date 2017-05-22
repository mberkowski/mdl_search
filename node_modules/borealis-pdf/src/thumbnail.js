import React from 'react';
import { NavLink } from 'react-router-dom';
import PropTypes from 'prop-types';

const Thumbnail = props => (
  <div>
    <NavLink
      className="thumbnail"
      activeClassName="active"
      to={props.to}
    >
      <img alt="pdf-link" src={props.thumbnail} />
    </NavLink>
  </div>
)

const propTypes = {
  to: PropTypes.string.isRequired,
  thumbnail: PropTypes.string.isRequired,
};

Thumbnail.propTypes = propTypes;

export default Thumbnail;