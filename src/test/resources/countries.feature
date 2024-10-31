Feature: Validación de información del país

  Scenario: Verificar la información básica de Argentina
    Given la petición del país "Argentina"
    When obtengo los datos del país con status 200
    Then la capital debe ser "Buenos Aires"
    And la bandera debe tener los colores "white, light blue"
    #Agregar nueva validación de dominio de internet.


  # Agregar escenario de un nuevo país acá