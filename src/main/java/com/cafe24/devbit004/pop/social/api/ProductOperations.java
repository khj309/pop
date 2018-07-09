package com.cafe24.devbit004.pop.social.api;

import java.util.List;
import java.util.Map;

public interface ProductOperations {

    List<Product> getProducts(Map<String, Object> params);
}
