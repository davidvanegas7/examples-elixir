# Test Elixir

**Instalación**

Para instalart elixir en Ubuntu 14.04, tenemos que introducir los siguientes comandos:

`wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
`

`sudo apt-get update
`

`sudo apt-get install esl-erlang
`

`sudo apt-get install elixir
`

Esto lo que hara es agregar Erlang Solutions repo, correr el repositorio, installar la plataforma de Erlang/OTP y todas sus aplicaciones y al final instalar elixir.

Para instalar Phoenix (el framework MVC de Elixir) debes instalar previamente algunos paquetes que son necesarios en tu Sistema Operativo.

(1) Primero hay que instalar Hex, un manejador de paquetes necesario si se quiere correr aplicaciones Phoenix

`mix local.hex
`

(2) Ahora es necesario instalar erlang como tal

`sudo apt-get install erlang
`

(3) Una vez que esta instalado elixir y Erlang, Estamos listos para instalar el archivo Mix de Phoenix.

`mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez
`

Es necesario aclarar que debes tener instalado Node.js (>=5.0.0) y los paquetes de postgresql que son la BD por defecto de Phoenix.

Si no tienes esa version de node, recomiendo mirar este  [link][1]

Es importante que la version de node sea minimo la 5, de otro modo saldra un error similiar a este:
'error: Compiling of web/static/js/app.js failed. Couldn't find preset "es2015" relative to directory "web/static/js"'

-----------------------------------------------
**Creación de Proyecto**

Para crear un proyecto Phoenix, introducimos en consola

`mix phoenix.new nombre_proyecto
`

creara los paquetes necesarios para su proyecto, si quiere correr el servidor:

`mix phoenix.server
`

Si quieres tambien correr la app por IEx (interactive Elixir):

`iex -S mix phoenix.server
`
Antes de cualquier cosa, configura tu base de datos en `config/dev.exs` y ejecuta:

`mix ecto.create
`

Con esto finaliza la introduccion a Phoenix de elixir

----------------------------------------------
Por ultimo, estas son las recomendaciones que vienen por defecto en el proyecto de Phoenix

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`


---------------------------------------------
**Pasos siguientes**
Para los pasos siguientes, crear el CRUD tanto con vistas HTML o creando un API, puedes seguir el [siguiente tutorial][2]

Phoenix te realiza mucho de lo que necesitas, te deja la aplicacion practicamente lista, lo unico que tienes que hacer es ingresas los comandos por consola necesarios para que puedas crear cada clase. Todo se basa en rails, por lo que si tienes experiencia con el comando scaffold, puedes guiarte mucho mas facil aqui.

El comando es:

`mix phoenix.gen.html Clase clase columna:tipo columna:tipo [columna:references:claseforanea]`

Al igual que en rails, creara por defecto la primary key como id.

[1]:http://tecadmin.net/upgrade-nodejs-via-npm/#
[2]:http://codetunes.com/2015/phoenix-blog/
