# PetStore API - Automatización con Karate

## 1. OBJETIVO

Automatizar y validar las siguientes operaciones de la API PetStore:

- Añadir una mascota.
- Consultar la mascota creada mediante su ID.
- Actualizar su nombre y cambiar su estado a "sold".
- Consultar por estado y verificar que aparezca la mascota modificada.

Documentación: https://petstore.swagger.io/
URL base: https://petstore.swagger.io/v2


## 2. TECNOLOGÍAS Y REQUISITOS

- JDK 21 o compatible.
- Apache Maven 3.9.x.
- Karate 2.1.3.
- JUnit Jupiter 5.10.1.

## 3. EJECUCIÓN

Desde la raíz del proyecto, donde se encuentra pom.xml:

    mvn clean test

