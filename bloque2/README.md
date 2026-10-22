# Bloque 2 — Programar en cliente y servidor

En el Bloque 1 hicimos páginas que **siempre se ven igual**. En este bloque les damos vida. Primero instalamos el **servidor** donde se ejecuta PHP; después programamos con **JavaScript**, que se ejecuta en tu navegador, y con **PHP**, que se ejecuta en el servidor y puede leer datos de una **base de datos**.

| Orden | Tema | Título | Qué harás |
|-------|------|--------|-----------|
| 1º | [Tema 6](tema06/apuntes.md) | Instalación de servidores de aplicaciones web | Instalar XAMPP y crear una base de datos de prueba con phpMyAdmin |
| 2º | [Tema 4](tema04/apuntes.md) | Lenguajes de script cliente y servidor | Programar con JavaScript, con PHP y con PHP + base de datos |

> 📌 Damos **primero el Tema 6** porque PHP no se puede probar sin un servidor. Así, cuando lleguemos a PHP, ya tendremos XAMPP funcionando y la base de datos creada.

---

## Orden en el que lo vamos a ver

| Paso | Qué vemos | Dónde está |
|------|-----------|------------|
| 1 | **Instalar XAMPP** y arrancar Apache y MySQL | [Tema 6 · Parte A](tema06/apuntes.md#parte-a-instalar-y-arrancar-xampp) |
| 2 | **Crear una base de datos** de prueba en phpMyAdmin | [Tema 6 · Parte B](tema06/apuntes.md#parte-b-crear-una-base-de-datos-con-phpmyadmin) |
| 3 | **JavaScript**: el DOM, cambiar textos, botones, jQuery | [Tema 4 · Parte A](tema04/apuntes.md#parte-a-javascript-en-el-navegador) |
| 4 | **PHP**: echo, variables, funciones, formularios | [Tema 4 · Parte B](tema04/apuntes.md#parte-b-php-en-el-servidor) |
| 5 | **PHP + base de datos**: mostrar los datos en una página | [Tema 4 · Parte C](tema04/apuntes.md#parte-c-php-y-bases-de-datos) |

> ℹ️ JavaScript (paso 3) **no necesita XAMPP**

---

## Hilo conductor del bloque

```
   TU ORDENADOR (cliente)                          EL SERVIDOR (XAMPP)
 ┌───────────────────────┐                    ┌─────────────────────────────┐
 │ Navegador             │                    │ Apache  ← recibe la petición│
 │                       │  1. pide la página │    │                        │
 │  HTML + CSS           │ ─────────────────► │    ▼                        │
 │  + JavaScript ◄──┐    │                    │ PHP     ← ejecuta el código │
 │    (Parte A)     │    │                    │    │      (Parte B)         │
 │                  │    │  2. recibe HTML    │    ▼                        │
 │  el JS se ejecuta│    │ ◄───────────────── │ MySQL   ← guarda los datos  │
 │  AQUÍ, después   ┘    │                    │          (Tema 6)           │
 └───────────────────────┘                    └─────────────────────────────┘
```

- **JavaScript** llega al navegador junto con el HTML y se ejecuta **en tu ordenador**.
- **PHP** se ejecuta **en el servidor**. Al navegador solo le llega el resultado: HTML normal.
- **MySQL** guarda los datos (usuarios, libros, productos...). PHP los consulta y los convierte en HTML.

Al terminar el bloque tendrás **XAMPP instalado**, que es justo lo que necesita **WordPress** en el Bloque 3.


