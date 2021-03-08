import React, { Component } from "react";
import ReactDom from "react-dom";
import Form from "react-bootstrap/Form";
import ButtonGroup from "react-bootstrap/ButtonGroup";
import Button from "react-bootstrap/Button";
import Modal from "react-bootstrap/Modal";

import { html } from "gridjs";
import { Grid, _ } from "gridjs-react";
import "gridjs/dist/theme/mermaid.css";
import * as Icon from "react-feather";

const helpers = require("../../Apifecol");

const apifecol = new helpers();

class Billers extends Component {
  constructor(props) {
    super(props);
    this.state = {
      error: null,
      isLoaded: false,
      items: [],
      isOpen: false,
      biller_id: false,
      biller: false,
      nit_types:[]
    };
  }

  openModal = (e, row) => {
    this.setState({ isOpen: true, biller_id: row });
    this.GetBiller(row);
  };
  closeModal = () => {
    this.setState({ isOpen: false });
  };

  componentDidMount() {
    //Get Billers
    fetch(`${apifecol.GetServerApiUri()}/Listings/Rows/billers`, {
      method: "POST",
      headers: {
        Authorization: "Bearer " + localStorage.getItem("token"),
      },
    })
      .then((res) => res.json())
      .then(
        (result) => {
          this.setState({
            isLoaded: true,
            items: result.data,
          });
          this.BillersList();
        },
        (error) => {
          this.setState({
            isLoaded: true,
            error,
          });
        }
      );
  }

  OptionListings(){


  }

  BillersList() {
    const { error, isLoaded, items } = this.state;

    //Render biller list
    ReactDom.render(
      <Grid
        data={items.map((b) => [b.name, b.identification_number, b.id])}
        columns={[
          { name: "Nombre" },
          { name: "NIT/CC" },
          {
            name: "Opciones",
            formatter: (cell) => {
              return _(
                <ButtonGroup aria-label="Basic example">
                  <Button
                    className="btn App-btn App-btn-primary"
                    onClick={(e) => this.openModal(e, cell)}
                  >
                    {isLoaded ? <Icon.Edit size={20} /> : "Click to load"}
                  </Button>
                  <Button
                    className="btn App-btn App-btn-primary"
                    onClick={() => alert(cell)}
                  >
                    {isLoaded ? <Icon.Trash2 size={20} /> : "Click to load"}
                  </Button>
                </ButtonGroup>
              );
            },
          },
        ]}
        language={apifecol.GridLanguage()}
        search={true}
        sort={true}
        pagination={{
          enabled: true,
          limit: 1,
        }}
      />,
      document.getElementById("Billers")
    );
  }

  GetBiller(id) {
    var success = (data) => {
      apifecol.E("ModalTitle").innerHTML = data.name;
      var fields = ["name", "business_name", "identification_number", "dv"];
      for (let f in fields) {
        apifecol.E(fields[f]).value = data[fields[f]];
      }
      console.log(data);
    };
    apifecol.Ajax({
      url: `${apifecol.GetServerApiUri()}/Listings/Rows/billers/${id}`,
      type: "POST",
      async: true,
      token: localStorage.getItem("token"),
      success: (data) => {
        if (apifecol.IsJson(data)) {
          var result = JSON.parse(data);
          switch (result.code) {
            case 200:
              success(result.data);
              break;
            case 403:
              success = false;
              break;
            default:
              success = false;
              break;
          }
        } else {
          console.log("fail");
        }
      },
    });
  }
  ModalBiller() {
    var handleKeyUpNIT = (event) => {
      if (event.charCode >= 48 && event.charCode <= 57) {
        return true;
      }
      return false;
    };
    return (
      <Form autoComplete="off" onSubmit={this.handleSubmit}>
        <Modal
          size="lg"
          show={this.state.isOpen}
          onHide={this.closeModal}
          dialogClassName="fullscreen-modal"
        >
          <Modal.Header closeButton>
            <Modal.Title id="ModalTitle"></Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <div className="row">
              <div className="col-sm-12">
                <div className="row">
                  <div className="col-sm-auto">
                    <Form.Group controlId="name">
                      <Form.Label>Nombre</Form.Label>
                      <Form.Control
                        size="sm"
                        type="text"
                        name="name"
                        required
                      />
                      <Form.Text className="text-muted"></Form.Text>
                    </Form.Group>
                  </div>
                  <div className="col-sm-auto">
                    <Form.Group controlId="business_name">
                      <Form.Label>Nombre comercial</Form.Label>
                      <Form.Control
                        size="sm"
                        type="text"
                        name="business_name"
                        required
                      />
                      <Form.Text className="text-muted"></Form.Text>
                    </Form.Group>
                  </div>
                  <div className="col-sm-auto">
                    <Form.Group controlId="identification_number">
                      <Form.Label>NIT/CC</Form.Label>
                      <Form.Control
                        size="sm"
                        type="number"
                        name="identification_number"
                        required
                        onKeyUp={() => handleKeyUpNIT}
                      />
                      <Form.Text className="text-muted">
                        <strong className="text-danger">*</strong> Sin dígito de
                        verificación.
                      </Form.Text>
                    </Form.Group>
                  </div>
                  <div className="col-sm-2">
                    <Form.Group controlId="dv">
                      <Form.Label>DV</Form.Label>
                      <Form.Control size="sm" type="number" name="dv" />
                    </Form.Group>
                  </div>
                  <div className="col-sm-auto">
                    <Form.Group controlId="nit_type_id">
                      <Form.Label>Tipo de documento</Form.Label>
                      <Form.Control
                        as="select"
                        size="sm"
                        defaultValue={"DEFAULT"}
                      >
                        <option value="DEFAULT" disabled={true}>
                          Seleccione
                        </option>
                        {/*options.map((option, index) => {
                          return (
                            <option key={index} value={option.value}>
                              {option.value}
                            </option>
                          );
                        })*/}
                      </Form.Control>
                    </Form.Group>
                  </div>
                </div>
              </div>
              <div className="col-sm-6"></div>
            </div>
          </Modal.Body>
          <Modal.Footer>
            <Button
              className="btn App-btn-primary"
              onClick={() => this.closeModal()}
            >
              Guardar
            </Button>
            <Button variant="secondary" onClick={() => this.closeModal()}>
              Close
            </Button>
          </Modal.Footer>
        </Modal>
      </Form>
    );
  }

  render() {
    const { error, isLoaded, items } = this.state;
    apifecol.SetTitle("Facturadores");
    if (error) {
      return <div>Error: {error.message}</div>;
    } else if (!isLoaded) {
      return <div>Loading...</div>;
    } else {
      return (
        <div>
          <div id="Billers"></div>
          {this.ModalBiller()}
        </div>
      );
    }
  }
}

export default Billers;
