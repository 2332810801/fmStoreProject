package com.fmjava.core.service;

import com.fmjava.core.pojo.entity.PageResult;
import com.fmjava.core.pojo.entity.Result;
import com.fmjava.core.pojo.seller.Seller;

public interface SellerService {
     void add(Seller seller);
     PageResult findPage(Integer page, Integer pageSize,Seller seller);

    Seller sellerdetail(String sellerId);

    void updateStatus(Seller seller);
}
