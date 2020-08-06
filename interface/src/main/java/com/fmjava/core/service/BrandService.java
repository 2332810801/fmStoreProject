package com.fmjava.core.service;

import com.fmjava.core.pojo.entity.PageResult;
import com.fmjava.core.pojo.good.Brand;

import java.util.List;

public interface BrandService {
    /**
     * 查询所有品牌信息
     * @return
     */
    List<Brand> findBrandAll();

    /**
     * 分页查询品牌信息
     * @param page 当前页码
     * @param pageSize 查询数
     * @param brand 查询实体
     * @return
     */
    PageResult findPage(Integer page, Integer pageSize, Brand brand);

    /**
     * 添加品牌信息
     * @param brand
     */
    void addBrand(Brand brand);

    /**
     * 根据主键查询品牌信息
     * @param id
     * @return
     */
    Brand findById(Long id);

    /**
     * 根据主键修改品牌信息
     * @param brand
     */
    void update(Brand brand);

    /**
     * 批量删除品牌
     * @param id
     */
    void deleteById(Long[] id);

    /**
     * 查询品牌列表
     * @return
     */
    List<Brand> selectOptionList();
}
