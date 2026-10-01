# Tema 1 — Introducción a las aplicaciones web

> **Idea clave:** cada vez que abres una web, tu navegador (el **cliente**) le **pide** algo a un ordenador remoto (el **servidor**) usando el protocolo **HTTP**, y el servidor le **responde**. Todo lo que veremos este curso (HTML, CSS, PHP, WordPress, Moodle...) ocurre dentro de ese "pide y responde".

## Índice

1. [De Arpanet a la web](#1-de-arpanet-a-la-web)
2. [Anatomía de una URL](#2-anatomía-de-una-url)
3. [Sitio web, aplicación web y servicio web](#3-sitio-web-aplicación-web-y-servicio-web)
4. [Arquitectura cliente-servidor](#4-arquitectura-cliente-servidor)
5. [Páginas estáticas y dinámicas](#5-páginas-estáticas-y-dinámicas)
6. [El protocolo HTTP](#6-el-protocolo-http)
7. [Otros protocolos que vas a oír](#7-otros-protocolos-que-vas-a-oír)
8. [Chuleta final](#8-chuleta-final)

---

## 1. De Arpanet a la web

**Internet** es una red de redes: millones de redes distintas conectadas entre sí que funcionan como si fueran una sola. **La web** (WWW) es solo *uno* de los servicios que funcionan sobre Internet, igual que el correo o la transferencia de ficheros.

```
 Internet  = las carreteras (cables, routers, TCP/IP)
 La web    = uno de los servicios que circulan por ellas (páginas con enlaces)
 Correo, FTP, videollamadas... = otros servicios que usan las mismas carreteras
```

| Año | Hito |
|-----|------|
| 1983 | La red militar **Arpanet** (EE. UU.) adopta el protocolo **TCP/IP**. Se considera el nacimiento de Internet |
| 1989 | Tim Berners-Lee, en el **CERN** (Suiza), propone la web: **HTML + HTTP + URL + navegador** |
| 1990-91 | Primera web del mundo en el CERN; al año siguiente se abre al resto del mundo |
| 1993 | Hay unos 100 sitios web en todo el mundo |
| 1997 | Ya son unos 200.000 |
| Hoy | Más de mil millones de sitios web |

> 🔍 **Pruébalo:** la primera web de la historia sigue en línea: [info.cern.ch/hypertext/WWW/TheProject.html](http://info.cern.ch/hypertext/WWW/TheProject.html). Solo tiene texto y enlaces: es HTML puro, sin CSS.

La web se sostiene sobre **tres piezas** que veremos durante el curso:

```
      HTML               HTTP                URL
 (cómo se escribe   (cómo se pide y    (dónde está cada
   una página)        se envía)          página)
```

---

## 2. Anatomía de una URL

La **URL** es la dirección de un recurso en la web. Cada parte tiene un significado:

```
 https://fp-oficial.medac.es:443/formacion-profesional/smr?curso=2#horario
 └─┬─┘   └────────┬────────┘ └┬┘ └──────────┬─────────┘ └──┬───┘ └──┬──┘
 protocolo    dominio      puerto        ruta            parámetros  ancla
```

| Parte | Qué indica | Ejemplo |
|-------|-----------|---------|
| **Protocolo** | Cómo se comunica: `http` o `https` (cifrado) | `https` |
| **Dominio** | Nombre del servidor. El DNS lo traduce a una IP | `fp-oficial.medac.es` |
| **Puerto** | "Puerta" del servidor. Casi nunca se escribe: 80 para http, 443 para https | `:443` |
| **Ruta** | Carpeta y fichero dentro del servidor | `/formacion-profesional/smr` |
| **Parámetros** | Datos que envía el cliente (lo verás en los formularios GET del Tema 2) | `?curso=2` |
| **Ancla** | Posición dentro de la página | `#horario` |

> 💡 El dominio es para personas; los ordenadores usan **direcciones IP**. El servicio **DNS** hace de "agenda" que traduce `medac.es` → `185.x.x.x`. Lo verás en Servicios en Red.

---

## 3. Sitio web, aplicación web y servicio web

Son tres cosas distintas que se confunden mucho:

| | Sitio web | Aplicación web | Servicio web |
|--|-----------|----------------|--------------|
| **Qué es** | Páginas que **muestran** información | Programa que **se usa** desde el navegador | Programa que **responde datos a otros programas** |
| **Interacción** | Leer y navegar | Crear, editar, guardar... | Ninguna con personas |
| **¿Hace falta usuario?** | Normalmente no | Normalmente sí | Suele usar claves de acceso |
| **Qué devuelve** | Páginas HTML | Páginas HTML que cambian según el usuario | Solo **datos** (JSON o XML) |
| **Ejemplo** | Web de un cine con la cartelera, portal de un ayuntamiento | Gmail, Google Docs, Canva, Trello, Moodle | El servicio del tiempo que consulta la app del móvil |

```
 Persona ──navegador──► SITIO WEB         → "léeme"
 Persona ──navegador──► APLICACIÓN WEB    → "úsame" (con tu usuario)
 Programa ──HTTP──────► SERVICIO WEB      → "toma estos datos"
```

### Ventajas de una aplicación web frente a un programa instalado

1. **No se instala**: basta con un navegador.
2. Accesible **desde cualquier lugar y dispositivo** con tu usuario y contraseña.
3. **Siempre actualizada**: el cambio se hace una vez en el servidor.
4. Permite **trabajar varias personas a la vez** sobre el mismo documento.

¿Inconvenientes? Sin conexión a Internet normalmente no funciona, y tus datos quedan en el servidor de otra empresa.

### Un servicio web, en directo

Pega esta dirección en el navegador:

```
https://api.open-meteo.com/v1/forecast?latitude=37.77&longitude=-3.79&current_weather=true
```

Obtendrás algo así (no es una página, son **datos**):

```json
{
  "latitude": 37.77,
  "longitude": -3.79,
  "current_weather": {
    "temperature": 24.3,
    "windspeed": 9.4,
    "time": "2026-10-01T12:00"
  }
}
```

Este formato se llama **JSON**. Una app del tiempo pide esos datos y los "pinta" bonitos en tu pantalla. Tú acabas de hacer lo mismo que hace la app, pero sin el dibujo.

Formas habituales de construir servicios web:

| Modelo | Idea |
|--------|------|
| **REST / API web** | Se pide con una URL normal por HTTP y responde en **JSON** (o XML). Es el más usado hoy |
| **SOAP + WSDL** | Peticiones y respuestas en **XML** con un formato muy estricto. Habitual en sistemas antiguos de bancos y administraciones |

---

## 4. Arquitectura cliente-servidor

```
   CLIENTE                         RED                          SERVIDOR
 ┌───────────┐                                               ┌─────────────┐
 │ Navegador │ ──── 1. Petición HTTP (dame index.html) ────► │ Servidor web│
 │ (Chrome)  │                                               │  (Apache)   │
 │           │ ◄─── 2. Respuesta HTTP (aquí la tienes) ───── │             │
 └───────────┘                                               └──────┬──────┘
                                                                    │
                                                              ┌─────┴──────┐
                                                              │Base de datos│
                                                              └────────────┘
```

| Componente | Qué es | Ejemplo |
|-----------|--------|---------|
| **Cliente** | Quien **pide** | Tu navegador |
| **Servidor** | Quien **atiende y responde** | Apache, Nginx, IIS |
| **Red** | El camino entre ambos | Wifi del aula, fibra, Internet |
| **Protocolo** | Las normas para entenderse | HTTP / HTTPS |
| **Servicio** | Lo que el cliente pide | Una página, un fichero, datos |
| **Base de datos** | Donde se guarda la información | MySQL, MariaDB |

> 💡 "Servidor" puede ser el **programa** (Apache) o el **ordenador** donde está. En el Tema 6 instalarás un servidor en tu propio PC con XAMPP: tu ordenador será cliente y servidor a la vez (`localhost`).

---

## 5. Páginas estáticas y dinámicas

### Estática: el servidor entrega el fichero tal cual

```
 Navegador ──GET /index.html──► Servidor web ── busca el fichero en disco
    ▲                                 │
    └────── envía index.html ◄────────┘

 Todos los usuarios reciben EXACTAMENTE el mismo HTML
```

Pasos:

1. El usuario escribe la URL y el navegador envía una **petición HTTP**.
2. El servidor **busca** el fichero pedido.
3. Lo **envía** tal cual. Siempre el mismo resultado.

La mini-web del Tema 2 (`index.html`, `contacto.html`...) es **estática**.

| ✔ Ventajas | ✘ Inconvenientes |
|-----------|-----------------|
| Carga muy rápida | Para cambiar algo hay que editar el HTML a mano |
| Funciona en cualquier servidor, sin instalar nada | No se adapta al usuario |
| Mantenimiento barato | No puede guardar datos (comentarios, pedidos...) |
| Buena para buscadores | |

### Dinámica: el servidor **fabrica** la página en el momento

```
 Navegador ──GET /perfil.php──► Servidor web ──► Servidor de aplicaciones (PHP)
    ▲                                                   │  ejecuta el código
    │                                                   ▼
    │                                             Base de datos
    │                                                   │  "dame los datos de Ana"
    └──── HTML generado para Ana ◄──────────────────────┘

 Ana y Luis piden la misma URL y reciben páginas DISTINTAS
```

Pasos:

1. El usuario escribe la URL y el navegador envía una petición HTTP.
2. El servidor web ve que es un programa (`.php`) y se lo pasa al **servidor de aplicaciones**.
3. Este **ejecuta el código** y, si hace falta, consulta la **base de datos**.
4. Con el resultado **genera el HTML**.
5. El servidor web envía esa página al navegador.

Ejemplos: tu bandeja de Gmail, tu perfil de Moodle, una tienda online con carrito, **WordPress**.

### ¿Cómo saber si una página es dinámica?

| Pista | Estática | Dinámica |
|-------|----------|----------|
| Extensión en la URL | `.html` | `.php`, `.asp`, `.jsp` (o sin extensión) |
| ¿Tiene inicio de sesión? | No | Sí |
| ¿Cambia según quién la mira? | No | Sí |
| ¿Tiene buscador, carrito, comentarios? | No | Sí |

> 🔍 **Pruébalo:** abre cualquier web, pulsa **Ctrl + U** (ver código fuente). Siempre verás **HTML**, nunca PHP: el PHP se ejecuta en el servidor y al navegador solo le llega el resultado.

Una página también puede cambiar **en el navegador** usando **JavaScript** (por ejemplo, un menú que se despliega). Eso es dinamismo en el **cliente**; lo veremos en el Tema 4.

---

## 6. El protocolo HTTP

HTTP (*Hypertext Transfer Protocol*) es el idioma en el que hablan navegador y servidor. Funciona siempre igual: **petición → respuesta**.

```
 CLIENTE                                            SERVIDOR
    │  1. Traduce la URL: dominio → IP (DNS), puerto 80/443
    │
    │  2. PETICIÓN (request)
    │  ─────────────────────────────────────────────►
    │     GET /index.html HTTP/1.1
    │     Host: www.miweb.es
    │
    │                               3. Procesa y RESPONDE (response)
    │  ◄─────────────────────────────────────────────
    │     HTTP/1.1 200 OK
    │     Content-Type: text/html
    │
    │     <!DOCTYPE html><html>...
    │
    │  4. El navegador interpreta el HTML y lo muestra.
    │     Si ve un <img> o un <link> al CSS, hace NUEVAS peticiones.
```

### Métodos más usados

| Método | Para qué | Dónde lo verás |
|--------|----------|----------------|
| `GET` | Pedir un recurso | Al escribir una URL o pulsar un enlace |
| `POST` | Enviar datos al servidor | Formularios de login, registro... (Tema 2) |

### Códigos de estado

El servidor siempre responde con un número de tres cifras. La primera cifra dice el tipo:

| Código | Significado | Cuándo lo ves |
|--------|-------------|---------------|
| **200** OK | Todo bien | Casi siempre, aunque no lo notas |
| **301** / **302** | Redirección: está en otra dirección | Al escribir `http://` y acabar en `https://` |
| **404** Not Found | Ese recurso no existe | Enlace roto, imagen mal enlazada |
| **403** Forbidden | Existe, pero no tienes permiso | Carpetas protegidas del servidor |
| **500** Internal Server Error | Error en el servidor | Un fallo en el código PHP |

```
 2xx → ✔ éxito      3xx → ↪ redirección
 4xx → ✘ error del CLIENTE (has pedido algo mal)
 5xx → ✘ error del SERVIDOR (él ha fallado)
```

### HTTP y HTTPS

| | HTTP | HTTPS |
|--|------|-------|
| Puerto | **80** | **443** |
| ¿Cifrado? | No: cualquiera en la red puede leerlo | Sí (TLS): solo lo leen cliente y servidor |
| Candado en el navegador | ✘ "No seguro" | 🔒 |

### Versiones

| Versión | Novedad |
|---------|---------|
| HTTP/1.0 | Una conexión por cada petición; se cierra al responder |
| HTTP/1.1 | La conexión **se mantiene abierta** para varias peticiones |
| HTTP/2 | Muchos recursos en paralelo **por una sola conexión**: más rápido |
| HTTP/3 | Funciona sobre **UDP** (QUIC) en vez de TCP, para ir aún más rápido. Ya lo usan Google, YouTube y muchas webs grandes |

### Ver HTTP con tus propios ojos

1. Abre cualquier web y pulsa **F12** → pestaña **Red** (*Network*).
2. Recarga la página (**F5**).
3. Cada línea es **una petición**: el HTML, cada CSS, cada imagen, cada script...

```
 Nombre          Estado  Tipo        Tamaño
 ────────────────────────────────────────────
 index.html      200     document    4.2 kB
 style.css       200     stylesheet  1.1 kB
 medac.jpg       200     jpeg        35 kB
 logo.png        404     png         0 B      ← ¡enlace roto!
```

4. Haz clic en una línea → **Encabezados** (*Headers*): verás el método, la URL, el código de estado y la respuesta del servidor.

---

## 7. Otros protocolos que vas a oír

| Protocolo | Para qué | Puerto |
|-----------|----------|--------|
| **HTTP / HTTPS** | Páginas web | 80 / 443 |
| **SMTP** | **Enviar** correo | 25 / 587 |
| **POP3** | **Descargar** correo al equipo (y normalmente borrarlo del servidor) | 110 / 995 |
| **IMAP** | Leer el correo **dejándolo en el servidor** (sincronizado entre dispositivos) | 143 / 993 |
| **FTP** | Transferir ficheros (por ejemplo, subir tu web al servidor) | 21 |
| **SSH** | Acceso remoto **cifrado** a otra máquina | 22 |
| **Telnet** | Acceso remoto **sin cifrar** (obsoleto, inseguro) | 23 |
| **DNS** | Traducir nombres de dominio a IP | 53 |

En el Tema 15 instalarás un **webmail**: una aplicación web que por detrás habla SMTP e IMAP con el servidor de correo.

---

## 8. Resumen final

| Concepto | En una frase |
|----------|--------------|
| Internet | Red de redes que funciona con TCP/IP |
| Web (WWW) | Servicio de páginas enlazadas: HTML + HTTP + URL |
| Sitio web | Páginas para **leer** |
| Aplicación web | Programa que **se usa** desde el navegador, sin instalarlo |
| Servicio web | Programa que da **datos** a otros programas (JSON/XML) |
| Cliente | Quien pide (el navegador) |
| Servidor | Quien responde (Apache, Nginx...) |
| Página estática | El servidor envía el fichero tal cual: igual para todos |
| Página dinámica | El servidor **genera** la página (PHP + base de datos): distinta para cada usuario |
| HTTP | Idioma petición-respuesta de la web (puerto 80) |
| HTTPS | HTTP cifrado (puerto 443) |
| GET / POST | Pedir / enviar datos |
| 200 / 404 / 500 | Bien / no existe / fallo del servidor |

**Para consultar:** [MDN — ¿Cómo funciona la web?](https://developer.mozilla.org/es/docs/Learn/Getting_started_with_the_web/How_the_Web_works) · [MDN — Códigos de estado HTTP](https://developer.mozilla.org/es/docs/Web/HTTP/Status)
