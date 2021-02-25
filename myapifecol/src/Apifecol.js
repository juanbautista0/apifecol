
module.exports = class Apifecol {

  constructor(){

  };

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
      if(object.hasOwnProperty("BeforeSend")){
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
        if(object.hasOwnProperty('token')){
            if(object.token !== ''){
                xhr.setRequestHeader('Authorization', 'Bearer ' + object.token);
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
}