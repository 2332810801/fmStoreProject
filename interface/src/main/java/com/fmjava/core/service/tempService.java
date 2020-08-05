package com.fmjava.core.service;

import com.fmjava.core.pojo.entity.PageResult;
import com.fmjava.core.pojo.good.Brand;
import com.fmjava.core.pojo.template.TypeTemplate;

import java.util.List;
import java.util.Map;

public interface tempService {
    //分页查询模板
    PageResult findPage(Integer page, Integer pageSize, TypeTemplate searchTemp);
    //添加模板
    void add(TypeTemplate template);
    //根据主键数组批量删除模板
    void deleteById(Long[] id);
    //根据主键查询模板
    TypeTemplate findWithId(Long id);
    //修改模板
    void update(TypeTemplate template);
    //根据主键查询模板
    TypeTemplate findOne(Long id);
    //查询规格与规格选项
    List<Map> findBySpecList(Long id);
}
