# Pasos para levantar el proyecto:
1. Ir a la carpeta databaseDocker desde la terminal
```
cd databaseDocker
```
2. Levantar la base de datos con docker
```
docker compose up -d
```
3. Volver a la carpeta general del proyecto
```
cd ..
```
4. Instalar las gemas
```
bundle install
```
5. Crear la base de datos
```
rails db:create
```
6. Realizar la migración
```
rails db:migrate
```
7. Empezar la aplicación
```
rails server
```

## Pasos para cerrar el proyecto:
1. Apretar control + c en la terminal donde se tiene corriendo rails server
2. Ir a la carpeta de la base de datos
```
cd databaseDocker
```
3. Correr el comando
```
docker compose down
```
