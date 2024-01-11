package com.controller;

import com.model.Account;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ClientController {
    @RequestMapping("/ClientController.do")
    public ModelAndView ClientController(@ModelAttribute("Account") Account account){
        System.out.println("获取到post请求了！"+account.toString());

        /*创建视图层对象*/
        ModelAndView mav=new ModelAndView();
        mav.setViewName("1104");
        mav.addObject("account",account);
        return mav;
    }
}
