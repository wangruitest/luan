package rml.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import rml.model.MUser;

public interface BigScreenMapper {
    List<Map<String, Object>> getAll();

    int getYesterdayTouristCount();

    List<Map<String, Object>> getYesterdayTopTenCityTouristCountEntireCountry();
}