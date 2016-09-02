package ua.goit.timonov.enterprise.module_9.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Date;
import java.util.Map;
import java.util.logging.Logger;

/**
 * Created by Alex on 01.09.2016.
 */

@Controller
public class MainController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Map<String, Object> model) {
        model.put("currentTime", new Date().toString());
        System.out.println("In main controller 1");
        return "index";
    }

    @RequestMapping(value = "/", method = RequestMethod.POST)
    public String indexPost(Map<String, Object> model) {
        model.put("currentTime", new Date().toString());
        return "index";
    }

}
