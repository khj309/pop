package com.cafe24.devbit004.pop.social.api.impl.json;

import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public abstract class Cafe24ObjectMixin {

    @JsonAnySetter
    abstract void add(String key, Object value);
}
