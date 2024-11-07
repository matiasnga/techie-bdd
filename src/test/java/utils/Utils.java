package utils;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
import dto.MerchantDto;
import dto.PaymentRequestDto;
import dto.TaxpayerDto;
import dto.TransactionDto;

import java.lang.reflect.Type;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

public class Utils {

    public String generateRequestJson(int date, String taxpayerId, long jurisdiction, String currency, float amount, String merchant) {

        PaymentRequestDto perceptionRequestDto = new PaymentRequestDto();
        perceptionRequestDto.setDate(LocalDateTime.ofInstant(Instant.now(), ZoneId.systemDefault()));
        perceptionRequestDto.setExternalId(UUID.randomUUID().toString());

        TaxpayerDto taxpayerDto = new TaxpayerDto();
        taxpayerDto.setId(taxpayerId);
        taxpayerDto.setJurisdiction(jurisdiction);
        perceptionRequestDto.setTaxpayer(taxpayerDto);

        TransactionDto transactionDto = new TransactionDto();
        transactionDto.setAmount(BigDecimal.valueOf(amount).setScale(2, RoundingMode.HALF_UP));
        transactionDto.setPaymentMethod("credit");
        transactionDto.setCurrency(currency);
        perceptionRequestDto.setTransaction(transactionDto);

        MerchantDto newMerchant = new MerchantDto();
        newMerchant.setSoftDescriptor(merchant);
        perceptionRequestDto.setMerchant(newMerchant);

        Gson gson = new GsonBuilder()
                .registerTypeAdapter(LocalDateTime.class, new JsonSerializer<LocalDateTime>() {
                    @Override
                    public JsonElement serialize(LocalDateTime src, Type typeOfSrc, JsonSerializationContext context) {
                        return new JsonPrimitive(src.format(DateTimeFormatter.ISO_LOCAL_DATE_TIME));
                    }
                })
                .create();
        return gson.toJson(perceptionRequestDto);
    }
}
