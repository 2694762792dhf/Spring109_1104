package com.controller;

import com.model.Account;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

@RestController
public class DataSenderController {

    private final RestTemplate restTemplate;

    public DataSenderController(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    @PostMapping("/sendData")
    public ResponseEntity<String> sendData(@ModelAttribute("Account") Account account) {
        System.out.println("sendData::::" + account.toString());


        String receiverUrl = "http://localhost:8082/Spring109_centralBank/receiveData.do";

        // 设置 HTTP 头
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        // 使用数据和头信息创建请求实体
        HttpEntity<Account> requestEntity = new HttpEntity<>(account, headers);

        // 发送 HTTP POST 请求并获取响应
        ResponseEntity<String> responseEntity = restTemplate.postForEntity(receiverUrl, requestEntity, String.class);

        return responseEntity;
    }
}


