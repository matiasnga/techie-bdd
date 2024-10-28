Feature: Validación de información del país

  Scenario: Verificar la información básica de Argentina
    Given el país "Argentina"
    When obtengo los datos del país
    Then la capital debe ser "Buenos Aires"
    And la bandera debe tener los colores "White, Light Blue"
    #Agregar nuevas validaciones de dominio de internet y poblacion acá.


  # Agregar escenario de un nuevo país acá