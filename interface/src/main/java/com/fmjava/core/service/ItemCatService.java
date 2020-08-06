package com.fmjava.core.service;

import com.fmjava.core.pojo.item.ItemCat;

import java.util.List;

public interface ItemCatService {
    /**
     * 查询根据父id查询分类信息
     * @param parentId
     * @return
     */
    List<ItemCat> findByParentId(Long parentId);

    /**
     * 根据id查询分类信息
     * @param id
     * @return
     */
    ItemCat findTypeId(Long id);

    /**
     * 查询所以分类信息
     * @return
     */
    List<ItemCat> findAll();
}
