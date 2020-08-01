package com.fmjava.core.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fmjava.core.pojo.entity.PageResult;
import com.fmjava.core.pojo.entity.Result;
import com.fmjava.core.pojo.good.Brand;
import com.fmjava.core.service.BrandService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;

@RestController
@RequestMapping("/brand")
public class BrandController {
    @Reference
    private BrandService service;

    /**
     * 查询品牌信息
     * @return
     */
    @RequestMapping("/findBrandAll")
    public List<Brand> findBrandAll(){
       return service.findBrandAll();
    }

    /**
     * 分页查询品牌信息
     * @param page
     * @param pageSize
     * @return
     */
    @RequestMapping("/findPage")
    public PageResult findPage(Integer page, Integer pageSize,@RequestBody Brand brand){
        return service.findPage(page,pageSize,brand);
    }

    /**
     * 添加品牌信息
     * @param brand
     * @return
     */
    @RequestMapping("/add")
    public Result addBrand(@RequestBody Brand brand){
        try {
            service.addBrand(brand);
            return new Result(true,"添加成功");
        }catch (Exception e){
            return new Result(false,"添加失败");
        }
    }
    @RequestMapping("/findById")
    public Brand findById(Long id){
       return service.findById(id);
    }
    @RequestMapping("/update")
    public Result update(@RequestBody Brand brand){
        try {
            service.update(brand);
            return new Result(true,"更新成功");
        }catch (Exception e){
            return new Result(false,"更新失败");
        }
    }
    @RequestMapping("/deleteById")
    public Result deleteById(@RequestParam Long[] id){
        try {
            service.deleteById(id);
            return new Result(true,"删除成功");
        }catch (Exception e){
            return new Result(false,"删除失败");
        }
    }
}
