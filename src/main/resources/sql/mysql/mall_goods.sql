### 后台管理分页多条件查询
#sql("paginateAdminList")
select * from #(table) where 1=1 
#if(onSale!=null)
 and on_sale=#(onSale)
#end
#if(isHot!=null)
 and is_hot=#(isHot)
#end
#if(isDelete!=null)
 and is_delete=#(isDelete)
#end
#if(isRecommend!=null)
 and is_recommend=#(isRecommend)
#end
#if(bcategoryId!=null&&bcategoryId>0)
 and ( bcategory_id=#(bcategoryId) or  ( concat('_',bcategory_key,'_')  regexp concat('_(',replace(#sqlValue(bcategoryId),'_','|'),')_') ))
#end
#if(fcategoryId!=null&&fcategoryId>0)
 and ( fcategory_id=#(fcategoryId) or  ( concat('_',fcategory_key,'_')  regexp concat('_(',replace(#sqlValue(fcategoryId),'_','|'),')_') ))
#end
#if(keywords??)
#setLocal(kw=SqlUtil.likeValue(keywords))
 and ((name like '%#(kw)%') or (sub_title like '%#(kw)%'))
#end
 order by update_time desc
#end

### 后台管理分页多条件查询
#sql("paginateAdminList2")
select goods.*,create_user.name as create_user_name,update_user.name as update_user_name,on_sale_user.name as on_sale_user_name,under_user.name as under_user_name from #(table) as goods 
 left join jb_user as create_user on goods.create_user_id=create_user.id
 left join jb_user as update_user on goods.update_user_id=update_user.id
 left join jb_user as on_sale_user on goods.on_sale_user_id=on_sale_user.id
 left join jb_user as under_user on goods.under_user_id=under_user.id
 where 1=1 
#if(onSale!=null)
 and goods.on_sale=#(onSale)
#end
#if(isHot!=null)
 and goods.is_hot=#(isHot)
#end
#if(isDelete!=null)
 and goods.is_delete=#(isDelete)
#end
#if(isRecommend!=null)
 and goods.is_recommend=#(isRecommend)
#end
#if(bcategoryId!=null&&bcategoryId>0)
 and ( goods.bcategory_id=#(bcategoryId) or  ( concat('_',goods.bcategory_key,'_')  regexp concat('_(',replace(#sqlValue(bcategoryId),'_','|'),')_') ))
#end
#if(fcategoryId!=null&&fcategoryId>0)
 and ( goods.fcategory_id=#(fcategoryId) or  ( concat('_',goods.fcategory_key,'_')  regexp concat('_(',replace(#sqlValue(fcategoryId),'_','|'),')_') ))
#end
#if(keywords??)
#setLocal(kw=SqlUtil.likeValue(keywords))
 and ((goods.name like '%#(kw)%') or (goods.sub_title like '%#(kw)%'))
#end
 order by goods.update_time desc
#end

###检测商品分类是否已经被商品使用
#sql("checkGoodsBackCategoryInUse")
select id from #(table) where (bcategory_id=#(bcategoryId) or  ( concat('_',bcategory_key,'_')  regexp concat('_(',replace(#sqlValue(bcategoryId),'_','|'),')_') ))
#end