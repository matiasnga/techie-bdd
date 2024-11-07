package dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class PaymentRequestDto {
    private String externalId;
    private LocalDateTime date;
    private TaxpayerDto taxpayer;
    private TransactionDto transaction;
    private MerchantDto merchant;
}
