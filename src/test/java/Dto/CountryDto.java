package Dto;

import lombok.Data;

@Data
public class CountryDto {
    public String capital;
    public String flagDescription;
    public String domain;
    public Integer population;

    public void setFlagDescription(String flagDescription) {
        this.flagDescription = flagDescription.toLowerCase();
    }
}
