import React, { Component } from "react";
import ReactDom from "react-dom";
import Form from "react-bootstrap/Form";
import ButtonGroup from "react-bootstrap/ButtonGroup";
import Button from "react-bootstrap/Button";
import Modal from "react-bootstrap/Modal";
import Table from "react-bootstrap/Table";

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
      nit_types: [],
      liabilities: [],
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
    //Get Nit types
    this.RenderNitTypes(true);
    //Get Liabilities
    this.RenderLiabilities(true);
  }

  /**
   * SelectLiabilities
   * (ES)Detecta cambio o intención de selección de responsabilidad.
   * (EN)Detects change or intent of responsibility selection.
   * @param {HTMLElement} e
   * @return {VoidFunction}
   */
  SelectLiabilities(e) {
    console.log(e.target.value);
    //DEFAULT
  }

  /**
   * RenderLiabilities
   * (ES) Obtiene y renderiza las responsabilidades.
   * (EN) Get and renders responsibilities.
   * @param {Boolean} storage
   * @return {VoidFunction}
   */
  RenderLiabilities(storage) {
    //validar si se necesita cargar las responsabilidades
    if (storage) {
      //Aquí se valida si no existe en local las responsabilidades
      if (localStorage.getItem("Liabilities") === null) {
        fetch(`${apifecol.GetServerApiUri()}/Listings/Rows/type_liabilities`, {
          method: "GET",
          headers: {
            Authorization: "Bearer " + localStorage.getItem("token"),
          },
        })
          .then((res) => res.json())
          .then(
            (result) => {
              if (result.code == 200) {
                this.setState({
                  isLoaded: true,
                  liabilities: result.data,
                });
                localStorage.setItem(
                  "Liabilities",
                  JSON.stringify(result.data)
                );
              }
            },
            (error) => {
              this.setState({
                isLoaded: true,
                error,
              });
            }
          );
      } else {
        //Si existen se defini el nit_types
        this.setState({
          isLoaded: true,
          liabilities: JSON.parse(localStorage.getItem("Liabilities")),
        });
      }
    } else {
      const { error, isLoaded, liabilities } = this.state;

      return (
        <Form.Group controlId="nit_type_id">
          <Form.Label>Responsabilidades</Form.Label>
          <Form.Control
            as="select"
            size="sm"
            defaultValue={"DEFAULT"}
            onChange={(event) => this.SelectLiabilities(event)}
          >
            <option value="DEFAULT" disabled={true}>
              Seleccione
            </option>
            {liabilities.map((liabilitie) => {
              //Render nit types
              return (
                <option key={liabilitie.id} value={liabilitie.id}>
                  {liabilitie.code}: {liabilitie.name}
                </option>
              );
            })}
          </Form.Control>
        </Form.Group>
      );
    }
  }

  /**
   * TableLiabilities
   * (ES)Tabla encargada de mostrar las responsabilidades asignadas.
   * (EN)Table in charge of showing the assigned responsibilities.
   */
  TableLiabilities() {
    return (
      <Table responsive id="LiabilitiesTable" size="sm">
        <thead>
          <tr>
            <td><small className="text-muted">Descripción</small></td>
            <td><small className="text-muted">Código</small></td>
            <td><small className="text-muted">Acción</small></td>
          </tr>
        </thead>
        <tbody></tbody>
      </Table>
    );
  }
  RenderNitTypes(storage = false) {
    //validar si se necesita cargar los tipos de nit
    if (storage) {
      //Aquí se valida si no existe en local los tipos de nit
      if (localStorage.getItem("NitTypes") === null) {
        fetch(`${apifecol.GetServerApiUri()}/Listings/Rows/nit_types`, {
          method: "POST",
          headers: {
            Authorization: "Bearer " + localStorage.getItem("token"),
          },
        })
          .then((res) => res.json())
          .then(
            (result) => {
              if (result.code == 200) {
                this.setState({
                  isLoaded: true,
                  nit_types: result.data,
                });
                localStorage.setItem("NitTypes", JSON.stringify(result.data));
              }
            },
            (error) => {
              this.setState({
                isLoaded: true,
                error,
              });
            }
          );
      } else {
        //Si existen se defini el nit_types
        this.setState({
          isLoaded: true,
          nit_types: JSON.parse(localStorage.getItem("NitTypes")),
        });
      }
    } else {
      const { error, isLoaded, nit_types } = this.state;
      return (
        <Form.Group controlId="nit_type_id">
          <Form.Label>Tipo de documento</Form.Label>
          <Form.Control as="select" size="sm" defaultValue={"DEFAULT"}>
            <option value="DEFAULT" disabled={true}>
              Seleccione
            </option>
            {nit_types.map((nit) => {
              //Render nit types
              return (
                <option key={nit.id} value={nit.id}>
                  {nit.name}
                </option>
              );
            })}
          </Form.Control>
        </Form.Group>
      );
    }
  }

  BillersList() {
    const { error, isLoaded, items } = this.state;

    //Render biller list
    ReactDom.render(
      <Grid
        className="table-responsive table-sm"
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
      var fields = [
        "name",
        "business_name",
        "identification_number",
        "dv",
        "nit_type_id",
      ];
      for (let f in fields) {
        apifecol.E(fields[f]).value = data[fields[f]];
      }
      if (apifecol.E("identification_number").value != "") {
        apifecol.E("dv").value = apifecol.CalculateVerificationDigit(
          apifecol.E("identification_number").value
        );
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
                  <div className="col-sm-3">{this.RenderNitTypes()}</div>
                  <div className="col-sm-3">{this.RenderLiabilities()}</div>
                </div>
              </div>
              <div className="col-sm-6">{this.TableLiabilities()}</div>
            </div>
          </Modal.Body>
          <Modal.Footer>
            <Button
              className="btn App-btn-primary"
              onClick={() => this.closeModal()}
            >
              Guardar
            </Button>
            <Button
              variant="secondary"
              onClick={() => this.closeModal()}
              className="btn App-btn-secondary"
            >
              Cerrar
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
          <div className="table-responsive table-sm" id="Billers"></div>
          {this.ModalBiller()}
        </div>
      );
    }
  }
}

export default Billers;
