package com.fmjava.core.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fmjava.core.pojo.item.ItemCat;
import com.fmjava.core.service.ItemCatService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/itemCat")
public class ItemCatController {

    @Reference
    ItemCatService service;
    @RequestMapping("/findByParentId")
    public List<ItemCat> findByParentId(Long parentId){
        return service.findByParentId(parentId);
    }
    @RequestMapping("/findTypeId")
    public ItemCat findTypeId(Long id){
        return service.findTypeId(id);
    }
}
