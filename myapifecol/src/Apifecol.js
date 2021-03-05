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
};
