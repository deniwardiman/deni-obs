package com.deni.obs.controller;

import com.deni.obs.model.DataTableModel;
import com.deni.obs.model.Ranks;
import com.deni.obs.service.RankService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.LinkedList;
import java.util.List;

@Controller
@RestController
@RequestMapping("/rank")
public class RankController extends AbstractBaseController {

    private final RankService rankService;

    @Autowired
    public RankController(RankService rankService) {
        this.rankService = rankService;
    }
    @RequestMapping(value = "/lists", method = RequestMethod.GET)
    public DataTableModel lists(HttpServletRequest request) {
        String filter = request.getParameter("filter");
        String filterValue = request.getParameter("filterValue");
        String name = request.getParameter("search[value]");
        if(filterValue != null){
            if(!filterValue.trim().equals("")) name = filterValue.trim();
        }

        Integer pageSize = Integer.valueOf(request.getParameter("length"));
        Integer page = Integer.valueOf(request.getParameter("start")) / pageSize;
        String sortBy = "department";
        String order = request.getParameter("order[0][dir]");
        switch(Integer.valueOf(request.getParameter("order[0][column]"))) {
            case 1 :  sortBy = "department"; break;
            case 2 :  sortBy = "student"; break;
            case 3 :  sortBy = "mark"; break;
            case 4 :  sortBy = "pass"; break;
        }

        Pageable pageable = PageRequest.of(page, pageSize, order.equalsIgnoreCase("desc") ? Sort.Direction.DESC : Sort.Direction.ASC, sortBy);
        Page<Ranks> items = rankService.findAll(pageable, name);
        Long totalRow = rankService.findTotalRow();

        List<Object> an = new LinkedList<>();
        for(Ranks dt : items) {
            an.add(dt);
        }
        Integer draw = Integer.valueOf(request.getParameter("draw"));

        return new DataTableModel(draw, totalRow, (int) items.getTotalElements(), an);
    }
}
