Feature: Validación de información del país

  Scenario Outline: Verificar la información básica de <Country>
    Given el país <Country>
    When obtengo los datos del país
    Then la capital debe ser <Capital>
    And la bandera debe tener los colores <FlagColors>
    And el dominio de internet debe ser <Domain>

    Examples:
      | Country       | Capital        | FlagColors          | Domain |
      | "Argentina"   | "Buenos Aires" | "Light Blue, White" | ".ar"  |
      | "New Zealand" | "Wellington"   | "Blue, White, Red"  | ".nz"  |
      | "Indonesia"   | "Jakarta"      | "Red, White"        | ".id"  |
      | "Russia"      | "Moscow"       | "Blue, Red, White"  | ".ru"  |