# Trabajo Práctico grupal de Base de Datos - Cátedra Cabrera
## Integrantes
- Juan Bautista Botter Brun [101505]
- Patricio Ibar [109569]
- Valentina Llanos Pontaut [104413]
- Valentín Marturet [104526]

## Informe
[Ver Informe](Entrega.pdf)

## Ejecución de las Queries
Primero hay que instalar **PostgreSQL**. En Ubuntu esto puede hacerse corriendo las siguientes líneas de comandos.
```
sudo apt update
sudo apt install postgresql postgresql-contrib
```
Luego se inicializa el servicio mediante las siguientes líneas de comandos.
```
sudo systemctl start postgresql
sudo systemctl enable postgresql
```
Puede verificarse que el servicio está corriendo correctamente corriendo `sudo systemctl status postgresql
`
Luego debe cambiarse al usuario de `postgres` e ingresar a la shell de **PostgreSQL**.
```
sudo -i -u postgres
psql
```

Una vez dentro de la shell de **PostgreSQL** se pueden ingresar las queries.

Lo primero es crear la base de datos con el comando especificado en el archivo `create_database.sql`. Luego para seleccionar esa base de datos hay que ejecutar el comando específico de posgres `\c <database_name>`.