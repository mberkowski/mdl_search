import React from 'react';
import PropTypes from 'prop-types';
import {
  BrowserRouter as Router,
  Route,
} from 'react-router-dom';
import './index.css';
import BorealisPDFViewer from './borealis-pdf-viewer';

class BorealisPDFRoute extends React.Component {
  constructor(props) {
    super(props);
    this.state = { viewer: {}, id: 0 };
    this._app = this._app.bind(this);
    this.viewer = this.viewer.bind(this);
  }

  _app() {
    const pdfprops = this.props;
    return () => (
      <div>
        <Route
          render={
            props => <BorealisPDFViewer
              {...pdfprops}
              {...props}
            />
           }
        />
      </div>
    );
  }

  viewer() {
    const Viewer = this._app();
    return (
      <div>
        <Route exact path="/pdf/:id" component={Viewer} />
        <Route exact path="/pdf/transcript/:id" component={Viewer} />
      </div>
    );
  }

  render() {
    return (
      <div>{this.viewer()}</div>
    );
  }
}

BorealisPDFRoute.propTypes = {
  config: PropTypes.object.isRequired,
};

export default BorealisPDFRoute;

