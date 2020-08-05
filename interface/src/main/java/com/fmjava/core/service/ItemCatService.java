package com.fmjava.core.service;

import com.fmjava.core.pojo.item.ItemCat;

import java.util.List;

public interface ItemCatService {

     List<ItemCat> findByParentId(Long parentId);

    ItemCat findTypeId(Long id);

    List<ItemCat> findAll();
}
