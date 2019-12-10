package rml.controller;

import com.sun.xml.internal.ws.developer.SerializationFeature;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import rml.JSONMapperFactory;
import rml.model.MUser;
import rml.service.BigScreenService;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/bigScreen")
public class BigScreenController {



    @Autowired
    BigScreenService bigScreenService;

    @RequestMapping(value="/test.do")
    @ResponseBody
    public List<Map<String, Object>> listUser(HttpServletRequest request) {
        List<Map<String, Object>> list = bigScreenService.getAll();
        request.setAttribute("data", list);



//        JSONMapperFactory jsonMapperFactory = new JSONMapperFactory();
//        ObjectMapper objectMapper = null;
//        String datas = null;
//        try {
//            objectMapper = jsonMapperFactory.getObject();
//            datas = objectMapper.writeValueAsString(returnMap);
//        } catch (Exception e) {
//            this.log.error("���������������������������", e);
//        }
//        response.setContentType("application/json;charset=UTF-8");
        return list;
    }

    @RequestMapping("getYesterdayTouristCount.do")
    @ResponseBody
    public int getYesterdayTouristCount(){
//        Date now=new Date();
//        Calendar cal=Calendar.getInstance();
//        cal.add(Calendar.DATE,   -1);
//        String yesterday = new SimpleDateFormat( "yyyy-MM-dd ").format(cal.getTime());
        int result= bigScreenService.getYesterdayTouristCount();

        return result;
    }


    @RequestMapping("getYesterdayTopTenCityTouristCountEntireCountry.do")
    @ResponseBody
    public List<Map<String, Object>> getYesterdayTopTenCityTouristCountEntireCountry(){
//        Date now=new Date();
//        Calendar cal=Calendar.getInstance();
//        cal.add(Calendar.DATE,   -1);
//        String yesterday = new SimpleDateFormat( "yyyy-MM-dd ").format(cal.getTime());
        List<Map<String, Object>> result= bigScreenService.getYesterdayTopTenCityTouristCountEntireCountry();

        return result;
    }

}
