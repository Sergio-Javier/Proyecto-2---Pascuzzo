# AUTOBATTLER-PASCUZZO

<img src="https://media.gettyimages.com/id/157334670/es/foto/base-de-datos.jpg?s=612x612&w=gi&k=20&c=038JVeL8H1wTL7ZqaCW1e-ryH0GYtPbpZVOdUDQC55E=">
_________________________________________________________________________________________________________________________________

## Entrega segundo proyecto
### **PRESENTACIÓN**
[CLICK AQUÍ](https://docs.google.com/presentation/d/16O-zsWoQdSBcbjZN8IAhYMevG8TtxkO-h4BGcAlowJE/edit?usp=sharing)
### Pascuzzo Sergio Javier
### Comisión 57190
### Tutor: Ariel Annone
### Docente: Anderson Ocaña Torres
*********************************************************************************************************************************
### INTRODUCCION:
Mi nombre es Sergio Javier Pascuzzo, curso en Coderhouse Base de datos en SQL, y presentare como proyecto una base de datos, basado en un juego (ficticio). Más adelante aclararé de que se trata y el procedimiento de como realice dicho trabajo.

### Situación problemática:
Se debe crear una base de datos de prueba para la creación de un juego estilo autobattler, la misma debe poder registrar un perfil de usuario, además debe brindar y obtener información de las partidas jugadas. Por otro lado, también permitirá compras por parte del usuario de productos relacionados.

### Modelo de negocio:
Es un juego estilo autobattler, el mismo es online modo pvp (player vs player), donde en una sala o partida, se encuentran ocho jugadores, y los mismos compiten uno a uno de forma aleatoria en un formato torneo.
En cada ronda previa al enfrentamiento, los jugadores compran unidades, que pueden ir combinando según sus rasgos principales y/o secundarios para mejorar las estadísticas de las mismas; al mismo tiempo van ganando oro por encuentro, derrota o victoria, con el cual compran las unidades.
Los jugadores comienzan con una cantidad de vida, si pierden una batalla se descuentan puntos de vida, si ganan siguen en competencia. El objetivo es dañar al oponente, hasta quitarle su vida y quede solo uno de los ocho jugadores. El jugador sale de la partida una vez que haya perdido sus puntos de vida, y su posición entre los ocho es determinada de acuerdo al momento y cantidad de vida negativa que quedo.
Finalizada la partida, según las estadísticas de la misma, el jugador cumple misiones (las cuales da recompensas), aumenta su nivel de usuario y su nivel clasificatorio (según modo de juego)
Además, el usuario puede agregar a otros jugadores para compartir más partidas, o información entre ellos.
Cabe destacar que el juego tendrá diferentes modos, para que pueda jugar en solitario, practicar, jugar online para subir de nivel o un modo clasificatorio, para mejorar su rango, el cual servirá para emparejar con jugadores de las mismas características, y ser más competitivo.
Fuera de la sala de juego los jugadores verán estado de su perfil, irán subiendo de nivel con la experiencia obtenida, o sumando puntos para el modo clasificación. Además, configurar y guardar el perfil de juego, y realizar compras de productos que brinda el mismo. 

### Descripción del problema:
- Gestión de perfil: crear una base de datos que obtenga información al momento del registro de un nuevo usuario. Que el usuario utilice esta información para ingresar a su perfil de juego.
- Gestión de partida: las partidas deben obtener información preestablecida para que el usuario pueda hacer uso de ellas durante las partidas.
- Gestión de registro de partida: se debe poder registrar los resultados finales de la partida, con el fin de que el usuario vea sus últimos resultados, y pueda evaluar su estrategia y desempeño.
- Gestión de compras: poder brindar información necesaria de productos del juego, y que el usuario pueda adquirirlos, brindando detalle de compra.

### Objetivos:
Crear una base de datos en una primera instancia para la creación del juego, la cual debe responder de forma eficiente al momento de capturar la información, y permitir, tanto al equipo de trabajo poder ingresar y modificar datos relacionados al juego, como a los usuarios poder registrarse y utilizar esta información al momento de ingresar a la sala de juego.

### Descripción de la base de datos:
La base de datos está diseñada para el registro de nuevos usuarios, registro e historial de partidas para que los usuarios ya registrados lleven un control, información de compras y modificación de los valores del juego por parte del equipo de trabajo.

### TABLAS:

- **USUARIO:**
Almacena información sobre los usuarios al momento de registrarse e información relacionada al perfil de juego.
*Atributos:* ID_USER, NOMBRE, APELLIDO, FECHA_NACIMIENTO, CORREO, PASSWORD, NICK, NIVEL_USER, PUNTOS_CLASIF, CONECTADO

- **CONFIGURACIÓN:**
Registra el tipo de configuración seleccionada por el perfil, tiene valores predeterminados.
*Atributos:* ID_CONFIG, NOMBRE_CONFIG, CONFIG_VIDEO, CONFIG_SONIDO, CONFIG_JUEGO, ID_USER

- **AMIGOS:**
Listado de otros usuarios agregados por al perfil del usuario principal, este permite visualizar si están conectados o no.
*Atributos:* ID_AMIGO,ID_USER, NICK_AMIGO, AMIGO_CONECTADO

- **PARTIDA:**
Información necesaria para ingresar a la partida, y obtener información del estado de la misma al finalizar.
*Atributos:* ID_SALA, TIEMPO_DE_PARTIDA, ID_MODO, ID_ESTADISTICA, ID_MISION

- **ESTADISTICA:**
Brinda información detallada de cada partida
*Atributos:* ID_ESTADISTICA, POSICION, NIVEL_ALCANZADO, UNIDADES_COMPRADAS

- **UNIDAD:**
Las unidades son los personajes que se despliegan durante el juego, cada una con sus características correspondientes.
*Atributos:* ID_UNIDAD, NOMBRE, COSTO, RASGO_PRINCIPAL, RASGO_SECUNDARIO, DANIO, DEFENSA, VIDA

- **MODO_DE_JUEGO:**
Contiene la información del tipo de juego a seleccionar, lo que brindara características según el tipo.
*Atributos:* ID_MODO, TIPO_MODO, GANA_NIVEL_EXP, GANA_PUNTOS_CLASIF

- **MISIONES:**
Las misiones ofrecerán recompensas de acuerdo a la consigna asignada.
*Atributos:* ID_MISION, TIPO_DE_MISION, TITULO, DESCRIPCIÓN, RECOMPENSA

- **PRODUCTO:**
El usuario tendrá posibilidad de adquirir a cambio de un pago productos relacionados al juego.
*Atributos:* ID_PRODUCTO, TIPO_PRODUCTO, VALOR

- **FACTURA:**
Se emitirá una factura luego de realizada una transacción entre el usuario y el juego, donde se le detallara su compra, costo y cobro de la misma.
*Atributos:* ID_TRANSACCION, FECHA_DE_COMPRA,ID_PRODUCTO, CANTIDAD_PRODUCTO, ID_USER, EMAIL, NICK, TOTAL_PAGAR, MEDIO_DE_PAGO, COMPLETADO

- **REGISTRO_DE_PARTIDA:**
En ella se llevara el registro general de las partidas jugadas por el usuario, a fin de minimizar el acceso a información.
*Atributos:* ID_REG, FECHA_HORA, ID_SALA, ID_USER

### Listado de tablas y descripción:

| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |                                  ---: |
| USUARIO       | ID_USER           | INT                                   |
|               | NOMBRE            | VARCHAR(200)                           |
|               | APELLIDO          | VARCHAR(200)                           |
|               | FECHA_NACIMIENTO  | DATE                                  |
|               | CORREO            | VARCHAR(100)                          |
|               | PASSWORD          | VARCHAR(50)                           |
|               | NICK              | VARCHAR(50)                           |
|               | NIVEL_USER        | INT                                   |
|               | PUNTOS_CLASIF     | INT                                   |
|               | CONECTADO         | BOOLEAN                               |


|Tabla	      |Columna		|Tipo de Datos	|
|-------------|-----------------|	-------:|
|CONFIGURACON |ID_CONFIG	|INT		|
|	      |NOMBRE_CONFIG   |VARCHAR(100)	|
|	      |CONFIG_VIDEO	   |ENUM	|
|	      |CONFIG_SONIDO	 |BOOLEAN	|
|	      |CONFIG_JUEGO  	 |ENUM	|
|         |ID_USER           |INT   |

|Tabla	      |Columna		|Tipo de Datos	|
|-------------|-----------------|	-------:|
|AMIGOS		|ID_AMIGO           |INT        |
|           |ID_USER	        |INT		|
|		    |NICK_AMIGO	        |VARCHAR(50)|
|		    |CONECTADO	        |BOOLEAN	|

|Tabla	      |Columna		|Tipo de Datos	|
|-------------|-----------------|	-------:|
|MODO_DE_JUEGO	|ID_MODO	|INT	|
|		|TIPO_MODO	|ENUM	|
|		|GANA_NIVEL_EXP	|INT  |
|		|GANA_PUNTOS_CLASIF	|INT  |

|Tabla	      |Columna		|Tipo de Datos	|
|-------------|-----------------|	-------:|
|MISIONES	|ID_MISION	|INT		|
|		|TIPO_DE_MISION	|ENUM	|
|		|TITULO		|VARCHAR(100)	|
|		|DESCRIPCIÓN	|VARCHAR(500)	|
|		|RECOMPENSA	|VARCHAR(25)	|

|Tabla	      |Columna		|Tipo de Datos	|
|-------------|-----------------|	-------:|
|REGISTRO_DE_PARTIDA	|ID_REG |INT		|
|		|FECHA_HORA	|DATETIME	|
|		|ID_SALA	|INT		|
|		|ID_USER	|INT		|

|Tabla	      |Columna		|Tipo de Datos	|
|-------------|-----------------|	-------:|
|ESTADISTICA	|ID_ESTADISTICA	|INT	|
|		|POSICION	|INT	|
|		|NIVEL_ALCANZADO|INT(1)	|
|		|UNIDADES_COMPRADAS|VARCHAR (255)|


|Tabla	      |Columna		|Tipo de Datos	|
|-------------|-----------------|	-------:|
|UNIDAD		|ID_UNIDAD	|INT		|
|		|NOMBRE		|VARCHAR(50)	|
|		|COSTO		|ENUM		|
|		|RASGO_PRINCIPAL|	VARCHAR(50)|
|		|RASGO_SECUNDARIO|	VARCHAR(50)|
|		|DAÑO		|INT		|
|		|DEFENSA	|INT		|
|		|VIDA		|INT		|

|Tabla	      |Columna		|Tipo de Datos	|
|-------------|-----------------|	-------:|
|PARTIDA	|ID_SALA	        |INT	    |
|           |TIEMPO_DE_PARTIDA  |TIME       |
|	        |ID_ESTADISTICA	    |INT		|
|	        |ID_MODO	        |INT		|
|	        |ID_MISION	        |INT		|

|Tabla	      |Columna		|Tipo de Datos	|
|-------------|-----------------|	-------:|
|PRODUCTO	|ID_PRODUCTO	|INT		|
|		|TIPO_PRODUCTO	|VARCHAR(50)	|
|		|VALOR		|DECIMAL(6,2)	|

|Tabla	      |Columna		|Tipo de Datos	|
|-------------|-----------------|	-------:|
|FACTURA	|ID_TRANSACCION	|INT		    |
|           |FECHA_DE_COMPRA|DATETIME       |
|		|ID_PRODUCTO	    |INT		    |
|		|ID_USER	        |INT		|
|		|EMAIL		        |VARCHAR(100)	|
|		|NICK		        |VARCHAR(50)	|
|		|CANTIDAD_PRODUCTO  |	INT	|
|		|TOTAL_PAGAR	    |DECIMAL(6,2)	|
|		|MEDIO_DE_PAGO	    |VARCHAR(100)	|
|		|COMPLETADO	        |BOOLEAN	|

### DIAGRAMA ENTIDAD-RELACIÓN (DER)

![image](https://github.com/Sergio-Javier/AUTOBATTLER-PASCUZZO/assets/173856047/54a2c8de-57e1-4bfd-920b-d04523bd4fe2)


**[PARA VISUALIZAR MEJOR HACER CLICK AQUI](https://whimsical.com/der-autobattler-2bxqrFpQD5GyFNj2uwau9e)**

# OBJETOS
## Integración de objetos a sql
* Listado de Vistas más una descripción detallada, su objetivo, y qué tablas las componen.
* Listado de Funciones que incluyan una descripción detallada, el objetivo para la cual fueron creadas y qué datos o tablas manipulan y/o son implementadas.
* Listado de Stored Procedures con una descripción detallada, qué objetivo o beneficio aportan al proyecto, y las tablas que lo componen y/o tablas con las que interactúa
* Listado de Triggers

### Documentacion de Vistas
### Vista: 

#### Vista : vw_date_reg 
**Descripción: Se desea crear una vista, para visualizar en una sola tabla, los registros de partida y a que jugador corresponde. Además, algun dato importante de la partida que podamos obtener de ese registro, sin tener que ir a ver el dato, tabla por tabla.**

**Columnas:**

* *ID_REG*:*PERTENECIENTE A LA TABLA REGISTRO_DE_PARTIDA. ES UN TIPO INT* 

* *NICK*:*PERTENECIENTE A LA TABLA USUARIO, DEL TIPO VARCHAR, INDICA LOS APODOS DE LOS JUGADORES*

* *TIEMPO_DE_PARTIDA*:*PERTENECIENTE A LA TABLA PARTIDA, DEL TIPO TIME, INDICA LA DURACION DE LA PARTIDA* 

* *UNIDADES_COMPRADAS*:*PERTENECIENTE A LA TABLA ESTADISTICAS, DEL TIPO VARCHAR, QUE INDICA UN LISTADO EN CADENA SEPARADO POR COMA LOS ID DE LAS UNIDADES UTILIZADAS EN LA PARTIDA* 

**Ejemplo de consulta:**

```sql
SELECT * FROM vw_date_reg 
ORDER BY `ID_REG` ASC;
```


#### Vista : vw_user_count_party
**Descripción: Esta segunda vista, fue creada para controlar que jugadores tenian partidas registradas, y la cantidad de las mismas** 

**Columnas:**

* *ID_USER*:*PERTENECIENTE A LA TABLA USUARIO, DEL TIPO INT, INDICA EL ID AL QUE SE LE ASIGNO AL USUARIO AL REGISTRARSE * 

* *NICK*:*PERTENECIENTE A LA TABLA USUARIO, DEL TIPO VARCHAR, INDICA LOS APODOS DE LOS JUGADORES*

* *total_partidas*:*INDICA EL CONTEO SEGUN LA CANTIDAD DE ID_REG QUE POSEA CADA ID_USER* 

**Ejemplo de consulta:**

```sql
    -- prueba
SELECT * FROM vw_user_count_party
ORDER BY `ID_USER` ASC;
```
```sql
-- seleccionar los usuarios con 0 partidas (luego los usare para utilizar en otros objetos a crear)
SELECT * FROM vw_user_count_party
WHERE total_partidas = 0
ORDER BY `ID_USER` ASC;
```

## Documentación de Funciones 

### Función:

### Función: fn_nombre_unidades

**Descripción: UTILIZADA PARA CONVERTIR LA LISTA EN CADENA SEPARADA POR COMAR DE LAS UNIDADES COMPRADAS PARA TOMAR ESE NUMERO, QUE ES DEL TIPO VARCHAR, Y CONCATENARLO CON EL ID DE LA UNIDAD, DE LA TABLA UNIDAD. SE CREA CON LA INTENCION DE FACILITAR LA VISTA DE LAS UNIDADES AL MOMENTO DE QUERER EJECUTAR, POR EJEMPLO LA VISTA vw_date_reg** 

**Parámetros:**

* *unidades_compradas VARCHAR(255)*:**

**Retorno:**

**nombre_unidades*:*Convierte la lista de cadenas separada por comas en números, en una lista separada con comas con los nombres de las unidades, segun su numero id.*

**Ejemplo de uso:**

```sql
SELECT 
*,
fn_nombre_unidades(UNIDADES_COMPRADAS) AS nombres_unidades
FROM vw_date_reg;
```
Nota: esta funcion se utilizo sobre una vista creada anteriormente, en caso de no crear o no ejecutar la vista, la funcion fn_nombre_unidades(UNIDADES_COMPRADAS) debe ser ejecutada desde ESTADISTICAS, o en caso de hacer un join entre la tabla PARTIDA y ESTADISTICA. Se especifica, ya que se sabe especificamente donde esta almacenado este tipo de dato, recuerde VARCHAR lista de cadenas separado por coma.


### Función: fn_convertir

**Descripción: UTILIZADA PARA CONVERTIR LOS VALORES DE LOS MONTOS TOTALES DELA FACTURA, CONSIDERADO EN DOLARES, A PESOS ARGENTINOS EN LA PROVIENCIA Y CIUDAD DE BUENOS AIRES.** 

**Parámetros:**

* *factura int*:*Parámetro de entrada, hace referencia al id de la factura a la que se quiere aplicar la funcion.*
* *dolar_oficial float (6,2)*:*Parámetro de entrada, que se ingresará al llamar la función de acuerdo de cotizacon del dolar en el día.*

**Retorno:**

* *total_convertido*:*Devuelve un numero flotante*

**Ejemplo de uso:**

```sql
SELECT fn_convertir (1,951) AS Monto_Argentino;
```

**Nota: Recordar, la primer variable corresponde al ID_TRANSACCION, de tabla FACTURA. El calculo sirve para el valor del dolar oficial indicado por el Banco Central de la Republica Argentina.** 


## Documentación de Triggers 

### Trigger: after_insert_trigger

**Descripción:** Este trigger registra la inserción de un nuevo usuario en la tabla LOG_CAMBIOS.

**Detalles:**

* **Tabla afectada:** USUARIO
* **Acción:** INSERT
* **Información registrada:** Fecha, ID del usuario, Usuario que realiza la inserccion

**Ejemplo:**

* Se inserta un nuevo usuario.
* El trigger registra la acción en la tabla LOG_CAMBIOS con los detalles correspondientes.

### Trigger: before_delete_trigger

**Descripción:** Este trigger registra la eliminacion de un usuario en la tabla LOG_CAMBIOS y guarda datos del mismo.

**Detalles:**

* **Tabla afectada:** USUARIO
* **Acción:** DELETE
* **Información registrada:** Fecha, ID_USER, NICK, PASSWORD, Usuario que realiza el delete.

**Ejemplo:**

* Se elimina un usuario.
* El trigger copia en la tabla LOG, el evento, y guarda datos del usuario, en caso de ser necesario volver a identificar.


## Documentación de Procedimientos Almacenados

### Procedimiento: sp_rango_user

**Descripción: Le asigna un nombre de rango a al usuario seleccionado segun su puntaje de clasificacion.** 

**Parámetros:**

* *p_id_user : Parámetro IN del tipo INT, donde se introduce el numero de ID_USER de la tabla USUARIO.*
* *p_nick : Parámetro OUT del tipo VARCHAR. Se declara como variable @p_nick*
* *p_nombre_rango : Parámetro del tipo VARCHAR. Se declara como variable @p_nombre_rango*
   
**Retorno: @p_nick, @p_nombre_rango, ambos del tipo VARCHAR, que corresponden al nick del usuario y alrango asignado segun su puntaje, respectivamente.**

**Ejemplo de uso:**

```sql
-- valor esperado: VodnikJavier, BRONCE
CALL sp_rango_user(1, @p_nick, @p_nombre_rango);
SELECT @p_nick AS Nick,
       @p_nombre_rango AS Nombre_Rango;
```
```sql
-- valor esperado: msj usuario no encontrado
CALL sp_rango_user(30, @p_nick, @p_nombre_rango);
SELECT @p_nick AS Nick,
       @p_nombre_rango AS Nombre_Rango;
```
Nota: El parametro de entrada es un numero entero, y solo se puede modificar ese parametro, los nombres de los parametros de salida no pueden ser modificados hasta que no se altere el procedimiento. Luego de ejecutar el procedimiento se debe seleccionar a las variables, ya que alli queda guardada la informacion, si se puede renombrar (AS) estas variables para poder ver el nombre del registro.
**No funciona** con mas de un numero ingresado a la vez. Se debe hacer uno por uno.

### Procedimiento: delete_user 

**Descripción: Borra automaticamente el usuario seleccionado con su id** 

**Parámetros:**

* *d_id_user  : Parámetro IN del tipo INT, donde se introduce el numero de ID_USER de la tabla USUARIO.*
   
**Retorno*:*Si ejecuta o no la tarea trae un mensaje, de acuerdo a la accion final*

**Ejemplo de uso:**

```sql
-- Anteriormente, se presento una vista vw_user_count_party, que trae aquellos usuarios que no tienen registro de partidas, con sus id respectivos, podemos usar estos id que nos da la view, e insertar uno por uno los id a eliminar. En caso de tener que incorporar estos registros borrados, los tenemos en nuestra tabla LOG_CAMBIOS
call delete_user(30);
```
Nota: el parametro a ingresar es un INT.
