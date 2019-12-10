package rml.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import rml.dao.BigScreenMapper;

import java.util.List;
import java.util.Map;

@Service("bigScreenService")
public class BigScreenService {
    @Autowired
    BigScreenMapper bigScreenMapper;

    public List<Map<String, Object>> getAll() {
        return bigScreenMapper.getAll();
    }

    public int getYesterdayTouristCount() {
        return bigScreenMapper.getYesterdayTouristCount();
    }

    public List<Map<String, Object>> getYesterdayTopTenCityTouristCountEntireCountry() {

        return bigScreenMapper.getYesterdayTopTenCityTouristCountEntireCountry();
    }
}
