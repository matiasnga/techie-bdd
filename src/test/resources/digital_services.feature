Feature: Servicios Digitales Api-Tax

  Scenario Outline: <Case Number>. <Description>
    Given un payment en dia <date> con taxpayerid <taxpayerId> en jusrisdiccion <jurisdiction> con monto en <currency> con importe <amount> y merchant <merchant>
    When obtengo calculo con status 201
    Then la percepcion de 767 debe ser <IVA amount>, la condicion debe ser <IVA type>, la base imponible debe ser <IVA taxBase>, el regimen debe ser <IVA taxRegimeCode> y la alicuota <IVA rate>
    Then la percepcion de 217 debe ser <IGG amount>, la condicion debe ser <IGG type>, la base imponible debe ser <IGG taxBase>, el regimen debe ser <IGG taxRegimeCode> y la alicuota <IGG rate>
    Then la percepcion de <jurisdiction> debe ser <IBB amount>, la condicion debe ser <IBB type>, la base imponible debe ser <IBB taxBase>, el regimen debe ser <IBB taxRegimeCode> y la alicuota <IBB rate>
    Then la percepcion de 939 debe ser <IP amount>, la condicion debe ser <IP type>, la base imponible debe ser <IP taxBase>, el regimen debe ser <IP taxRegimeCode> y la alicuota <IP rate>

    Examples:
      | Case Number | Description                      | date                  | taxpayerId | jurisdiction | amount | currency | merchant                    | apartado | exchange | IVA taxRegimeCode | IVA type | IVA taxBase | IVA rate | IVA amount | IGG taxRegimeCode | IGG type           | IGG taxBase | IGG rate | IGG amount | IBB taxRegimeCode | IBB type | IBB taxBase | IBB rate | IBB amount | IP taxRegimeCode | IP type   | IP taxBase | IP rate | IP amount |
      | 1           | Compra ARS. Apartado A. IIBB N/A | "2024-11-08 00:00:00" | 3000000007 | 901          | 1300   | "ars"    | "GOOGLE *YouTubeP P15kvqUY" | A        | 1100     | 956               | "SA"     | 1300        | 0.21     | 273        | 594               | "Sujeto Alcanzado" | 1300        | 0.3      | 390        | 0                 | "-"      | 1300        | 0        | 0          | 989              | "SSDD"    | 1300       | 0.08    | 104       |
      | 2           | Compra USD. Apartado B. IIBB N/A | "2024-11-08 00:00:00" | 3000000007 | 902          | 13200  | "ars"    | "Netflix"                   | B        | 1100     | 956               | "EX"     | 13200       | 0        | 0          | 594               | "Sujeto Alcanzado" | 13200       | 0.3      | 3960       | 0                 | "-"      | 13200       | 0        | 0          | 989              | "SSDD"    | 13200      | 0.08    | 1056      |
      | 3           | Compra ARS. No SSDD              | "2024-11-08 00:00:00" | 3000000007 | 903          | 15000  | "ars"    | "no es SSDD"                | -        | 1100     | 956               | "EX"     | 15000       | 0        | 0          | 594               | "Sujeto Alcanzado" | 15000       | 0.3      | 4500       | 0                 | "-"      | 15000       | 0        | 0          | 990              | "NO_SSDD" | 15000      | 0.3     | 4500      |





