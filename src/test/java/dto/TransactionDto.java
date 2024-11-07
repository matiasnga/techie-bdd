package dto;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class TransactionDto {
    private BigDecimal amount;
    private String paymentMethod;
    private String currency;
}
