Feature: Servicios Digitales Api-Tax

  Scenario Outline: <Case number>. <Case Description>
    Given un payment en dia <date> con taxpayerid <taxpayerId> en jusrisdiccion <jurisdiction> con monto en <currency> con importe <amount> y merchant <merchant>
    When obtengo calculo con status 201
    Then la percepcion de 767 debe ser <IVA amount>, la condicion debe ser <IVA type>, la base imponible debe ser <IVA taxBase>, el regimen debe ser <IVA taxRegimeCode> y la alicuota <IVA rate>
    Then la percepcion de 217 debe ser <IGG amount>, la condicion debe ser <IGG type>, la base imponible debe ser <IGG taxBase>, el regimen debe ser <IGG taxRegimeCode> y la alicuota <IGG rate>
    Then la percepcion de <jurisdiction> debe ser <IBB amount>, la condicion debe ser <IBB type>, la base imponible debe ser <IBB taxBase>, el regimen debe ser <IBB taxRegimeCode> y la alicuota <IBB rate>
    Then la percepcion de 939 debe ser <IP amount>, la condicion debe ser <IP type>, la base imponible debe ser <IP taxBase>, el regimen debe ser <IP taxRegimeCode> y la alicuota <IP rate>

    Examples:
      | Case Description | Case number                      | date                  | taxpayerId | jurisdiction | amount | currency | exchange | merchant                    | apartado | IVA type | IVA taxBase | IVA taxRegimeCode | IVA rate | IVA amount | IGG type           | IGG taxBase | IGG taxRegimeCode | IGG rate | IGG amount | IBB type | IBB taxBase | IBB taxRegimeCode | IBB rate | IBB amount | IP type | IP taxBase | IP taxRegimeCode | IP rate | IP amount |
      | 1                | Compra ARS. Apartado A. IIBB N/A | "2024-11-08 00:00:00" | 2031477522 | 923          | 1300   | "ars"      | 1350     | "GOOGLE *YouTubeP P15kvqUY" | A        | "SA"     | 1300        | 956               | 0.21     | 273        | "Sujeto Alcanzado" | 1300        | 594               | 0.3      | 390        | "-"      | 0           | 0                 | 0        | 0          | "SSDD"  | 1300       | 989              | 0.08    | 104       |