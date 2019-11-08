package com.funo.services;

import javax.jws.WebService;

@WebService
public interface IPhoneServices {
    /*
    public String queryRegionInfos(String username,String password,
                                   Long cityCode);
    public String querySingleRegionInfo(String username,String password,
                                        Long cityCode, Long regionId);
    public String queryTouristsDay(String username,String password,
                                   Long cityCode, Long regionId);
    public String queryTouristsRealtime(String username,String password,
                                        Long cityCode);
    public String queryNotices(String username,String password,
                               Long cityCode, Long regionId, String time);*/

    public String getTouristFromToAnhui(String username, String password,
                                        String searchDate);
    public String getTouristByScenic(String username, String password,
                                     String searchDate, String scenicCode);
    public String getRealtimeByScenic(String username, String password,
                               String scenicCode);
    public String getOverNightByCity(String username, String password,
    							String cityCode,String searchDate);
    
    public String getRealTimeToday(String username, String password,
    							String scenicCode);
    
    
} 
