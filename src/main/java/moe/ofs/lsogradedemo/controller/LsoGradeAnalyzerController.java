package moe.ofs.lsogradedemo.controller;

import lombok.extern.slf4j.Slf4j;
import moe.ofs.lsogradedemo.model.LandingGrade;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Slf4j
@Controller
public class LsoGradeAnalyzerController {

    // define service locale as JVM option such as -Dlso.locale=zh_CN
    @Value("${lso.locale:}")
    private String locale;

    @RequestMapping(value = "/grade")
    public String inputLsoGrade() {
        return "LsoGradeForm";
    }

    @RequestMapping(value = "/view-grade", method = RequestMethod.POST)
    public String viewLsoGrade(LandingGrade landingGrade,
                               Model model,
                               RedirectAttributes redirectAttributes) {

        RestTemplate restTemplate = new RestTemplate();

        String gradeServiceUrl = locale.isEmpty() ? "http://localhost:8881/v1/lsograde/parse/" :
                "http://localhost:8881/v1/lsograde/parse/" + locale + "/";

        HttpHeaders headers = new HttpHeaders();
//        headers.setContentType(MediaType.TEXT_PLAIN);

        HttpEntity<String> requestEntity = new HttpEntity<>(landingGrade.getRawGrade(), headers);

        ResponseEntity<LandingGrade> response =
                restTemplate.exchange(gradeServiceUrl, HttpMethod.POST, requestEntity, LandingGrade.class);

//        ResponseEntity<LandingGrade> response =
//                restTemplate.postForEntity(gradeServiceUrl, landingGrade, LandingGrade.class);

        model.addAttribute("grade", response.getBody());

        return "LsoGradeView";
    }

    @RequestMapping(value = "/show/{id}", method = RequestMethod.POST)
    @ResponseBody
    public LandingGrade showLsoGrade(@PathVariable("id") String landingId) {

        RestTemplate restTemplate = new RestTemplate();
        String gradeServiceUrl
                = "http://localhost:8881/v1/lsograde/show/" + landingId + "/";
        ResponseEntity<LandingGrade> response
                = restTemplate.getForEntity(gradeServiceUrl + "/zh_CN", LandingGrade.class);

        return response.getBody();
    }

}
