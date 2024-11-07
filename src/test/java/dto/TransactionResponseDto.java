package dto;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class TransactionResponseDto {
    private BigDecimal amountInArs;
    private BigDecimal amountInUsd;
    private String paymentMethod;
    private String currency;
}
