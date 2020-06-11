var jbolt_table_js_version="0.5.4";
/**
 * Jbolt-table组件的封装
 */
function checkTableBodyHasScrolled(table,direction){
    if(direction=='v'){
        return parseInt(table.outerHeight()-table.thead.height)>parseInt(table.table_body.outerHeight());
    }else if(direction=='h'){
        return parseInt(table.outerWidth())>parseInt(table.table_body.outerWidth());
    }
}
/**
 * 是否全选
 * @returns
 */
function jboltTableIsCheckedAll(ele){
	var table=getRealJboltTableByEle(ele);
	if(isOk(table)){
		var jboltTable=table.jboltTable("inst");
		return jboltTable.me.isCheckboxCheckedAll(jboltTable);
	}
	return false;
}
/**
 * 删除选中的行
 * @param ele
 * @returns
 */
function removeJBoltTableCheckedTr(ele){
	var table=getRealJboltTableByEle(ele);
	if(isOk(table)){
		var jboltTable=table.jboltTable("inst");
		jboltTable.me.removeJBoltTableCheckedTr(jboltTable);
	}
}
/**
 * 检测jbolttable是否选中了一条数据数据
 * 返回id
 * @param table
 * @returns
 */
function jboltTableGetCheckedId(ele){
	var table=getRealJboltTableByEle(ele);
	if(isOk(table)){
		var jboltTable=table.jboltTable("inst");
		return jboltTable.me.getCheckedId(jboltTable);
	}
	LayerMsgBox.alert("表格组件配置异常",2);
	return false;
}
/**
 * 检测jbolttable是否选中并返回所有id
 * @param table
 * @returns
 */
function jboltTableGetCheckedIds(ele){
	var table=getRealJboltTableByEle(ele);
	if(isOk(table)){
		var jboltTable=table.jboltTable("inst");
		return jboltTable.me.getCheckedIds(jboltTable);
	}
	LayerMsgBox.alert("表格组件配置异常",2);
	return false;
}

/**
 * 得到checkbox选中的ids
 * @param table
 * @returns
 */
function getJboltTableCheckedIds(tableId){
	var table;
	 if(tableId){
		  table=$("#"+tableId);
	  }else{
		  table=jboltBody.find(".jbolt_table_view>.jbolt_table_box>.jbolt_table_body>table[data-jbolttable].jbolt_main_table");
	  }
	if(isOk(table)){
		var jboltTable=table.jboltTable("inst");
		return jboltTable.me.getCheckedIds(jboltTable,true);
	}
	return false;
}


/**
 * 检测jbolttable是否一个没选
 * @param table
 * @returns
 */
function jboltTableIsCheckedNone(ele){
	var table=getRealJboltTableByEle(ele);
	if(isOk(table)){
		var jboltTable=table.jboltTable("inst");
		return jboltTable.me.isCheckedNone(jboltTable);
	}
	return false;
}

function getRealJboltTableByEle(ele){
	var action=getRealJqueryObject(ele);
	var table;
	if(isOk(action)){
		var tableId=action.data("jbolt-table-id");
		  if(tableId){
			  table=$("#"+tableId);
		  }else{
			  table=action.closest(".jbolt_table_view").find(".jbolt_table_box>.jbolt_table_body>table[data-jbolttable].jbolt_main_table");
		  }
	}
	return table;
}
/**
 * 得到选中的行数
 * @param table
 * @returns
 */
function jboltTableGetCheckedCount(ele){
	var table=getRealJboltTableByEle(ele);
	if(isOk(table)){
		var jboltTable=table.jboltTable("inst");
		return jboltTable.me.getCheckedCount(jboltTable);
	}
	return 0;
}
/**
 * 重置slave区域
 * @param masterTable
 * @returns
 */
function resetJBolttableSlaveBox(masterTable){
	var box=masterTable.closest(".jbolttable_master_slave_box");
	if(!isOk(box)){return false;}
	var master=masterTable.closest(".split.master");
	if(!isOk(master)){return false;}
	var id=0;
	var slave=box.find(".split.slave");
	if(!isOk(slave)){return false;}
	var tables=slave.find(".jbolt_main_table");
	LayerMsgBox.load(3);
	if(isOk(tables)){
		var tt,tableSrcUrl,tableUrl;
		tables.each(function(){
			tt=$(this).jboltTable("inst");
			tableSrcUrl=tt.data("orign-url")||tt.data("srcurl");
			tableUrl=tableSrcUrl.replace("[masterId]",id);
			tt.data("url",tableUrl).data("data-url",tableUrl);
			tt.me.readByPage(tt,1);
		});
	}
	var protals=slave.find("[data-ajaxportal]");
	if(isOk(protals)){
		var srcUrl,portal,url;
		protals.each(function(){
			portal=$(this);
			srcUrl=portal.data("orign-url")||portal.data("srcurl");
			url=srcUrl.replace("[masterId]",id);
			portal.ajaxPortal(true,url,true);
		});
	}
	var elm,elsrcurl;
	slave.find("[data-url][data-orign-url],[href][data-orign-url],[data-url][data-srcurl],[href][data-srcurl]").each(function(){
		elm=$(this);
		elsrcurl=elm.data("orign-url")||elm.data("srcurl");
		if(elsrcurl.indexOf("[masterId]")!=-1){
			elsrcurl=elsrcurl.replace("[masterId]",id);
			if(elm.data("url")){
				elm.data("url",elsrcurl).attr("data-url",elsrcurl);
			}
			if(elm.attr("href")){
				elm.attr("href",elsrcurl);
			}
		}
	});
}
/**
 * 主从样式 主表点击 驱动从表区域table和ajaxportal加载
 * @param tr
 * @param id
 * @returns
 */
function masterTableTrTriggerShowSlave(ele,id){
	var tr=$(ele);
	var box=tr.closest(".jbolttable_master_slave_box");
	if(!isOk(box)){return false;}
	var masterTable=tr.closest(".jbolt_main_table");
	masterTable.find("tbody>tr.active").removeClass("active");
	tr.addClass("active");
	var slave=box.find(".split.slave");
	if(!isOk(slave)){return false;}
	var tables=slave.find(".jbolt_main_table");
	LayerMsgBox.load(3);
	if(isOk(tables)){
		var tt,tableSrcUrl,tableUrl;
		tables.each(function(){
			tt=$(this).jboltTable("inst");
			tableSrcUrl=tt.data("orign-url")||tt.data("srcurl");
			tableUrl=tableSrcUrl.replace("[masterId]",id);
			tt.data("url",tableUrl).data("data-url",tableUrl);
			tt.me.readByPage(tt,1);
		});
	}
	var protals=slave.find("[data-ajaxportal]");
	if(isOk(protals)){
		var srcUrl,portal,url;
		protals.each(function(){
			portal=$(this);
			srcUrl=portal.data("orign-url")||portal.data("srcurl");
			url=srcUrl.replace("[masterId]",id);
			portal.ajaxPortal(true,url,true);
		});
	}
	var elm,elsrcurl;
	slave.find("[data-url][data-orign-url],[href][data-orign-url],[data-url][data-srcurl],[href][data-srcurl]").each(function(){
		elm=$(this);
		elsrcurl=elm.data("orign-url")||elm.data("srcurl");
		if(elsrcurl.indexOf("[masterId]")!=-1){
			elsrcurl=elsrcurl.replace("[masterId]",id);
			if(elm.data("url")){
				elm.data("url",elsrcurl).attr("data-url",elsrcurl);
			}
			if(elm.attr("href")){
				elm.attr("href",elsrcurl);
			}
		}
	});
	
}
/**
 * treeTable中tr上移 处理都带着下级
 * @param table
 * @param tr
 * @returns
 */
function moveDownTreeTableRow(table,tr){
	//得到下面的一个
	var nextTr=tr.next();
	if(!isOk(nextTr)){
		return false;
	}
	
	var tbody=tr.closest("tbody");
	var downArray=new Array();
	processTreeTableTrAllNodes(downArray,tbody,tr);
	var currentLastTr=(downArray.length==1)?tr:downArray[downArray.length-1];
	nextTr=currentLastTr.next();
	if(!isOk(nextTr)){
		return false;
	}
	
	var upArray=new Array();
	processTreeTableTrAllNodes(upArray,tbody,nextTr);
	var lastUpTr=(upArray.length==1)?nextTr:upArray[upArray.length-1];
	trChangeToDown(downArray,lastUpTr);

}
/**
 * treeTable中tr上移 处理都带着下级
 * @param table
 * @param tr
 * @returns
 */
function moveUpTreeTableRow(table,tr){
	//得到上面的一个
	var prevTr=tr.prev();
	if(!isOk(prevTr)){
		return false;
	}
	var prevTrId=prevTr.data("id");
	var trPid=tr.data("pid");
	if(prevTrId==trPid){
		//如果上一个已经到了自己的爸爸 就不处理了
		return false;
	}
	var lastPrevTr=tr.prevAll("[data-pid='"+trPid+"']:first");
	if(isOk(lastPrevTr)){
		var tbody=tr.closest("tbody");
		var upArray=new Array();
		processTreeTableTrAllNodes(upArray,tbody,tr);
		trChangeToUp(upArray,lastPrevTr);
	}
}
/**
 * 递归得到左右子tr
 * @param upArray
 * @param tbody
 * @param tr
 * @returns
 */
function processTreeTableTrAllNodes(upArray,tbody,tr){
	upArray.push(tr);
	var isParent=tr[0].hasAttribute("data-parent");
	if(isParent){//如果是一个
		var sons=tbody.find("tr[data-pid='"+tr.data("id")+"']");
		if(isOk(sons)){
			var size=sons.length;
			for(var i=0;i<size;i++){
				processTreeTableTrAllNodes(upArray,tbody,sons.eq(i));
			}
		}
	}
}
/**
 * 删除一行以及所有下级
 * @param table
 * @param tr
 * @returns
 */
function deleteTreeTableRow(table,tr){
	var isParent=tr[0].hasAttribute("data-parent");
	var isSon=tr[0].hasAttribute("data-son");
	var tbody=tr.closest("tbody");
	if(isParent){
		var sons=tbody.find("tr[data-pid='"+tr.data("id")+"']");
		if(isOk(sons)){
			var size=sons.length;
			for(var i=0;i<size;i++){
				deleteTreeTableRow(table,sons.eq(i))
			}
		}
	}
	tr.remove();
	if(isSon){
		var pid=tr.data("pid");
		if(pid){
			var leaveSons=tbody.find("tr[data-pid='"+pid+"']");
			//还有其他子节点 就不处理了 如果没有子节点了就处理pid
			if(!isOk(leaveSons)){
				var ptr=tbody.find("tr[data-id='"+pid+"']");
				if(isOk(ptr)){
					ptr.removeAttr("data-parent");
					ptr.find("td[data-parent-td='true']").removeAttr('data-parent-td').find("i.fa.parent_flag").remove();
				}
			}
		}
	}
}
/**
 * 刷新table
 * @param ele
 * @returns
 */
function refreshJBoltTable(ele){
	 var tableId=ele.data("jbolt-table-id");
	 var table;
	  if(tableId){
		  table=$("#"+tableId);
	  }else{
		  table=ele.closest(".jbolt_table_view").find(".jbolt_table_box>.jbolt_table_body>table[data-jbolttable].jbolt_main_table");
	  }
	if(isOk(table)){
		var jboltTable=table.jboltTable("inst");
		jboltTable.me.refresh(jboltTable);
	}
}
/**
 * 刷新table 通过tableId
 * @param tableId
 * @returns
 */
function refreshJBoltTableById(tableId){
	var table=$("#"+tableId);
	if(isOk(table)){
		var jboltTable=table.jboltTable("inst");
		jboltTable.me.refresh(jboltTable);
	}
}
/**
 * 刷新table 到第一页
 * @param ele
 * @returns
 */
function jboltTablePageToFirst(ele){
	var tableId=ele.data("jbolt-table-id");
	var table;
	if(tableId){
		table=$("#"+tableId);
	}else{
		table=ele.closest(".jbolt_table_view").find(".jbolt_table_box>.jbolt_table_body:first>table");
	}
	if(isOk(table)){
		var jboltTable=table.jboltTable("inst");
		jboltTable.me.jboltTablePageToFirst(jboltTable);
	}
}
/**
 * 刷新table 到最后一页
 * @param ele
 * @returns
 */
function jboltTablePageToLast(ele){
	 var tableId=ele.data("jbolt-table-id");
	 var table;
	  if(tableId){
		  table=$("#"+tableId);
	  }else{
		  table=ele.closest(".jbolt_table_view").find(".jbolt_table_box>.jbolt_table_body:first>table");
	  }
	if(isOk(table)){
		var jboltTable=table.jboltTable("inst");
		jboltTable.me.jboltTablePageToLast(jboltTable);
	}
}
/**
 * 得到滚动条宽度
 * @param ele
 * @returns
 */
function getScrollBarWidth(ele){
	return Math.abs(ele.offsetWidth - ele.clientWidth);
}
/**
 * 得到滚动条高度
 * @param ele
 * @returns
 */
function getScrollBarHeight(ele){
	return Math.abs(ele.offsetHeight - ele.clientHeight);
}
;(function($){
	var JBoltTableInts={};
	var jboltTablePageTpl='<!--JBoltTable 分页-->'+
	'<div class="jbolt_table_pages noselect">'+
	'<div class="pages">'+
	'<div class="mainPagination" id="${pageId}"></div>'+
	'<div class="searchPage">'+
	'<span class="page-go pl-3">到<input id="gonu" type="number" onblur="if(this.value&&this.value>=1){}else{this.value=1;}" min="1" max="1"  pattern="[0-9]*" class="current_page" value="1">页</span>'+
	'<a href="javascript:;" class="page-btn">GO</a>'+
	'<span class="page-sum">共&nbsp;<strong id="totalRow" class="allPage">1</strong>&nbsp;条&nbsp;<strong id="totalPage" class="allPage">1</strong>&nbsp;页</span>'+
	'<select id="pageSize" class="mx-2" style="width:80px;height: 32px;margin-top:-1px;border-color:#e6e6e6;">'+
	'<option value="5">5条/页</option>'+
	'<option value="10">10条/页</option>'+
	'<option value="15">15条/页</option>'+
	'<option value="20">20条/页</option>'+
	'<option value="25">25条/页</option>'+
	'<option value="30">30条/页</option>'+
	'<option value="35">35条/页</option>'+
	'<option value="40">40条/页</option>'+
	'<option value="45">45条/页</option>'+
	'<option value="50">50条/页</option>'+
	'</select>'+
	'</div>'+
	'</div>'+
	'<div class="clearfix"></div>'+
	'</div>';
	
	var JboltColSortTpl='<span class="jbolt_table_col_sort"><i class="sort sort_asc" title="升序"></i><i class="sort sort_desc" title="降序"></i><span>';
	var JboltColSort_asc_Tpl='<span class="jbolt_table_col_sort"><i class="sort sort_asc active" title="升序"></i><i class="sort sort_desc" title="降序"></i><span>';
	var JboltColSort_desc_Tpl='<span class="jbolt_table_col_sort"><i class="sort sort_asc" title="升序"></i><i class="sort sort_desc active" title="降序"></i><span>';
	var prependTplMap={
			"th_checkbox":'<th data-width="50" style="min-width:50px;max-width:50px;width:50px;" data-column="checkbox"><div class="jbolt_table_checkbox"><input type="checkbox" name="jboltTableCheckbox" data-ptype="thead"><span><i class="fa fa-check"></i></span></div></th>',
			"td_checkbox":'<td style="min-width:50px;max-width:50px;width:50px;"><div class="jbolt_table_checkbox"><input type="checkbox" name="jboltTableCheckbox" data-ptype="tbody"><span><i class="fa fa-check"></i></span></div></td>',
			"th_radio":'<th data-width="50"  style="min-width:50px;max-width:50px;width:50px;" data-column="radio"><div class="jbolt_table_radio"><input type="radio" name="jboltTableRadio" data-ptype="thead"><span><i class="fa fa-check"></i></span></div></th>',
			"td_radio":'<td data-width="50"  style="min-width:50px;max-width:50px;width:50px;"><div class="jbolt_table_radio"><input type="radio" name="jboltTableRadio" data-ptype="tbody"><span><i class="fa fa-check"></i></span></div></td>'
			};
	var jb_methods = {
			resize:function(table){
				this.setTableHeight(table);
			},
			//删除选中checkbox或者radio的行
			removeJBoltTableCheckedTr:function(table){
				var that=this;
				var columnprepend=table.data("column-prepend");
				if(!columnprepend){
					columnprepend="checkbox";
				}
				if(columnprepend=="checkbox"||columnprepend.indexOf(":checkbox")){
					var cks=table.tbody.find("input[type='checkbox'][name='jboltTableCheckbox']:checked");
					if(isOk(cks)){
						cks.each(function(i){
							that.deleteRow(table,cks.eq(i).closest("tr").index());
						});
					}
				
				}else if(columnprepend=="radio"||columnprepend.indexOf(":radio")){
					var rds=table.tbody.find("tr>td>input[type='radio'][name='jboltTableRadio']:checked");
					if(isOk(rds)){
						rds.each(function(i){
							that.deleteRow(table,rds.eq(i).closest("tr").index());
						});
					}
				}
			},
			getCheckedCount:function(table){
				var that=this;
				var columnprepend=table.data("column-prepend");
				if(!columnprepend){
					columnprepend="checkbox";
				}
				
				if(columnprepend=="checkbox"||columnprepend.indexOf(":checkbox")){
					return that.getCheckboxCheckedCount(table);
				}
				
				if(columnprepend=="radio"||columnprepend.indexOf(":radio")){
					return that.getRadioCheckedCount(table);
				}
			},
			isCheckedNone:function(table){
				var that=this;
				var columnprepend=table.data("column-prepend");
				if(!columnprepend){
					columnprepend="checkbox";
				}
				
				if(columnprepend=="checkbox"||columnprepend.indexOf(":checkbox")){
					return that.isCheckboxCheckedNone(table);
				}
				
				if(columnprepend=="radio"||columnprepend.indexOf(":radio")){
					return that.isRadioCheckedNone(table);
				}
			
			},
			//判断是否有选中的行
			getCheckedIds:function(table,dontShowError){
				var columnprepend=table.data("column-prepend");
				if(!columnprepend){
					columnprepend="checkbox";
				}
				var ids=new Array();
				if(columnprepend=="checkbox"||columnprepend.indexOf(":checkbox")){
					var cks=table.tbody.find("input[type='checkbox'][name='jboltTableCheckbox']:checked");
					if(!isOk(cks)||cks.length==0){
						if(!dontShowError){
							LayerMsgBox.alert("请至少选择一行数据",2);
						}
						return false;
					}
					cks.each(function(i){
						ids.push(cks.eq(i).closest("tr").data("id"));
					});
				}else if(columnprepend=="radio"||columnprepend.indexOf(":radio")){
					var rds=table.tbody.find("tr>td>input[type='radio'][name='jboltTableRadio']:checked");
					if(!isOk(rds)||rds.length==0){
						if(!dontShowError){
							LayerMsgBox.alert("请至少选择一行数据",2);
						}
						return false;
					}
					rds.each(function(i){
						ids.push(rds.eq(i).closest("tr").data("id"));
					});
				}
				return isOk(ids)?ids:false;
			},
			//检测是否选中了一个数据
			getCheckedId:function(table){
				var columnprepend=table.data("column-prepend");
				if(!columnprepend){
					columnprepend="checkbox";
				}
				var id;
				if(columnprepend=="checkbox"||columnprepend.indexOf(":checkbox")){
					var cks=table.tbody.find("input[type='checkbox'][name='jboltTableCheckbox']:checked");
					if(!isOk(cks)||cks.length!=1){
						LayerMsgBox.alert("请选择一行数据",2);
						return false;
					}
					id=cks.eq(0).closest("tr").data("id");
				}else if(columnprepend=="radio"||columnprepend.indexOf(":radio")){
					var rds=table.tbody.find("tr>td>input[type='radio'][name='jboltTableRadio']:checked");
					if(!isOk(rds)||rds.length!=1){
						LayerMsgBox.alert("请选择一行数据",2);
						return false;
					}
					id=rds.eq(0).closest("tr").data("id");
				}
				return id?id:false;
			},
			//删除行
			deleteRow:function(table,index){
				var that=this;
				var ajax=table.data("ajax");
				if(ajax){
					//TODO 执行ajax删除后 这里删除
					table.find("tbody>tr:nth-child("+(index+1)+")").remove();
					if(table.left_fixed){
						table.left_fixed.body.table.find("tbody>tr:nth-child("+(index+1)+")").remove();
					}
					if(table.right_fixed){
						table.right_fixed.body.table.find("tbody>tr:nth-child("+(index+1)+")").remove();
					}
					//reize的时候判断scroll相关的处理了
					that.refreshMainTableVScroll(table);
					//如果有横向滚动条 处理一下样式
					that.refreshFixedColumnHScroll(table);
					
				}else{
					table.find("tbody>tr:nth-child("+(index+1)+")").remove();
					if(table.left_fixed){
						table.left_fixed.body.table.find("tbody>tr:nth-child("+(index+1)+")").remove();
					}
					if(table.right_fixed){
						table.right_fixed.body.table.find("tbody>tr:nth-child("+(index+1)+")").remove();
					}
					//reize的时候判断scroll相关的处理了
					that.refreshMainTableVScroll(table);
					//如果有横向滚动条 处理一下样式
					that.refreshFixedColumnHScroll(table);
				}
				that.processOneAutoThWidthByTrChange(table);
				
			},
			//tr上移
			moveUpRow:function(table,trIndex){
				var tableArray=new Array();
				var tr=table.find("tbody>tr:eq("+trIndex+")");
				if(isOk(tr)){
					trChangeToUp(tr,tr.prev());
					if(table.left_fixed){
						var leftTr=table.left_fixed.body.table.find("tbody>tr:eq("+trIndex+")");
						if(isOk(leftTr)){
							trChangeToUp(leftTr,leftTr.prev());
						}
					}
					if(table.right_fixed){
						var rightTr=table.right_fixed.body.table.find("tbody>tr:eq("+trIndex+")");
						if(isOk(rightTr)){
							trChangeToUp(rightTr,rightTr.prev());
						}
					}
				}
			},
			//tr下移
			moveDownRow:function(table,trIndex){
				var tableArray=new Array();
				var tr=table.find("tbody>tr:eq("+trIndex+")");
				if(isOk(tr)){
					trChangeToDown(tr,tr.next());
					if(table.left_fixed){
						var leftTr=table.left_fixed.body.table.find("tbody>tr:eq("+trIndex+")");
						if(isOk(leftTr)){
							trChangeToDown(leftTr,leftTr.next());
						}
					}
					if(table.right_fixed){
						var rightTr=table.right_fixed.body.table.find("tbody>tr:eq("+trIndex+")");
						if(isOk(rightTr)){
							trChangeToDown(rightTr,rightTr.next());
						}
					}
				}
				
				
			},
			//得到实例
			inst:function(tableId){
				if(!tableId&&this.hasClass("jbolt_table")){
					tableId=this.attr("id");
				}
				return JBoltTableInts[tableId];
			},
			//设置实例
			put:function(tableId,table){
				JBoltTableInts[tableId]=table;
			},
			
			/**
			 * 处理toolbar 或者其他地方绑定过来的按钮 比如右上角的添加按钮
			 */
			processBindEleTableId:function(table){
				var tableId=table.attr("id");
				var bind_elements=table.data("bind-elements");
				if(bind_elements){
					$(bind_elements).data("jbolt-table-id",tableId).attr("data-jbolt-table-id",tableId);
				}
				if(isOk(table.toolbar)){
					table.toolbar.find("button,a").data("jbolt-table-id",tableId).attr("data-jbolt-table-id",tableId);
				}
			},
			checkTableThead:function(table){
				var thead=table.find("thead");
				if(!isOk(thead)){
					return "Table表格不能缺少thead";
				}
				var trs=thead.find("tr");
				if(!isOk(trs)){
					return "Table表格Thead中必须有tr";
				}
				var ths=thead.find("tr>th");
				if(!isOk(ths)){
					LayerMsgBox.alert("Table表格Thead中必须有th",2);
					return false;
				}
			},
			//初始化
			init: function (tables) {
				var that=this;
				LayerMsgBox.load(3,15000);
				return tables.each(function(){
					var table=$(this);
					var tableId=table.attr("id");
					if(!tableId){
						tableId="jbolt_table_"+randomId();
						table.attr("id",tableId);
					}else{
						var existTable=that.inst(tableId);
						if(existTable){
							LayerMsgBox.closeLoadNow();
							return true;
						}
					}
					//判断表格缺陷
					var errorMsg=that.checkTableThead(table);
					if(errorMsg){
						LayerMsgBox.alert(errorMsg,2);
						return false;
					}
					table.thead=table.find("thead");
					table.tbody=table.find("tbody");
					if(!isOk(table.tbody)){
						table.append("<tbody></tbody>");
						table.tbody=table.find("tbody");
					}
					table.tfoot=table.find("tfoot");
					table.thead.trs=table.thead.find("tr");
					table.thead.height=41*table.thead.trs.length;
					
					
					table.removeClass("table table-bordered table-hover table-striped table-dark table-borderless table-sm table-primary table-secondary table-success table-danger table-warning table-info table-light");
					table.addClass("jbolt_table text-nowrap novscroll jbolt_main_table");
					//如果有用这个的 就给他清除掉 
					var table_parent=table.parent();
					if(table_parent.hasClass("table-responsive")){
						table_parent.removeClass("table-responsive").addClass("jbolt_table_body");
					}
					var table_body=table.closest(".jbolt_table_body");
					if(!isOk(table_body)){
						table.wrap("<div class='jbolt_table_body'></div>");
						table_body=table.closest(".jbolt_table_body");
					}
					var table_box=table_body.closest(".jbolt_table_box");
					if(!isOk(table_box)){
						table_body.wrap("<div class='jbolt_table_box'></div>");
						table_box=table_body.closest(".jbolt_table_box");
					}
					
					var table_view=table_box.closest(".jbolt_table_view");
					if(!isOk(table_view)){
						table_box.wrap("<div class='jbolt_table_view'></div>");
						table_view=table_box.closest(".jbolt_table_view");
					}
					
					var toolbar=table_view.find(".jbolt_table_toolbar");
					if(!isOk(toolbar)){
						var toolbarId=table.data('toolbar');
						if(toolbarId){
							var pbox=table_view.closest("[data-ajaxportal]");
							if(!isOk(pbox)){
										if(isWithtabs()){
											pbox=JBoltTabUtil.getCurrentTabContent();
										}else{
											pbox=mainPjaxContainer
											var inDialog=!(pbox&&pbox.length==1);
											if(inDialog){
												pbox=$("body .jbolt_page");
												var notNormalPage=!(pbox&&pbox.length==1);
												if(notNormalPage){
													pbox=jboltBody;
												}
											}
										}
							}
							if(isOk(pbox)){
								toolbar=pbox.find("#"+toolbarId);
							}else{
								toolbar=$("#"+toolbarId);
							}
						}
						if(isOk(toolbar)){
							toolbar.insertBefore(table_box);
						}
					}
					if(table.hasClass("border-dark")){
						table_view.addClass("border-dark");
						table_box.addClass("border-dark");
						table_body.addClass("border-dark");
						if(isOk(toolbar)){
							toolbar.addClass("border-dark");
						}
					}else if(table.hasClass("border-secondary")){
						table_view.addClass("border-secondary");
						table_box.addClass("border-secondary");
						table_body.addClass("border-secondary");
						if(isOk(toolbar)){
							toolbar.addClass("border-secondary");
						}
					}else if(table.hasClass("border-gray")){
						table_view.addClass("border-gray");
						table_box.addClass("border-gray");
						table_body.addClass("border-gray");
						if(isOk(toolbar)){
							toolbar.addClass("border-gray");
						}
					}
					table.table_view=table_view;
					table.table_box=table_box;
					table.table_body=table_body;
					table.toolbar=toolbar;
					
					table.me=that;
					//put到实例中
					that.put(tableId,table);
					var ajax=table.data("ajax");
					if(ajax){
						that.processTableMainBeforeAjax(table);
						//处理ajax读取数据后 再执行处理表格
						that.ajaxLoadTableData(table,function(){
							that.reProcessTableMain(table);
							table.data("inited",true);
						});
					}else{
						//处理table样式与事件主入口
						that.processTableMain(table);
						table.data("inited",true);
					}
					
				});
			},
			processPagesToJboltPage:function(table){
				//如果没用 判断是不是用错了 直接使用了_page.html
				var pages=table.table_view.find(".pages"),jbolt_table_pages;
				if(isOk(pages)){
					jbolt_table_pages=pages.closest(".jbolt_table_pages");
					if(!isOk(jbolt_table_pages)){
						pages.attr("class","pages").wrap('<div class="jbolt_table_pages noselect"></div>');
					}
				}else{
					//如果没有 就说明压根没在view里 就得找找外面了
					var pageId=table.data("page");
					if(pageId){
						pages=table.closest(".jbolt_page").find("#"+pageId).closest(".pages");
					}else{
						pages=table.table_view.parent().find(".pages");
					}
					if(isOk(pages)){
						jbolt_table_pages=pages.closest(".jbolt_table_pages");
						if(!isOk(jbolt_table_pages)){
							pages.attr("class","pages").wrap('<div class="jbolt_table_pages noselect"></div>');
							jbolt_table_pages=pages.closest(".jbolt_table_pages");
						}
						
						jbolt_table_pages.insertAfter(table.table_box);
					}
				}
				
				if(isOk(jbolt_table_pages)){
					  var input=jbolt_table_pages.find("#gonu");
					  if(isOk(input)){
						  pageNumber=Math.abs(parseInt(input.val()));
					  }else{
						  pageNumber=1;
					  }
					  var pageSize=Math.abs(parseInt(jbolt_table_pages.find("#pageSize").val()));
					  var totalPage=Math.abs(parseInt(jbolt_table_pages.find("#totalPage").text()));
					  table.data("pagenumber",pageNumber);
					  table.data("pagesize",pageSize);
					  table.data("totalpage",totalPage);
				}
			},
			getColumnPrependElement:function(columnType,tagName){
				return prependTplMap[tagName+"_"+columnType];
			},
			getTbodyColumnPrependElement:function(columnType){
				var result="";
				switch (columnType) {
				case "checkbox":
					retult="<td><input type='checkbox' data-type='tbody_checkbox'/></td>";
					break;
				case "radio":
					retult="<td><input type='radio' data-type='tbody_radio'/></td>";
					break;
				}
				return result;
			},
			
			processTableColumnPrepend:function(table){
				//处理table thead 列补充类型 额外添加的
				this.processTableTheadColumnPrepend(table);
				//处理table tbody 列补充类型 额外添加的
				this.processTableTbodyColumnPrepend(table);
			},
			processTableTbodyColumnPrepend:function(table){
				//处理Tbody添加列操作 比如在第一列添加checkbox等 
				var columnPrepend=table.data("column-prepend");
				if(!columnPrepend||!table.prependColumnType){return false;}
				var td=table.find("tbody>tr>td:nth-child("+(table.prependColumnIndex+1)+")");
				if(isOk(td)){
					td.before(this.getColumnPrependElement(table.prependColumnType,"td"));
				}
			},
			processTableTheadColumnPrepend:function(table){
				//处理Thead添加列操作 比如在第一列添加checkbox等 
				var columnPrepend=table.data("column-prepend");
				if(!columnPrepend){return false;}
				var that=this,columnIndex=0,columnType;
				if(columnPrepend.indexOf(":")!=-1){
					var arr=columnPrepend.split(":");
					columnIndex=parseInt(arr[0])-1;
					columnType=arr[1];
				}else{
					columnType=columnPrepend;
				}
				var th=table.find("thead>tr:first>th:eq("+columnIndex+")");
				if(isOk(th)){
					th.before(this.getColumnPrependElement(columnType,"th"));
					table.prependColumnIndex=columnIndex;
					table.prependColumnType=columnType;
				}
			},
			/**
			 * 处理table样式与事件主入口
			 */
			processTableMain:function(table){
				var that=this;
				//如果勿用了_page.html没用_jbolt_table_page.html会自动处理
				that.processPagesToJboltPage(table);
				//处理tableHeader中的列头排序特效
				that.processTableHeaderColSort(table);
				//处理table 列补充类型 额外添加的
				that.processTableColumnPrepend(table);
				//处理thIndex
				that.processTableColIndex(table,true,true);
				//处理宽高
				that.processTableWidthAndHeight(table);
				//处理单元格宽度与样式
				that.processTableStyle(table);
				//关联的条件查询form处理
				that.processConditionsForm(table);
				//设置其他table绑定tableId
				that.processOtherTableBindTableId(table);
				//设置绑定组件的tableId
				that.processBindEleTableId(table);
				//处理fixed column中的元素
				that.afterFixedColumn(table);
				//处理事件
				that.processTableEvent(table);
				LayerMsgBox.closeLoadNow();
			},
			//重新设置默认排序列样式
			reProcessTableHeaderColDefaultSort:function(table){
				var thead=table.find("thead");
				var sortableColumns=table.data("sortable-columns");
				if(!sortableColumns){
					return false;
				}
				var defaultSort=table.data("sort");
				var th,sortColumn,sortType,defaultSort=table.data("sort");
				if(defaultSort){
					var dsarr=defaultSort.split(":");
					sortColumn=dsarr[0];
					sortType=dsarr[1];
				}
				table.table_view.find(".jbolt_table_header>table>thead>tr>th i.sort.active").removeClass("active");
				th=thead.find("tr>th[data-column='"+sortColumn+"']");
				if(isOk(th)){
					var thColIndex=th.data("col-index");
					table.table_view.find(".jbolt_table_header>table>thead>tr>th[data-col-index='"+thColIndex+"']").find(".sort.sort_"+sortType).addClass("active");
					th.find(".sort.sort_"+sortType).addClass("active");
				}
			},
			//处理初始化列头排序样式
			processTableHeaderColSort:function(table){
				var thead=table.find("thead");
				var sortableColumns=table.data("sortable-columns");
				if(!sortableColumns){
					return false;
				}
				//如果table上设置了可以排序的列 就去找绑定的这些列 设置样式
				var columnsArr=sortableColumns.split(",");
				if(!isOk(columnsArr)){return false;}
				var len=columnsArr.length;
				var th,sortColumn,sortType,defaultSort=table.data("sort");
				if(defaultSort){
					var dsarr=defaultSort.split(":");
					sortColumn=dsarr[0];
					sortType=dsarr[1];
				}
				for(var i=0;i<len;i++){
					th=thead.find("tr>th[data-column='"+columnsArr[i]+"']");
					if(isOk(th)){
						th.addClass("sort_col");
						if(sortColumn==columnsArr[i]){
							if(sortType=="asc"){
								th.append(JboltColSort_asc_Tpl);
							}else if(sortType=="desc"){
								th.append(JboltColSort_desc_Tpl);
							}
						}else{
							th.append(JboltColSortTpl);
						}
					}
				}
				
				
			},
			processTheadColIndex:function(table){
				this.processTableColIndex(table,true,false);
			},
			//初始化列索引 这里还得考虑复杂表头的递归处理
			processTableColIndex:function(table,processHead,processBody){
				var that=this,thead=table.find("thead"),tbody=table.find("tbody"),trs=thead.find("tr"),currentTr,trLen,newThs,thLen,currentTh;
				if(!isOk(trs)){
					LayerMsgBox.alert("尚未提供有效的Thead",2);
					return;
				}
				//几个tr
				trLen=trs.length;
				currentTr=trs.eq(0);
				if(trLen==1){
					newThs=currentTr.find("th");
					if(isOk(newThs)){
						thLen=newThs.length;
						for(var i=0;i<thLen;i++){
							if(processHead){
								newThs.eq(i).data("col-index",i).attr("data-col-index",i);
							}
							if(processBody){
								tbody.find("tr>td:nth-child("+(i+1)+")").data("col-index",i).attr("data-col-index",i);
							}
						}
					}
					return;
				}
			
				newThs=currentTr.find("th");
				if(isOk(newThs)){
					thLen=newThs.length;
					//循环TH 这里需要注意 有colspan的就要处理下级了
					var thIndex=0;//当前th的index
					var endIndex=0;
					var fixedIndex=1;//处理fixed
					for(var i=0;i<thLen;i++){
						currentTh=newThs.eq(i);
						if(processHead){
							currentTh.data("fixed-col-index",fixedIndex).attr("data-fixed-col-index",fixedIndex);
						}
						if(currentTh[0].hasAttribute("colspan")){
							var colspan=parseInt(currentTh.attr("colspan"));
							endIndex=thIndex+colspan-1;
							var thObj={
									trIndex:(currentTr.index()+1),
									startColIndex:thIndex,
									endColIndex:endIndex,
									processBody:processBody,
									processHead:processHead,
									fixedIndex:fixedIndex
							}
							that.processColSpanNextTrThColIndex(table,thead,tbody,thObj);
							if(thObj.processBody){
								for(var i=thObj.startColIndex;i<=thObj.endColIndex;i++){
									tbody.find("tr>td:nth-child("+(i+1)+")").data("col-index",i).attr("data-col-index",i);
									tbody.find("tr>td:nth-child("+(i+1)+")").data("fixed-col-index",fixedIndex).attr("data-fixed-col-index",fixedIndex);
								}
							}
							thIndex=endIndex+1;
						}else{
							if(processHead){
								currentTh.data("col-index",thIndex).attr("data-col-index",thIndex);
							}
							if(processBody){
								tbody.find("tr>td:nth-child("+(thIndex+1)+")").data("col-index",thIndex).attr("data-col-index",thIndex);
								tbody.find("tr>td:nth-child("+(thIndex+1)+")").data("fixed-col-index",fixedIndex).attr("data-fixed-col-index",fixedIndex);
							}
							thIndex=thIndex+1;
							endIndex=endIndex+1;
						}
						
						fixedIndex++;
					}
				}
			
			},
			/**
			 * 处理下级tr里的th
			 */
			processColSpanNextTrThColIndex:function(table,thead,tbody,thObj){
				var that=this,tr=thead.find("tr:eq("+thObj.trIndex+")");
				if(!isOk(tr)){return false;}
				var ths=tr.find("th:not(.processed)");
				if(!isOk(ths)){return false;}
				var thIndex=0,tempTh;
				for(var i=thObj.startColIndex;i<=thObj.endColIndex;i++){
					tempTh=ths.eq(thIndex);
					if(tempTh&&tempTh.length==1){
						if(thObj.processHead){
							tempTh.data("fixed-col-index",thObj.fixedIndex).attr("data-fixed-col-index",thObj.fixedIndex);
							tempTh.addClass("processed");
						}
						if(tempTh[0].hasAttribute("colspan")){
							thObj.trIndex=thObj.trIndex+1;
							thObj.startColIndex=i;
							that.processColSpanNextTrThColIndex(table,thead,tbody,thObj);
							return false;
						}else{
							if(thObj.processHead){
								tempTh.data("col-index",i).attr("data-col-index",i);
							}
							thIndex++;
						}
					}
				}
			},
			processTbodyColIndex:function(table){
				this.processTableColIndex(table,false,true);
			},
			/**
			 * 处理table样式与事件主入口
			 */
			processTableMainBeforeAjax:function(table){
				var that=this;
				//初始化分页组件占位box
				that.addJboltPageBox(table);
				//处理tableHeader中的列头排序特效
				that.processTableHeaderColSort(table);
				//处理table thead 列补充类型 额外添加的
				that.processTableTheadColumnPrepend(table);
				//处理 thead colIndex
				that.processTheadColIndex(table);
				//设置宽高数据
				that.processTableWidthAndHeight(table);
				//处理单元格宽度高度
				that.processCellWidthAndHeight(table);
				//重新设置tableHeight
//				that.setTableHeight(table);
				//处理fixedHeader
				that.processHeaderFixed(table);
				//关联的条件查询form处理
				that.processConditionsForm(table);
				//设置其他table绑定tableId
				that.processOtherTableBindTableId(table);
				//设置绑定组件的tableId
				that.processBindEleTableId(table);
				//处理事件重新绑定
				that.processTableEvent(table);
				LayerMsgBox.closeLoadNow();
				
			},
			processOtherTableBindTableId:function(table){
				var tableId=table.attr("id");
				table.table_view.find("table:not(.jbolt_main_table)").data("jbolt-table-id",tableId);
			},
			/**
			 * 处理关联绑定的数据
			 */
			processConditionsForm:function(table){
				var that=this;
				var conditionsForm=table.data("conditions-form");
				if(conditionsForm!=undefined&&conditionsForm!=""&&conditionsForm!="undefined"){
					var ajax=table.data("ajax");
					if(ajax){
						$("#"+conditionsForm).on("submit",function(e){
							e.preventDefault();
							e.stopPropagation();
							table.data("sortColumn","").data("sortType","");
							that.reProcessTableHeaderColDefaultSort(table);
							that.readByPage(table,1);
							return false;
						});
					}
				}
			},
			/**
			 * 处理当新数据重置后 重新处理组件事件
			 */
			afterAjaxSetTableDataInitAutoEle:function(table_view){
				$('.tooltip.show').remove();
				SwitchBtnUtil.init(table_view);
				SelectUtil.initAutoSetValue(table_view);
				FormDate.init(table_view);
				LayerTipsUtil.init(table_view);
				ImageViewerUtil.init(table_view);
				RadioUtil.init(table_view);
				CheckboxUtil.init(table_view);
				AutocompleteUtil.init(table_view);
				Select2Util.init(table_view);
				SelectUtil.init({parent:table_view});
				initToolTip(table_view);
			},
			/**
			 * 本地渲染的table 最后执行这个
			 */
			afterFixedColumn:function(table){
				var fixedCols=table.table_view.find(".jbolt_table_fixed");
				if(isOk(fixedCols)){
					SwitchBtnUtil.init(fixedCols);
					SelectUtil.initAutoSetValue(fixedCols);
					FormDate.init(fixedCols);
					LayerTipsUtil.init(fixedCols);
					ImageViewerUtil.init(fixedCols);
					RadioUtil.init(fixedCols);
					CheckboxUtil.init(fixedCols);
					AutocompleteUtil.init(fixedCols);
					Select2Util.init(fixedCols);
					SelectUtil.init({parent:fixedCols});
				}
				
			},
			/**
			 * ajax数据切换后重置样式
			 */
			processAllTableStyleReset:function(table){
				var leftScroll=table.table_body.scrollLeft();
				var topScroll=table.table_body.scrollTop();
				table.table_view.find(".jbolt_table_header>table").css("margin-left","0px");
				table.table_view.find(".jbolt_table_body>table").css("margin-top",(0-table.thead.height)+"px");
				table.table_body.scrollLeft(leftScroll);
				table.fixed_header.find("table").css("margin-left",(0-leftScroll)+"px");
				if(table.table_body.sortRankAfter){
						table.table_body.scrollTop(0);
				}else{
					if(table.table_body.needKeepScrollTopAndLeft){
						if(table.table_body.scroll_left>0){
							table.table_body.scrollLeft(leftScroll);
						}
						if(table.table_body.scroll_top>0){
							table.table_body.scrollTop(topScroll);
						}
					}else{
						if(leftScroll>0){
							table.table_body.scrollLeft(0);
						}
						if(topScroll>0){
							table.table_body.scrollTop(0);
						}
					}
				}
			
				
				table.table_body.needKeepScrollTopAndLeft=false;
				 table.table_body.sortRankAfter=false;
			},
			/**
			 * 再次刷新数据后要重新渲染表格关键数据和样式
			 */
			reProcessTableMain:function(table){
				var that=this;
				//处理thIndex
				that.processTbodyColIndex(table);
				//处理单元格宽度
				that.processCellWidthAfterAjax(table);
				//重新设置tableHeight
				that.setTableHeight(table);
				//处理左侧fixed
				that.processColumnFixedLeft(table);
				//处理右侧fixed
				that.processColumnFixedRight(table);
				//处理恢复样式
				that.processAllTableStyleReset(table);
				//判断数据为空
				that.processEmptyTableBody(table);
				//处理右侧滚动条 纵向
				that.refreshMainTableVScroll(table);
				//处理下方滚动条 横向
				that.refreshFixedColumnHScroll(table);
				//处理ajax加载数据后重新刷新绑定必要组件自动化
				that.afterAjaxSetTableDataInitAutoEle(table.table_view);
				//设置其他table绑定tableId
				that.processOtherTableBindTableId(table);
			},
			refresh:function(table){
				//刷新当前数据
				if(!table){
					var jboltTable=this.jboltTable("inst");
					var ajax=jboltTable.data("ajax");
					if(ajax){
						jboltTable.me.readByPage(jboltTable);
					}else{
						jboltTable.me.tableSubmitForm(jboltTable);
					}
				}else{
					var ajax=table.data("ajax");
					if(ajax){
						this.readByPage(table);
					}else{
						this.tableSubmitForm(table);
					}
					
				}
			},
			/**
			 * 根据需要 提交表格绑定查询表单 非ajax表格使用
			 */
			tableSubmitForm:function(table,pageNumber){
				resetJBolttableSlaveBox(table);
				var formId=table.data("conditions-form");
				if(!formId){$.error("表格data-conditions-form未绑定");return false;}
				var pbox=null;
				var ajaxPortal=table.closest("[data-ajaxportal]");
				if(isOk(ajaxPortal)){
					pbox=ajaxPortal;
				}else{
					var withTabs=isWithtabs();
					if(withTabs){
						pbox=table.closest(".jbolt_tabcontent");
					}else{
						pbox=$(mainPjaxContainer);
						var inDialog=!(pbox&&pbox.length==1);
						if(inDialog){
							pbox=$("body .jbolt_page");
							var notNormalPage=!(pbox&&pbox.length==1);
							if(notNormalPage){
								pbox=jboltBody;
							}
						}
					}
				}
				if(!pbox){
					$.error("表格所在页面未规范使用布局");
					return false;
				}
				var form=pbox.find("#"+formId);
				if(isOk(form)){
					var pages=table.table_view.find(".pages");
					if(isOk(pages)){
						//如果有分页 就得带着分页
						if(!pageNumber){
							pageNumber=table.data("pagenumber");
							if(!pageNumber){
								pageNumber=1;
							}
						}
						
						var pageSize=pages.find("#pageSize").val();
						form.append('<input type="hidden" name="page" value="'+pageNumber+'"/>');
						form.append('<input type="hidden" name="pageSize" value="'+pageSize+'"/>');
					}
					
					var sortColumn=table.data("sort-column");
					var sortType=table.data("sort-type");
					if(sortColumn&&sortType){
						form.append('<input type="hidden" name="sortColumn" value="'+sortColumn+'"/>');
						form.append('<input type="hidden" name="sortType" value="'+sortType+'"/>');
					}
					form.submit();
				}
			},
			//跳转到第一页
			jboltTablePageToFirst:function(table){
				if(!table){
					var jboltTable=this.jboltTable("inst");
					var ajax=jboltTable.data("ajax");
					if(ajax){
						jboltTable.me.readByPage(jboltTable,1);
					}else{
						jboltTable.me.tableSubmitForm(jboltTable,1);
					}
				}else{
					var ajax=table.data("ajax");
					if(ajax){
						this.readByPage(table,1);
					}else{
						this.tableSubmitForm(table,1);
					}
				}
			},
			//跳转到最后页
			jboltTablePageToLast:function(table){
				if(!table){
					var jboltTable=this.jboltTable("inst");
					var totalPage=jboltTable.data("totalpage");
					if(!totalPage){totalPage=1;}
					jboltTable.data("tolastpage",true);
					var ajax=jboltTable.data("ajax");
					if(ajax){
						jboltTable.me.readByPage(jboltTable,totalPage);
					}else{
						jboltTable.me.tableSubmitForm(jboltTable,totalPage);
					}
				}else{
					var totalPage=table.data("totalpage");
					if(!totalPage){totalPage=1;}
					table.data("tolastpage",true);
					var ajax=table.data("ajax");
					if(ajax){
						this.readByPage(table,totalPage);
					}else{
						this.tableSubmitForm(table,totalPage);
					}
				}
			},
			/**
			 * 按照分页读取
			 */
			readByPage:function(table,pageNumber){
				resetJBolttableSlaveBox(table);
				var that=this;
				var jbolt_table_pages=table.table_view.find(".jbolt_table_pages");
				  if(!pageNumber){
					  var input=jbolt_table_pages.find("#gonu");
					  if(isOk(input)){
						  pageNumber=Math.abs(parseInt(input.val()));
					  }else{
						  pageNumber=1;
					  }
				  }
				  var pageSize=Math.abs(parseInt(jbolt_table_pages.find("#pageSize").val()));
				  var totalPage=Math.abs(parseInt(jbolt_table_pages.find("#totalPage").text()));
				  var oldPageNumber=table.data("pagenumber");
				  var page=table.data("page");
				  if(!page||!oldPageNumber){
					  oldPageNumber=1;
				  }
				  table.data("pagenumber",pageNumber);
				  table.data("pagesize",pageSize);
				  table.data("totalpage",totalPage);
				  var leftScroll=table.table_body.scrollLeft();
				  var topScroll=table.table_body.scrollTop();
				  var sortColumn=table.data("sort-column");
				  table.table_body.scroll_top=topScroll;
				  table.table_body.scroll_left=leftScroll;
				  that.ajaxLoadTableData(table,function(){
					  table.table_body.needKeepScrollTopAndLeft=false;
					  table.table_body.sortRankAfter=false;
					  if(table.table_body.scroll_left||table.table_body.scroll_top){
						  if(oldPageNumber&&oldPageNumber==pageNumber){
							  table.table_body.needKeepScrollTopAndLeft=true;
						  }
						  if(sortColumn){
							  table.table_body.sortRankAfter=true;
						  }
					  }
					that.reProcessTableMain(table);
				  });
			},
			//添加占位pagebox
			addJboltPageBox:function(table){
				var pageId=table.data("page");
				if(!pageId){return false;}
				var pageHtml=juicer(jboltTablePageTpl,{pageId:pageId});
				var jbolt_table_pages=$(pageHtml);
				table.table_box.after(jbolt_table_pages);
				return jbolt_table_pages;
			},
			//初始化分页组件
			initJboltTablePage:function(table,pageInfo){
				var pageId=table.data("page");
				if(!pageId){return false;}
				table.data("totalpage",pageInfo.totalPage);
				var jbolt_table_pages=table.table_view.find(".jbolt_table_pages");
				if(!isOk(jbolt_table_pages)){
					jbolt_table_pages=addJboltPageBox(table);
				}
				var pager=jbolt_table_pages.find("#"+pageId);
				jbolt_table_pages.find("#gonu").val(pageInfo.pageNumber).attr("max",pageInfo.totalPage);
				jbolt_table_pages.find("#totalPage").text(pageInfo.totalPage);
				jbolt_table_pages.find("#totalRow").text(pageInfo.totalRow);
				jbolt_table_pages.find("#pageSize").val(pageInfo.pageSize);
				
				var that=this;
				pager.pagination(pageInfo.totalPage,{
					   num_edge_entries:1,
					   current_page:(pageInfo.pageNumber-1),
						callback:function(index,ct){
							if(isNaN(index)==false){
								var page=index+1;
								that.readByPage(table,page);
								return false;
							}
						}
				   });
				
				
				if(!table.data("page-ok")){
					jbolt_table_pages.find("#gonu").on("keydown",function(e){
						   if(e.keyCode==109||e.keyCode==189){
							   return false;
						   }
					   });
					jbolt_table_pages.find("#pageSize").on("change",function(){
						that.readByPage(table,1);
					   });
					
					jbolt_table_pages.find(".page-btn").on("click",function(){
						that.readByPage(table);
					});
				}
				table.page=jbolt_table_pages;
				
				//设置page初始化成功标识
				table.data("page-ok",true);
			},
			/**
			 * 添加多条数据
			 */
			addRowDatas:function(ele,data){
				var tagName=ele[0].tagName.toLowerCase();
				var appendEle,tplId;
				if(tagName=="tbody"){
					appendEle=ele;
					tplId=ele.parent().data("rowtpl");
				}else{
					appendEle=ele.find("tbody");
					tplId=ele.data("rowtpl");
				}
				var tplContent=g(tplId).innerHTML;
				if(data){
					//如果直接传数据数据 就直接渲染
					if(isArray(data)){
						appendEle.append(juicer(tplContent,{datas:data}));
						return true;
					}
					if(data.pageSize&&data.totalRow){
						//说明是分页数据
						appendEle.append(juicer(tplContent,{datas:data.list,pageNumber:data.pageNumber,pageSize:data.pageSize}));
					}
				}
				
				
			},
			/**
			 * 添加一行数据
			 */
			addRowData:function(ele,data){
				var tagName=ele[0].tagName.toLowerCase();
				var appendEle,tplId;
				if(tagName=="tbody"){
					appendEle=ele;
					tplId=ele.parent().data("rowtpl");
				}else{
					appendEle=ele.find("tbody");
					tplId=ele.data("rowtpl");
				}
				var tplContent=g(tplId).innerHTML;
				appendEle.append(juicer(tplContent,{datas:[data]}));
			},
			/**
			 * 重新刷新当前数据 如果有分页还要处理分页
			 */
			setTableData:function(table,data){
				if(table.data("tolastpage")){
					return false;
				}
				var that=this;
				//添加行数据
				that.addRowDatas(table.tbody,data);
				//处理table tbody 列补充类型 额外添加的
				that.processTableTbodyColumnPrepend(table);
				if(data.pageSize){
					//处理分页组件变化
					var pageInfo={pageNumber:data.pageNumber,pageSize:data.pageSize,totalPage:data.totalPage,totalRow:data.totalRow,firstPage:data.firstPage,lastPage:data.lastPage};
					that.initJboltTablePage(table,pageInfo);
				}
				table.jsonData=data;
			},
			showLoading:function(table){
				var loading=table.table_view.find(".jbolt_table_loading");
				if(!isOk(loading)){
					loading=$('<div class="jbolt_table_loading noselect"><span class="loading_msg"><i class="fa fa-spinner fa-pulse mr-2"></i>数据加载中...</span></div>');
					table.table_view.append(loading);
				}
				loading.show();
			},
			hideLoading:function(table){
				table.table_view.find('.jbolt_table_loading').hide();
			},
			processTheadOldWidth:function(table){
				var th,width,dataW,ths=table.thead.find("tr>th[data-col-index]");
				if(isOk(ths)){
					ths.each(function(){
						th=$(this);
						width=th.outerWidth();
						dataW=th.data("min-width")||th.data("width");
						if(width<dataW){
							width=dataW;
						}
						th.data("old-width",width).attr("data-old-width",width);
					});
				}
			},
			/**
			 * ajax加载table的数据
			 */
			ajaxLoadTableData:function(table,callback){
				var that=this;
				var url=table.data("url");
				if(!url){
					LayerMsgBox.alert("请指定表格数据加载地址：data-url属性",2);
					return false;
				}
				//先把fixed的div删掉
				table.table_view.find(".jbolt_table_fixed").remove();
				that.processTheadOldWidth(table);
				
				
				that.showLoading(table);
				var page=table.data("page");
				if(page){
					var pageNumber=table.data("pagenumber");
					var pageSize=table.data("pagesize");
					if(!pageSize){
						pageSize=10;
					}
					if(!pageNumber){
						pageNumber=1;
					}
					
					if(url.indexOf("?")!=-1){
						url=url+"&page="+pageNumber+"&pageSize="+pageSize;
					}else{
						url=url+"?page="+pageNumber+"&pageSize="+pageSize;
					}
				}
				//处理 sort 参数
				var sortColumn=table.data("sort-column");
				var sortType=table.data("sort-type");
				if(sortColumn&&sortColumn){
					if(url.indexOf("?")!=-1){
						url=url+"&sortColumn="+sortColumn+"&sortType="+sortType;
					}else{
						url=url+"?sortColumn="+sortColumn+"&sortType="+sortType;
					}
				}
				
				//执行ajax加载 要考虑绑定了查询条件的需要带着 用post
				var conditionsForm=table.data("conditions-form");
				if(conditionsForm!=undefined&&conditionsForm!=""&&conditionsForm!="undefined"){
					Ajax.getWithForm(conditionsForm,url,function(res){
						//如果分页了 并且 要求是调用跳转到最后一页 并且TM最后一页满了之后 新增加新页面后totalPage变更了
						//就要根据请求反馈信息拿到最后一页 重新调用一次查询最后一页
						if(table.data("page")){
							var toLastPage=table.data("tolastpage");
							if(toLastPage){
								table.data("tolastpage",false);
								table.removeAttr("data-tolastpage");
								var nowTotalPage=res.data.totalPage;
								var totalPage=table.data("totalpage");
								if(nowTotalPage!=totalPage){
									table.data("pagenumber",res.data.pageNumber);
									table.data("pagesize",res.data.pageSize);
									table.data("totalpage",nowTotalPage);
									//说明新增了一页
									that.readByPage(table,nowTotalPage);
									return true;
								}
							}
						}
						table.tbody.empty();
						//设置表格数据和分页数据
						that.setTableData(table,res.data);
						if(callback){
							callback();
						}
						that.hideLoading(table);
					});
				}else{
					Ajax.get(url,function(res){
						//如果分页了 并且 要求是调用跳转到最后一页 并且TM最后一页满了之后 新增加新页面后totalPage变更了
						//就要根据请求反馈信息拿到最后一页 重新调用一次查询最后一页
						if(table.data("page")){
							var toLastPage=table.data("tolastpage");
							if(toLastPage){
								table.data("tolastpage",false);
								table.removeAttr("data-tolastpage");
								var nowTotalPage=res.data.totalPage;
								var totalPage=table.data("totalpage");
								if(nowTotalPage!=totalPage){
									table.data("pagenumber",res.data.pageNumber);
									table.data("pagesize",res.data.pageSize);
									table.data("totalpage",nowTotalPage);
									//说明新增了一页
									that.readByPage(table,nowTotalPage);
									return true;
								}
							}
						}
						table.tbody.empty();
						//设置表格数据和分页数据
						that.setTableData(table,res.data);
						if(callback){
							callback();
						}
						that.hideLoading(table);
					});
				}
				
				
				
			},
			/**
			 * 处理空数据样式
			 */
			processEmptyTableBody:function(table){
				var tbody=table.find("tbody");
				var trs=tbody.find("tr");
				if(!isOk(trs)){
					tbody.append('<tr><td colspan="100%" class="text-center"><div class="alert alert-warning d-inline-block px-5 py-1 my-2" style="font-size:16px;"><i class="fa fa-warning mr-1"></i>暂无数据</div></td></tr>');
					table.table_view.find(".jbolt_table_fixed").hide();
				}else{
					table.table_view.find(".jbolt_table_fixed:not(.jbolt_table_fixed_hide)").show();
				}
			},
			//处理宽度高度
			processTableWidthAndHeight:function(table){
				this.initTableDataSet(table);
				this.setTableWidth(table);
				this.setTableHeight(table);
			},
			//初始化默认值
			initTableDataSet:function(table){
				var width=table.data("width");
				if(!width||(typeof(width)=="string"&&width=="100%")){
					width="fill";
					table.data("width","fill").attr("data-width","fill");
				} 
				//fill状态下
				var thWidth,th,styleWidth;
				var autoThs=table.thead.find("th[data-col-index][data-width='auto'],th[data-col-index][data-min-width],th[data-col-index]:not([data-width])");
				var hasAutoTh=isOk(autoThs);
				table.thead.find("th").each(function(){
					th=$(this);
					thWidth=th.data("width");
					if(!thWidth){
						styleWidth=this.style.width;
						if(!styleWidth){
							thWidth="auto";
						}else if(styleWidth.indexOf("px")!=-1){
							thWidth=parseInt(styleWidth);
						}
						th.data("width",thWidth).attr("data-width",thWidth);
						if(thWidth="auto"&&this.hasAttribute("data-col-index")&&!this.hasAttribute("data-min-width")){
							th.data("min-width","100").attr("data-min-width","100");
						}
					}else if(typeof(thWidth)=="number"&&this.hasAttribute("data-col-index")){
						if(hasAutoTh){
							th.attr("data-nochange","true").data("nochange",true);
						}
					}
				});
				//不设置就是fill
				var height=table.data("height");
				if(!height){
					var maxHeight=table.data("max-height");
					if(!maxHeight){
						table.data("height","fill").attr("data-height","fill");
					}
				}
			},
			//设置宽度
			setTableWidth:function(table){
				var width=table.data("width");
				if(width){
					var wtype=typeof(width);
					if(wtype=="number"){
						width=width+"px";
						table.table_view.css("width",width);
					}else if(wtype=="string"&&width=="auto"){
						table.table_view.css({"width":"100%","max-width":"100%"});
					}else if(wtype=="string"&&width=="fill"){
						table.table_view.css({"width":"100%","max-width":"100%"});
					}else if(wtype=="string"&&width.indexOf("%")!=-1&&width!="100%"){
						table.table_view.css({"width":width,"max-width":width});
					}else{
						table.table_view.css({"width":width,"max-width":width});
					}
				}
			},
			//处理主从结构高度
			processMasterSlaveBoxHeight:function(table){
				mainPjaxContainer.css({
					"overflow":"auto"
				});
				var box=table.closest(".jbolttable_master_slave_box");
				if(!isOk(box)){return false;}
				mainPjaxContainer.css({
					"overflow":"hidden"
				});
				table.data("in-master-slave",true);
				var jboltPage=box.closest(".jbolt_page");
				var height=jboltPage.height();
				var pageTitle=jboltPage.find(".jbolt_page_title");
				if(isOk(pageTitle)){
					height=height-parseInt(pageTitle.outerHeight());
				}
				height=height-18;
				box.css({
					"height":height,
					"max-height":height
				});
			},
			//处理fill_box
			processTableFillBox:function(table){
				if(table.data("height")!="fill_box"){return false;}
				var totalHeight=table.table_view.outerHeight();
				totalHeight=totalHeight-41;
				if(table.data("page")){
					totalHeight=totalHeight-44;
				}
				if(table.data("toolbar")){
					totalHeight=totalHeight-44;
				}
				table.table_body.css("height",totalHeight+"px");
			},
			//设置高度
			setTableHeight:function(table){
				var that=this,
				height=table.data("height");
				maxheight=table.data("max-height");
				if(!height&&maxheight){
					height=maxheight;
				}
				if(height){
					var htype=typeof(height);
					if(htype=="string"&&(height=="100%"||height=="fill")){
						var fillHeight=that.getFillHeight(table);
						if(!maxheight){
							table.table_body.css("height",fillHeight+"px");
						}
						table.table_body.css("max-height",fillHeight+"px");
					}else if(htype=="string"&&height=="fill_box"){
						that.processTableFillBox(table);
					}else if(htype=="string"&&height.indexOf("%")!=-1){	
						var fillHeight=that.getFillHeight(table);
						var numberHeightPre=Number(height.replace("%",""))/100;
						var tableHeight=parseInt(fillHeight*numberHeightPre);
						if(!maxheight){
							table.table_body.css("height",tableHeight+"px");
						}
						table.table_body.css("max-height",tableHeight+"px");
					}else{
						var thead=table.find("thead"),
						thh=thead.outerHeight();
						height=height-thh-4;
						if(!maxheight){
							table.table_body.css("height",height+"px");
						}
						table.table_body.css("max-height",height+"px");
					}
					that.refreshMainTableVScroll(table);
				}
			},
			getFillHeightInMasterSlaveBox:function(table){
				var splitBox=table.table_view.closest(".split");
				if(isOk(splitBox)){
					return parseInt(splitBox.height())-thh;
				}
			},
			getFillHeight:function(table){
				//判断在master slavebox中
				var jbolttable_master_slave_box=table.table_view.closest(".jbolttable_master_slave_box");
				if(isOk(jbolttable_master_slave_box)){
					return this.getFillHeightInMasterSlaveBox();
				}
				var that=this,
				thead=table.find("thead"),
				thh=thead.outerHeight(),
				tableH=parseInt(table.height()),
				height=tableH;
				//判断是不是在jbolt_page中
				var jboltPage=table.table_view.closest(".jbolt_page");
				if(isOk(jboltPage)){
					height=0;
					if(self!=top){
						height=Math.floor(jboltWindowHeight-50);
					}else{
						var jboltLayerPortal=jboltPage.closest(".jbolt_layer_portal");
						if(isOk(jboltLayerPortal)){
							height=Math.floor(jboltLayerPortal.height())-50;
						}else{
							height=Math.floor(mainPjaxContainer.height())-50;
						}
					}
					var pageTitle=jboltPage.find(".jbolt_page_title");
					if(isOk(pageTitle)){
						height=height-parseInt(pageTitle.outerHeight());
					}
				}else{
					height=0;
					if(self!=top){
						height=parseInt(jboltWindowHeight-50);
					}else{
						var jboltLayerPortal=jboltPage.closest(".jbolt_layer_portal");
						if(isOk(jboltLayerPortal)){
							height=Math.floor(jboltLayerPortal.height())-50;
						}else{
							height=jboltWindowHeight-50;
							var jbolt_admin_main_top=$(".jbolt_admin_main_top");
							if(isOk(jbolt_admin_main_top)){
								height=parseInt(height-jbolt_admin_main_top.outerHeight());
							}
						}
						
					}
				}
				
				var page_box=table.table_view.find(".jbolt_table_pages");
				if(isOk(page_box)){
					var pagerHeight=Math.ceil(page_box.outerHeight());
					height=height-pagerHeight;
				}
				if(isOk(table.toolbar)){
					var toolbarHeight=Math.ceil(table.toolbar.outerHeight());
					height=height-toolbarHeight;
				}
				
				var eles=table.data("height-elements");
				if(isOk(eles)){
					jboltPage.find(eles).each(function(){
						height=height-Math.ceil($(this).outerHeight());
					});
				}
				height=height-thh;
				return Math.floor(height);
			},
			isSetRightFixedColumn:function(table){
				//判断是否设置了fixedColumn
				return  table.data("fixed-columns-right");
			},
			isSetFixedColumn:function(table){
				//判断是否设置了fixedColumn
				return (table.data("fixed-columns-left")||table.data("fixed-columns-right"));
			},
			/**
			 * ajax加载数据或者渲染本地Table后执行的样式处理任务
			 */ 
			processTableStyle:function(table){
				var that=this;
				//处理单元格宽度
				that.processCellWidthAndHeight(table);
				//处理fixedHeader
				that.processHeaderFixed(table);
				//处理fixedColumn
				that.processColumnFixed(table);
				//处理空的tbody
				that.processEmptyTableBody(table);
			},
			processColumnFixed:function(table){
				//处理fixedColumn left
				this.processColumnFixedLeft(table);
				//处理fixedColumn right
				this.processColumnFixedRight(table);
				//如果有横向滚动条 处理一下样式
				this.refreshFixedColumnHScroll(table);
			},
			processFixedColumnTableTrHoverEvent:function(table){
				//fixed table的houver事件处理
				table.table_box.on("mouseenter",".jbolt_table_fixed>.jbolt_table_body>table>tbody>tr",function(){
					var tr=$(this);
					var index=tr.index();
					table.find("tbody>tr:eq("+index+")").addClass("hover");
					if(isOk(table.fixedColumnTables)){
						table.fixedColumnTables.find("tbody>tr:eq("+index+")").addClass("hover");
					}
				}).on("mouseleave",".jbolt_table_fixed>.jbolt_table_body>table>tbody>tr",function(){
					var tr=$(this);
					var index=tr.index();
					table.find("tbody>tr:eq("+index+")").removeClass("hover");
					if(isOk(table.fixedColumnTables)){
						table.fixedColumnTables.find("tbody>tr:eq("+index+")").removeClass("hover");
					}
				});
			},
			processMainTableTrHoverEvent:function(table){
				//主table的hover事件
				table.on("mouseenter","tbody>tr",function(){
					var tr=$(this);
					tr.addClass("hover");
					var index=tr.index();
					if(isOk(table.fixedColumnTables)){
						table.fixedColumnTables.find("tbody>tr:eq("+index+")").addClass("hover");
					}
				}).on("mouseleave","tbody>tr",function(){
					var tr=$(this);
					tr.removeClass("hover");
					var index=tr.index();
					if(isOk(table.fixedColumnTables)){
						table.fixedColumnTables.find("tbody>tr:eq("+index+")").removeClass("hover");
					}
				});
			},
			processMainTableBodyScrollAndResizeEvent:function(table){
				//处理主table的scroll和resize
				var that=this;
				table.table_body.on("scroll",function(e){
					var leftScroll=table.table_body.scrollLeft();
					table.fixed_header.table.css("margin-left",(0-leftScroll)+"px");
					var topScroll=table.table_body.scrollTop();
					if(isOk(table.fixedColumnTables)){
						table.fixedColumnTables.css("margin-top",(0-table.thead.height-topScroll)+"px");
					}
				}).on("resize",function(){
					that.processTableColWidthAfterResize(table);
					//reize的时候判断scroll相关的处理了
					that.refreshMainTableVScroll(table);
					//如果有横向滚动条 处理一下样式
					that.refreshFixedColumnHScroll(table);
				});
			},
			/**
			 * ajax加载数据前或者渲染本地Table后执行的事件处理任务
			 */
			processTableEvent:function(table){
				var that=this;
				//处理主table的scroll和resize
				that.processMainTableBodyScrollAndResizeEvent(table);
				//处理主table的tr hover绑定
				that.processMainTableTrHoverEvent(table);
				//处理table tr hover
				that.processFixedColumnTableTrHoverEvent(table);
				//处理tableheader上的拖拽列宽和点击列头排序事件
				that.processTableColWidthResizeAndColSortEvent(table);
				//处理columnPrepend点击事件
				that.processTableColumnPrependEvent(table);
				//处理fixedColumn上的滚轮事件
				that.processFixedColumnScrollEvent(table);
				
			},
			processFixedColumnScrollEvent:function(table){
				//处理fixedColumn上的滚轮事件
				table.table_view.on("mousewheel",".jbolt_table_fixed",function(e){
					var topScroll=table.table_body.scrollTop();
					topScroll=topScroll-e.originalEvent.wheelDelta;
					table.table_body.scrollTop(topScroll);
					return false;
				});
			},
			/**
			 * 处理columnprepend组件事件
			 */
			processTableColumnPrependEvent:function(table){
//				var ajax=table.data("ajax");
				var hasColumnPrepend=table.data("column-prepend");
				//ajax加载table 但是没设置这个 就直接略过
//				if(ajax&&!hasColumnPrepend){
				if(!hasColumnPrepend){
					return false;
				}
				/*if(!ajax){
					var theadPrepend=table.find("thead>tr>th>.jbolt_table_checkbox,thead>tr>th>.jbolt_table_radio");
					if(!isOk(theadPrepend)){
						return false;
					}
				}*/
				var that=this;
				//绑定change后的样式变更
				table.table_view.on("change",".jbolt_table_checkbox>input[type='checkbox']",function(e){
					if(this.checked){
						$(this).parent().addClass("checked");
					}else{
						$(this).parent().removeClass("checked");
					}
				});
				//绑定thead全选和全不选
				table.table_view.on("click","table>thead>tr>th>.jbolt_table_checkbox>input[type='checkbox']",function(e){
					var jbolt_table_checkbox=$(this).parent();
					var name=this.name;
					if(this.checked){
						CheckboxUtil.checkAll(name);
					}else{
						CheckboxUtil.uncheckAll(name);
					}
				});
				//绑定tbody中的
				table.table_view.on("click","table>tbody>tr>td>.jbolt_table_checkbox>input[type='checkbox']",function(e){
					var jbolt_table_checkbox=$(this).parent();
					var rowIndex=jbolt_table_checkbox.closest("tr").index();
					var colIndex=jbolt_table_checkbox.closest("td").data("col-index");
					var me=$(this);
					var ptable=me.closest("table.jbolt_main_table");
					var isMainTable=isOk(ptable);
					var pfixed=me.closest(".jbolt_table_fixed");
					var isFixedTable=isOk(pfixed);
					var theadCheckboxs=table.table_view.find("table>thead>tr>th[data-col-index='"+colIndex+"']>.jbolt_table_checkbox>input[type='checkbox']");
					//如果选中了
					if(this.checked){
						if(that.isCheckboxCheckedAll(table)){
							CheckboxUtil.checkIt(theadCheckboxs);
						}
					}else{//没选中就去掉全选
						CheckboxUtil.uncheckIt(theadCheckboxs);
					}
					//如果是mainTable不是悬浮table
					if(isMainTable&&!isFixedTable){
						//存在fixedTable
						if(isOk(table.fixedColumnTables)){
							var fixedCheckbox=table.fixedColumnTables.find("tbody>tr:eq("+rowIndex+")>td[data-col-index='"+colIndex+"']>.jbolt_table_checkbox>input[type='checkbox']");
							if(isOk(fixedCheckbox)){
								if(this.checked){
									CheckboxUtil.checkIt(fixedCheckbox);
								}else{//没选中就去掉全选
									CheckboxUtil.uncheckIt(fixedCheckbox);
								}
							}
						}
						
					}else
					//如果是悬浮table
					if(isFixedTable&&!isMainTable){
						var mainTableCheckbox=table.find("tbody>tr:eq("+rowIndex+")>td[data-col-index='"+colIndex+"']>.jbolt_table_checkbox>input[type='checkbox']");
						if(isOk(mainTableCheckbox)){
							if(this.checked){
								CheckboxUtil.checkIt(mainTableCheckbox);
							}else{//没选中就去掉全选
								CheckboxUtil.uncheckIt(mainTableCheckbox);
							}
						}
					}
				});
				
				
			},
			getCheckboxCheckedCount:function(table){
				return table.find("tbody>tr>td>.jbolt_table_checkbox>input[type='checkbox'][name='jboltTableCheckbox']:checked").length;
			},
			getRadioCheckedCount:function(table){
				return table.find("tbody>tr>td>.jbolt_table_radio>input[type='radio'][name='jboltTableRadio']:checked").length;
			},
			isCheckboxCheckedAll:function(table){
				return table.find("tbody>tr").length==this.getCheckboxCheckedCount(table);
			},
			isCheckboxCheckedOne:function(table){
				return this.getCheckboxCheckedCount(table)==1;
			},
			isCheckboxCheckedNone:function(table){
				return this.getCheckboxCheckedCount(table)==0;
			},
			isRadioCheckedOne:function(table){
				return this.getRadioCheckedCount(table)==1;
			},
			isRadioCheckedNone:function(table){
				return this.getRadioCheckedCount(table)==0;
			},
			isCheckboxCheckedMulti:function(table){
				return this.getCheckboxCheckedCount(table)>1;
			},
			processTableThResizeAndSortStyleEvent:function(e){
				if(e.target.tagName=="TH"){
					//说明鼠标在TH上了
					var th=$(e.target);
					th.data("can-sort",false).attr("data-can-sort",false);
					var tr=th.parent(),resizing=th.data("resizing");
					var width=th.outerWidth()-10,left=th.offset().left;
					var newWidth=e.clientX-left;
					if(th.hasClass("resize_col")){
						if(!resizing){
							if(newWidth>=width){
								th.data("can-resize",true).attr("data-can-resize",true);
								if(tr.css("cursor")!="col-resize"){
									tr.css("cursor","col-resize");
								}
							}else{
								th.data("can-resize",false).attr("data-can-resize",false);
								if(th.hasClass("sort_col")){
									tr.css("cursor","pointer");
									th.data("can-sort",true).attr("data-can-sort",true);
								}else{
									if(tr.css("cursor")!="auto"){
										tr.css("cursor","auto");
									}
								}
							}
						}
					}else if(th.hasClass("sort_col")){
						tr.css("cursor","pointer");
						th.data("can-sort",true).attr("data-can-sort",true);
					}else{
						tr.css("cursor","auto");
						th.data("can-resize",false).attr("data-can-resize",false).data("can-sort",false).attr("data-can-sort",false);
					}
					
				}
			},
			processTableColWidthResizeAndColSortEvent:function(table){
				//处理tableheader上的拖拽列宽和点击列头排序事件
				var that=this;
				if(table.data("column-resize")){
					table.table_view.on("mousemove",function(e){
						var resizingTh=table.table_view.find("table>thead>tr>th[data-resizing='true']");
						if(isOk(resizingTh)){
							if(table.right_fixed){
								table.right_fixed.addClass("jbolt_table_fixed_hide");
							}
							var width=resizingTh.outerWidth()-10,left=resizingTh.offset().left;
							var newWidth=e.clientX-left;
							var dataWidth=resizingTh.data("width");
							var dataMinWidth=resizingTh.data("min-width");
							if(dataMinWidth){
								dataWidth=dataMinWidth;
							}
							if(newWidth>dataWidth){
								that.resizeTheadTh(table,resizingTh.data("col-index"),newWidth);
							}
						}else{
							that.processTableThResizeAndSortStyleEvent(e);
						}
					}).on("mousedown",".jbolt_table_header>table>thead>tr>th.resize_col",function(e){
						var th=$(this);
						var canResize=th.data("can-resize");
						th.data("resizing",canResize?true:false).attr("data-resizing",canResize?true:false);
						if(canResize){
							var cursor=th.parent().css("cursor");
							if(cursor="col-resize"){
								table.table_box.find("table.jbolt_table.novscroll").addClass("col_last_need_border_right active");
							}
						}
						return false;
					}).on("mouseup",function(e){
						 e.preventDefault();
						$(this).find('.jbolt_table_header>table>thead>tr>th').data("resizing",false).data("can-resize",false).attr("data-resizing",false).attr("data-can-resize",false);
						//如果有横向滚动条 处理一下样式
						that.refreshFixedColumnHScroll(table);
					});
				}else{
					table.table_view.on("mousemove",function(e){
						that.processTableThResizeAndSortStyleEvent(e);
					})
				}
				
				
				table.table_view.on("click",".jbolt_table_header>table>thead>tr>th[data-can-sort='true']",function(e){
					  e.preventDefault();
					  e.stopPropagation();
					  if(e.target.tagName=="I"){
						  var i=$(e.target),type,th=i.closest("th");
						  if(i.hasClass("sort_asc")){
							  type="asc";
						  }else if(i.hasClass("sort_desc")){
							  type="desc";
						  }
						  that.sortByCol(table,th,type);
					  }else{
						  that.sortByCol(table,$(this));
					  }
					return false;
				});
				
				var ajax=table.data("ajax");
				if(!ajax){
					table.table_view.on("mouseenter",".jbolt_table_header>table>thead>tr",function(e){
						if(e.target.tagName=="TH"){
							//说明鼠标在TH上了
							var th=$(e.target),tr=th.parent();
							var width=th.outerWidth()-10,left=th.offset().left;
							var newWidth=e.clientX-left;
							if(newWidth<width){
								tr.css("cursor","pointer");
								th.data("can-sort",true).attr("data-can-sort",true);
							}
						}		
					});
				}
			},
			//排序查询
			sortByCol:function(table,col,theSortType){
				var sort_column_name=col.data("column");
				var colIndex=col.data("col-index");
				table.data("sort-column",sort_column_name).attr("data-sort-column",sort_column_name);
				var defaultSortColumn=table.data("default-sort-column");
				if(defaultSortColumn&&sort_column_name==defaultSortColumn&&!theSortType){
					//如果table的默认排序字段就是当前要排序的字段 并且当前排序的字段已经是倒序排列了 就需要切换为正序
					var activeType=col.find("i.sort.active");
					if(isOk(activeType)){
						if(activeType.hasClass("sort_desc")){
							theSortType="asc";
						}
					}
				}
				if(theSortType){
					//指定要用什么方式了
					var sameCols=table.table_view.find("table>thead>tr>th[data-col-index='"+colIndex+"']");
					table.table_view.find("i.sort.active").removeClass("active");
						if(theSortType=="desc"){
							table.data("sort-type","desc").attr("data-sort-type","desc");
							sameCols.find("i.sort.sort_desc").addClass("active");
						}else if(theSortType=="asc"){
							table.data("sort-type","asc").attr("data-sort-type","asc");
							sameCols.find("i.sort.sort_asc").addClass("active");
						}
				}else{
					var sortType=col.find("i.sort.active");
					var sameCols=table.table_view.find("table>thead>tr>th[data-col-index='"+colIndex+"']");
					table.table_view.find("i.sort.active").removeClass("active");
					if(isOk(sortType)){
						if(sortType.hasClass("sort_asc")){
							table.data("sort-type","desc").attr("data-sort-type","desc");
							sameCols.find("i.sort.sort_desc").addClass("active");
						}else if(sortType.hasClass("sort_desc")){
//							table.data("sort-type","asc");
//							sameCols.find("i.sort.sort_asc").addClass("active");
							table.data("sort-column","").removeAttr("data-sort-column").data("sort-type","").removeAttr("data-sort-type");
						}
					}else{
						sameCols.find("i.sort.sort_asc").addClass("active");
						table.data("sort-type","asc").attr("data-sort-type","asc");
					}
					
				}
				
				var ajax=table.data("ajax");
				if(ajax){
					this.readByPage(table,1);
				}else{
					this.tableSubmitForm(table,1);
				}
			},
			resizeTheadTh:function(table,thColIndex,width){
				table.table_view.find("table>thead>tr>th[data-col-index='"+thColIndex+"']").css({
					"width":width+"px",
					"min-width":width+"px",
					"max-width":width+"px"
				});
				table.table_view.find("table>tbody>tr>td[data-col-index='"+thColIndex+"']").css({
					"width":width+"px",
					"min-width":width+"px",
					"max-width":width+"px"
				});
			},
			//刷新主table的v scroll样式
			refreshMainTableVScroll:function(mainTable){
				var that=this;
				var thh=parseInt(mainTable.find("thead").outerHeight())+1;
				var hasVScroll=checkTableBodyHasScrolled(mainTable, "v");
				if(hasVScroll){
					mainTable.table_box.find("table").removeClass("novscroll");
				}else{
					mainTable.table_box.find("table").addClass("novscroll");
				}
				that.processHeaderRight(mainTable);
				var tableDataHeight=mainTable.data("height");
				var isFillHeight=(typeof(tableDataHeight)=="string"&&tableDataHeight=="fill");
				var tableH=parseInt(mainTable.height());
				var bodyH=parseInt(mainTable.table_body.height());
				if(isFillHeight){
					if(hasVScroll){
						mainTable.table_box.find(".jbolt_table_body>table").addClass("noBottomBorder");
					}else{
						mainTable.table_box.find(".jbolt_table_body>table").removeClass("noBottomBorder");
					}
				}else{
					
					if(tableH< bodyH){
						mainTable.table_box.find(".jbolt_table_body>table").removeClass("noBottomBorder");
					}else{
						mainTable.table_box.find(".jbolt_table_body>table").addClass("noBottomBorder");
					}
				}
				
				
				
			},
			//刷新主table的h scroll样式
			refreshFixedColumnHScroll:function(mainTable){
				var that=this;
				var hasHScroll=checkTableBodyHasScrolled(mainTable, "h");
				var hasVScroll=checkTableBodyHasScrolled(mainTable, "v");
				var tmh=parseInt(mainTable.find("thead").outerHeight())+1;
				var mainTbodyHeight=parseInt(mainTable.table_body.height());
				var tableH=parseInt(mainTable.height());
				var tableDataHeight=mainTable.data("height");
				var isFillHeight=(typeof(tableDataHeight)=="string"&&tableDataHeight=="fill");
				//如果是height fill的情况
				if(isFillHeight){
					if(hasHScroll){
						var scrollHeight=getScrollBarHeight(mainTable.table_body[0]);
						mainTbodyHeight=mainTbodyHeight-scrollHeight;
					}else{
						if(!hasVScroll){
							mainTbodyHeight=tableH-tmh;
						}
					}
					
				}else{
					if(hasHScroll){
						var scrollHeight=getScrollBarHeight(mainTable.table_body[0]);
						mainTbodyHeight=mainTbodyHeight-scrollHeight;
					}
				}
			
				
				//左侧处理
				if(isOk(mainTable.left_fixed)){
					//处理fixed 区域高度
					mainTable.left_fixed.body.css({
						"max-height":mainTbodyHeight+"px",
						"height":"auto"
					});
					if(hasHScroll){
						mainTable.left_fixed.removeClass("jbolt_table_fixed_hide");
					}else{
						mainTable.left_fixed.addClass("jbolt_table_fixed_hide");
					}
				}
				//右侧处理
				if(isOk(mainTable.right_fixed)){
					//处理fixed 区域高度
					mainTable.right_fixed.body.css({
						"max-height":mainTbodyHeight+"px",
						"height":"auto"
					});
					if(hasVScroll){
						var scrollWidth=getScrollBarWidth(mainTable.table_body[0]);
						mainTable.right_fixed.css({
							"right":scrollWidth+"px"
						});
						var jbolt_table_fixed_right_mend=mainTable.right_fixed.header.find(".jbolt_table_fixed_right_mend");
						if(!isOk(jbolt_table_fixed_right_mend)){
							mainTable.right_fixed.header.append("<div class='jbolt_table_fixed_right_mend' style='width:"+scrollWidth+"px;right:"+(0-scrollWidth)+"px'></div>");
						}
					}else{
						mainTable.right_fixed.css({
							"right":"-1px"
						});
						mainTable.right_fixed.header.find(".jbolt_table_fixed_right_mend").remove();
					}
					
					if(hasHScroll){
						mainTable.right_fixed.removeClass("jbolt_table_fixed_hide");
					}else{
						mainTable.right_fixed.addClass("jbolt_table_fixed_hide");
					}
					
				}
			},
			getColumnFixedIndexArr:function(table,fixed_columns_dir){
				var fixed_columns=table.data("fixed-columns-"+fixed_columns_dir),indexArr;
				if(fixed_columns){
					if(typeof(fixed_columns)=="number"){
						indexArr=[fixed_columns];
					}else{
						indexArr=fixed_columns.split(",");
					}
				}
				return indexArr;
			},
			cloneTableBoxContent:function(table_box,dir,indexArr){
				var that=this;
				var className="jbolt_table_fixed_"+dir;
				//从原数据处克隆后处理
				var fixedColumnBox=$('<div class="jbolt_table_fixed"></div>');
				fixedColumnBox.addClass(className);
				var jbolt_table_header=table_box.find(".jbolt_table_header:first").clone();
				var jbolt_table_body=table_box.find(".jbolt_table_body:first").clone();
				var size=indexArr.length;
				var trs=jbolt_table_header.find("thead>tr");
				var trlen=trs.length;
				if(trlen==1){
					var thead_th_selector="table>thead>tr>th:not(",
					tbody_td_selector="table>tbody>tr>td:not(";
					//就一行的话 好说
					for(var i=0;i<size;i++){
						thead_th_selector=thead_th_selector+(i>0?",":"")+":nth-child("+indexArr[i]+")";
						tbody_td_selector=tbody_td_selector+(i>0?",":"")+":nth-child("+indexArr[i]+")";
					}
					thead_th_selector=thead_th_selector+")";
					tbody_td_selector=tbody_td_selector+")";
					jbolt_table_header.find(thead_th_selector).remove();
					jbolt_table_body.find(thead_th_selector).remove();
					jbolt_table_body.find(tbody_td_selector).remove();
				}else{
					//如果多行
					var thead_th_selector1="table>thead>tr>th:not(",
					tbody_td_selector1="table>tbody>tr>td:not(";
					//就一行的话 好说
					for(var i=0;i<size;i++){
						thead_th_selector1=thead_th_selector1+(i>0?",":"")+"[data-fixed-col-index='"+indexArr[i]+"']";
						tbody_td_selector1=tbody_td_selector1+(i>0?",":"")+"[data-fixed-col-index='"+indexArr[i]+"']";
					}
					thead_th_selector1=thead_th_selector1+")";
					tbody_td_selector1=tbody_td_selector1+")";
					jbolt_table_header.find(thead_th_selector1).remove();
					jbolt_table_body.find(thead_th_selector1).remove();
					jbolt_table_body.find(tbody_td_selector1).remove();
				}
				
				//这里去掉fixed_right上的resize_col 为了不让 右侧的fixed column控制宽度
				if(dir=="right"){
					jbolt_table_header.find("table>thead>tr>th.resize_col").removeClass("resize_col");
				}
				
				fixedColumnBox.append(jbolt_table_header);
				fixedColumnBox.append(jbolt_table_body);
				jbolt_table_header.table=jbolt_table_header.find("table");
				var header_width=jbolt_table_header.table.css("width");
				if(header_width&&typeof(header_width)=="string"&&header_width.indexOf("px")!=-1){
					jbolt_table_header.table.css({"width":"auto"});
				}
				jbolt_table_body.table=jbolt_table_body.find("table");
				var body_width=jbolt_table_body.table.css("width");
				if(body_width&&typeof(body_width)=="string"&&body_width.indexOf("px")!=-1){
					jbolt_table_body.table.css({"width":"auto"});
				}
				that.clearTableData(jbolt_table_header.table);
				that.clearTableData(jbolt_table_body.table);
				fixedColumnBox.header=jbolt_table_header;
				fixedColumnBox.body=jbolt_table_body;
				return fixedColumnBox;
			},
			processColumnFixedLeft:function(table){
				var that=this;
				//得到需要左侧显示的fixedColumns 列序号
				var indexArr=that.getColumnFixedIndexArr(table,"left");
				if(!indexArr||indexArr.length==0){return false;}
				//创建一个左侧覆盖区域 用于存放左侧需要fixed效果的columns
				var jbolt_table_fixed=that.cloneTableBoxContent(table.table_box,"left",indexArr);
				//append
				table.table_box.append(jbolt_table_fixed);
				
				initToolTip(jbolt_table_fixed);
				table.left_fixed=jbolt_table_fixed;
				table.fixedColumnTables=table.table_box.find(".jbolt_table_fixed>.jbolt_table_body>table");
			},
			processColumnFixedRight:function(table){
				var that=this;
				//得到需要左侧显示的fixedColumns 列序号
				var indexArr=that.getColumnFixedIndexArr(table,"right");
				if(!indexArr||indexArr.length==0){return false;}
				
				//创建一个左侧覆盖区域 用于存放左侧需要fixed效果的columns
				var jbolt_table_fixed=that.cloneTableBoxContent(table.table_box,"right",indexArr);
				jbolt_table_fixed.addClass("jbolt_table_fixed_hide");
				//append
				table.table_box.append(jbolt_table_fixed);
				
				initToolTip(jbolt_table_fixed);
				table.right_fixed=jbolt_table_fixed;
				table.fixedColumnTables=table.table_box.find(".jbolt_table_fixed>.jbolt_table_body>table");
			},
			processHeaderRight:function(table){
				//获得滚动条宽度，用来设置clone出来的thead里的右侧样式
				var scrollbarW=getScrollBarWidth(table.table_body[0]);
				if(scrollbarW){
					table.table_box.find(".jbolt_table_header").css("padding-right",scrollbarW+"px");
				}else{
					table.table_box.find(".jbolt_table_header").css("padding-right","0px");
				}
			},clearTableData:function(table){
				table.removeAttr("data-jbolttable");
				table.removeAttr("data-fixed-columns-left");
				table.removeAttr("data-fixed-columns-right");
				table.removeClass("jbolt_main_table");
				table.removeAttr("id");
			},
			processHeaderFixed:function(table){
				//要去复制一份儿 thead
				var that=this,
				headerTable=table.clone(),
				thead=headerTable.find("thead");
				that.clearTableData(headerTable);
				if(table.data("column-resize")){
					thead.find("tr>th").addClass("resize_col");
				}
				headerTable.find("tbody").remove();
				var jboltTableHeader=$("<div>");
				jboltTableHeader.addClass("jbolt_table_header");
				jboltTableHeader.append(headerTable);
				//在原区域上方插入
				table.table_body.before(jboltTableHeader);
				//把原来的thead隐藏掉
				table.css("margin-top","-"+table.thead.height+"px");
				table.table_box.addClass("fixedHeader");
				that.processHeaderRight(table);
				initToolTip(thead);
				//赋值给table
				jboltTableHeader.table=headerTable;
				table.fixed_header=jboltTableHeader;
			},
			processTableColWidthAfterResize:function(table){
				var that=this;
				that.processCellWidthAndHeight(table);
			},
			//处理一行header的样式
			processTheadWidthCompletion:function(table){
				//如果存在auto列 就判断现在满了没有
				var that=this,avgWidth=60,th,avgthsSize,avgths,laveaWidth=0;
				var hasVScroll=checkTableBodyHasScrolled(table, "v");
				var scrollWidth=hasVScroll?getScrollBarWidth(table.table_body[0]):0;
				if(hasVScroll){
					//有滚动条的时候处理单独的
					table.tableBodyLeaveWidth=table.tableBodyLeaveWidth-scrollWidth-1;
				}
				avgths=table.thead.find("tr>th[data-col-index][data-width='auto'],tr>th[data-col-index]:not([data-width]),tr>th[data-col-index]:not([data-nochange]):not([data-column='index']):not([data-column='checkbox']):not([data-column='optcol'])");
				if(isOk(avgths)){
					avgthsSize=avgths.length;
					if(table.tableBodyLeaveWidth<200&&avgthsSize>=2){
						avgWidth=100;
					}else{
						avgWidth=Math.floor(table.tableBodyLeaveWidth/avgthsSize);
						laveaWidth=table.tableBodyLeaveWidth-avgWidth*avgthsSize;
						var tbs=table.closest(".jbolt_page").find("[data-jbolttable]");
						if(tbs.length==1){
							 if(table.thead.trs.length>1){
								laveaWidth=laveaWidth-2;
							}
						}else{
							if(table.thead.trs.length>2){
								laveaWidth=laveaWidth-2;
							}else if(table.thead.trs.length>1){
								laveaWidth=laveaWidth-1;
							}
						}
					}
					var avgMinThWidth,real_avgWidth,dataWidth;
					avgths.each(function(i){
						th=$(this);
						real_avgWidth=avgWidth;
						if(i==avgthsSize-1){
							real_avgWidth=real_avgWidth+laveaWidth;
						}
						dataWidth=th.data("min-width")||th.data("width");
						if(dataWidth<100){
							dataWidth=100;
						}
						if(real_avgWidth<dataWidth){
							real_avgWidth=dataWidth;
						}
						that.resizeTheadTh(table,th.data("col-index"),real_avgWidth);
					});
				}
			},
			/**
			 * 处理单元格宽高和样式
			 */
			processCellWidthAndHeight:function(table){	
				//这里得到了表格外框的宽度 然后需要看看是不是要把表格列设置均匀分布
				var that=this;
				var ths=table.thead.find("th[data-col-index]");
				var thsize=ths.length;
				//表格还剩多少没分配宽度 
				table.tableBodyLeaveWidth=table.table_body.width()-1;
				for(var i=0;i<thsize;i++){
					//处理非auto列的宽度 一次性设置好 不能变更的 剩下的下面自动化处理
					that.setOneColumnWidth(table,i,ths.eq(i));
				}
				var width=table.data("width");
				if(width&&width!="auto"){
					//处理补全
					that.processTheadWidthCompletion(table);
				}
				
				//如果是fill的就得等width设置好再设置height
				if(!table.data("ajax")){
					that.processCellHeight(table);
				}
				that.processTheadThHeight(table);
				if(table.hasClass('novscroll')){
					table.addClass("col_last_need_border_right");
				}
					
			},
			processHeadThAndBodyTbFinalWidth:function(table){
				var that=this;
				var thead=table.find("thead"),tbody=table.find("tbody"),ths=thead.find("tr>th[data-col-index]:not(.jbolt_table_last_th)");
				if(!isOk(ths)){return false;}
				var thSize=ths.length,thColIndex,th,real_width,width,totalWidth=0,autoThColIndex=new Array();
				for(var i=0;i<thSize;i++){
					th=ths.eq(i);
					thColIndex=th.data("col-index");
					real_width=th[0].offsetWidth;
					var leftBorderWidth=parseInt(th.css("border-left-width"));
					var rightBorderWidth=parseInt(th.css("border-right-width"));
					real_width=real_width-leftBorderWidth;
					width=th.data("width");
					if(!width||width=="auto"){
						autoThColIndex.push(thColIndex);
					}else{
						if(real_width<width){
							real_width=width;
						}
						totalWidth=totalWidth+real_width;
						that.resizeTheadTh(table,thColIndex,real_width);
					}
					
				}
				var autoThInfo={totalWidth:totalWidth,autoThColIndex:autoThColIndex};
				return autoThInfo;
			},
			processHeadThAndBodyTbAutoWidth:function(table){
				var that=this;
				var thead=table.find("thead"),tbody=table.find("tbody"),ths=thead.find("tr>th[data-col-index][data-width='auto']:not(.jbolt_table_last_th)");
				if(!isOk(ths)){return false;}
				tbody.hide();
				var thSize=ths.length,thColIndex,th,real_width;
				for(var i=0;i<thSize;i++){
					th=ths.eq(i);
					thColIndex=th.data("col-index");
					real_width=th.outerWidth();
					that.resizeTheadTh(table,thColIndex,real_width);
				}
				tbody.show();
			},
			/**
			 * 处理tbody单元格宽 ajax之后
			 */
			processCellWidthAfterAjax:function(table){
				//这里得到了表格外框的宽度 然后需要看看是不是要把表格列设置均匀分布
				var that=this;
				var th,thwidth,realWidth,ths=table.thead.find("th[data-col-index]");
				ths.each(function(i){
					th=$(this);
					thwidth=th.data("old-width");
					that.resizeTheadTh(table,th.data("col-index"),thwidth);
				});
				table.table_view.find("table").removeClass("col_last_need_border_right");
				that.processCellHeight(table);
				
				//开始判断样式了
				var hasVScroll=checkTableBodyHasScrolled(table, "v");
				var lw=table.outerWidth()-(table.table_body.outerWidth()-1);
				var scrollBarWidth=getScrollBarWidth(table.table_body[0]);
				var avgths=table.thead.find("tr>th[data-col-index][data-width='auto'],tr>th[data-col-index]:not([data-width]),tr>th[data-col-index]:not([data-nochange]):not([data-column='index']):not([data-column='checkbox']):not([data-column='optcol'])");
				if(isOk(avgths)){
					var avgth=avgths.eq(0);
					if(lw>=0){
						if(hasVScroll){
							realWidth=avgth.outerWidth()-scrollBarWidth-lw;
						}else{
							realWidth=avgth.outerWidth()-lw+1;
						}
					}else{
						if(hasVScroll){
							realWidth=avgth.outerWidth()-lw-scrollBarWidth;
						}else{
							realWidth=avgth.outerWidth()-lw+scrollBarWidth;
						}
					}
					if(realWidth){
						that.resizeTheadTh(table,avgth.data("col-index"),realWidth);
					}
				}
			},
			processOneAutoThWidthByTrChange:function(table){
				var that=this;
				var hasVScroll=checkTableBodyHasScrolled(table, "v");
				var hasHScroll=checkTableBodyHasScrolled(table, "h");
				var thead=table.find("thead");
				if(!hasVScroll&&!hasHScroll){
					var isAuto=table[0].style.width="auto";
					if(isAuto){
						var pr=parseInt(table.fixed_header.css("padding-right"));
						var cha=table.table_body.width()-table.width();
						if(cha>=10||cha<=-10){
							var lastTh=thead.find("tr>th[data-col-index][data-width='auto']:first");
							if(!isOk(lastTh)){
								lastTh=thead.find("tr>th[data-col-index]:not([data-width]):first");
							}
							if(isOk(lastTh)){
								var lastThWidth=lastTh.outerWidth()+cha;
								that.resizeTheadTh(table,lastTh.data("col-index"),lastThWidth);
							}
							return;
						}
					}
				}else if(hasVScroll&&!hasHScroll){
					var isAuto=table[0].style.width="auto";
					if(isAuto){
						var pr=parseInt(table.fixed_header.css("padding-right"));
						var cha=table.table_body.width()-table.width();
						if(pr==0&&(cha<=5||cha>=-5)){
							var lastTh=thead.find("tr>th[data-col-index][data-width='auto']:first");
							if(!isOk(lastTh)){
								lastTh=thead.find("tr>th[data-col-index]:not([data-width]):first");
							}
							if(isOk(lastTh)){
								var lastThWidth=lastTh.outerWidth()-17;
								that.resizeTheadTh(table,lastTh.data("col-index"),lastThWidth);
							}
						}
					}
				
				}
			},
			processCellHeight:function(table){
				var tr,height;
				table.find("tbody>tr").each(function(){
					tr=$(this);
					height=tr.find("td:first").outerHeight()+"px";
					tr.find("td").css({
						"height":height,
						"min-height":height,
						"max-height":height,
					})
				});
			},
			processTheadThHeight:function(table){
				var th,thHeight;
				table.find("thead>tr>th").each(function(){
					th=$(this);
					thHeight=th.outerHeight()+"px";
					th.css({
						"height":thHeight,
						"min-height":thHeight,
						"max-height":thHeight,
					});
				});
			},
			setOneAutoWidthColumnWidth:function(table,index,th,minWidth){
				var width=th.data("width"),isAutoTh=(typeof(width)=="string"&&width=="auto"),nthTdIndex=index+1,maxWidth;
				if(!isAutoTh){
					return false;
				}
				if(table.data("width")=="auto"){
					minWidth=th.data("min-width")||100;
				}else{
					minWidth=th.data("min-width")||minWidth;
				}
				width=minWidth;
				maxWidth=th.data("max-width")||width;
				th.css({
					"min-width":minWidth,
					"max-width":maxWidth,
					"width":width
				});
				if(!table.data("ajax")){
					table.tbody.find("tr>td[data-col-index='"+index+"']").css({
						"min-width":minWidth,
						"max-width":maxWidth,
						"width":width
					});
				}
			
				
			},
			//按顺序设置一列宽度
			setOneColumnWidth:function(table,index,th){
				var width=th.data("width");
				var minwidth=th.data("min-width");
				if(minwidth){
					width=minwidth;
				}
				if(!width||(typeof(width)=="string"&&width=="auto")){
					return false;
				}
				var column=th.data("column");
					if((column&&(column=="index"||column=="checkbox"||column=="radio"||column=='optcol'))||th[0].hasAttribute("data-nochange")){
						table.tableBodyLeaveWidth=table.tableBodyLeaveWidth-width;
					}
				this.resizeTheadTh(table,th.data("col-index"),width);
			},
			//ajax执行完后 重新设置新添加的cell的宽
			setOneColumnWidthAfterAjax:function(th,index,table,thead,tbody,tfoot){
				var nthTdIndex=index+1,th=thead.find("tr>th[data-col-index='"+index+"']");
				var width=th[0].offsetWidth;
				table.tbody.find("tr>td[data-col-index='"+index+"']").css({
							"min-width":width,
							"max-width":width,
							"width":width
						});
			}
	};
	$.fn.jboltTable = function (method) {
		// 方法调用
		if (jb_methods[method]) {
			return jb_methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
		} else if (typeof method === 'object' || !method) {
			return jb_methods.init(this);
		} else {
			$.error('Method' + method + 'does not exist on jQuery.jboltTable');
		}
	};
})(jQuery);

/**
 * jboltTreeTable组件封装
 */
;(function($){
	var jb_methods = {
		init: function (tables) {
			var that=this;
			return tables.each(function(){
				var table=$(this);
				table.removeClass("table-striped");
				table.addClass("jbolt_tree_table text-nowrap");
				var tbody=table.find("tbody");
				var tdIndex=table.data("parent-td-index");
				if(tdIndex==undefined||tdIndex=="undefined"){
					tdIndex=0;
				}
				tbody.find("tr[data-parent]>td:nth-child("+tdIndex+")").data("parent-td",true).attr("data-parent-td","true").append('<i class="fa fa-angle-down parent_flag">')
				.off("click")
				.on("click",function(){
					var td=$(this);
					var tr=td.closest("tr");
					if(td.hasClass("expand")){
						//闭合
						that.collapseAll(tr);
					}else{
						//展开
						that.expand(tr);
					}
				});
				
				var expandall_trigger=table.data("expandall-trigger");
				if(expandall_trigger){
					$(expandall_trigger).off("click").on("click",function(e){
						  e.preventDefault();
						  e.stopPropagation();
						table.jboltTreeTable('expandAll');
						return false;
					});
				}
				var collapseall_trigger=table.data("collapseall-trigger");
				if(collapseall_trigger){
					$(collapseall_trigger).off("click").on("click",function(e){
						  e.preventDefault();
						  e.stopPropagation();
						table.jboltTreeTable('collapseAll');
						return false;
					});
				}
				//默认开启全部
				var expandall=table[0].hasAttribute("data-expandall");
				if(expandall){
					table.jboltTreeTable('expandAll');
				}
				//如果也定义了jbolttable 就执行这个
				if(table[0].hasAttribute("data-jbolttable")){
					table.jboltTable();
				}
				table.data("inited",true);
			});
		},
		expand: function (tr) {
				var dataId=tr.data("id");
				tr.siblings("tr[data-pid='"+dataId+"']").show(200);
				tr.find("td[data-parent-td]").addClass("expand");
		},
		expandAll: function (tr) {
			var that=this;
			if(tr){
				//先把自己展开
				that.expand(tr);
				if(tr[0].hasAttribute("data-parent")){
					var dataId=tr.data("id");
					//得到自己的下级节点
					var trs=tr.siblings("tr[data-pid='"+dataId+"']");
					if(trs&&trs.length>0){
						var theTr;
						trs.each(function(){
							theTr=$(this);
							//循环子节点 挨个打开
							that.expand(theTr);
							//递归调用 继续找下级
							that.expandAll(theTr);
						});
					}
					
				}
			}else{
				that.find("tr[data-son]").show(200);
				that.find("td[data-parent-td]").addClass("expand");
			}
		},
		collapse: function (tr) {
				var dataId=tr.data("id");
				tr.siblings("tr[data-pid='"+dataId+"']").hide(200);
				tr.find("td[data-parent-td]").removeClass("expand");
				
		},
		collapseAll:function (tr) {
			var that=this;
			if(tr){
				var dataId=tr.data("id");
				if(tr[0].hasAttribute("data-parent")){
					//如果是个parent就找到所有子节点
					var trs=tr.siblings("tr[data-pid='"+dataId+"']");
					if(trs&&trs.length>0){
						var theTr;
						//如果有下级就逐级关闭
						trs.each(function(){
							//循环子节点 挨个关闭
							theTr=$(this);
							that.collapse(theTr);
							//然后递归调用 排除下级
							that.collapseAll(theTr);
						});
					}
				}
				that.collapse(tr);
			}else{
				that.find("tr[data-son]").hide(200);
				that.find("td[data-parent-td]").removeClass("expand");
			}
		},
	};
	
	$.fn.jboltTreeTable = function (method) {
		// 方法调用
		if (jb_methods[method]) {
			return jb_methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
		} else if (typeof method === 'object' || !method) {
			return jb_methods.init(this);
		} else {
			$.error('Method' + method + 'does not exist on jQuery.jboltTreeTable');
		}
	};
})(jQuery);

