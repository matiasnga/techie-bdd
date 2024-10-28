Feature: Validación de información del país

  Scenario: Verificar la información básica de Argentina
    Given obtengo los datos del país "Argentina" desde la API
    When obtengo la capital y la descripcion de la bandera
    Then la capital debería ser "Buenos Aires"
    And la bandera debe tener los colores "White, Light Blue"