package Dto;

import lombok.Data;


@Data
public class CountryDto {
    public String capital;
    public String flagDescription;
    public String domain;
    public Long population;

    public void setFlagDescription(String flagDescription) {
        this.flagDescription = flagDescription.toLowerCase();
    }

    public void setCapital(String capital) {
        this.capital = capital
                .replace("á", "a")
                .replace("é", "e")
                .replace("í", "i")
                .replace("ó", "o")
                .replace("ú", "u")
                .replace("Á", "A")
                .replace("É", "E")
                .replace("Í", "I")
                .replace("Ó", "O")
                .replace("Ú", "U");
    }
}
