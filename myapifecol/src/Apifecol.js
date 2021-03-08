module.exports = class Apifecol {
  constructor() {}

  /**
   * @access public
   * (EN) Ajax request
   * (ES) Petición ajax
   * @param {Object} object
   * (EN) Data object
   * (ES) Objeto de datos
   * @param {String} object.url
   * (EN) Request Url
   * (ES) Url de petición
   * @param {String} object.type
   * (EN) Request type GET,POST
   * (ES) Tipo de solicitud GET, POST
   * @param {String} object.token
   * (EN) JWT Authorization
   * (ES) Autorización Json Web Token
   * @param {*} object.data
   * (EN) Data params
   * (ES) Parametro de datos
   * @param {Boolean} object.async
   * (EN) Async request
   * (ES) Peticion asíncrona
   * @param {CallableFunction} object.BeforeSend
   * (EN) Before request callback
   * (ES) Función antes de enviar
   * @param {CallableFunction} object.success
   * (EN) Success requested answer
   * (ES) Respuesta de peticion
   * @param {String} object.content_type
   */
  Ajax(object = {}) {
    try {
      var elements = ["url", "type", "success"];
      elements.forEach((element) => {
        if (!object.hasOwnProperty(element)) {
          throw new Error(`No ${element}`);
        }
      });
      if (object.hasOwnProperty("BeforeSend")) {
        object.BeforeSend();
      }
      var xhr = new XMLHttpRequest();
      var content_type =
        this.SetContentType(object.content_type) ??
        "application/x-www-form-urlencoded";
      xhr.open(
        object.type,
        object.url,
        object.hasOwnProperty("async") ? object.async : true
      );

      //Set headers autorization
      if (object.hasOwnProperty("token")) {
        if (object.token !== "") {
          xhr.setRequestHeader("Authorization", "Bearer " + object.token);
        }
      }

      xhr.onload = function (e) {
        if (xhr.readyState === 4) {
          object.success(xhr.responseText);
        }
      };
      xhr.onerror = function (e) {
        console.error(xhr.statusText);
      };
      if (object.hasOwnProperty("data")) {
        if (object.content_type !== "file") {
          xhr.setRequestHeader("Content-Type", content_type);
        }
        xhr.send(object.data);
      } else {
        xhr.send(null);
      }
    } catch (error) {
      console.error(error.message);
    }
  }

  /**
   * SetContenType
   * @param {string} type
   * Tipo de dato a retornar header json,form, file
   */
  SetContentType(type) {
    switch (type) {
      case "json":
        return "application/json;charset=UTF-8";
        break;
      case "form":
        return "application/x-www-form-urlencoded";
        break;
      case "file":
        return "multipart/form-data";
        break;
      default:
        return "application/x-www-form-urlencoded";
        break;
    }
  }

  /**
   *
   * @param {string} str
   * String json a validar
   * @return {boolean} bool
   */
  IsJson(str) {
    try {
      JSON.parse(str);
    } catch (error) {
      console.log(str);
      return false;
    }
    return true;
  }
  /**
   * GetServerApiUri
   */

  GetServerApiUri() {
    if (localStorage.getItem("server_api") == null) {
      localStorage.setItem("server_api", "");
    }
    return localStorage.getItem("server_api");
  }

  /**
   * Table
   * Render listings grid js
   * @param {Object} config
   * @param {String} render
   */
  Table(config = {}, render = "", grid) {
    if (render != "" && config != {}) {
      var t = new grid(config).render(document.getElementById(render));
      //this.Styles();
      //this.StylingGridJs();
      var selector_id = this.makeid(8, true);
      //this.Selector(selector_id, render, config, t);
      setTimeout(function () {
        //feather.replace();
        //G.Icons("gtep-icons");
      }, 500);
      return t;
    }
  }

  Data(filters = {}, object = {}) {
    var form = new FormData();
    for (var k in filters) {
      if (filters[k] != "" && filters[k] != null) {
        form.append(k, filters[k]);
      }
    }
    if (Object.keys(object).length > 0) {
      object.server.body = form;
      return object;
    } else {
      return false;
    }
  }

  /**
   *
   * @param {Number} length
   * @param {String} text
   */
  makeid(length, text = false) {
    var result = "";
    if (text) {
      var characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    } else {
      var characters =
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    }
    var charactersLength = characters.length;
    for (var i = 0; i < length; i++) {
      result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    if (document.getElementById(result) != null) {
      this.makeid(length);
    } else {
      return result;
    }
  }

  MainComponent() {
    return document.getElementById("component");
  }
  
  /**
   * E
   * @param {String}
   */
  E(e){
    if(typeof document.getElementById(e) !== 'undefined')
    return document.getElementById(e);
  }
  /**
   * SetTitle
   */
  SetTitle(title){
    document.getElementsByTagName("title")[0].innerHTML = title;
   if( document.getElementById("ComponentTitle") != null){
    document.getElementById("ComponentTitle").innerHTML = title;
   }
  }

  GridLanguage() {
    return {
      search: {
        placeholder: "Escriba la palabra clave...🔍",
      },
      sort: {
        sortAsc: "Ordenar columna ascendente",
        sortDesc: "Ordenar columna descendente",
      },
      pagination: {
        previous: "Anterior",
        next: "Siguiente",
        navigate: (page, pages) => `Página ${page} de ${pages}`,
        page: (page) => `Página ${page}`,
        showing: "Mostrando",
        of: "de",
        to: "a",
        results: "resultados",
      },
      loading: "Cargando...",
      noRecordsFound: "No se han encontrado registros que coincidan",
      error: "Un error ocurrió mientras buscaba los datos",
    };
  }

  /**
   * LoadIcon
   */
   LoadIcon(){
    window.feather.replace();
    return '';
   }

  /**
   * GridjsStyles
   * GridJs Custom styles
   */
  GridjsStyles(){
    this.Styles();
    this.StylingGridJs();
  }

  Styles() {
    var input = document.getElementsByClassName("gridjs-search-input")[0];
    input.classList.add("form-control");
    input.classList.add("form-control-sm");
    input.classList.remove("gridjs-search-input");
    input.classList.remove("gridjs-input");
  }
  StylingGridJs() {
    var element = document.getElementsByClassName("gridjs-table");
    var sorts = document.getElementsByClassName("gridjs-sort");
    var orderer = document.getElementsByClassName("gridjs-th-sort");

    //Action Callback icons
    if (orderer.length > 0) {
      for (let i = 0; i < orderer.length; i++) {
        orderer[i].setAttribute("onclick", `G.IconsRenderRefres(event,this);`);
      }
    }

    //Btn styles
    if (sorts.length > 0) {
      for (let i = 0; i < sorts.length; i++) {
        sorts[i].style.border = "none";
        sorts[i].classList.add("btn");
        sorts[i].classList.add("btn-sm");
      }
    }
    //Table style
    if (element.length > 0) {
      for (let index = 0; index < element.length; index++) {
        element[index].style.fontSize = "13px;";
        element[index].classList.remove("gridjs-table");
      }
    }
  }
};
