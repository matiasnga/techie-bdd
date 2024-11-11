Feature: Servicios Digitales Api-Tax

  Scenario Outline: <Case Number>. <Description>
    Given un payment en dia <"date"> con taxpayerid <taxpayerId> en jusrisdiccion <jurisdiction> con monto en <currency> con importe <amount> y merchant <merchant>
    When obtengo calculo con status 201
    Then la percepcion de 767 debe ser <IVA amount>, la condicion debe ser <IVA type>, la base imponible debe ser <IVA taxBase>, el regimen debe ser <IVA taxRegimeCode> y la alicuota <IVA rate>
    Then la percepcion de 217 debe ser <IGG amount>, la condicion debe ser <IGG type>, la base imponible debe ser <IGG taxBase>, el regimen debe ser <IGG taxRegimeCode> y la alicuota <IGG rate>
    Then la percepcion de <jurisdiction> debe ser <IBB amount>, la condicion debe ser <IBB type>, la base imponible debe ser <IBB taxBase>, el regimen debe ser <IBB taxRegimeCode> y la alicuota <IBB rate>
    Then la percepcion de 939 debe ser <IP amount>, la condicion debe ser <IP type>, la base imponible debe ser <IP taxBase>, el regimen debe ser <IP taxRegimeCode> y la alicuota <IP rate>

    Examples:
      | Case Number |  Description | "date" | taxpayerId | jurisdiction | amount | usd amount | currency | merchant | apartado | exchange | IGG rate | IGG amount | IGG taxRegimeCode | IGG type | IGG taxBase | IP rate | IP amount | IP taxRegimeCode | IP type | IP taxBase | IVA rate | IVA amount | IVA taxRegimeCode | IVA type | IVA taxBase | IBB rate | IBB amount | IBB taxRegimeCode | IBB type | IBB taxBase |
      | 1 | Apartado A. IIBB N/A (menor a 10 usd ) | "2024-11-11 00:00:00" | 3000000007 | 901 | 12197.79 | 9.99 | "ars" | "GOOGLE *YouTubeP P15kvqUY" | A | 1221 | 0.3 | 3659.34 | 596 | "Sujeto Alcanzado" | 12197.79 | 0.08 | 975.82 | 989 | "SSDD" | 12197.79 | 0.21 | 2561.54 | 956 | "SA" | 12197.79 | 0 | 0 | 0 | "-" | 12197.79 |
      | 2 | Apartado A. IIBB N/A (igual  a 10 usd ) | "2024-11-11 00:00:00" | 3000000007 | 902 | 12210 | 10 | "ars" | "GOOGLE *YouTubeP P15kvqUY" | A | 1221 | 0.3 | 3663 | 596 | "Sujeto Alcanzado" | 12210 | 0.08 | 976.8 | 989 | "SSDD" | 12210 | 0.21 | 2564.1 | 956 | "SA" | 12210 | 0 | 0 | 0 | "-" | 12210 |
      | 3 | Apartado A. IIBB N/A (mayor a 10usd) | "2024-11-11 00:00:00" | 3000000007 | 903 | 12222.21 | 10.01 | "ars" | "GOOGLE *YouTubeP P15kvqUY" | A | 1221 | 0.3 | 3666.66 | 596 | "Sujeto Alcanzado" | 12222.21 | 0.08 | 977.78 | 989 | "SSDD" | 12222.21 | 0.21 | 2566.66 | 956 | "SA" | 12222.21 | 0 | 0 | 0 | "-" | 12222.21 |
      | 4 | Apartado B. IIBB N/A (menor a 10 usd ) | "2024-11-11 00:00:00" | 3000000007 | 902 | 12197.79 | 9.99 | "ars" | "Netflix" | B | 1221 | 0.3 | 3659.34 | 596 | "Sujeto Alcanzado" | 12197.79 | 0.08 | 975.82 | 989 | "SSDD" | 12197.79 | 0.21 | 2561.54 | 956 | "SA" | 12197.79 | 0 | 0 | 0 | "-" | 12197.79 |
      | 5 | Apartado B. IIBB N/A (igual  a 10 usd ) | "2024-11-11 00:00:00" | 3000000007 | 903 | 12210 | 10 | "ars" | "Netflix" | B | 1221 | 0.3 | 3663 | 596 | "Sujeto Alcanzado" | 12210 | 0.08 | 976.8 | 989 | "SSDD" | 12210 | 0 | 0 | 956 | "EX" | 12210 | 0 | 0 | 0 | "-" | 12210 |
      | 6 | Apartado B. IIBB N/A (mayor a 10usd) | "2024-11-11 00:00:00" | 3000000007 | 904 | 12222.21 | 10.01 | "ars" | "Netflix" | B | 1221 | 0.3 | 3666.66 | 596 | "Sujeto Alcanzado" | 12222.21 | 0.08 | 977.78 | 989 | "SSDD" | 12222.21 | 0 | 0 | 956 | "EX" | 12222.21 | 0.03 | 366.67 | 34 | "AC" | 12222.21 |
      | 7 | No SSDD | "2024-11-11 00:00:00" | 3000000007 | 905 | 12197.79 | 9.99 | "ars" | "no es SSDD" | - | 1221 | 0.3 | 3659.34 | 596 | "Sujeto Alcanzado" | 12197.79 | 0.3 | 3659.34 | 990 | "NO_SSDD" | 12197.79 | 0 | 0 | 956 | "EX" | 12197.79 | 0 | 0 | 0 | "-" | 12197.79 |
      | 8 | IIBB | "2024-11-11 00:00:00" | 3000000007 | 906 | 12210 | 10 | "ars" | "GOOGLE *YouTubeP P15kvqUY" | A | 1221 | 0.3 | 3663 | 596 | "Sujeto Alcanzado" | 12210 | 0.08 | 976.8 | 989 | "SSDD" | 12210 | 0.21 | 2564.1 | 956 | "SA" | 12210 | 0.055 | 671.55 | 15 | "AC" | 12210 |
      | 9 | IIBB | "2024-11-11 00:00:00" | 3000000007 | 907 | 12222.21 | 10.01 | "ars" | "Netflix" | B | 1221 | 0.3 | 3666.66 | 596 | "Sujeto Alcanzado" | 12222.21 | 0.08 | 977.78 | 989 | "SSDD" | 12222.21 | 0 | 0 | 956 | "EX" | 12222.21 | 0 | 0 | 0 | "-" | 12222.21 |
      | 10 | IIBB | "2024-11-11 00:00:00" | 3000000007 | 908 | 12197.79 | 9.99 | "ars" | "Netflix" | B | 1221 | 0.3 | 3659.34 | 596 | "Sujeto Alcanzado" | 12197.79 | 0.08 | 975.82 | 989 | "SSDD" | 12197.79 | 0.21 | 2561.54 | 956 | "EX" | 12197.79 | 0 | 0 | 0 | "-" | 12197.79 |
      | 11 | IIBB | "2024-11-11 00:00:00" | 3000000007 | 909 | 12210 | 10 | "ars" | "Netflix" | B | 1221 | 0.3 | 3663 | 596 | "Sujeto Alcanzado" | 12210 | 0.08 | 976.8 | 989 | "SSDD" | 12210 | 0 | 0 | 956 | "EX" | 12210 | 0 | 0 | 0 | "-" | 12210 |
      | 12 | IIBB | "2024-11-11 00:00:00" | 3000000007 | 910 | 12222.21 | 10.01 | "ars" | "no es SSDD" | - | 1221 | 0.3 | 3666.66 | 596 | "Sujeto Alcanzado" | 12222.21 | 0.3 | 3666.66 | 990 | "NO_SSDD" | 12222.21 | 0 | 0 | 956 | "EX" | 12222.21 | 0 | 0 | 0 | "-" | 12222.21 |
      | 13 | IIBB | "2024-11-11 00:00:00" | 3000000007 | 911 | 12197.79 | 9.99 | "ars" | "GOOGLE *YouTubeP P15kvqUY" | A | 1221 | 0.3 | 3659.34 | 596 | "Sujeto Alcanzado" | 12197.79 | 0.08 | 975.82 | 989 | "SSDD" | 12197.79 | 0.21 | 2561.54 | 956 | "SA" | 12197.79 | 0.01 | 121.98 | 21 | "AC" | 12197.79 |
      | 14 | IIBB | "2024-11-11 00:00:00" | 3000000007 | 912 | 12210 | 10 | "ars" | "Netflix" | B | 1221 | 0.3 | 3663 | 596 | "Sujeto Alcanzado" | 12210 | 0.08 | 976.8 | 989 | "SSDD" | 12210 | 0 | 0 | 956 | "EX" | 12210 | 0 | 0 | 0 | "-" | 12210 |
      | 15 | IIBB | "2024-11-11 00:00:00" | 3000000007 | 913 | 12222.21 | 10.01 | "ars" | "Netflix" | B | 1221 | 0.3 | 3666.66 | 596 | "Sujeto Alcanzado" | 12222.21 | 0.08 | 977.78 | 989 | "SSDD" | 12222.21 | 0 | 0 | 956 | "EX" | 12222.21 | 0 | 0 | 0 | "-" | 12222.21 |
      | 16 | IIBB | "2024-11-11 00:00:00" | 3000000007 | 914 | 12197.79 | 9.99 | "ars" | "Netflix" | B | 1221 | 0.3 | 3659.34 | 596 | "Sujeto Alcanzado" | 12197.79 | 0.08 | 975.82 | 989 | "SSDD" | 12197.79 | 0.21 | 2561.54 | 956 | "EX" | 12197.79 | 0 | 0 | 0 | "-" | 12197.79 |
      | 17 | IIBB | "2024-11-11 00:00:00" | 3000000007 | 915 | 12210 | 10 | "ars" | "Netflix" | B | 1221 | 0.3 | 3663 | 596 | "Sujeto Alcanzado" | 12210 | 0.08 | 976.8 | 989 | "SSDD" | 12210 | 0 | 0 | 956 | "SA" | 12210 | 0.04 | 488.4 | 100 | "AC" | 12210 |
      | 18 | IIBB | "2024-11-11 00:00:00" | 3000000007 | 916 | 12222.21 | 10.01 | "ars" | "GOOGLE *YouTubeP P15kvqUY" | A | 1221 | 0.3 | 3666.66 | 596 | "Sujeto Alcanzado" | 12222.21 | 0.08 | 977.78 | 989 | "SSDD" | 12222.21 | 0.21 | 2566.66 | 956 | "SA" | 12222.21 | 0.05 | 611.11 | 110 | "AC" | 12222.21 |
      | 19 | IIBB | "2024-11-11 00:00:00" | 3000000007 | 917 | 12197.79 | 9.99 | "ars" | "Netflix" | B | 1221 | 0.3 | 3659.34 | 596 | "Sujeto Alcanzado" | 12197.79 | 0.08 | 975.82 | 989 | "SSDD" | 12197.79 | 0.21 | 2561.54 | 956 | "EX" | 12197.79 | 0.036 | 439.12 | 7 | "AC" | 12197.79 |
      | 20 | IIBB | "2024-11-11 00:00:00" | 3000000007 | 918 | 12210 | 10 | "ars" | "Netflix" | B | 1221 | 0.3 | 3663 | 596 | "Sujeto Alcanzado" | 12210 | 0.08 | 976.8 | 989 | "SSDD" | 12210 | 0 | 0 | 956 | "EX" | 12210 | 0 | 0 | 0 | "-" | 12210 |
      | 21 | IIBB | "2024-11-11 00:00:00" | 3000000007 | 919 | 12222.21 | 10.01 | "ars" | "Netflix" | B | 1221 | 0.3 | 3666.66 | 596 | "Sujeto Alcanzado" | 12222.21 | 0.08 | 977.78 | 989 | "SSDD" | 12222.21 | 0 | 0 | 956 | "EX" | 12222.21 | 0 | 0 | 0 | "-" | 12222.21 |
      | 22 | IIBB | "2024-11-11 00:00:00" | 3000000007 | 920 | 12197.79 | 9.99 | "ars" | "no es SSDD" | - | 1221 | 0.3 | 3659.34 | 596 | "Sujeto Alcanzado" | 12197.79 | 0.3 | 3659.34 | 990 | "NO_SSDD" | 12197.79 | 0 | 0 | 956 | "EX" | 12197.79 | 0 | 0 | 0 | "-" | 12197.79 |
      | 23 | IIBB | "2024-11-11 00:00:00" | 3000000007 | 921 | 12210 | 10 | "ars" | "Netflix" | B | 1221 | 0.3 | 3663 | 596 | "Sujeto Alcanzado" | 12210 | 0.08 | 976.8 | 989 | "SSDD" | 12210 | 0 | 0 | 956 | "EX" | 12210 | 0 | 0 | 0 | "-" | 12210 |
      | 24 | IIBB | "2024-11-11 00:00:00" | 3000000007 | 922 | 12222.21 | 10.01 | "ars" | "no es SSDD" | - | 1221 | 0.3 | 3666.66 | 596 | "Sujeto Alcanzado" | 12222.21 | 0.3 | 3666.66 | 990 | "NO_SSDD" | 12222.21 | 0 | 0 | 956 | "EX" | 12222.21 | 0 | 0 | 0 | "-" | 12222.21 |
      | 25 | IIBB | "2024-11-11 00:00:00" | 3000000007 | 923 | 12222.21 | 10.01 | "ars" | "GOOGLE *YouTubeP P15kvqUY" | A | 1221 | 0 | 0 | 596 | "EX" | 12222.21 | 0.08 | 977.78 | 989 | "SSDD" | 12222.21 | 0 | 0 | 956 | "EX" | 12222.21 | 0.03 | 366.67 | 2 | "AC" | 12222.21 |
      | 26 | IIBB | "2024-11-11 00:00:00" | 3000000007 | 924 | 12222.21 | 10.01 | "ars" | "no es SSDD" | - | 1221 | 0.3 | 3666.66 | 596 | "Sujeto Alcanzado" | 12222.21 | 0.3 | 3666.66 | 990 | "NO_SSDD" | 12222.21 | 0 | 0 | 956 | "EX" | 12222.21 | 0 | 0 | 0 | "-" | 12222.21 |











