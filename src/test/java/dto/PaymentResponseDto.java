package dto;

import lombok.Data;

import java.util.List;
import java.util.UUID;

@Data
public class PaymentResponseDto {
    private UUID id;
    private String externalId;
    private String date;
    private TaxpayerDto taxpayer;
    private TransactionResponseDto transaction;
    private MerchantDto merchant;
    private List<PerceptionDto> perceptions;
}
