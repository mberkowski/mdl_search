import React from 'react';
import { NavLink } from 'react-router-dom';
import PropTypes from 'prop-types';

const TranscriptNav = (props) => {
  const { hasTranscript, label, id } = props;
    if (hasTranscript) {
    return (
      <div className="row image-nav">
        <ul className="nav nav-pills">
          <li><NavLink
            className="transcript-nav-link"
            activeClassName="active"
            to={`/pdf/${id}`}
          >{label}</NavLink>
          </li>
          <li >
            <NavLink
              className="transcript-nav-link"
              activeClassName="active"
              to={`/pdf/transcript/${id}`}
            >Transcript</NavLink>
          </li>
        </ul>
      </div>
    );
  }
  return <span />;
};

TranscriptNav.propTypes = {
  hasTranscript: PropTypes.bool.isRequired,
  label: PropTypes.string.isRequired,
  id: PropTypes.number.isRequired,
};

export default TranscriptNav;
