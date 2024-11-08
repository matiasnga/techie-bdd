Feature: Servicios Digitales Api-Tax

  Scenario Outline: Calculo de impuestos SSDD
    Given un payment con importe en dia <date> con taxpayerid <taxpayerId> en jusrisdiccion <jurisdiction> con monto en <currency> con importe <amount> y merchant <merchant>
    When obtengo calculo con status 201
    Then la percepcion de 939 debe ser 3000.00, la condicion debe ser "NO_SSDD", la base imponible debe ser 10000.00, el regimen debe ser "990" y la alicuota 0.3000
    Then la percepcion de 901 debe ser 0, la condicion debe ser "-", la base imponible debe ser 0, el regimen debe ser "-" y la alicuota 0
    Examples:
      | date                | taxpayerId | jurisdiction | amount  | paymentMethod | currency | merchant                    | IVA id | IVA type | IVA taxBase | IVA taxRegimeCode | IVA rate | IVA amount | IGG id | IGG type | IGG taxBase | IGG taxRegimeCode | IGG rate | IGG amount | IBB id | IBB type | IBB taxBase | IBB taxRegimeCode | IBB rate | IBB amount | IP id | IP type | IP taxBase | IP taxRegimeCode | IP rate |
      | 2024-11-08 00:00:00 | 2031477522 | 904          | 8000,25 | "credit"      | "ARS"    | "GOOGLE *YouTubeP P15kvqUY" | 767    | "AC"     | 8000,25     | 956               | 0,21     | 1680,0525  | 217    | AC       | 8000,25     | 594               | 0,3      | 2400,075   | 939    | AC       | 8000,25     | 989               | 0,08     | 640,02     | 904   | AC      | 8000,25    | 34               | 0,04    |