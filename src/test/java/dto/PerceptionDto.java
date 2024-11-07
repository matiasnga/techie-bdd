package dto;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class PerceptionDto {
    private String id;
    private String type;
    private BigDecimal taxBase;
    private String taxRegimeCode;
    private BigDecimal rate;
    private BigDecimal amount;
}
