// Direcciones de los servicios del backend en PRODUCCION.
//
// Este fichero sustituye a environment.ts al compilar con --configuration production
// (el reemplazo esta declarado en angular.json, en la configuracion "production").
// Es el unico fichero que hay que tocar para apuntar la app a otro servidor: se cambia la IP
// o el dominio, se commitea y el workflow reconstruye la imagen en ese push.
//
// Ojo: las resuelve el navegador, no el contenedor. Tienen que ser direcciones alcanzables
// desde el equipo donde se abre la app.
export const environment = {
  // URL usada por las llamadas HTTP.
  apiUrl: 'http://localhost:1337',

  // URL base usada para conectar con Socket.IO.
  socketUrl: 'http://localhost:1337',
};
