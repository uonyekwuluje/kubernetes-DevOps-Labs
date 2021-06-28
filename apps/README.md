# Simple Hello World App

## Create Docker Image
```
docker build -t helloworldapp .
```

## Test App
Run the command below:
```
docker run -p 8080:80 helloworldapp 
```
Open your browser and type
```
http://localhost:8080
```
