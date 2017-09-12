/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Usuario
 */

@Controller
public class HomeController {
    
    @RequestMapping("home.htm")
    public ModelAndView home(HttpServletRequest request){
        ModelAndView v = new ModelAndView();
        v.setViewName("home");
        return v;
    }
    
    @RequestMapping("contactanos.htm")
    public ModelAndView contactanos(){
        return new ModelAndView("contactanos");
    }
    
}
