Feature: Validación de información del país

  Scenario: Calculo de impuestos
    Given un payment con importe en dia 0 con taxpayerid "20314775229" en jusrisdiccion 923 con monto en "ARS" con importe 10000 y merchant "GOOGLE"
    When obtengo calculo con status 201
    Then la percepcion de 767 debe ser 0, la condicion debe ser "EX", la base imponible debe ser 10000, el regimen debe ser 199 y la alicuota 0
    And la percepcion de 217 debe ser 0, la condicion debe ser "EX", la base imponible debe ser 10000, el regimen debe ser 199 y la alicuota 0
    And la percepcion de 923 debe ser 0, la condicion debe ser "EX", la base imponible debe ser 10000, el regimen debe ser 199 y la alicuota 0
    And la percepcion de 939 debe ser 0, la condicion debe ser "EX", la base imponible debe ser 10000, el regimen debe ser 199 y la alicuota 0

