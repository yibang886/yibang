(function($){
	var settings = {}, caches = {},
	_setting = {
		//默认的设置	
		MAX_QUERY_NUM: 10
	},
	tools = {
			isArray: function(arr) {
				return Object.prototype.toString.apply(arr) === "[object Array]";
			},
			clone: function (obj){
				if (obj === null) return null;
				var o = tools.isArray(obj) ? [] : {};
				for(var i in obj){
					o[i] = (obj[i] instanceof Date) ? new Date(obj[i].getTime()) : (typeof obj[i] === "object" ? arguments.callee(obj[i]) : obj[i]);
				}
				return o;
			},
			preventDefault: function(e){
				if (navigator.userAgent.toLowerCase().indexOf('msie') >= 0) {
					  event.returnValue = false;
				} else {
					  e.preventDefault();
				}
			},
			stopPropa: function(e){
				e = e || window.event;
				if(e.stopPropagation)e.stopPropagation();else e.cancelBubble = true;
			}
	},
	data = {
			//操作数据
			cacheData: function(setting,qdata){
				$.extend(qdata,{"queryBoxContainer":$("#"+setting.queryBoxContainerId),"defaultPageContainer":$("#"+setting.defaultPageId)});
				caches[setting.quickQueryId] = qdata;
			},
			getCityList: function(setting){
				return caches[setting.quickQueryId]["cityList"];
			},
			getCityMap: function(setting){
				return caches[setting.quickQueryId]["cityMap"];
			},
			getQueryBoxContainerObj: function(setting){
				return caches[setting.quickQueryId]["queryBoxContainer"];
			},
			getDefaultPageContainerObj: function(setting){
				return caches[setting.quickQueryId]["defaultPageContainer"];
			},
			getSetting: function(quickQueryId){
				return settings[quickQueryId];
			},
			queryData: function(value,data,config){
				var ret = [];
				var regExp = RegExp("^("+$.trim(value)+")", "i");
				var dataLen = data.length;
				var configLen = config.length;
				for(var i = 0; i < dataLen; i++){
					var item = data[i];
					var itemResult = false;
					for(var j = 0; j < configLen; j++){
						itemResult = itemResult||regExp.test(item[config[j]]);
						if(itemResult){
							ret.push(item);
							break;
						}
					}
				}
				return ret;
			}
	},
	view = {
			//操作quickQuery的dom
			renderDefaultPage: function(setting){
				var container = data.getDefaultPageContainerObj(setting);
				var defPage = $("<div class=\"mid_bd ad_list\"><p class=\"ad_nav\"><span class=\"on\" style=\"border-radius:2px 0  0 2px\">ABCD</span><span>EFGH</span><span>JKLM</span><span>NOPQRS</span><span>TUVWX</span><span style=\"width:21px;border-radius:0 2px 2px 0;\">YZ</span></p></div>");
				defPage.find("span").each(function(index,ele){
					event.bindNavItemEvent($(ele),{quickQueryId:setting.quickQueryId,index:index});
				});
				var propSetList = setting.propSetList;
				var len = propSetList.length;
				var cityMap = data.getCityMap(setting);
				for(var i = 0; i < len; i++){
					var propSet = propSetList[i];
					var pLen = propSet.length;
					for(var j = 0; j < pLen; j++){
						var items = cityMap[propSet[j]];
						var itemLen = items?items.length:0;
						if(itemLen<=0) continue;
						var tmp = $("<dl id=\""+propSet[j]+"DL\"><dt>"+propSet[j]+"</dt></dl>");
						var dd = $("<dd></dd>");
						for(var k = 0; k < itemLen; k++){
							var item = items[k];
							dd.append(event.bindDefaultItemEvent($("<a href=\"javascript:void(0)\">"+item+"</a>"),{quickQueryId:setting.quickQueryId,item:item}));
						}
						defPage.append(tmp.append(dd));
					}
				}
				container.empty().append(defPage);
				view.showDefaultItem(setting,0);
			},
			showDefaultItem: function(setting,index){
				var propSetList = setting.propSetList;
				var propSet = propSetList[index];
				var container = data.getDefaultPageContainerObj(setting);
				container.find("dl").hide();
				var len = propSet.length;
				for(var i = 0; i < len; i++){
					container.find("#"+propSet[i]+"DL").show();
				}
			},
			showClickedNavItem: function(setting,index){
				var container = data.getDefaultPageContainerObj(setting);
				container.find(".ad_nav span").removeClass("on");
				container.find(".ad_nav span:eq("+index+")").addClass("on");
				view.focusOnInput(setting);
			},
			refreshDefaultPageContentByTabIndex: function(tabIndex){
				
			},
			renderQueryBox: function(setting,items){
				var len = items.length;
				var max = setting.MAX_QUERY_NUM;
				var queryBox = $("<div class=\"mid_bd year_list\"></div>");
				for(var i = 0; i < len && i < max; i++){
					var item = items[i];
					queryBox.append(event.bindItemEvent($("<a href=\"javacript:void(0)\">"+item[setting.displayProp]+"</a>"),{"quickQueryId":setting.quickQueryId,item:item}));
				}
				var container = data.getQueryBoxContainerObj(setting);
				container.empty();
				container.append(queryBox).show();
			},
			showDefaultPage: function(setting){
				var container = data.getDefaultPageContainerObj(setting);
				container.show();
			},
			hideDefaultPage: function(setting){
				var container = data.getDefaultPageContainerObj(setting);
				container.hide();
			},
			showQueryBox: function(setting){
				var container = data.getQueryBoxContainerObj(setting);
				container.show();
			},
			hideQueryBox: function(setting){
				var container = data.getQueryBoxContainerObj(setting);
				container.hide();
			},
			focusOnInput: function(setting){
				setting.quickQueryObj.focus();
			}
	},
	handler = {
			//事件的处理器
			onInputFocus: function(event){
				tools.stopPropa(event);
				var setting = data.getSetting(event.data.quickQueryId);
				view.showDefaultPage(setting);
				view.hideQueryBox(setting);
			},
			onInputClick: function(event){
				tools.stopPropa(event);
				var setting = data.getSetting(event.data.quickQueryId);
				view.showDefaultPage(setting);
			},
			onInputKeyup: function(event){
				tools.stopPropa(event);
				var setting = data.getSetting(event.data.quickQueryId);
				//获取输入，并调用搜索函数；如果输入为空，则直接出默认选择
				var obj = setting.quickQueryObj;
				var inputValue = obj.val();
				//根据搜索结果渲染搜索结果下拉框
				var ret = data.queryData(inputValue, data.getCityList(setting), setting.propList);
				if(ret.length>0){
					view.hideDefaultPage(setting);
					view.renderQueryBox(setting,ret);
				}else{
					view.hideQueryBox(setting);
					view.showDefaultPage(setting);
				}
				
			},
			onItemClick: function(event){
				//条目选择的方法
				tools.stopPropa(event);
				var setting = data.getSetting(event.data.quickQueryId);
				setting.quickQueryObj.val(event.data.item[setting.displayProp]);
				view.hideQueryBox(setting);
			},
			onDefaultItemClick: function(event){
				tools.stopPropa(event);
				//条目选择的方法
				var setting = data.getSetting(event.data.quickQueryId);
				setting.quickQueryObj.val(event.data.item);
				view.hideDefaultPage(setting);
			},
			onNavItemClick: function(event){
				tools.stopPropa(event);
				var setting = data.getSetting(event.data.quickQueryId);
				var index = event.data.index;
				//change nav status
				view.showClickedNavItem(setting,index);
				view.showDefaultItem(setting,index);
			},
			hideQuickQuery: function(event){
				var setting = data.getSetting(event.data.quickQueryId);
				view.hideQueryBox(setting);
				view.hideDefaultPage(setting);
			}
	},
	event = {
			bindEvent: function(setting){
				var obj = setting.quickQueryObj;
				obj.bind("focus",{quickQueryId:setting.quickQueryId},handler.onInputFocus);
				obj.bind("click",{quickQueryId:setting.quickQueryId},handler.onInputClick);
				obj.bind("keyup",{quickQueryId:setting.quickQueryId},handler.onInputKeyup);
				$(document).bind("click",{quickQueryId:setting.quickQueryId},handler.hideQuickQuery)
			},
			bindItemEvent: function(obj,data){
				return obj.bind("click",data,handler.onItemClick);
			},
			bindNavItemEvent: function(obj,data){
				return obj.bind("click",data,handler.onNavItemClick);
			},
			bindDefaultItemEvent: function(obj,data){
				return obj.bind("click",data,handler.onDefaultItemClick);
			}
	};
	$.fn.quickQuery = {
			init: function(obj,qSetting,qdata){
				var setting = tools.clone(_setting);
				$.extend(true, setting, qSetting);
				setting.quickQueryId = obj.attr("id");
				setting.quickQueryObj = obj;
				settings[setting.quickQueryId] = setting;
				
				//把数据存储起来
				data.cacheData(setting,qdata);
				
				//绑定事件
				event.bindEvent(setting);
				
				//渲染默认页面
				view.renderDefaultPage(setting);
				
				var quickQueryObj = {
						//对外的接口
						setting: setting
				};
				return quickQueryObj;
			}
	};
})(jQuery);