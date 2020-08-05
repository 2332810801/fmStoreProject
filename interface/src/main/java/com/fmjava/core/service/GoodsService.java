package com.fmjava.core.service;

import com.fmjava.core.pojo.entity.GoodsEntity;
import com.fmjava.core.pojo.entity.PageResult;
import com.fmjava.core.pojo.good.Goods;

public interface GoodsService {
    void add(GoodsEntity goodsEntity);

    PageResult findPage(Integer page, Integer pageSize, Goods goods);
}
