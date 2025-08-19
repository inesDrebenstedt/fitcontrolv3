package de.fitcontrol.restapi.controller.json;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RepDto {
    private Long id;
    private String category; // "NORMAL", "FAILURE", etc.
}
