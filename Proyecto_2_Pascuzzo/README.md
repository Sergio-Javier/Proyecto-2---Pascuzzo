# AUTOBATTLER-PASCUZZO

<img src="https://media.gettyimages.com/id/157334670/es/foto/base-de-datos.jpg?s=612x612&w=gi&k=20&c=038JVeL8H1wTL7ZqaCW1e-ryH0GYtPbpZVOdUDQC55E=">
_________________________________________________________________________________________________________________________________

## Entrega primer proyecto
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
*Atributos:* ID_USER, NOMBRE, APELLIDO, FECHA_NACIMIENTO, CORREO, PASSWORD, NICK, NIVEL_USER, PUNTOS_CLASIF, CONECTADO, ID_CONFIG, ID_USER_

- **CONFIGURACIÓN:**
Registra el tipo de configuración seleccionada por el perfil, tiene valores predeterminados.
*Atributos:* ID_CONFIG, NOMBRE_CONFIG, CONFIG_VIDEO, CONFIG_SONIDO, CONFIG_JUEGO

- **AMIGOS:**
Listado de otros usuarios agregados por al perfil del usuario principal, este permite visualizar si están conectados o no.
*Atributos:* ID_USER_, NICK_AMIGO, CONECTADO

- **PARTIDA:**
Información necesaria para ingresar a la partida, y obtener información del estado de la misma al finalizar.
*Atributos:* ID_SALA, TIEMPO_DE_PARTIDA, ID_MODO, ID_UNIDAD, ID_MISION, PUNTOS_CLASIF_OBTENIDO, NIVEL_EXP_OBTENIDO, ORO, NIVEL,PUNTOS_DE_VIDA

- **ESTADISTICA:**
Brinda información detallada de cada partida
*Atributos:* ID_ESTADISTICA, POSICION, NIVEL_ALCANZADO, UNIDADES_COMPRADAS

- **UNIDAD:**
Las unidades son los personajes que se despliegan durante el juego, cada una con sus características correspondientes.
*Atributos:* ID_UNIDAD, NOMBRE, COSTO, RANGO_PRINCIPAL, RANGO_SECUNDARIO, DAÑO, DEFENSA, VIDA

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
*Atributos:* ID_TRANSACCION, ID_PRODUCTO, ID_USER, EMAIL, NICK, CANTIDAD_PRODUCTO, TOTAL_PAGAR, MEDIO_DE_PAGO, COMPLETADO

- **REGISTRO_DE_PARTIDA:**
En ella se llevara el registro general de las partidas jugadas por el usuario, a fin de minimizar el acceso a información.
*Atributos:* ID_REG, FECHA_HORA, ID_SALA, ID_USER

### Listado de tablas y descripción:

| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |                                  ---: |
| USUARIO       | ID_USER           | INT                                   |
|               | NOMBRE            | VARCHAR(25)                           |
|               | APELLIDO          | VARCHAR(25)                           |
|               | FECHA_NACIMIENTO  | DATE                                  |
|               | CORREO            | VARCHAR(100)                          |
|               | PASSWORD          | VARCHAR(25)                           |
|               | NICK              | VARCHAR(25)                           |
|               | NIVEL_USER        | INT                                   |
|               | PUNTOS_CLASIF     | INT                                   |
|               | CONECTADO         | BOOLEAN                               |


|Tabla	      |Columna		|Tipo de Datos	|
|-------------|-----------------|	-------:|
|CONFIGURACON |ID_CONFIG	|INT		|
|	      |NOMBRE_CONFIG   |VARCHAR(25)	|
|	      |CONFIG_VIDEO	   |ENUM	|
|	      |CONFIG_SONIDO	 |BOOLEAN	|
|	      |CONFIG_JUEGO  	 |ENUM	|

|Tabla	      |Columna		|Tipo de Datos	|
|-------------|-----------------|	-------:|
|AMIGOS		|ID_USER_	|INT		|
|		|NICK_AMIGO	|VARCHAR(25)	|
|		|CONECTADO	|BOOLEAN	|

|Tabla	      |Columna		|Tipo de Datos	|
|-------------|-----------------|	-------:|
|MODO_DE_JUEGO	|ID_MODO	|INT	|
|		|TIPO_MODO	|VARCHAR(25)	|
|		|GANA_NIVEL_EXP	|INT  |
|		|GANA_PUNTOS_CLASIF	|INT  |

|Tabla	      |Columna		|Tipo de Datos	|
|-------------|-----------------|	-------:|
|MISIONES	|ID_MISION	|INT		|
|		|TIPO_DE_MISION	|VARCHAR(25)	|
|		|TITULO		|VARCHAR(25)	|
|		|DESCRIPCIÓN	|VARCHAR(100)	|
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
|		|UNIDADES_COMPRADAS|INT(1)|


|Tabla	      |Columna		|Tipo de Datos	|
|-------------|-----------------|	-------:|
|UNIDAD		|ID_UNIDAD	|INT		|
|		|NOMBRE		|VARCHAR(25)	|
|		|COSTO		|ENUM		|
|		|RANGO_PRINCIPAL|	VARCHAR(25)|
|		|RANGO_SECUNDARIO|	VARCHAR(25)|
|		|DAÑO		|INT		|
|		|DEFENSA	|INT		|
|		|VIDA		|INT		|

|Tabla	      |Columna		|Tipo de Datos	|
|-------------|-----------------|	-------:|
|PARTIDA	|ID_SALA	|INT	|
|	|ID_ESTADISTICA	|INT		|
|	|ID_MODO	|INT		|
|	|ID_UNIDAD	|INT		|
|	|ID_MISION	|INT		|
|	|PUNTOS_CLASIF_OBTENIDO	|INT	|
|	|NIVEL_EXP_OBTENIDO	|INT	|
|	|ORO		|INT		|
|	|NIVEL		|INT		|
|	|PUNTOS_DE_VIDA	|INT		|
|	|TIEMPO_DE_PARTIDA	|TIME	|

|Tabla	      |Columna		|Tipo de Datos	|
|-------------|-----------------|	-------:|
|PRODUCTO	|ID_PRODUCTO	|INT		|
|		|TIPO_PRODUCTO	|VARCHAR(50)	|
|		|VALOR		|DECIMAL(5,2)	|

|Tabla	      |Columna		|Tipo de Datos	|
|-------------|-----------------|	-------:|
|FACTURA	|ID_TRANSACCION	|INT		|
|		|ID_PRODUCTO	|INT		|
|		|ID_USER	|INT		|
|		|EMAIL		|VARCHAR(100)	|
|		|NICK		|VARCHAR(25)	|
|		|CANTIDAD_PRODUCTO|	INT	|
|		|TOTAL_PAGAR	|DECIMAL(5,2)	|
|		|MEDIO_DE_PAGO	|VARCHAR(100)	|
|		|COMPLETADO	|BOOLEAN	|

### DIAGRAMA ENTIDAD-RELACIÓN (DER)

![image](https://github.com/Sergio-Javier/AUTOBATTLER-PASCUZZO/assets/173856047/54a2c8de-57e1-4bfd-920b-d04523bd4fe2)


**[PARA VISUALIZAR MEJOR HACER CLICK AQUI](https://whimsical.com/der-autobattler-2bxqrFpQD5GyFNj2uwau9e)**