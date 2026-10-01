# Tema 2 — El lenguaje de marcas (HTML)

> **Idea clave:** HTML no "programa" nada: **marca** el contenido para decirle al navegador qué es cada cosa (un título, un párrafo, una imagen, un enlace...). El aspecto lo pondremos en el Tema 3 con CSS.

## Índice

1. [Cómo se escribe una etiqueta](#1-cómo-se-escribe-una-etiqueta)
2. [Esqueleto de toda página HTML](#2-esqueleto-de-toda-página-html)
3. [Textos: títulos, párrafos y compañía](#3-textos-títulos-párrafos-y-compañía)
4. [Listas](#4-listas)
5. [Imágenes](#5-imágenes)
6. [Enlaces y rutas](#6-enlaces-y-rutas)
7. [Insertar contenido de otra web: iframe](#7-insertar-contenido-de-otra-web-iframe)
8. [Capas: div](#8-capas-div)
9. [Tablas](#9-tablas)
10. [Formularios](#10-formularios)
11. [Chuleta final](#11-chuleta-final)

**Cómo trabajar este tema:** abre la carpeta [`ejemplos/`](ejemplos/) en VS Code, pulsa botón derecho sobre `index.html` → **Open with Live Server**, y ve modificando el código mientras lees.

---

## 1. Cómo se escribe una etiqueta

```html
<etiqueta atributo="valor">contenido</etiqueta>
```

```
   <a href="contacto.html">Contacto</a>
   │ │    │               │        │
   │ │    │               │        └── etiqueta de cierre (lleva /)
   │ │    │               └── contenido que ve el usuario
   │ │    └── valor del atributo (siempre entre comillas)
   │ └── atributo: información extra de la etiqueta
   └── etiqueta de apertura
```

Hay etiquetas que **no tienen contenido** y por tanto no se cierran:

```html
<br>          <!-- salto de línea -->
<hr>          <!-- línea horizontal de separación -->
<img src="foto.jpg" alt="Descripción">
<input type="text">
```

Los **comentarios** no se ven en la página; sirven para dejar notas en el código:

```html
<!-- Esto es un comentario: el navegador lo ignora -->
```

> ⚠️ **Error típico:** cerrar en distinto orden del que se abrió. Las etiquetas se cierran "como las muñecas rusas": la última que abres es la primera que cierras.
>
> ```html
> <p><b>Mal</p></b>      <!-- ❌ -->
> <p><b>Bien</b></p>     <!-- ✅ -->
> ```

---

## 2. Esqueleto de toda página HTML

Toda página empieza igual. En VS Code escribe `!` y pulsa **Tab** y te lo genera solo o `html:5`:

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi primera página web</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <!-- Aquí va todo lo que se ve en la página -->
</body>
</html>
```

| Etiqueta | Para qué sirve |
|----------|----------------|
| `<!DOCTYPE html>` | Le dice al navegador que es HTML5 |
| `<html lang="es">` | Raíz del documento. `lang="es"` indica que está en español |
| `<head>` | **Cabecera**: información *sobre* la página (no se ve en pantalla) |
| `<meta charset="UTF-8">` | Permite tildes, ñ y símbolos sin que salgan caracteres raros |
| `<meta name="viewport"...>` | Hace que la página se adapte al móvil |
| `<title>` | Texto de la **pestaña** del navegador |
| `<link>` | Enlaza un fichero externo, normalmente la hoja de estilos CSS |
| `<style>` | Permite escribir CSS dentro del propio HTML |
| `<body>` | **Cuerpo**: todo lo que el usuario ve |

```
 ┌──────────── pestaña: <title> ────────────┐
 │  Mi primera página web            ×      │
 ├──────────────────────────────────────────┤
 │                                          │
 │           Todo esto es <body>            │
 │                                          │
 └──────────────────────────────────────────┘
   <head> no se ve: son "datos sobre la página"
```

> 💡 **Consejo:** VS Code genera `lang="en"` y `<title>Document</title>`. Cámbialos siempre a `lang="es"` y a un título que tenga sentido.

---

## 3. Textos: títulos, párrafos y compañía

```html
<h1>Título principal (solo uno por página)</h1>
<h2>Subtítulo</h2>
<h3>Apartado más pequeño</h3>
<!-- existen hasta <h6> -->

<p>Esto es un párrafo. El navegador deja espacio antes y después.</p>
<p>Los    espacios    de    más    se    ignoran.</p>

<pre>
    Con pre     se respetan
         los espacios y los saltos de línea
</pre>

<p>Texto en <b>negrita</b>, en <i>cursiva</i>,
   <strong>importante</strong> y <em>destacado</em>.<br>
   Esto va en la línea siguiente gracias a br.</p>

<hr>
```

> 🔍 **Pruébalo:** en `index.html` el párrafo `<p>           Párrafo1</p>` tiene muchos espacios delante, pero en el navegador no aparecen. En cambio dentro de `<pre>` sí se respetan.

### Caracteres especiales (entidades)

Algunos símbolos se escriben con un código que empieza por `&` y acaba en `;`:

| Código | Resultado | Código | Resultado |
|--------|-----------|--------|-----------|
| `&lt;` | < | `&copy;` | © |
| `&gt;` | > | `&euro;` | € |
| `&amp;` | & | `&nbsp;` | espacio que no se "come" |
| `&#9749;` | ☕ | `&#9733;` | ★ |

```html
<p>Para escribir una etiqueta en pantalla: &lt;p&gt;</p>
<h1>Hola, esto aparece resaltado &#9749;</h1>
```

---

## 4. Listas

```html
<h3>Lista ordenada (numerada)</h3>
<ol>
    <li>Comprar el pan</li>
    <li>Entrenar</li>
    <li>Hacer tareas</li>
</ol>

<h3>Lista desordenada (con viñetas)</h3>
<ul>
    <li>Comprar el pan</li>
    <li>Entrenar</li>
    <li>Hacer tareas</li>
</ul>
```

Resultado:

```
Lista ordenada              Lista desordenada
 1. Comprar el pan           • Comprar el pan
 2. Entrenar                 • Entrenar
 3. Hacer tareas             • Hacer tareas
```

Trucos útiles de `<ol>`:

```html
<ol type="A">  ...  </ol>     <!-- A, B, C -->
<ol type="i">  ...  </ol>     <!-- i, ii, iii -->
<ol start="5"> ...  </ol>     <!-- empieza en 5 -->
```

Una lista puede ir **dentro** de otra (lista anidada):

```html
<ul>
    <li>Frutas
        <ul>
            <li>Manzana</li>
            <li>Pera</li>
        </ul>
    </li>
    <li>Verduras</li>
</ul>
```

> ⚠️ **Error típico:** poner texto directamente dentro de `<ul>` u `<ol>`. Cada elemento **tiene** que ir dentro de su `<li>`.

---

## 5. Imágenes

```html
<img src="img/medac.jpg" alt="Logo de MEDAC" title="Foto Medac" width="400" height="200">
```

| Atributo | Qué hace |
|----------|----------|
| `src` | **Ruta** de la imagen (obligatorio) |
| `alt` | Texto alternativo: se muestra si la imagen no carga y lo leen los lectores de pantalla |
| `title` | Texto que aparece al dejar el ratón encima |
| `width` / `height` | Ancho y alto en píxeles |

> 💡 **Consejo:** si pones solo `width`, el alto se calcula solo y la imagen **no se deforma**.
>
> ```html
> <img src="img/medac.jpg" alt="Logo de MEDAC" width="300">
> ```

La ruta `img/medac.jpg` significa "entra en la carpeta `img` que está junto a este HTML y coge `medac.jpg`". Por eso es importante organizar bien las carpetas:

```
ejemplos/
├── index.html        ← aquí está el <img src="img/medac.jpg">
├── css/
│   └── style.css
└── img/
    └── medac.jpg     ← aquí está la imagen
```

---

## 6. Enlaces y rutas

```html
<!-- Enlace a otra página de MI web (ruta relativa) -->
<a href="contacto.html">Contacto</a>

<!-- Enlace a otra web (ruta absoluta) -->
<a href="https://fp-oficial.medac.es/formacion-profesional">Página de MEDAC</a>

<!-- Abrir en una pestaña nueva -->
<a href="https://developer.mozilla.org/es/" target="_blank">Documentación MDN</a>

<!-- Enlace de correo y de teléfono -->
<a href="mailto:secretaria@centro.es">Escríbenos</a>
<a href="tel:+34953000000">Llámanos</a>

<!-- Una imagen que funciona como enlace -->
<a href="index.html"><img src="img/medac.jpg" alt="Volver al inicio" width="120"></a>
```

### Relativa o absoluta

| Tipo | Ejemplo | Cuándo usarla |
|------|---------|---------------|
| **Relativa** | `contacto.html`, `img/foto.jpg`, `../index.html` | Ficheros de **tu propia web** |
| **Absoluta** | `https://www.google.es` | Recursos de **otra web** |

Moverse entre carpetas con rutas relativas:

```
web/
├── index.html
├── contacto.html
└── paginas/
    └── servicios.html

Desde index.html        → paginas/servicios.html
Desde servicios.html    → ../index.html      (.. = subir una carpeta)
```

### Enlaces dentro de la misma página (anclas)

```html
<a href="#formulario">Ir al formulario</a>

<!-- ... mucho contenido ... -->

<h2 id="formulario">Formulario</h2>
```

---

## 7. Insertar contenido de otra web: iframe

Un `<iframe>` es una "ventana" dentro de tu página que muestra otra web. Es lo que usan Google Maps o YouTube cuando pulsas **Compartir → Insertar**.

```html
<h1>Página contacto</h1>
<a href="index.html">Home</a>

<iframe src="https://www.google.com/maps/embed?pb=..."
        width="600" height="450" style="border:0;"
        allowfullscreen loading="lazy"></iframe>
```

Cómo conseguir el código de un mapa:

1. Busca el sitio en **Google Maps**.
2. **Compartir** → pestaña **Insertar un mapa** → **Copiar HTML**.
3. Pégalo en tu página.

Con un vídeo de YouTube es igual: **Compartir → Insertar**.

---

## 8. Capas: div

`<div>` es una **caja vacía** que sirve para agrupar elementos. Por sí sola no se ve, pero cuando le demos estilo (Tema 3) podremos ponerle borde, fondo, colocarla...

```html
<div class="estiloCaja">
    <h2>Título dentro de una caja</h2>
    <p>Párrafo dentro de una caja</p>
</div>
```

```
┌──── div.estiloCaja ────────────┐
│  Título dentro de una caja     │
│  Párrafo dentro de una caja    │
└────────────────────────────────┘
```

El atributo `class` le pone un **nombre** a la caja para poder darle estilo después. En HTML5 también existen cajas con nombre propio, que funcionan igual que `div` pero dicen qué contienen:

```html
<header>Cabecera de la web</header>
<nav>Menú</nav>
<main>Contenido principal</main>
<footer>Pie de página</footer>
```

---

## 9. Tablas

Una tabla se construye **fila a fila**:

```
<table>          → la tabla completa
  <caption>      → título de la tabla
  <tr>           → una fila (table row)
    <th>         → celda de cabecera (sale en negrita y centrada)
    <td>         → celda normal (table data)
```

### Tabla básica

```html
<table border="1">
    <caption>Horario de mañana</caption>
    <tr>
        <th>Hora</th>
        <th>Lunes</th>
        <th>Martes</th>
    </tr>
    <tr>
        <td>8:00</td>
        <td>Aplicaciones Web</td>
        <td>Seguridad</td>
    </tr>
    <tr>
        <td>9:00</td>
        <td>Servicios en Red</td>
        <td>Aplicaciones Web</td>
    </tr>
</table>
```

Resultado:

```
          Horario de mañana
┌───────┬──────────────────┬──────────────────┐
│ Hora  │      Lunes       │      Martes      │
├───────┼──────────────────┼──────────────────┤
│ 8:00  │ Aplicaciones Web │ Seguridad        │
├───────┼──────────────────┼──────────────────┤
│ 9:00  │ Servicios en Red │ Aplicaciones Web │
└───────┴──────────────────┴──────────────────┘
```

> 💡 **Truco para no perderte:** cuenta las celdas de cada fila. **Todas las filas deben tener el mismo número** (salvo que uses colspan/rowspan).

### Atributos de la tabla

```html
<table border="2" width="80%" align="center">
```

| Atributo | Qué hace |
|----------|----------|
| `border` | Grosor del borde. Sin él, la tabla no tiene líneas |
| `width` | Ancho: en píxeles (`500`) o en % de la página (`80%`) |
| `align` | Posición de la tabla: `left`, `center`, `right` |

> ℹ️ Estos atributos funcionan, pero son de HTML antiguo. En el Tema 3 haremos lo mismo (y mucho más) con CSS.

### Unir celdas: colspan y rowspan

```html
<table border="1">
    <tr>
        <th colspan="3">Notas 1er trimestre</th>   <!-- ocupa 3 columnas -->
    </tr>
    <tr>
        <th>Alumno</th>
        <th>Examen</th>
        <th>Prácticas</th>
    </tr>
    <tr>
        <td rowspan="2">Grupo A</td>                <!-- ocupa 2 filas -->
        <td>7</td>
        <td>8</td>
    </tr>
    <tr>
        <!-- aquí NO va la primera celda: la ocupa el rowspan de arriba -->
        <td>6</td>
        <td>9</td>
    </tr>
</table>
```

```
┌─────────────────────────────────┐
│       Notas 1er trimestre       │   ← colspan="3"
├──────────┬─────────┬────────────┤
│ Alumno   │ Examen  │ Prácticas  │
├──────────┼─────────┼────────────┤
│          │    7    │     8      │
│ Grupo A  ├─────────┼────────────┤   ← rowspan="2"
│          │    6    │     9      │
└──────────┴─────────┴────────────┘
```

### Tabla con enlaces

Dentro de una celda puede ir cualquier cosa: enlaces, imágenes, listas...

```html
<table border="1">
    <tr>
        <th>Aplicación</th>
        <th>Enlace</th>
    </tr>
    <tr>
        <td>Balsamiq</td>
        <td><a href="https://balsamiq.cloud/" target="_blank">Accede</a></td>
    </tr>
</table>
```

Tienes un ejemplo completo en [`ejemplos/tabla.html`](ejemplos/tabla.html).

---

## 10. Formularios

Un formulario recoge datos que escribe el usuario y los **envía** a algún sitio (normalmente un programa en el servidor, como un fichero PHP).

```html
<form action="datos.php" method="post">
    <!-- campos -->
    <button type="submit">Enviar datos</button>
</form>
```

| Atributo | Qué indica |
|----------|-----------|
| `action` | **A dónde** se envían los datos (qué programa los recibe) |
| `method` | **Cómo** se envían: `get` o `post` |

### GET o POST

```
method="get"   →  los datos viajan en la URL
                  formulario.html?nombre=Ana&curso=SMR
                  ✔ se puede guardar como favorito   ✘ se ven (¡nunca para contraseñas!)

method="post"  →  los datos viajan "dentro" de la petición, no se ven en la URL
                  ✔ para contraseñas y datos personales   ✔ admite más datos
```

> 🔍 **Pruébalo sin servidor:** pon `action=""` y `method="get"`, rellena el formulario y pulsa Enviar. Mira la **barra de direcciones**: verás tus datos pegados a la URL. Así compruebas qué nombre (`name`) tiene cada campo.

### La pareja label + input

```html
<label for="nombre">Nombre:</label>
<input type="text" id="nombre" name="nombre">
```

```
  for="nombre"  ──────►  id="nombre"      (une la etiqueta con su campo:
                                            al pulsar el texto se activa el campo)

  name="nombre"  ─────►  nombre=Ana        (nombre con el que viaja el dato al servidor)
```

> ⚠️ **Error típico:** que el `for` del label **no coincida** con el `id` del input. La página se ve bien, pero al pulsar el texto no pasa nada. Mira el [Caso práctico 4](casospracticos.md).

### Campos de texto y similares

```html
<label for="usuario">Usuario:</label>
<input type="text" id="usuario" name="usuario" placeholder="Escribe tu usuario" required>

<label for="clave">Contraseña:</label>
<input type="password" id="clave" name="clave">

<label for="correo">Email:</label>
<input type="email" id="correo" name="correo">

<label for="edad">Edad:</label>
<input type="number" id="edad" name="edad" min="16" max="99">

<label for="fecha">Fecha de nacimiento:</label>
<input type="date" id="fecha" name="fecha">

<label for="curso">Curso:</label>
<input type="text" id="curso" name="curso" value="Aplicaciones Web">
```

| Atributo | Qué hace |
|----------|----------|
| `name` | Nombre del dato al enviarlo |
| `value` | Valor que aparece **ya escrito** |
| `placeholder` | Texto de ayuda en gris que **desaparece** al escribir |
| `required` | No deja enviar el formulario si está vacío |
| `min`, `max` | Límites en campos numéricos |

`value` y `placeholder` parecen iguales pero no lo son: `value` es un dato real que se envía; `placeholder` es solo una pista.

### Área de texto (varias líneas)

```html
<label for="mensaje">Mensaje:</label><br>
<textarea id="mensaje" name="mensaje" rows="5" cols="40"></textarea>
```

### Checkbox (puedes marcar varias)

```html
<input type="checkbox" id="leche" name="compra" value="leche">
<label for="leche">Caja de leche</label><br>

<input type="checkbox" id="pan" name="compra" value="pan" checked>
<label for="pan">Pan rústico</label><br>

<input type="checkbox" id="huevos" name="compra" value="huevos">
<label for="huevos">Huevos (docena)</label>
```

`checked` hace que la casilla salga **ya marcada**. Basta con escribir la palabra (no hace falta `checked="true"`).

### Radio (solo puedes marcar una)

```html
<p>Turno:</p>
<input type="radio" id="manana" name="turno" value="manana" checked>
<label for="manana">Mañana</label>

<input type="radio" id="tarde" name="turno" value="tarde">
<label for="tarde">Tarde</label>
```

> 🔑 **La clave de los radio:** todos los botones del mismo grupo deben tener **el mismo `name`**. Si tienen `name` distinto, el navegador deja marcarlos todos a la vez.

### Lista desplegable

```html
<label for="modulo">Módulo:</label>
<select id="modulo" name="modulo">
    <option value="">-- Selecciona --</option>
    <option value="sor">Sistemas Operativos en Red</option>
    <option value="aw" selected>Aplicaciones Web</option>
    <option value="si">Seguridad Informática</option>
</select>
```

- Lo que ve el usuario es el texto entre `<option>` y `</option>`.
- Lo que se **envía** es el `value`.
- `selected` marca la opción que sale elegida por defecto. Si no hay ninguna, sale la primera.

### Botones

```html
<button type="submit">Enviar</button>     <!-- envía el formulario -->
<button type="reset">Borrar</button>      <!-- vacía todos los campos -->
<button type="button">Botón</button>      <!-- no hace nada por sí solo (se usa con JavaScript, Tema 4) -->
```

La forma antigua, que también verás por ahí:

```html
<input type="submit" value="Enviar">
<input type="button" value="Aceptar">
```

### Agrupar campos: fieldset y legend

```html
<fieldset>
    <legend>Datos personales</legend>
    <label for="nom">Nombre:</label>
    <input type="text" id="nom" name="nom">
</fieldset>
```

```
┌─ Datos personales ──────────────┐
│  Nombre: [                  ]   │
└─────────────────────────────────┘
```

Formulario completo de clase en [`ejemplos/formulario.html`](ejemplos/formulario.html).

---

## 11. Resumen final

| Quiero... | Etiqueta |
|-----------|----------|
| Un título | `<h1>` ... `<h6>` |
| Un párrafo | `<p>` |
| Salto de línea / separador | `<br>` / `<hr>` |
| Respetar espacios | `<pre>` |
| Lista numerada / con viñetas | `<ol>` / `<ul>` + `<li>` |
| Una imagen | `<img src="" alt="">` |
| Un enlace | `<a href="">` |
| Un mapa o vídeo de otra web | `<iframe>` |
| Una caja para agrupar | `<div>` |
| Una tabla | `<table>` `<tr>` `<th>` `<td>` |
| Un formulario | `<form action="" method="">` |
| Campo de texto | `<input type="text">` |
| Casillas / opción única | `type="checkbox"` / `type="radio"` |
| Desplegable | `<select>` + `<option>` |
| Texto largo | `<textarea>` |
| Botón de enviar | `<button type="submit">` |

**Para consultar:** [MDN — HTML básico](https://developer.mozilla.org/es/docs/Learn/Getting_started_with_the_web/HTML_basics) · [HTML Cheat Sheet](https://htmlcheatsheet.com/)
