package com.fmjava.core.service;

import com.fmjava.core.pojo.entity.GoodsEntity;
import com.fmjava.core.pojo.entity.PageResult;
import com.fmjava.core.pojo.entity.Result;
import com.fmjava.core.pojo.good.Goods;

public interface GoodsService {
    /**
     * 添加商品
     * @param goodsEntity
     */
    void add(GoodsEntity goodsEntity);

    /**
     * 分页查询商品列表
     * @param page
     * @param pageSize
     * @param goods
     * @return
     */
    PageResult findPage(Integer page, Integer pageSize, Goods goods);

    /**
     * 根据主键查询商品
     * @param id
     * @return
     */
    GoodsEntity findOne(Long id);

    /**
     * 修改商品信息
     * @param goodsEntity
     */
    void update(GoodsEntity goodsEntity);

    /**
     * 批量删除商品信息
     * @param ids
     */
    void delete(Long[] ids);

    /**
     * 审核商品信息
     * @param ids
     * @param status
     */
    void updateStatus(Long[] ids, String status);
}
