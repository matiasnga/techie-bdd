# Techie BDD (Behaviour Driven Development)

En la Ingeniería de Software, Behavior-Driven Development (BDD) o Desarrollo Basado en Comportamiento es una
práctica ágil de desarrollo de software que se centra en la colaboración entre desarrolladores, testers y partes
interesadas no técnicas para definir el comportamiento del sistema a través de ejemplos claros y comprensibles. BDD
fomenta la comunicación entre todos los involucrados en el proyecto, utilizando un lenguaje común y accesible, lo que
ayuda a reducir malentendidos y mejorar la calidad del software.

# Cucumber Framework

Cucumber es una herramienta de automatización de pruebas que facilita el Desarrollo Basado en Comportamiento (BDD)
mediante el uso del lenguaje Gherkin, que permite escribir pruebas en un formato legible para humanos.

### Ejemplo de Gherkin:
```
Característica: Login de usuario
  Escenario: Login exitoso
    Dado que el usuario está en la página de inicio de sesión
    Cuando introduce un nombre de usuario y una contraseña válidos
    Entonces debería ser redirigido a la página de inicio
```

En Gherkin, la estructura típica de los pasos utiliza las palabras clave en inglés:

- Dado (Given): Define el contexto o la situación inicial.
- Cuando (When): Describe la acción o evento que ocurre.
- Entonces (Then): Establece las expectativas o resultados que deberían suceder después de la acción.

## API Rest Countries
https://restcountries.com/#endpoints-all

```bash
curl --location 'https://restcountries.com/v3.1/translation/Argentina'
```

## Práctica
- Agregar la verificación del dominio de internet del ejemplo dado (.ar) 
- Agregar la verificacion de la población (45.376.763)
- Agregar un nuevo escenario con un otro país a elección y verificar capital, colores de la bandera, dominio de internet y población.

## Dependencias
- java 11
- rest-assured
- cucumber-java
- cucumber-jvm-deps
- cucumber-junit
- lombok