package com.fmjava.core.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.fmjava.core.dao.good.BrandDao;
import com.fmjava.core.dao.good.GoodsDao;
import com.fmjava.core.dao.good.GoodsDescDao;
import com.fmjava.core.dao.item.ItemCatDao;
import com.fmjava.core.dao.item.ItemDao;
import com.fmjava.core.dao.seller.SellerDao;
import com.fmjava.core.pojo.entity.GoodsEntity;
import com.fmjava.core.pojo.entity.PageResult;
import com.fmjava.core.pojo.good.Brand;
import com.fmjava.core.pojo.good.Goods;
import com.fmjava.core.pojo.good.GoodsDesc;
import com.fmjava.core.pojo.good.GoodsQuery;
import com.fmjava.core.pojo.item.Item;
import com.fmjava.core.pojo.item.ItemCat;
import com.fmjava.core.pojo.seller.Seller;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.opensaml.xml.signature.G;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class GoodsServiceImpl implements GoodsService {
    @Autowired
    private GoodsDao goodsDao;
    @Autowired
    private GoodsDescDao descDao;
    @Autowired
    private ItemDao itemDao;
    @Autowired
    private ItemCatDao catDao;
    @Autowired
    private BrandDao brandDao;
    @Autowired
    private SellerDao sellerDao;
    @Override
    public void add(GoodsEntity goodsEntity) {
        //1.保存商品
        goodsEntity.getGoods().setAuditStatus("0");
        goodsDao.insertSelective(goodsEntity.getGoods());
        //保存商品详情
        GoodsDesc goodsDes = goodsEntity.getGoodsDesc();
        goodsDes.setGoodsId(goodsEntity.getGoods().getId());
        descDao.insertSelective(goodsDes);

        //3. 保存库存
        insertItem(goodsEntity);

    }

    @Override
    public PageResult findPage(Integer page, Integer pageSize, Goods goods) {
        PageHelper.startPage(page, pageSize);
        GoodsQuery query = new GoodsQuery();
        GoodsQuery.Criteria criteria = query.createCriteria();
        if (goods != null) {
            if (goods.getGoodsName() != null && !"".equals(goods.getGoodsName())) {
                criteria.andGoodsNameLike("%"+goods.getGoodsName()+"%");
            }
            if (goods.getAuditStatus() != null && !"".equals(goods.getAuditStatus())) {
                criteria.andAuditStatusEqualTo(goods.getAuditStatus());
            }
            if (goods.getSellerId() != null && !"".equals(goods.getSellerId())){
                criteria.andSellerIdEqualTo(goods.getSellerId());
            }
        }
        Page<Goods> goodsList = (Page<Goods>)goodsDao.selectByExample(query);
        return new PageResult(goodsList.getTotal(), goodsList.getResult());
    }

    public void insertItem(GoodsEntity goodsEntity){
        if("1".equals(goodsEntity.getGoods().getIsEnableSpec())){
            //勾选了规格复选框
                if(goodsEntity.getItemList()!=null){
                    for (Item item : goodsEntity.getItemList()) {
                            //商品标题：商品名称+规格选项值
                        String title = goodsEntity.getGoods().getGoodsName();
                        String spec = item.getSpec();
                        Map specMap = JSON.parseObject(spec);
                        Collection values = specMap.values();
                        for (Object value : values) {
                            title+=""+value;
                        }
                        /*设置标题*/
                        item.setTitle(title);
                        Item item1 = setItemValue(goodsEntity, item);
                        itemDao.insertSelective(item1);
                    }
                }
        }else {
            //没有勾选规格
            Item item = new Item();
            //价格
            item.setPrice(new BigDecimal(999999));
            //库存
            item.setNum(0);
            //标题
            item.setTitle(goodsEntity.getGoods().getGoodsName());
            //设置库存对象属性值
            setItemValue(goodsEntity,item);
            itemDao.insertSelective(item);
        }

    }

    private Item setItemValue(GoodsEntity goodsEntity, Item item) {
        //商品id
        item.setGoodsId(goodsEntity.getGoods().getId());
        //创建时间
        item.setCreateTime(new Date());
        //更新时间
        item.setUpdateTime(new Date());
        //库存状态, 默认为0, 未审核
        item.setStatus("0");
        //分类id, 库存使用商品的第三级分类最为库存分类
        item.setCategoryid(goodsEntity.getGoods().getCategory3Id());
        //分类名称
        ItemCat itemCat = catDao.selectByPrimaryKey(goodsEntity.getGoods().getCategory3Id());
        item.setCategory(itemCat.getName());
        //品牌名称
        Brand brand = brandDao.selectByPrimaryKey(goodsEntity.getGoods().getBrandId());
        item.setBrand(brand.getName());
        //卖家名称
        Seller seller = sellerDao.selectByPrimaryKey(goodsEntity.getGoods().getSellerId());
        item.setSeller(seller.getName());
        //示例图片
        String itemImages = goodsEntity.getGoodsDesc().getItemImages();
        List<Map> maps = JSON.parseArray(itemImages, Map.class);
        if (maps != null && maps.size() > 0) {
            String url = String.valueOf(maps.get(0).get("url"));
            item.setImage(url);
        }
        return item;
    }
}
