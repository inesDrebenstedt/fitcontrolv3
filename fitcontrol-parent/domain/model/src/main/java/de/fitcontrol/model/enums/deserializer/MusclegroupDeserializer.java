package de.fitcontrol.model.enums.deserializer;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;

import de.fitcontrol.model.enums.MuscleGroup;

import java.io.IOException;
import java.util.Arrays;

public class MusclegroupDeserializer extends JsonDeserializer<MuscleGroup> {
    @Override
    public MuscleGroup deserialize(JsonParser jsonParser, DeserializationContext ctxt) throws IOException {
        String value = jsonParser.getText().replace(" ", "_");
        
        return Arrays.stream(MuscleGroup.values())
                .filter(musclegroup -> musclegroup.name().equalsIgnoreCase(value))
                .findFirst()
                .orElseThrow(() -> new IllegalArgumentException("Invalid muscle group: " + value));
    }
}