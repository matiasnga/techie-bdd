Feature: Servicios Digitales Api-Tax

  Scenario Outline: Calculo de impuestos SSDD <Case Description> <Case number>
    Given un payment en dia <date> con taxpayerid <taxpayerId> en jusrisdiccion <jurisdiction> con monto en <currency> con importe <amount> y merchant <merchant>
    When obtengo calculo con status 201
    Then la percepcion de <IVA id> debe ser <IVA amount>, la condicion debe ser <IVA type>, la base imponible debe ser <IVA taxBase>, el regimen debe ser <IVA taxRegimeCode> y la alicuota <IVA rate>
    Then la percepcion de <IGG id> debe ser <IGG amount>, la condicion debe ser <IGG type>, la base imponible debe ser <IGG taxBase>, el regimen debe ser <IGG taxRegimeCode> y la alicuota <IGG rate>
    Then la percepcion de <IBB id> debe ser <IBB amount>, la condicion debe ser <IBB type>, la base imponible debe ser <IBB taxBase>, el regimen debe ser <IBB taxRegimeCode> y la alicuota <IBB rate>
    Then la percepcion de <IP id> debe ser <IP amount>, la condicion debe ser <IP type>, la base imponible debe ser <IP taxBase>, el regimen debe ser <IP taxRegimeCode> y la alicuota <IP rate>

  Examples:
    | Case Description | Case number | date | taxpayerId | jurisdiction | amount | paymentMethod | currency | merchant | IVA id | IVA type | IVA taxBase | IVA taxRegimeCode | IVA rate | IVA amount | IGG id | IGG type | IGG taxBase | IGG taxRegimeCode | IGG rate | IGG amount | IBB id | IBB type | IBB taxBase | IBB taxRegimeCode | IBB rate | IBB amount | IP id | IP type | IP taxBase | IP taxRegimeCode | IP rate | IP amount |
    | Caso de prueba Test 1 | 1 | "2024-11-08 00:00:00" | 2031477522 | 904 | 8000.25 | "credit" | "ARS" | "GOOGLE *YouTubeP P15kvqUY" | 767 | "AC" | 8000.25 | 956 | 0.21 | 1680.0525 | 217 | "AC" | 8000.25 | 594 | 0.3 | 2400.08 | 939 | "AC" | 8000.25 | 989 | 0.08 | 640.02 | 904 | "AC" | 8000.25 | 34 | 0.04 | 320.01 |
    | Caso de prueba Test 2 | 2 | "2024-11-01 00:00:00" | 2031477522 | 904 | 8000.25 | "credit" | "ARS" | "GOOGLE *YouTubeP P15kvqUY" | 767 | "AC" | 8000.25 | 956 | 0.21 | 1680.0525 | 217 | "AC" | 8000.25 | 594 | 0.3 | 2400.08 | 939 | "AC" | 8000.25 | 989 | 0.08 | 640.02 | 904 | "AC" | 8000.25 | 34 | 0.04 | 320.01 |
    | Caso de prueba Test 3 | 3 | "2024-11-08 00:00:00" | 2031477522 | 904 | 8000.25 | "credit" | "ARS" | "GOOGLE *YouTubeP P15kvqUY" | 767 | "AC" | 8000.25 | 956 | 0.21 | 1680.0525 | 217 | "AC" | 8000.25 | 594 | 0.3 | 2400.08 | 939 | "AC" | 8000.25 | 989 | 0.08 | 640.02 | 904 | "AC" | 8000.25 | 34 | 0.04 | 320.01 |