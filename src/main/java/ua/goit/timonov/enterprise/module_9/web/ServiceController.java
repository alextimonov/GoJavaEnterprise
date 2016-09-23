package ua.goit.timonov.enterprise.module_9.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Date;
import java.util.Map;

/**
 * Created by Alex on 14.09.2016.
 */
@Controller
//@RequestMapping("/service")
public class ServiceController {

    @RequestMapping(value = "/service", method = RequestMethod.GET)
    public String service(Map<String, Object> model) {
        model.put("currentTime", new Date().toString());
        return "service";
    }

}
