package com.fmjava.core.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fmjava.core.pojo.entity.PageResult;
import com.fmjava.core.pojo.entity.Result;
import com.fmjava.core.pojo.good.Brand;
import com.fmjava.core.pojo.template.TypeTemplate;
import com.fmjava.core.service.tempService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/temp")
public class tempController {
    @Reference
    private tempService service;
    @RequestMapping("/findPage")
    public PageResult findPage(Integer page, Integer pageSize,@RequestBody TypeTemplate searchTemp){
        return service.findPage(page,pageSize,searchTemp);
    }

    @RequestMapping("/add")
    public Result add(@RequestBody TypeTemplate template) {
        try {
            service.add(template);
            return new Result(true, "添加成功!");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "添加失败!");
        }
    }

    @RequestMapping("/deleteById")
    public Result deleteById(Long[] id){
        try {
            service.deleteById(id);
            return new Result(true, "删除成功!");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "删除失败!");
        }
    }
    @RequestMapping("/findWithId")
    public TypeTemplate findWithId(Long id){
        return service.findWithId(id);
    }
    @RequestMapping("/update")
    public Result update(@RequestBody TypeTemplate template){
        try {
            service.update(template);
            return new Result(true, "更新成功!");
        } catch (Exception e) {
            e.printStackTrace();
            return new Result(false, "更新失败!");
        }
    }
}
