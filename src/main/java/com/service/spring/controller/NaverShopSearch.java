package com.service.spring.controller;

import com.service.spring.domain.Snack;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;

public class NaverShopSearch {

    public NaverShopSearch() {
    }

    public static List<Snack> search(int start, String option, String category, int display) {
        RestTemplate rest = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.add("X-Naver-Client-Id", "izKbppH3AqXMDojvYn0E");
        headers.add("X-Naver-Client-Secret", "ewN4O9X02x");
        String body = "";

        String query = makeQuery(start, option, display);

        HttpEntity<String> requestEntity = new HttpEntity<String>(body, headers);
        ResponseEntity<String> responseEntity = rest.exchange(query, HttpMethod.GET, requestEntity, String.class);

//        HttpStatus httpStatus = responseEntity.getStatusCode();
//        int status = httpStatus.value();
//        System.out.println("Response status: " + status);

        String response = responseEntity.getBody();

        return fromJSONtoItems(response, category);
    }

    private static String makeQuery(int start, String option, int display) {
        return "https://openapi.naver.com/v1/search/shop.json?sort=sim&display=" + Integer.toString(display)
                + "&query=" + option + "&start=" + Integer.toString(start);
    }

    public static List<Snack> makeList(int start, String option, String category, int display) {
        return search(start, option, category, display);
    }

//    public static void main(String[] args) {
//        NaverShopSearch naverShopSearch = new NaverShopSearch();
//        List<Snack> snacks = naverShopSearch.makeList();
//        for (Snack s : snacks) {
//            System.out.println(s.toString());
//        }
//    }

    private static List<Snack> fromJSONtoItems(String result, String category) {
        
        JSONObject rjson = new JSONObject(result);
//        System.out.println("total = " + rjson.get("total"));

        JSONArray items = rjson.getJSONArray("items");
//        System.out.println("JSON LIST LENGTH = " + items.length());
        
        List<Snack> itemDtoList = new ArrayList<>();

        for (int i = 0; i < items.length(); i++) {
            JSONObject itemJson = (JSONObject) items.get(i);
            if (((JSONObject) items.get(i)).getString("title").contains("x")) continue;
            if (((JSONObject) items.get(i)).getString("title").contains("X")) continue;
            if (((JSONObject) items.get(i)).getString("title").contains("대용량")) continue;
            if (((JSONObject) items.get(i)).getString("title").contains("바나나킥")) continue;
            if (((JSONObject) items.get(i)).getString("title").contains("/")) continue;
            if (((JSONObject) items.get(i)).getString("title").contains("+")) continue;
            if (((JSONObject) items.get(i)).getString("title").length() >= 30) continue;
            if (Integer.parseInt(((JSONObject) items.get(i)).getString("lprice")) >= 3000) continue;
            Snack snack = new Snack(itemJson, category, 40);
            if (snack.getName().isEmpty() || snack.getImgUrl().isEmpty() || snack.getLink().isEmpty()) continue;
            itemDtoList.add(snack);
        }
        return itemDtoList;
    }
}