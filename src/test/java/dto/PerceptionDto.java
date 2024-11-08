package dto;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class PerceptionDto {
    private Long taxCode;
    private Long taxRegimeCode;
    private String type;
    private BigDecimal taxBase;
    private BigDecimal rate;
    private BigDecimal amount;
}
