package com.fmjava.core.service;

import com.fmjava.core.pojo.entity.PageResult;
import com.fmjava.core.pojo.entity.Result;
import com.fmjava.core.pojo.seller.Seller;

public interface SellerService {
    /**
     * 商家入驻
     * @param seller
     */
     void add(Seller seller);

    /**
     * 分页商家查询
     * @param page
     * @param pageSize
     * @param seller
     * @return
     */
     PageResult findPage(Integer page, Integer pageSize,Seller seller);

    /**
     * 商家详情
     * @param sellerId
     * @return
     */
     Seller sellerdetail(String sellerId);

    /**
     * 商家审核
     * @param seller
     */
     void updateStatus(Seller seller);
}
