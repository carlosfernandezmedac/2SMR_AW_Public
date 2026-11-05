# Tema 6 — Instalación de servidores de aplicaciones web

> **Idea clave:** para que PHP funcione hace falta un **servidor web** (Apache), y para guardar datos, un **gestor de bases de datos** (MySQL). **XAMPP** instala las dos cosas, más PHP, de una sola vez en tu propio ordenador.

> 📌 **Este tema va antes que el Tema 4.** Aquí dejamos preparado el servidor y una base de datos de prueba; en el [Tema 4](../tema04/apuntes.md) programaremos con PHP sobre ellos.

## Índice

**Parte A: Instalar y arrancar XAMPP**
1. [Qué es un servidor de aplicaciones web](#1-qué-es-un-servidor-de-aplicaciones-web)
2. [La tecnología AMP y XAMPP](#2-la-tecnología-amp-y-xampp)
3. [Instalar XAMPP](#3-instalar-xampp)
4. [Arrancar Apache y MySQL](#4-arrancar-apache-y-mysql) · [¿Y si ya tengo MySQL instalado?](#y-si-ya-tengo-mysql-instalado)
5. [Tu primera página PHP en XAMPP](#5-tu-primera-página-php-en-xampp)

**Parte B: Crear una base de datos con phpMyAdmin**
6. [Entrar en phpMyAdmin](#6-entrar-en-phpmyadmin)
7. [Crear una base de datos](#7-crear-una-base-de-datos)
8. [Crear una tabla](#8-crear-una-tabla)
9. [Meter datos en la tabla](#9-meter-datos-en-la-tabla) · [¿Dónde se guardan los datos?](#dónde-se-guardan-los-datos)
10. [Atajo: importar un fichero .sql](#10-atajo-importar-un-fichero-sql)
11. [Leer una tabla de MySQL con PHP](#11-leer-una-tabla-de-mysql-con-php)

[Resumen final](#resumen-final)

---

## Parte A: Instalar y arrancar XAMPP

### 1. Qué es un servidor de aplicaciones web

Es lo que vimos en el Tema 1 con las páginas dinámicas, pero ahora lo vamos a tener **en nuestro propio ordenador**:

```
 Navegador ──petición──►  APACHE  (servidor web)
                            │  ¿es un .php?
                            ▼
                           PHP    (servidor de aplicaciones: ejecuta el código)
                            │  ¿necesita datos?
                            ▼
                          MySQL   (base de datos)
                            │
 Navegador ◄──HTML──────────┘  Apache devuelve la página terminada
```

1. El navegador pide una página a **Apache**.
2. Si es un `.php`, Apache se la pasa a **PHP**, que ejecuta el código.
3. Si el código necesita datos, PHP se los pide a **MySQL**.
4. PHP genera el HTML y Apache se lo envía al navegador.

---

### 2. La tecnología AMP y XAMPP

**AMP** son las iniciales de las tres piezas, todas de código libre:

| Letra | Pieza | Qué hace |
|-------|-------|----------|
| **A** | **Apache** | Servidor web: recibe las peticiones y entrega las páginas |
| **M** | **MySQL** (en XAMPP, MariaDB, que es casi igual) | Gestor de bases de datos: guarda la información |
| **P** | **PHP** (también Perl o Python) | Lenguaje que se ejecuta en el servidor |

Instalar las tres por separado es lento. Por eso existen **paquetes** que lo traen todo junto:

| Paquete | Sistemas operativos | Nota |
|---------|---------------------|------|
| **XAMPP** | Windows, Linux y macOS | El que usaremos. La **X** significa "cualquier sistema" |
| **WampServer** | Solo Windows | La **W** es de Windows |
| **MAMP** | macOS (y Windows) | La **M** es de Mac |

```
  X  A  M  P  P
  │  │  │  │  └─ Perl
  │  │  │  └──── PHP
  │  │  └─────── MySQL / MariaDB
  │  └────────── Apache
  └───────────── cualquier sistema operativo (multiplataforma)
```

---

### 3. Instalar XAMPP

1. Descarga XAMPP desde [apachefriends.org/es](https://www.apachefriends.org/es/index.html), eligiendo tu sistema operativo.
2. Ejecuta el instalador **como administrador**.
3. Si aparece un aviso sobre el **Control de cuentas de usuario (UAC)**, pulsa Aceptar: solo dice que no lo instales dentro de `C:\Archivos de programa`.
4. En la pantalla de componentes, deja todo marcado y pulsa **Next**.
5. Carpeta de instalación: deja **`C:\xampp`**.
6. Avanza con **Next** hasta el final y pulsa **Finish**.

> ⚠️ Si al instalar el **Firewall de Windows** pregunta si permite el acceso a Apache, pulsa **Permitir**.

---

### 4. Arrancar Apache y MySQL

Al instalar, **todo está apagado**. Abre el **XAMPP Control Panel** (en el menú Inicio o en `C:\xampp\xampp-control.exe`):

```
 ┌─ XAMPP Control Panel ──────────────────────────────────────┐
 │ Module    PID     Port(s)     Actions                      │
 │ Apache    1234    80, 443     [ Stop ]  [Admin] [Config]   │  ← verde = encendido
 │ MySQL     5678    3306        [ Stop ]  [Admin] [Config]   │
 │ FileZilla                     [ Start ] ...                │
 │ Mercury                       [ Start ] ...                │
 │ Tomcat                        [ Start ] ...                │
 └────────────────────────────────────────────────────────────┘
```

1. Pulsa **Start** en **Apache**. El nombre se pone en **verde** y aparecen los puertos **80** y **443**.
2. Pulsa **Start** en **MySQL**. Se pone en **verde** con el puerto **3306**.

Comprueba que funciona: abre el navegador y escribe **`http://localhost`**. Debe salir la página de bienvenida de XAMPP.

| Si en el navegador ves... | Significa |
|---------------------------|-----------|
| La página de bienvenida de XAMPP | ✅ Apache funciona |
| *"No se puede acceder a este sitio"* | ❌ Apache está apagado |

> ⚠️ **Si Apache no arranca** (se pone en rojo), casi siempre es porque **otro programa ya usa el puerto 80**: Skype, IIS de Windows u otro servidor. Cierra ese programa o pregunta al profesor.

> ℹ️ En el libro las capturas son del XAMPP de **macOS**, que tiene otro aspecto: allí los botones se llaman *Manage Servers* y *Start All*. Hacen lo mismo.

#### ¿Y si ya tengo MySQL instalado?

Muchos tenéis instalado **MySQL** del módulo de Bases de Datos (con MySQL Workbench). Ese MySQL es un servicio de Windows que **se enciende solo** al arrancar el ordenador y ocupa el puerto **3306**. XAMPP trae **su propio** MySQL, que quiere usar **el mismo puerto**. Dos programas no pueden usar el mismo puerto a la vez, así que el MySQL de XAMPP **no arranca**:

```
 [mysql]  Problem detected!
 [mysql]  Port 3306 in use by "mysqld.exe"!
 [mysql]  MySQL WILL NOT start without the configured ports free!
```

**Solución recomendada:** apagar el otro MySQL mientras trabajas con XAMPP.

1. Pulsa **Windows + R**, escribe `services.msc` y pulsa Enter.
2. Busca el servicio **MySQL80** (o parecido).
3. Botón derecho → **Detener**.
4. Si quieres que no vuelva a encenderse solo: botón derecho → **Propiedades** → *Tipo de inicio*: **Manual**.
5. Vuelve al panel de XAMPP y pulsa **Start** en MySQL.

Cuando necesites el MySQL de Bases de Datos, haz lo contrario: **Stop** en XAMPP e **Iniciar** el servicio MySQL80.

> 💡 Hay otra opción: cambiar el puerto del MySQL de XAMPP (por ejemplo, al **3307**) en **Config → my.ini**. Funciona, pero luego hay que indicar ese puerto en phpMyAdmin y en cada conexión desde PHP. Para clase es más sencillo apagar uno de los dos.

---

### 5. Tu primera página PHP en XAMPP

Todo lo que quieras ver por `http://localhost` tiene que estar dentro de la carpeta **`htdocs`**:

```
C:\xampp\htdocs\                        →  http://localhost/
C:\xampp\htdocs\tema04\                 →  http://localhost/tema04/
C:\xampp\htdocs\tema04\prueba.php       →  http://localhost/tema04/prueba.php
```

Pasos:

1. Dentro de `C:\xampp\htdocs\` crea una carpeta para el proyecto, por ejemplo `tema04`. No es obligatorio, pero así queda ordenado.
2. Abre esa carpeta en **VS Code** y crea `prueba.php`:

```php
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>¿Funciona PHP?</title>
</head>
<body>
    <h1>Prueba de XAMPP</h1>
    <?php
        echo "<p>Si lees esto, Apache y PHP funcionan.</p>";
        echo "<p>Versión de PHP: " . phpversion() . "</p>";
    ?>
</body>
</html>
```

3. Guárdalo con extensión **`.php`**.
4. En el navegador: **`http://localhost/tema04/prueba.php`**

> ⚠️ **No** se abre con Live Server ni con doble clic: siempre por `http://localhost/...`

En el **[Tema 4, Parte B](../tema04/apuntes.md#parte-b-php-en-el-servidor)** aprenderás a escribir PHP de verdad.

> ℹ️ **php.ini** es el fichero de configuración de PHP (en `C:\xampp\php\php.ini`). Desde ahí se cambian cosas como el tamaño máximo de los ficheros que se pueden subir. Lo tocaremos cuando instalemos WordPress.

---

## Parte B: Crear una base de datos con phpMyAdmin

> ⚠️ Para esta parte, **Apache y MySQL** deben estar encendidos (en verde).

### 6. Entrar en phpMyAdmin

**phpMyAdmin** es una página web, incluida en XAMPP, para manejar las bases de datos **sin escribir SQL**.

Entra escribiendo en el navegador: **`http://localhost/phpmyadmin`**

O desde el panel de XAMPP: botón **Admin** de la fila de MySQL.

```
 ┌──────────────┬──────────────────────────────────────────────────┐
 │ phpMyAdmin   │ [Bases de datos] [SQL] [Estado] [Importar] ...   │
 │              │                                                  │
 │ + Nueva      │                                                  │
 │ ▸ biblioteca │      ← aquí aparecerán tus bases de datos        │
 │ ▸ mysql      │                                                  │
 │ ▸ test       │                                                  │
 └──────────────┴──────────────────────────────────────────────────┘
   menú lateral                    zona de trabajo
```

---

### 7. Crear una base de datos

Una **base de datos** es como un **armario**; dentro tendrá **tablas**, que son como cajones.

1. Pestaña **Bases de datos**.
2. En *Nombre de la base de datos* escribe **`biblioteca`**.
3. En el desplegable de al lado elige **`utf8mb4_general_ci`** (para que se guarden bien las tildes y la ñ).
4. Pulsa **Crear**.
5. La base de datos aparece en el **menú de la izquierda**.

> ℹ️ El libro dice `utf8_general_ci`. También funciona, pero `utf8mb4` es la versión actual y admite además emojis.

---

### 8. Crear una tabla

Una **tabla** tiene **columnas** (los datos que guardamos) y **filas** (cada registro). Es igual que una tabla de HTML:

```
                 columnas
          ┌────┬────────┬───────────────┬──────────┐
          │ id │ nombre │ apellidos     │ dni      │
          ├────┼────────┼───────────────┼──────────┤
 filas →  │ 1  │ Ana    │ López Martín  │12345678A │
          │ 2  │ Luis   │ García Ruiz   │87654321B │
          └────┴────────┴───────────────┴──────────┘
```

**Ejemplo: tabla `usuarios` de la biblioteca**

1. En el menú izquierdo, haz clic en **biblioteca**.
2. En *Crear tabla*: nombre **`usuarios`** y número de columnas **5**.
3. Pulsa **Crear** y rellena cada columna:

| Nombre | Tipo | Longitud | Otros |
|--------|------|----------|-------|
| `id` | INT | — | Índice: **PRIMARY**, marca **A_I** |
| `nombre` | VARCHAR | 50 | |
| `apellidos` | VARCHAR | 70 | |
| `dni` | VARCHAR | 9 | |
| `libros_leidos` | INT | — | |

4. Pulsa **Guardar**.

**Los tipos que vamos a usar:**

| Tipo | Para qué | Ejemplo |
|------|----------|---------|
| `INT` | Números enteros | `7`, `2026` |
| `VARCHAR(n)` | Texto de hasta *n* caracteres | `'Ana'` |
| `DATE` | Fechas (año-mes-día) | `2026-10-22` |

**La columna `id`:**

- **PRIMARY** (clave primaria): identifica **cada fila** sin repetirse, como el DNI de una persona.
- **A_I** (*auto increment*): MySQL le pone el número **solo** (1, 2, 3...). Tú no tienes que escribirlo.

> 💡 ¿Por qué 5 columnas? El libro pide guardar nombre, apellidos, DNI y libros leídos (4 datos), más la columna `id` para identificar cada fila.

---

### 9. Meter datos en la tabla

1. En el menú izquierdo, haz clic en la tabla **usuarios**.
2. Pestaña **Insertar**.
3. Rellena los campos. **Deja `id` vacío**: se rellena solo.
4. Pulsa **Continuar**.
5. Pestaña **Examinar**: verás la fila nueva.

```
 [Examinar] [Estructura] [SQL] [Buscar] [Insertar] ...
     │           │                          │
     │           │                          └─ añadir filas
     │           └─ ver o cambiar las columnas
     └─ ver los datos que hay
```

> ℹ️ En el libro se llega a *Insertar* desde *Más → Diseñador*. Es un camino más largo: basta con seleccionar la tabla y pulsar **Insertar**.

#### ¿Dónde se guardan los datos?

**PHP no guarda datos.** PHP solo **pide** los datos a MySQL y los convierte en HTML. Quien los guarda es **MySQL**, en una carpeta de tu disco duro:

```
 phpMyAdmin ──┐
              ├──►  MySQL  ──►  C:\xampp\mysql\data\biblioteca\
 PHP (.php) ──┘                 (una carpeta por cada base de datos)
```

| MySQL | Carpeta donde guarda las bases de datos |
|-------|------------------------------------------|
| El de **XAMPP** | `C:\xampp\mysql\data\` |
| El instalado aparte (MySQL 8 de **Bases de Datos**) | `C:\ProgramData\MySQL\MySQL Server 8.0\Data\` |

**Son dos almacenes distintos.** Una base de datos creada en el phpMyAdmin de XAMPP **no aparece** en MySQL Workbench conectado al MySQL de Bases de Datos, y al revés. Para pasar una base de datos de uno a otro se **exporta** a `.sql` y se **importa** en el otro (punto 10).

> ⚠️ **No borres ni copies a mano** los ficheros de la carpeta `data`. Para copiar o guardar una base de datos, usa siempre **Exportar** e **Importar** en phpMyAdmin.

---

### 10. Atajo: importar un fichero .sql

En lugar de crear todo a mano, se puede **importar** un fichero `.sql` que ya trae la base de datos, las tablas y los datos.

1. Descarga [`ejemplos/biblioteca.sql`](ejemplos/biblioteca.sql).
2. En phpMyAdmin, pestaña **Importar** (sin ninguna base de datos seleccionada).
3. **Seleccionar archivo** → `biblioteca.sql` → **Importar** (abajo del todo).
4. Aparece la base de datos `biblioteca` con las tablas `usuarios` y `libros`, ya con datos.

> ⚠️ Si ya creaste a mano una base de datos `biblioteca` con la tabla `usuarios`, la importación dará error porque la tabla ya existe. Borra antes tu base de datos (pestaña **Operaciones → Eliminar la base de datos**) o importa en otro equipo.

Así es como se **mueven bases de datos** de un ordenador a otro: se **exporta** a `.sql` (pestaña **Exportar**) y se **importa** en el otro. Lo usaremos para las copias de seguridad de WordPress.

Esta base de datos es la que usaremos en el **[Tema 4, Parte C](../tema04/apuntes.md#parte-c-php-y-bases-de-datos)** para mostrar los libros en una página PHP.

---

### 11. Leer una tabla de MySQL con PHP

> ⚠️ Para esta parte necesitas la base de datos `biblioteca` creada en el [Tema 6](../tema06/apuntes.md#parte-b-crear-una-base-de-datos-con-phpmyadmin) y **MySQL encendido** en XAMPP.

Una **página dinámica** muestra datos que están guardados en una **base de datos**. Si mañana se añade un libro en la base de datos, la página lo muestra sin tocar el código.

Siempre son **4 pasos**:

```
 1. Conectar      →  mysqli_connect(servidor, usuario, contraseña, base_de_datos)
 2. Consultar     →  mysqli_query(conexión, "SELECT ...")
 3. Recorrer      →  while ($fila = mysqli_fetch_assoc($resultado)) { ... }
 4. Cerrar        →  mysqli_free_result(...)  y  mysqli_close(...)
```

**Ejemplo: mostrar los libros de la biblioteca** ([`libros.php`](ejemplos/php/libros.php))

```php
    <?php
        // 1. Datos de conexión
    $servidor = "localhost";
    $usuario = "root";
    $clave = "";               // por defecto está vacía en XAMPP
    $base_datos = "biblioteca";

    // 2. Conectar con el servidor MySQL
    $conexion = mysqli_connect($servidor, $usuario, $clave, $base_datos);
    mysqli_set_charset($conexion, "utf8mb4");   // para que salgan bien las tildes y la ñ

    // 2. Consultar
    $consulta = "SELECT titulo, autor FROM libros";
    $resultado = mysqli_query($conexion, $consulta);

    // 4. Mostrar los resultados en una tabla HTML
    echo "<h2>Listado de usuarios</h2>";
    echo "<table border='1' cellpadding='5'>";
    echo "<tr><th>título</th><th>Autor</th></tr>";

    while ($fila = mysqli_fetch_assoc($resultado)) {
        echo "<tr>";
        echo "<td>" . $fila['titulo'] . "</td>";
        echo "<td>" . $fila['autor'] . "</td>";
        echo "</tr>";
    }

    echo "</table>";


    // 4. Cerrar
    mysqli_free_result($resultado);
    mysqli_close($conexion);
?>
```

```
 Don Quijote de la Mancha — Miguel de Cervantes
 Cien años de soledad — Gabriel García Márquez
 Manolito Gafotas — Elvira Lindo
 El Hobbit — J. R. R. Tolkien
```

- `mysqli_set_charset` hace que las tildes y la ñ se vean bien. Sin esta línea pueden salir cosas como `aÃ±os` en lugar de `años`.
- `$fila['titulo']` es el valor de la columna `titulo` en esa fila.
- El `while` repite el bloque **mientras queden filas**.
- Para mostrarlo en una **tabla HTML**, en cada vuelta se escribe un `<tr>` con sus `<td>`. Lo tienes hecho en [`libros.php`](ejemplos/php/libros.php).

---


## Resumen final

| Quiero... | Cómo |
|-----------|------|
| Encender el servidor | XAMPP Control Panel → **Start** en Apache y MySQL |
| Comprobar que funciona | `http://localhost` |
| Dónde guardo mis páginas PHP | `C:\xampp\htdocs\` |
| Ver mi página PHP | `http://localhost/carpeta/fichero.php` |
| Entrar en phpMyAdmin | `http://localhost/phpmyadmin` |
| Crear una base de datos | Pestaña **Bases de datos** → nombre → **Crear** |
| Crear una tabla | Seleccionar la BD → nombre y nº de columnas → **Crear** |
| Meter datos | Seleccionar la tabla → **Insertar** |
| Ver los datos | Seleccionar la tabla → **Examinar** |
| Copiar una BD a otro equipo | **Exportar** → fichero `.sql` → **Importar** en el otro |
| Usuario y contraseña de MySQL en XAMPP | `root` y contraseña **vacía** |
| MySQL de XAMPP no arranca (puerto 3306) | Detener el servicio **MySQL80** en `services.msc` |
| Dónde están los datos | `C:\xampp\mysql\data\` (los guarda MySQL, no PHP) |
| Conectar con MySQL | `mysqli_connect("localhost", "root", "", "bd")` |
| Que salgan bien las tildes | `mysqli_set_charset($conexion, "utf8mb4")` |
| Hacer una consulta | `mysqli_query($conexion, "SELECT ...")` |
| Recorrer resultados | `while ($fila = mysqli_fetch_assoc($resultado))` |

| Puerto | Servicio |
|--------|----------|
| 80 | Apache (HTTP) |
| 443 | Apache (HTTPS) |
| 3306 | MySQL |


