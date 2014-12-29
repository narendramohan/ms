package com.ms.spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;





import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.ms.spring.dao.KeywordRepository;
import com.ms.spring.model.JqGridModel;
import com.ms.spring.model.Keyword;
import com.ms.spring.service.AdminService;
import com.ms.spring.vo.ViewPage;

@Controller
public class SearchController {

	@Autowired
	AdminService adminService;
	
	@RequestMapping (value="search")
	public @ResponseBody List<JqGridModel> search(){
		JqGridModel gridModel1 = new JqGridModel();
        gridModel1.setId(1);
        gridModel1.setFirstName("Mohaideen");
        gridModel1.setLastName("Jamil");
        gridModel1.setCity("Coimbatore");
        gridModel1.setState("TamilNadu");

        JqGridModel gridModel2 = new JqGridModel();
        gridModel2.setId(2);
        gridModel2.setFirstName("Ameerkhan");
        gridModel2.setLastName("Saffar");
        gridModel2.setCity("Thirunelveli");
        gridModel2.setState("Tamilnadu");

        List<JqGridModel> jqGridModels = new ArrayList<>();
        jqGridModels.add(gridModel1);
        jqGridModels.add(gridModel2);

        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String jsonArray = gson.toJson(jqGridModels);
        jsonArray = "{\"page\":1,\"total\":\"2\",\"records\":"
                + jqGridModels.size() + ",\"rows\":" + jsonArray + "}";

       // System.out.println(jsonArray);

        //response.getWriter().print(jsonArray);
		return jqGridModels;
	}
	
	@RequestMapping (value="loadKeyowrds")
	public @ResponseBody String loadKeyowrds(){
        List<Keyword> jqGridModels = adminService.loadKeywords();     

        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String jsonArray = gson.toJson(jqGridModels);
        jsonArray = "{\"page\":1,\"total\":\"2\",\"records\":"
                + jqGridModels.size() + ",\"rows\":" + jsonArray + "}";

      //  System.out.println(jsonArray);

        //response.getWriter().print(jsonArray);
		return jsonArray;
	}
	
	
	

}
