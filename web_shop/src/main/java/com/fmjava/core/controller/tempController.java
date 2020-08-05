package com.fmjava.core.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fmjava.core.pojo.entity.PageResult;
import com.fmjava.core.pojo.entity.Result;
import com.fmjava.core.pojo.template.TypeTemplate;
import com.fmjava.core.service.tempService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/temp")
public class tempController {
    @Reference
    private tempService service;
    @RequestMapping("/findOne")
    public TypeTemplate findOne(Long id) {
        return service.findOne(id);
    }
    @RequestMapping("/findBySpecList")
    public List<Map> findBySpecList(Long id){
        List<Map> bySpecList = service.findBySpecList(id);
        return bySpecList;
    }
}
