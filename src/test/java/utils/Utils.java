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
import lombok.SneakyThrows;

import java.io.File;
import java.io.FileReader;
import java.lang.reflect.Type;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

public class Utils {

    public String generateRequestJson(String date, long taxpayerId, long jurisdiction, String currency, float amount, String merchant) {

        PaymentRequestDto perceptionRequestDto = new PaymentRequestDto();
        perceptionRequestDto.setDate(LocalDateTime.ofInstant(Instant.now(), ZoneId.systemDefault()));
        perceptionRequestDto.setExternalId(UUID.randomUUID().toString());

        TaxpayerDto taxpayerDto = new TaxpayerDto();
        taxpayerDto.setTaxpayerId(taxpayerId);
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

    public String mapExcelToJsonRequest(List<Map<String, String>> data, int row) {
        PaymentRequestDto perceptionRequestDto = new PaymentRequestDto();
        perceptionRequestDto.setDate(LocalDateTime.ofInstant(Instant.now(), ZoneId.systemDefault()));
        perceptionRequestDto.setExternalId(UUID.randomUUID().toString());

        TaxpayerDto taxpayerDto = new TaxpayerDto();
        taxpayerDto.setTaxpayerId(Long.valueOf(data.get(row).get("taxpayerId")));
        taxpayerDto.setJurisdiction(Long.valueOf(data.get(0).get("jurisdiction")));
        perceptionRequestDto.setTaxpayer(taxpayerDto);

        TransactionDto transactionDto = new TransactionDto();
        transactionDto.setAmount(new BigDecimal(data.get(row).get("amount")).setScale(2, RoundingMode.HALF_UP));
        transactionDto.setPaymentMethod(data.get(row).get("paymentMethod"));
        transactionDto.setCurrency(data.get(row).get("currency"));
        perceptionRequestDto.setTransaction(transactionDto);

        MerchantDto newMerchant = new MerchantDto();
        newMerchant.setSoftDescriptor(data.get(row).get("merchant"));
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

    @SneakyThrows
    public String getContentFromFile(String filePath) {
        return Files.readString(Paths.get(filePath));
    }

}
