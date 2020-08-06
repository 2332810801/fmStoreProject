package com.fmjava.core.service;

import com.fmjava.core.pojo.entity.PageResult;
import com.fmjava.core.pojo.entity.SpecEntity;
import com.fmjava.core.pojo.specification.Specification;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

public interface SpecService {
    /**
     * 分页规格查询
     * @param page
     * @param pageSize
     * @param spec
     * @return
     */
    PageResult findPageSpec(Integer page, Integer pageSize,Specification spec);

    /**
     * 添加规格
     * @param specEntity
     */
    void save(SpecEntity specEntity);

    /**
     * 根据id查询规格
     * @param id
     * @return
     */
    SpecEntity findSpecById(Long id);

    /**
     * 修改规格
     * @param specEntity
     */
    void update(SpecEntity specEntity);

    /**
     * 删除规格
     * @param id
     */
    void deleteById(Long[] id);

    /**
     * 查询规格
     * @return
     */
    List<Specification> selectOptionList();
}
