package com.fmjava.core.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.fmjava.core.dao.template.TypeTemplateDao;
import com.fmjava.core.pojo.entity.PageResult;
import com.fmjava.core.pojo.template.TypeTemplate;
import com.fmjava.core.pojo.template.TypeTemplateQuery;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;

@Service
@Transactional
public class tempServiceImpl implements tempService {
    @Autowired
    TypeTemplateDao templateDao;
    @Override
    public PageResult findPage(Integer page, Integer pageSize, TypeTemplate searchTemp) {
        PageHelper.startPage(page,pageSize);
        TypeTemplateQuery templateQuery = new TypeTemplateQuery();
        if(searchTemp!=null){
            if(searchTemp.getName()!=null&&!"".equals(searchTemp.getName())){
                TypeTemplateQuery.Criteria criteria = templateQuery.createCriteria();
                criteria.andNameLike("%"+searchTemp.getName()+"%");
            }
        }
        Page<TypeTemplate> typeTemplates = (Page<TypeTemplate>)templateDao.selectByExample(templateQuery);
        return new PageResult(typeTemplates.getTotal(),typeTemplates.getResult());
    }

    @Override
    public void add(TypeTemplate template) {
        templateDao.insertSelective(template);
    }

    @Override
    public void deleteById(Long[] id) {
        TypeTemplateQuery typeTemplateQuery = new TypeTemplateQuery();
        TypeTemplateQuery.Criteria criteria = typeTemplateQuery.createCriteria();
        criteria.andIdIn(Arrays.asList(id));
        templateDao.deleteByExample(typeTemplateQuery);
    }

    @Override
    public TypeTemplate findWithId(Long id) {
        return templateDao.selectByPrimaryKey(id);
    }

    @Override
    public void update(TypeTemplate template) {
        templateDao.updateByPrimaryKeySelective(template);
    }
}
