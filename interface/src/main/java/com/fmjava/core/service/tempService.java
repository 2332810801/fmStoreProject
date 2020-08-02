package com.fmjava.core.service;

import com.fmjava.core.pojo.entity.PageResult;
import com.fmjava.core.pojo.good.Brand;
import com.fmjava.core.pojo.template.TypeTemplate;

public interface tempService {

    PageResult findPage(Integer page, Integer pageSize, TypeTemplate searchTemp);

    void add(TypeTemplate template);

    void deleteById(Long[] id);

    TypeTemplate findWithId(Long id);

    void update(TypeTemplate template);
}
