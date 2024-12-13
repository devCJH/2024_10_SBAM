package com.example.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {
   
   @GetMapping("/test/main")
   public String main() {
      return "test/main";
   }
   
//   @PostMapping("/test/checkboxTest")
//   @ResponseBody
//   public String test(@RequestBody List<String> testList) {
//
//      for (String s : testList) {
//         System.out.println(s);
//      }
//      return "S";
//   }
   
   @PostMapping("/test/checkboxTest")
   @ResponseBody
   public String test(@RequestParam(value="tl[]") List<String> testList) {
      
      for (String s : testList) {
         System.out.println(s);
      }
      return "S";
   }
}
