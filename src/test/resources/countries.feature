Feature: Validación de información del país

  Scenario Outline: Verificar la información básica de <Country>
    Given la petición del país <Country>
    When obtengo los datos del país con status 200
    Then la capital debe ser <Capital>
    And la bandera debe tener los colores <FlagColors>
    And el dominio de internet debe ser <Domain>

    Examples:
      | Country       | Capital        | FlagColors          | Domain |
      | "Argentina"   | "Buenos Aires" | "light blue, white" | ".ar"  |
      | "New Zealand" | "Wellington"   | "blue, white, red"  | ".nz"  |
      | "Indonesia"   | "Jakarta"      | "red, white"        | ".id"  |
      | "Russia"      | "Moscow"       | "blue, red, white"  | ".ru"  |