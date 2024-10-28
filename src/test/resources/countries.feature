Feature: Validación de información del país

  Scenario Outline: Verificar la información básica de <Country>
    Given el país <Country>
    When obtengo los datos del país
    Then la capital debe ser <Capital>
    And la bandera debe tener los colores <FlagColors>
    And el dominio de internet debe ser <Domain>
    And la población debe ser <Population>

    Examples:
      | Country       | Capital        | FlagColors          | Domain | Population |
      | "Argentina"   | "Buenos Aires" | "Light Blue, White" | ".ar"  | 45376763   |
      | "New Zealand" | "Wellington"   | "Blue, White, Red"  | ".nz"  | 5084300    |
      | "Indonesia"   | "Jakarta"      | "Red, White"        | ".id"  | 273523621  |
      | "Russia"      | "Moscow"       | "Blue, Red, White"  | ".ru"  | 144104080  |