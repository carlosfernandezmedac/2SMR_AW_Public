# Tema 5 — Aplicaciones web 2.0

> **Idea clave:** en la **web 1.0** el usuario solo **leía**. En la **web 2.0** el usuario también **publica**: escribe en blogs, edita wikis, sube vídeos, comenta y comparte. La web pasa de ser un periódico a ser una conversación.

## Índice

1. [De la web 1.0 a la web 2.0](#1-de-la-web-10-a-la-web-20)
2. [RSS: enterarte de lo nuevo sin entrar en cada web](#2-rss-enterarte-de-lo-nuevo-sin-entrar-en-cada-web)
3. [Marcadores sociales y redes sociales](#3-marcadores-sociales-y-redes-sociales)
4. [Blogs](#4-blogs)
5. [Wikis](#5-wikis)
6. [Podcasts](#6-podcasts)
7. [Herramientas multimedia online](#7-herramientas-multimedia-online)
8. [Resumen final](#resumen-final)

---

## 1. De la web 1.0 a la web 2.0

```
 WEB 1.0 (años 90)                      WEB 2.0 (desde 2004 aprox.)
 ┌──────────────────────┐               ┌──────────────────────────────┐
 │  Unos pocos publican │               │  Todos publican y participan │
 │         │            │               │       ▲   │   ▲   │          │
 │         ▼            │               │       │   ▼   │   ▼          │
 │  Todos los demás leen│               │   comentan, comparten, editan│
 └──────────────────────┘               └──────────────────────────────┘
   Información                             Información + INTERACCIÓN
```

La **web 2.0**, también llamada **web social**, es la web en la que el usuario **no solo recibe** información, sino que **participa**: crea contenido, opina y lo comparte. El término se hizo popular hacia **2004**.

| | Web 1.0 | Web 2.0 |
|--|---------|---------|
| El usuario | Lee | Lee, **escribe, comenta, comparte** |
| Quién crea el contenido | El dueño de la web | **Los propios usuarios** |
| Actualización | De vez en cuando | **Constante** |
| Ejemplos | La web de una empresa con su información fija | Wikipedia, YouTube, Instagram, un blog con comentarios |

**Características de las aplicaciones web 2.0:**

- Se actualizan **continuamente** gracias a lo que publican los usuarios.
- Son **abiertas y participativas**: cualquiera puede aportar.
- Tienen herramientas para **compartir** e **interactuar** (comentarios, "me gusta", compartir...).
- La navegación es **sencilla e intuitiva**.
- Usan mucho **contenido multimedia**: imágenes, vídeos, audio.

> ℹ️ Se habla también de **web 3.0** (más "inteligente", que entiende lo que buscas), de webs descentralizadas con *blockchain*, etc. No hay acuerdo sobre qué es cada versión: lo importante es entender el gran cambio de la web 2.0, de **leer** a **participar**.

---

## 2. RSS: enterarte de lo nuevo sin entrar en cada web

Imagina que sigues 10 blogs y 3 periódicos. Para saber si hay algo nuevo tendrías que entrar en las 13 webs cada día. Con **RSS**, las novedades **vienen a ti**.

```
 Blog de tecnología ──┐
 Periódico ───────────┼──► fichero RSS (XML) ──► AGREGADOR ──► tú lees todo junto
 Podcast ─────────────┘    (se actualiza solo)   (Feedly,
                                                  Inoreader...)
```

| Término | Qué es |
|---------|--------|
| **RSS** | Un **fichero XML** que publica una web con sus últimas novedades (*Really Simple Syndication*) |
| **Feed** o **canal** | Ese fichero RSS de una web concreta |
| **Agregador** | El programa o la web que **lee varios feeds** y te enseña las novedades juntas |
| **Sindicación** | Ofrecer tu contenido para que otros lo reciban por RSS |

Cuando la web publica algo nuevo, se añade al fichero RSS. El agregador lo revisa cada cierto tiempo y te avisa.

### Cómo es un fichero RSS por dentro

Es **XML**, con etiquetas parecidas a las de HTML:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0">
    <channel>
        <title>Blog del Club de Informática</title>
        <link>https://www.ejemplo.es/blog</link>
        <description>Noticias del club de 2º SMR</description>

        <item>
            <title>Taller de montaje de PC</title>
            <link>https://www.ejemplo.es/blog/taller-montaje</link>
            <description>El 5 de noviembre montamos un PC desde cero.</description>
            <pubDate>Wed, 05 Nov 2026 16:00:00 +0100</pubDate>
        </item>

        <item>
            <title>Torneo en red local</title>
            <link>https://www.ejemplo.es/blog/torneo</link>
            <description>Inscripciones abiertas para el torneo de diciembre.</description>
            <pubDate>Mon, 10 Nov 2026 10:00:00 +0100</pubDate>
        </item>
    </channel>
</rss>
```

| Etiqueta | Qué indica |
|----------|-----------|
| `<rss>` | La raíz: "esto es un fichero RSS" |
| `<channel>` | El canal: los datos de la web (título, enlace, descripción) |
| `<item>` | **Cada novedad** (una entrada, una noticia, un episodio) |
| `<title>`, `<link>`, `<description>`, `<pubDate>` | Título, enlace, resumen y fecha de cada novedad |

---

## 3. Marcadores sociales y redes sociales

Un **marcador social** sirve para **guardar enlaces en Internet** (en vez de en los favoritos del navegador), organizarlos con **etiquetas** y **compartirlos** con otras personas. Ejemplos: Pinterest (enlaces con imágenes), Pocket o Raindrop.io.

El término se usa también para las **redes sociales**, que son aplicaciones para compartir contenido e interactuar:

| Red social | Para qué se usa sobre todo |
|------------|---------------------------|
| **X (antes Twitter)** | Mensajes cortos (*microblogging*). Los temas se marcan con *hashtags*: `#SMR` |
| **LinkedIn** | Red **profesional**: currículum, empresas, ofertas de empleo |
| **YouTube** | **Vídeos**, canales, listas de reproducción y comentarios |
| **Instagram / TikTok** | Fotos y vídeos cortos |

> 💡 Una empresa elige la red según lo que quiera hacer: enseñar a usar un producto → **YouTube**; ofrecer empleo → **LinkedIn**; avisos y ofertas rápidas → **X** o **Instagram**.

---

## 4. Blogs

Un **blog** es una web donde se publican **entradas** (artículos) de forma periódica, que aparecen **ordenadas por fecha** (la más reciente arriba) y en las que los lectores pueden **comentar**.

```
 ┌─────────────────────────────────────────────┐
 │  Blog del Club de Informática               │
 ├─────────────────────────────────────────────┤
 │  📝 10 nov — Torneo en red local     ← la más nueva
 │     Inscripciones abiertas...  [3 comentarios]
 │  📝 5 nov  — Taller de montaje de PC
 │     El 5 de noviembre montamos... [1 comentario]
 │  📝 28 oct — Bienvenidos al club     ← la más antigua
 └─────────────────────────────────────────────┘
```

**Tipos de blogs:**

| Tipo | Ejemplo |
|------|---------|
| **Corporativo** | El blog de una empresa con sus novedades |
| **Personal** | Alguien que escribe sobre sus aficiones o su día a día |
| **Comercial** | Centrado en dar a conocer un producto o servicio para vender |
| **Temático** | Varios autores que escriben sobre un tema (tecnología, cocina, viajes...) |

**Herramientas para crear un blog:**

| Herramienta | Cómo funciona |
|-------------|---------------|
| **Blogger** (de Google) | Gratis, muy sencilla. El blog se aloja en los servidores de Google |
| **WordPress.com** | Versión de WordPress **ya alojada**: te registras y empiezas a escribir. Gratis con límites; más funciones pagando |
| **WordPress.org** | El **programa WordPress**, gratuito, para instalarlo **en tu propio servidor**. Es lo que haremos en el [Tema 8](../tema08/apuntes.md) |

> ⚠️ **WordPress.com ≠ WordPress.org.** Usan el mismo programa, pero en **.com** te lo dan instalado en sus servidores, y en **.org** te lo descargas y lo instalas tú (en XAMPP, en un hosting...). Con el de **.org** tienes control total.

---

## 5. Wikis

Una **wiki** es una web cuyo contenido pueden **crear y editar los propios usuarios** desde el navegador. Cada página guarda un **historial** de cambios, así que se puede ver quién cambió qué y deshacer errores.

| Wiki | Qué es |
|------|--------|
| **Wikipedia** | Enciclopedia libre que cualquiera puede editar |
| **Wikimedia Commons** | Banco de imágenes, sonidos y vídeos libres que usa Wikipedia |
| **Wikisource** | Biblioteca de textos libres |
| Wikis de empresas o de videojuegos | Documentación interna, guías... |

> 🔍 **Pruébalo sin estropear nada:** Wikipedia tiene una página para practicar, la [Zona de pruebas](https://es.wikipedia.org/wiki/Wikipedia:Zona_de_pruebas). Pulsa **Editar**, escribe algo y mira el resultado. Después mira la pestaña **Ver historial** de cualquier artículo.

---

## 6. Podcasts

Un **podcast** es un programa de **audio** (a veces también vídeo) que se publica por episodios en Internet. Puedes escucharlo cuando quieras, descargarlo o **suscribirte**, y te avisa cuando sale un episodio nuevo.

¿Cómo se entera tu aplicación de que hay un episodio nuevo? Con **RSS**: cada podcast tiene su feed, y cada episodio es un `<item>` con el enlace al fichero de audio.

| Plataformas para escuchar o publicar | |
|--------------------------------------|--|
| Spotify, Apple Podcasts, iVoox, YouTube, SoundCloud, Spreaker | |

> ℹ️ El podcast nació hacia **2004**. El nombre viene de **iPod** + **broadcast** (emisión).

---

## 7. Herramientas multimedia online

Son aplicaciones web que sirven para **crear o mejorar** contenido sin instalar nada:

| Para qué | Ejemplos |
|----------|----------|
| Presentaciones | Canva, Prezi, Google Presentaciones |
| Guardar y compartir archivos | Google Drive, OneDrive, Dropbox, Mega |
| Imágenes libres de derechos | Pixabay, Unsplash, Pexels |
| Tipografías | Google Fonts (la usamos en el Tema 3) |
| Colores | Coolors, ColorZilla (extensión para saber el color de cualquier web) |
| Edición de vídeo | Canva, CapCut, Clipchamp |

---

## Resumen final

| Concepto | En una frase |
|----------|--------------|
| Web 2.0 | La web en la que los usuarios **participan**: publican, comentan, comparten |
| RSS | Fichero **XML** con las novedades de una web |
| Agregador | Programa que lee varios RSS y te enseña las novedades juntas |
| Marcador social | Guardar y compartir enlaces en Internet, con etiquetas |
| Red social | Aplicación para compartir contenido e interactuar (X, LinkedIn, YouTube...) |
| Blog | Web con **entradas ordenadas por fecha** y comentarios |
| Wiki | Web que **editan los usuarios**, con historial de cambios |
| Podcast | Programa de **audio por episodios**, al que te suscribes por RSS |
| WordPress.com / .org | El mismo programa: **.com** ya alojado, **.org** lo instalas tú |

**Para consultar:** [Wikipedia — Web 2.0](https://es.wikipedia.org/wiki/Web_2.0) · [Wikipedia — RSS](https://es.wikipedia.org/wiki/RSS) · [Zona de pruebas de Wikipedia](https://es.wikipedia.org/wiki/Wikipedia:Zona_de_pruebas)
