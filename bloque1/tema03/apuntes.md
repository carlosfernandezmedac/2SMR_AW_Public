# Tema 3 — Hojas de estilo (CSS)

> **Idea clave:** HTML dice **qué** es cada cosa; CSS dice **cómo se ve**. Separar las dos cosas permite cambiar el aspecto de toda una web tocando un solo fichero.

## Índice

1. [Qué es CSS y cómo se escribe](#1-qué-es-css-y-cómo-se-escribe)
2. [Tres formas de añadir CSS](#2-tres-formas-de-añadir-css)
3. [Selectores: a quién le aplico el estilo](#3-selectores-a-quién-le-aplico-el-estilo)
4. [La cascada: ¿qué regla gana?](#4-la-cascada-qué-regla-gana)
5. [Colores](#5-colores)
6. [Propiedades de texto](#6-propiedades-de-texto)
7. [Propiedades de fuente](#7-propiedades-de-fuente)
8. [Fondos](#8-fondos)
9. [El modelo de caja](#9-el-modelo-de-caja)
10. [Recetas prácticas: menú, tabla y formulario](#10-recetas-prácticas-menú-tabla-y-formulario)
11. [Herramientas de trabajo](#11-herramientas-de-trabajo)
12. [Chuleta final](#12-chuleta-final)

**Cómo trabajar este tema:** abre [`ejemplos/index.html`](ejemplos/index.html) con Live Server y ten al lado [`ejemplos/css/estilos.css`](ejemplos/css/estilos.css). Cambia valores, guarda y mira qué pasa.

---

## 1. Qué es CSS y cómo se escribe

CSS (*Cascading Style Sheets*, hojas de estilo en cascada) es una lista de **reglas**. Cada regla dice: "a estos elementos, ponles este aspecto".

```css
h1 {
    color: blue;
    font-size: 40px;
}
```

```
   h1  {  color : blue ;  font-size : 40px ; }
   │      │       │       │           │
   │      │       │       └───────────┴── otra declaración
   │      │       └── valor
   │      └── propiedad
   └── selector: a QUIÉN se aplica
       └─────── todo lo de dentro de { } es la DECLARACIÓN ───────┘
```

Reglas de escritura:

- Cada declaración acaba en **punto y coma** `;`.
- Los comentarios se escriben así: `/* comentario */` (no con `<!-- -->` como en HTML).
- Los valores numéricos llevan **unidad** pegada: `30px`, `2em`, `50%`. Nunca `30 px`.

> ⚠️ **Error típico:** olvidar un `;` o una `}`. CSS no avisa: simplemente **ignora** esa regla (y a veces la siguiente). Si algo "no hace caso", revisa primero la puntuación.

---

## 2. Tres formas de añadir CSS

### a) En línea (atributo `style`)

```html
<p style="color: red; font-size: 20px;">Solo este párrafo es rojo</p>
```

Útil para una prueba rápida. **No recomendable**: si tienes 50 párrafos, tendrías que repetirlo 50 veces.

### b) Interno (etiqueta `<style>` en el `<head>`)

```html
<head>
    <style>
        body {
            color: purple;
            background-color: #d8da3d;
        }
    </style>
</head>
```

Afecta a **toda esa página**, pero solo a esa.

### c) Externo (fichero `.css` enlazado) ✅ **la buena**

```html
<head>
    <link rel="stylesheet" href="css/style.css">
</head>
```

```css
/* css/style.css */
p {
    color: red;
    font-size: 30px;
}
```

| Atributo del link | Significado |
|-------------------|-------------|
| `rel="stylesheet"` | Lo que enlazo es una hoja de estilos |
| `href` | Ruta del fichero CSS (relativa o absoluta) |
| `type="text/css"` | Tipo de fichero. En HTML5 es opcional |
| `media` | Para qué medio: `screen`, `print`... (opcional) |

```
 index.html ──┐
 contacto.html├──► css/style.css   Un cambio aquí cambia TODA la web
 formulario.html┘
```

---

## 3. Selectores: a quién le aplico el estilo

### Selector de etiqueta — a **todos** los elementos de ese tipo

```css
p {
    text-align: left;
}
```

### Selector de clase `.` — a los elementos con ese `class`

```css
.estiloParrafo {
    color: blueviolet;
}
```

```html
<p>Párrafo normal</p>
<p class="estiloParrafo">Este sale violeta</p>
<h2 class="estiloParrafo">Este también: la clase sirve para cualquier etiqueta</h2>
```

Un elemento puede tener **varias clases**, separadas por espacio:

```html
<p class="estiloParrafo destacado">Tengo dos clases</p>
```

### Selector de identificador `#` — a **un único** elemento

```css
#cabecera {
    text-align: center;
}
```

```html
<div id="cabecera">Aplicaciones Web</div>
```

| | Clase `.` | Id `#` |
|--|-----------|--------|
| ¿Cuántas veces en la página? | Las que quieras | **Una sola** |
| Uso típico | Estilos que se repiten (botones, cajas, avisos) | Una zona única (cabecera, pie, menú principal) |

### Otros selectores muy útiles

```css
/* Agrupar: la misma regla para varios */
h1, h2, h3 {
    font-family: Arial, sans-serif;
}

/* Descendiente: solo los <p> que están DENTRO de .estiloCaja */
.estiloCaja p {
    color: gray;
}

/* Universal: todos los elementos */
* {
    margin: 0;
}
```

### Pseudoclases — estilo según el **estado**

```css
a:link    { color: blue; }            /* enlace no visitado */
a:visited { color: purple; }          /* enlace ya visitado */
a:hover   { background-color: #F89B4D; } /* ratón encima */
a:active  { color: red; }             /* mientras se hace clic */

input:focus { border: 2px solid orange; }  /* campo en el que estás escribiendo */
tr:hover    { background-color: #eee; }    /* fila de tabla bajo el ratón */
```

> 💡 En los enlaces, respeta el orden **L**ink → **V**isited → **H**over → **A**ctive (*"LoVe HAte"*). Si pones `hover` antes que `visited`, el hover deja de funcionar en los enlaces visitados.

---

## 4. La cascada: ¿qué regla gana?

Mira el CSS de clase:

```css
p {
    color: red;
    font-size: 30px;
}

.estiloParrafo {
    color: blueviolet;
}
```

```html
<p class="estiloParrafo">Nuevo estilo de párrafo</p>
```

¿De qué color sale? Las dos reglas le afectan. Sale **violeta y a 30px**:

```
 Regla p              → color: red        font-size: 30px
 Regla .estiloParrafo → color: blueviolet
                        ─────────────────   ───────────────
 Resultado            →  blueviolet  (gana  30px (nadie lo
                         la clase)          contradice, se suma)
```

Las reglas **se suman**. Solo cuando dos reglas chocan en la **misma propiedad** hay que decidir cuál gana:

**1. Gana la más específica:**

```
  style="..."  >  #id  >  .clase  >  etiqueta
  (en línea)
  más fuerte ◄──────────────────────► más débil
```

**2. Si son igual de específicas, gana la última escrita:**

```css
h1 { color: blue; }
h1 { color: green; }   /* ← gana esta: está después */
```

Por eso **el orden de las reglas dentro del CSS importa**, pero el orden de las etiquetas en el HTML no.

**3. Herencia:** algunas propiedades (color, fuente...) pasan de padres a hijos. Si pones `color` en `body`, todo el texto lo hereda salvo que otra regla diga lo contrario.

```css
body {
    font-family: Arial, sans-serif;   /* toda la página usa Arial */
    color: #333;
}
```

---

## 5. Colores

Se pueden escribir de varias formas; todas valen:

```css
color: teal;                     /* nombre en inglés */
color: #F89B4D;                  /* hexadecimal: #RRGGBB */
color: #f00;                     /* hexadecimal corto = #ff0000 */
color: rgb(153, 102, 153);       /* rojo, verde, azul de 0 a 255 */
color: rgba(0, 0, 0, 0.5);       /* el 4º valor es la transparencia (0 a 1) */
```

| Propiedad | Qué colorea |
|-----------|-------------|
| `color` | El **texto** |
| `background-color` | El **fondo** |
| `border-color` | El **borde** |

> 💡 En VS Code, al escribir un color aparece un cuadradito: pasa el ratón por encima y tendrás un selector de color. También puedes usar [coolors.co](https://coolors.co) para elegir paletas que combinen.

---

## 6. Propiedades de texto

```css
.texto {
    text-align: justify;           /* left | right | center | justify */
    line-height: 1.6;              /* interlineado: 1.6 veces el tamaño de letra */
    text-decoration: underline;    /* none | underline | overline | line-through */
    text-transform: uppercase;     /* uppercase | lowercase | capitalize */
    letter-spacing: 2px;           /* espacio entre letras */
    text-indent: 30px;             /* sangría de la primera línea */
}
```

`text-decoration` se puede detallar:

```css
.subrayado-bonito {
    text-decoration-line: underline;
    text-decoration-color: red;
    text-decoration-style: wavy;    /* solid | double | dotted | dashed | wavy */
}

/* O todo junto: */
.subrayado-bonito { text-decoration: underline wavy red; }
```

Uso muy habitual: **quitar el subrayado a los enlaces**:

```css
a {
    text-decoration: none;
}
```

> ℹ️ En algunos materiales aparece `text-height` para el interlineado. **Esa propiedad no existe**: la correcta es `line-height`.

---

## 7. Propiedades de fuente

```css
p {
    font-family: "Open Sans", Arial, sans-serif;  /* de más preferida a genérica */
    font-size: 18px;                 /* px | em | % | small | large... */
    font-weight: bold;               /* normal | bold | 100 a 900 */
    font-style: italic;              /* normal | italic | oblique */
    font-variant: small-caps;        /* normal | small-caps (versalitas) */
}
```

**`font-family` es una lista separada por comas**: si el ordenador no tiene la primera, prueba la segunda, y así hasta la última, que debe ser una genérica (`serif`, `sans-serif` o `monospace`). Los nombres con espacios van entre comillas.

```css
font-family: arial | courier;          /* ❌ la barra no vale */
font-family: Arial, "Courier New", monospace;   /* ✅ */
```

### La propiedad abreviada `font`

Todo en una línea, **en este orden** (tamaño y familia son obligatorios):

```css
/*     estilo  variante   grosor tamaño familia     */
font:  italic  small-caps bold   20px   Arial, sans-serif;
```

### Usar una fuente de Google Fonts

1. Entra en [fonts.google.com](https://fonts.google.com), elige una fuente y pulsa **Get font → Get embed code**.
2. Copia el `<link>` en tu `<head>` (antes de tu CSS):

```html
<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/estilos.css">
```

3. Úsala en el CSS:

```css
body {
    font-family: "Poppins", sans-serif;
}
```

---

## 8. Fondos

```css
body {
    background-color: #f4f4f4;
}

.banner {
    background-image: url("../img/fondo.jpg");   /* ruta desde el fichero CSS */
    background-repeat: no-repeat;     /* repeat | repeat-x | repeat-y | no-repeat */
    background-position: center;      /* top left | center | 30% 70%... */
    background-size: cover;           /* cover: rellena toda la caja */
    height: 300px;
}
```

> ⚠️ **Error típico:** la ruta de `url()` se cuenta **desde el fichero CSS**, no desde el HTML. Si el CSS está en `css/` y la imagen en `img/`, hay que subir una carpeta: `url("../img/fondo.jpg")`.

```
 web/
 ├── index.html
 ├── css/estilos.css   ← el url() se escribe desde AQUÍ
 └── img/fondo.jpg          → ../img/fondo.jpg
```

Ejemplo del libro, dos cajas con fondo distinto:

```css
.casoA {
    background-color: teal;
    color: white;
}

.casoB {
    background-color: rgb(153, 102, 153);
    color: rgb(255, 255, 204);
}
```

---

## 9. El modelo de caja

**Todo elemento HTML es una caja rectangular**, formada por cuatro capas:

```
 ┌──────────────────── margin (fuera, transparente) ─────────────────┐
 │   ┌──────────────── border (el borde) ──────────────────────┐     │
 │   │   ┌──────────── padding (relleno interior) ──────────┐  │     │
 │   │   │                                                  │  │     │
 │   │   │        content: texto, imagen... (width/height)  │  │     │
 │   │   │                                                  │  │     │
 │   │   └──────────────────────────────────────────────────┘  │     │
 │   └─────────────────────────────────────────────────────────┘     │
 └───────────────────────────────────────────────────────────────────┘
```

```css
.estiloCaja {
    width: 400px;               /* ancho del contenido */
    padding: 20px;              /* espacio entre el borde y el contenido */
    border: 2px outset blue;    /* grosor, estilo, color */
    margin: 30px auto;          /* 30px arriba/abajo, auto a los lados = CENTRADA */
    border-radius: 10px;        /* esquinas redondeadas */
    box-shadow: 3px 3px 8px gray; /* sombra */
}
```

### Estilos de borde

```css
border: 2px solid black;    /* línea continua */
border: 2px dashed black;   /* guiones */
border: 2px dotted black;   /* puntos */
border: 4px double black;   /* doble línea */
border: 4px outset blue;    /* efecto relieve (el de clase) */
```

### Un valor, dos, o cuatro

```css
padding: 10px;                 /* los 4 lados */
padding: 10px 20px;            /* arriba-abajo | izquierda-derecha */
padding: 10px 20px 5px 0;      /* arriba | derecha | abajo | izquierda (como las agujas del reloj) */
padding-top: 10px;             /* solo uno */
```

> 💡 **Truco:** pon esta regla al principio de tu CSS. Hace que `width` incluya padding y borde, y los cálculos son mucho más fáciles:
>
> ```css
> * { box-sizing: border-box; }
> ```

> 🔍 **Pruébalo:** pulsa **F12**, selecciona cualquier elemento y baja en el panel **Estilos/Computed**: verás el dibujo de su caja con los valores de margin, border y padding.

---

## 10. Recetas prácticas: menú, tabla y formulario

### Menú horizontal con enlaces tipo botón

```html
<nav class="menu">
    <a href="index.html">Inicio</a>
    <a href="contacto.html">Contacto</a>
    <a href="formulario.html">Formulario</a>
</nav>
```

```css
.menu {
    background-color: #12294a;
    padding: 10px;
    text-align: center;
}

.menu a {
    display: inline-block;        /* permite darle padding como a una caja */
    color: white;
    text-decoration: none;
    padding: 8px 16px;
    border-radius: 5px;
}

.menu a:hover {
    background-color: #00a99d;
}
```

### Tabla bonita (sin los atributos antiguos)

```css
table {
    width: 80%;
    margin: 20px auto;               /* centrada (sustituye a align="center") */
    border-collapse: collapse;       /* une los bordes dobles en uno */
}

th, td {
    border: 1px solid #ccc;          /* sustituye a border="1" */
    padding: 8px 12px;
    text-align: left;
}

th {
    background-color: #12294a;
    color: white;
}

tr:nth-child(even) {                 /* filas pares de otro color ("cebra") */
    background-color: #f2f2f2;
}

tr:hover {
    background-color: #d9f2ef;
}
```

```
 Sin border-collapse          Con border-collapse
 ╔═══╗╔═══╗                    ┌───┬───┐
 ║ A ║║ B ║                    │ A │ B │
 ╚═══╝╚═══╝                    └───┴───┘
```

### Formulario ordenado

```css
form {
    max-width: 500px;
    margin: 20px auto;
}

fieldset {
    border: 2px solid #00a99d;
    border-radius: 8px;
    margin-bottom: 15px;
}

legend {
    font-weight: bold;
    color: #12294a;
}

label {
    display: block;                  /* cada label en su propia línea */
    margin-top: 10px;
}

input[type="text"], input[type="email"], select, textarea {
    width: 100%;
    padding: 8px;
    border: 1px solid #aaa;
    border-radius: 4px;
}

input:focus, textarea:focus {
    border-color: #00a99d;
    outline: none;
}

button {
    background-color: #00a99d;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;                 /* manita al pasar el ratón */
}

button:hover {
    background-color: #008a80;
}
```

`input[type="text"]` es un **selector de atributo**: solo afecta a los `input` cuyo `type` es `text`.

Todas estas recetas están aplicadas en [`ejemplos/`](ejemplos/).

---

## 11. Herramientas de trabajo

| Herramienta | Para qué |
|-------------|----------|
| **Visual Studio Code** | Editor gratuito con colores, autocompletado y extensiones. El que usamos en clase |
| **Live Server** (extensión de VS Code) | Abre la página y la **recarga sola** cada vez que guardas |
| **Herramientas de desarrollador (F12)** | Inspeccionar cualquier web, ver qué CSS se aplica y **probar cambios en vivo** |
| **Notepad++** | Editor ligero para Windows, reconoce HTML y CSS |
| **NetBeans** | Entorno de desarrollo completo, más pensado para Java y proyectos grandes |

### Cómo usar F12 para depurar CSS

1. Botón derecho sobre el elemento → **Inspeccionar**.
2. En el panel **Estilos** verás todas las reglas que le afectan. Las que **han perdido** en la cascada aparecen **tachadas**.
3. Puedes cambiar valores ahí mismo y ver el resultado al momento (no se guarda: cuando te guste, cópialo a tu `.css`).

```
 Styles
 ─────────────────────────────
 .estiloParrafo {           style.css:6
     color: blueviolet;
 }
 p {                        style.css:1
     color: red;        ← tachado: ha perdido contra la clase
     font-size: 30px;
 }
```

---

## 12. Resumen final

| Quiero... | Propiedad |
|-----------|-----------|
| Color del texto / del fondo | `color` / `background-color` |
| Alinear texto | `text-align: center` |
| Interlineado | `line-height: 1.5` |
| Quitar subrayado | `text-decoration: none` |
| Mayúsculas | `text-transform: uppercase` |
| Tipo de letra | `font-family: Arial, sans-serif` |
| Tamaño de letra | `font-size: 18px` |
| Negrita / cursiva | `font-weight: bold` / `font-style: italic` |
| Imagen de fondo | `background-image: url("...")` |
| Borde | `border: 1px solid black` |
| Esquinas redondeadas | `border-radius: 8px` |
| Espacio interior / exterior | `padding` / `margin` |
| Centrar una caja | `margin: 0 auto` + `width` |
| Sombra | `box-shadow: 2px 2px 5px gray` |
| Manita al pasar el ratón | `cursor: pointer` |
| Estilo al pasar el ratón | selector`:hover` |

**Para consultar:** [MDN — CSS básico](https://developer.mozilla.org/es/docs/Learn/Getting_started_with_the_web/CSS_basics) · [CSS Cheat Sheet](https://htmlcheatsheet.com/css/)
