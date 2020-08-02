package com.fmjava.core.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fmjava.core.pojo.entity.PageResult;
import com.fmjava.core.pojo.entity.Result;
import com.fmjava.core.pojo.entity.SpecEntity;
import com.fmjava.core.pojo.specification.Specification;
import com.fmjava.core.service.SpecService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/spec")
public class SpecController {
    @Reference
    SpecService specService;
    @RequestMapping("/findPage")
    public PageResult findPageSpec(Integer page, Integer pageSize, @RequestBody Specification spec){
        return specService.findPageSpec(page,pageSize,spec);
    }
    @RequestMapping("/save")
    public Result save(@RequestBody SpecEntity specEntity){
       try {
           specService.save(specEntity);
           return new Result(true,"保存成功");
       }catch (Exception e){
           return new Result(false,"保存失败");
       }
    }

    @RequestMapping("/findSpecById")
    public SpecEntity findSpecById(Long id){
       return specService.findSpecById(id);
    }
    @RequestMapping("/update")
    public Result update(@RequestBody SpecEntity specEntity){
        try {
            specService.update(specEntity);
            return new Result(true,"更新成功");
        }catch (Exception e){
            return new Result(false,"更新失败");
        }
    }
    @RequestMapping("/deleteById")
    public Result deleteById(@RequestParam Long[] id){
        try {
            specService.deleteById(id);
            return new Result(true,"删除成功");
        }catch (Exception e){
            return new Result(false,"删除失败");
        }
    }
}
