package com.fmjava.core.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.fmjava.core.pojo.entity.PageResult;
import com.fmjava.core.pojo.entity.Result;
import com.fmjava.core.pojo.seller.Seller;
import com.fmjava.core.service.SellerService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/seller")
public class SellerController {
    @Reference
    private SellerService sellerService;
    @RequestMapping("/findPage")
    public PageResult findPage(Integer page, Integer pageSize, @RequestBody Seller seller){
        return sellerService.findPage(page,pageSize,seller);
    }

    @RequestMapping("/sellerdetail")
    public Seller sellerdetail(String sellerId){
        return sellerService.sellerdetail(sellerId);
    }
    @RequestMapping("/updateStatus")
    public Result updateStatus(@RequestBody Seller seller){
        try {
            sellerService.updateStatus(seller);
            return new Result(true,"审核完成");
        }catch (Exception e){
            return new Result(false,"审核失败");
        }

    }
}
