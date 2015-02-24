DROP DATABASE IF EXISTS yibangdb;

CREATE DATABASE IF NOT EXISTS yibangdb DEFAULT CHARACTER SET utf8;

USE yibangdb;

-- create table 'transtype' and insert pre-defined set of translation types;
DROP TABLE IF EXISTS transtype;
CREATE TABLE IF NOT EXISTS transtype
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  transtype VARCHAR(32) NOT NULL,
  PRIMARY KEY (id)
) ENGINE InnoDB, DEFAULT CHARACTER SET utf8 AUTO_INCREMENT 1;

INSERT INTO transtype(transtype) VALUES('笔译');
INSERT INTO transtype(transtype) VALUES('口译');
INSERT INTO transtype(transtype) VALUES('同声传译');
INSERT INTO transtype(transtype) VALUES('本地化');
INSERT INTO transtype(transtype) VALUES('速记');
INSERT INTO transtype(transtype) VALUES('其他');

-- create table 'language' and insert pre-defined set of languages;
DROP TABLE IF EXISTS language;
CREATE TABLE IF NOT EXISTS language
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  language VARCHAR(32) NOT NULL,
  PRIMARY KEY (id)
) ENGINE InnoDB, DEFAULT CHARACTER SET utf8 AUTO_INCREMENT 1;

INSERT INTO language(language) VALUES('中文-简体');
INSERT INTO language(language) VALUES('中文-繁体');
INSERT INTO language(language) VALUES('英语');
INSERT INTO language(language) VALUES('日语');
INSERT INTO language(language) VALUES('韩语');
INSERT INTO language(language) VALUES('法语');
INSERT INTO language(language) VALUES('德语');
INSERT INTO language(language) VALUES('俄语');
INSERT INTO language(language) VALUES('西班牙语');
INSERT INTO language(language) VALUES('意大利语');
INSERT INTO language(language) VALUES('希腊语');
INSERT INTO language(language) VALUES('泰语');
INSERT INTO language(language) VALUES('阿塞拜疆语');
INSERT INTO language(language) VALUES('阿布哈兹语');
INSERT INTO language(language) VALUES('阿尔瓦语');
INSERT INTO language(language) VALUES('阿拉伯语');
INSERT INTO language(language) VALUES('阿尔巴尼亚语');
INSERT INTO language(language) VALUES('阿非利堪斯语');
INSERT INTO language(language) VALUES('布里亚特语');
INSERT INTO language(language) VALUES('巴什基尔语');
INSERT INTO language(language) VALUES('白俄罗斯语');
INSERT INTO language(language) VALUES('巴利语');
INSERT INTO language(language) VALUES('波斯语');
INSERT INTO language(language) VALUES('巴斯克语');
INSERT INTO language(language) VALUES('冰岛语');
INSERT INTO language(language) VALUES('波兰语');
INSERT INTO language(language) VALUES('达尔金语');
INSERT INTO language(language) VALUES('东干语');
INSERT INTO language(language) VALUES('丹麦语');
INSERT INTO language(language) VALUES('梵文');
INSERT INTO language(language) VALUES('芬兰语');
INSERT INTO language(language) VALUES('菲律宾语');
INSERT INTO language(language) VALUES('格鲁吉亚语');
INSERT INTO language(language) VALUES('哈萨克语');
INSERT INTO language(language) VALUES('豪萨语');
INSERT INTO language(language) VALUES('荷兰语');
INSERT INTO language(language) VALUES('吉尔吉斯语');
INSERT INTO language(language) VALUES('捷克语');
INSERT INTO language(language) VALUES('库梅克语');
INSERT INTO language(language) VALUES('卡巴达尔语');
INSERT INTO language(language) VALUES('科米语');
INSERT INTO language(language) VALUES('克罗地亚语');
INSERT INTO language(language) VALUES('拉脱维亚语');
INSERT INTO language(language) VALUES('列兹金语');
INSERT INTO language(language) VALUES('立陶宛语');
INSERT INTO language(language) VALUES('拉克语');
INSERT INTO language(language) VALUES('罗马尼亚语');
INSERT INTO language(language) VALUES('老挝语');
INSERT INTO language(language) VALUES('拉丁语');
INSERT INTO language(language) VALUES('马里语');
INSERT INTO language(language) VALUES('缅甸语');
INSERT INTO language(language) VALUES('孟加拉语');
INSERT INTO language(language) VALUES('蒙古语');
INSERT INTO language(language) VALUES('马来语');
INSERT INTO language(language) VALUES('挪威语');
INSERT INTO language(language) VALUES('葡萄牙语');
INSERT INTO language(language) VALUES('瑞典语');
INSERT INTO language(language) VALUES('塞尔维亚语');
INSERT INTO language(language) VALUES('斯瓦西里语');
INSERT INTO language(language) VALUES('斯洛文尼亚语');
INSERT INTO language(language) VALUES('土耳其语');
INSERT INTO language(language) VALUES('乌尔都语');
INSERT INTO language(language) VALUES('乌克兰语');
INSERT INTO language(language) VALUES('希伯来语');
INSERT INTO language(language) VALUES('匈牙利语');
INSERT INTO language(language) VALUES('印古什语');
INSERT INTO language(language) VALUES('亚美尼亚语');
INSERT INTO language(language) VALUES('印地语');
INSERT INTO language(language) VALUES('越南语');
INSERT INTO language(language) VALUES('印度尼西亚语');
INSERT INTO language(language) VALUES('其他');

-- create table 'field' and insert pre-defined set of fields;
DROP TABLE IF EXISTS field;
CREATE TABLE IF NOT EXISTS field 
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  field VARCHAR(32) NOT NULL,
  PRIMARY KEY (id)
) ENGINE InnoDB, DEFAULT CHARACTER SET utf8 AUTO_INCREMENT 1;

INSERT INTO field(field) VALUES('医学');
INSERT INTO field(field) VALUES('法律');
INSERT INTO field(field) VALUES('机械');
INSERT INTO field(field) VALUES('外贸');
INSERT INTO field(field) VALUES('IT');
INSERT INTO field(field) VALUES('金融');
INSERT INTO field(field) VALUES('工程');
INSERT INTO field(field) VALUES('环境');
INSERT INTO field(field) VALUES('文学');
INSERT INTO field(field) VALUES('建筑');
INSERT INTO field(field) VALUES('航空');
INSERT INTO field(field) VALUES('化工');
INSERT INTO field(field) VALUES('汽车');
INSERT INTO field(field) VALUES('科技');
INSERT INTO field(field) VALUES('石油');
INSERT INTO field(field) VALUES('地质');
INSERT INTO field(field) VALUES('农业');
INSERT INTO field(field) VALUES('造纸');
INSERT INTO field(field) VALUES('印刷');
INSERT INTO field(field) VALUES('电力');
INSERT INTO field(field) VALUES('物流');
INSERT INTO field(field) VALUES('证券');
INSERT INTO field(field) VALUES('社科');
INSERT INTO field(field) VALUES('能源');
INSERT INTO field(field) VALUES('教育');
INSERT INTO field(field) VALUES('食品');
INSERT INTO field(field) VALUES('生物');
INSERT INTO field(field) VALUES('其他');

-- create table 'doctype' and insert pre-defined set of doc types;
DROP TABLE IF EXISTS doctype;
CREATE TABLE IF NOT EXISTS doctype
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  doctype VARCHAR(32) NOT NULL,
  PRIMARY KEY (id)
) ENGINE InnoDB, DEFAULT CHARACTER SET utf8 AUTO_INCREMENT 1;

INSERT INTO doctype(doctype) VALUES('论文');
INSERT INTO doctype(doctype) VALUES('简历');
INSERT INTO doctype(doctype) VALUES('证件');
INSERT INTO doctype(doctype) VALUES('图书');
INSERT INTO doctype(doctype) VALUES('文献');
INSERT INTO doctype(doctype) VALUES('合同');
INSERT INTO doctype(doctype) VALUES('协议');
INSERT INTO doctype(doctype) VALUES('专利');
INSERT INTO doctype(doctype) VALUES('标书');
INSERT INTO doctype(doctype) VALUES('手册/说明书');
INSERT INTO doctype(doctype) VALUES('图纸翻译');
INSERT INTO doctype(doctype) VALUES('出国/留学材料');
INSERT INTO doctype(doctype) VALUES('文凭');
INSERT INTO doctype(doctype) VALUES('职业资格证书');
INSERT INTO doctype(doctype) VALUES('房产证件');
INSERT INTO doctype(doctype) VALUES('工商财税证');
INSERT INTO doctype(doctype) VALUES('车牌档案');
INSERT INTO doctype(doctype) VALUES('等级证书');
INSERT INTO doctype(doctype) VALUES('司法文书');
INSERT INTO doctype(doctype) VALUES('新闻');
INSERT INTO doctype(doctype) VALUES('审计');
INSERT INTO doctype(doctype) VALUES('广告');
INSERT INTO doctype(doctype) VALUES('其他');

-- create table 'education' and insert pre-defined values;
DROP TABLE IF EXISTS education;
CREATE TABLE IF NOT EXISTS education 
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  education VARCHAR(32) NOT NULL,
  PRIMARY KEY (id)
) ENGINE InnoDB, DEFAULT CHARACTER SET utf8 AUTO_INCREMENT 1;

INSERT INTO education(education) VALUES ('博士研究生');
INSERT INTO education(education) VALUES ('硕士研究生');
INSERT INTO education(education) VALUES ('本科');
INSERT INTO education(education) VALUES ('大专');
INSERT INTO education(education) VALUES ('中专');
INSERT INTO education(education) VALUES ('其他');

-- create table 'school' and insert pre-defined values;
DROP TABLE IF EXISTS school;
CREATE TABLE IF NOT EXISTS school 
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  school VARCHAR(64) NOT NULL,
  PRIMARY KEY (id)
) ENGINE InnoDB, DEFAULT CHARACTER SET utf8 AUTO_INCREMENT 1;

INSERT INTO school(school) VALUES ('清华大学');
INSERT INTO school(school) VALUES ('北京大学');
INSERT INTO school(school) VALUES ('中国人民大学');
INSERT INTO school(school) VALUES ('北京交通大学');
INSERT INTO school(school) VALUES ('北京工业大学');
INSERT INTO school(school) VALUES ('北京航空航天大学');
INSERT INTO school(school) VALUES ('北京理工大学');
INSERT INTO school(school) VALUES ('北京科技大学');
INSERT INTO school(school) VALUES ('北方工业大学');
INSERT INTO school(school) VALUES ('北京化工大学');
INSERT INTO school(school) VALUES ('北京工商大学');
INSERT INTO school(school) VALUES ('北京邮电大学');
INSERT INTO school(school) VALUES ('北京石油化工学院');
INSERT INTO school(school) VALUES ('中国农业大学');
INSERT INTO school(school) VALUES ('北京林业大学');
INSERT INTO school(school) VALUES ('首都医科大学');
INSERT INTO school(school) VALUES ('北京中医药大学');
INSERT INTO school(school) VALUES ('北京师范大学');
INSERT INTO school(school) VALUES ('首都师范大学');
INSERT INTO school(school) VALUES ('首都体育学院');
INSERT INTO school(school) VALUES ('北京外国语大学');
INSERT INTO school(school) VALUES ('北京第二外国语学院');
INSERT INTO school(school) VALUES ('北京语言大学');
INSERT INTO school(school) VALUES ('中国传媒大学');
INSERT INTO school(school) VALUES ('中央财经大学');
INSERT INTO school(school) VALUES ('对外经济贸易大学');
INSERT INTO school(school) VALUES ('首都经济贸易大学');
INSERT INTO school(school) VALUES ('外交学院');
INSERT INTO school(school) VALUES ('北京体育大学');
INSERT INTO school(school) VALUES ('中央音乐学院');
INSERT INTO school(school) VALUES ('中国音乐学院');
INSERT INTO school(school) VALUES ('中央美术学院');
INSERT INTO school(school) VALUES ('中央戏剧学院');
INSERT INTO school(school) VALUES ('北京电影学院');
INSERT INTO school(school) VALUES ('北京舞蹈学院');
INSERT INTO school(school) VALUES ('中央民族大学');
INSERT INTO school(school) VALUES ('中国政法大学');
INSERT INTO school(school) VALUES ('北京信息科技大学');
INSERT INTO school(school) VALUES ('中国石油大学');
INSERT INTO school(school) VALUES ('北京农业职业学院');
INSERT INTO school(school) VALUES ('北京政法职业学院');
INSERT INTO school(school) VALUES ('北京财贸职业学院');
INSERT INTO school(school) VALUES ('北京经贸职业学院');
INSERT INTO school(school) VALUES ('复旦大学');
INSERT INTO school(school) VALUES ('同济大学');
INSERT INTO school(school) VALUES ('上海交通大学');
INSERT INTO school(school) VALUES ('华东理工大学');
INSERT INTO school(school) VALUES ('上海理工大学');
INSERT INTO school(school) VALUES ('上海海事大学');
INSERT INTO school(school) VALUES ('东华大学');
INSERT INTO school(school) VALUES ('上海电力学院');
INSERT INTO school(school) VALUES ('上海应用技术学院');
INSERT INTO school(school) VALUES ('上海海洋大学');
INSERT INTO school(school) VALUES ('上海中医药大学');
INSERT INTO school(school) VALUES ('华东师范大学');
INSERT INTO school(school) VALUES ('上海师范大学');
INSERT INTO school(school) VALUES ('上海外国语大学');
INSERT INTO school(school) VALUES ('上海财经大学');
INSERT INTO school(school) VALUES ('上海对外经贸大学');
INSERT INTO school(school) VALUES ('上海海关学院');
INSERT INTO school(school) VALUES ('华东政法大学');
INSERT INTO school(school) VALUES ('上海体育学院');
INSERT INTO school(school) VALUES ('上海音乐学院');
INSERT INTO school(school) VALUES ('上海戏剧学院');
INSERT INTO school(school) VALUES ('上海大学');
INSERT INTO school(school) VALUES ('上海工程技术大学');
INSERT INTO school(school) VALUES ('上海电机学院');
INSERT INTO school(school) VALUES ('上海金融学院');
INSERT INTO school(school) VALUES ('上海政法学院');
INSERT INTO school(school) VALUES ('上海商学院');
INSERT INTO school(school) VALUES ('上海视觉艺术学院');
INSERT INTO school(school) VALUES ('上海科技大学');
INSERT INTO school(school) VALUES ('南开大学');
INSERT INTO school(school) VALUES ('天津大学');
INSERT INTO school(school) VALUES ('天津科技大学');
INSERT INTO school(school) VALUES ('天津工业大学');
INSERT INTO school(school) VALUES ('中国民航大学');
INSERT INTO school(school) VALUES ('天津理工大学');
INSERT INTO school(school) VALUES ('天津农学院');
INSERT INTO school(school) VALUES ('天津医科大学');
INSERT INTO school(school) VALUES ('天津中医药大学');
INSERT INTO school(school) VALUES ('天津师范大学');
INSERT INTO school(school) VALUES ('天津职业技术师范大学');
INSERT INTO school(school) VALUES ('天津外国语大学');
INSERT INTO school(school) VALUES ('天津商业大学');
INSERT INTO school(school) VALUES ('天津财经大学');
INSERT INTO school(school) VALUES ('天津体育学院');
INSERT INTO school(school) VALUES ('天津音乐学院');
INSERT INTO school(school) VALUES ('天津美术学院');
INSERT INTO school(school) VALUES ('重庆大学');
INSERT INTO school(school) VALUES ('重庆邮电大学');
INSERT INTO school(school) VALUES ('重庆交通大学');
INSERT INTO school(school) VALUES ('重庆医科大学');
INSERT INTO school(school) VALUES ('西南大学');
INSERT INTO school(school) VALUES ('重庆师范大学');
INSERT INTO school(school) VALUES ('长江师范学院');
INSERT INTO school(school) VALUES ('四川外国语大学');
INSERT INTO school(school) VALUES ('西南政法大学');
INSERT INTO school(school) VALUES ('重庆科技学院');
INSERT INTO school(school) VALUES ('重庆理工大学');
INSERT INTO school(school) VALUES ('重庆工商大学');
INSERT INTO school(school) VALUES ('河北大学');
INSERT INTO school(school) VALUES ('河北工程大学');
INSERT INTO school(school) VALUES ('石家庄经济学院');
INSERT INTO school(school) VALUES ('河北工业大学');
INSERT INTO school(school) VALUES ('河北联合大学');
INSERT INTO school(school) VALUES ('河北科技大学');
INSERT INTO school(school) VALUES ('河北建筑工程学院');
INSERT INTO school(school) VALUES ('河北农业大学');
INSERT INTO school(school) VALUES ('河北医科大学');
INSERT INTO school(school) VALUES ('河北北方学院');
INSERT INTO school(school) VALUES ('河北师范大学');
INSERT INTO school(school) VALUES ('河北民族师范学院');
INSERT INTO school(school) VALUES ('山西大学');
INSERT INTO school(school) VALUES ('太原科技大学');
INSERT INTO school(school) VALUES ('中北大学');
INSERT INTO school(school) VALUES ('太原理工大学');
INSERT INTO school(school) VALUES ('山西农业大学');
INSERT INTO school(school) VALUES ('山西医科大学');
INSERT INTO school(school) VALUES ('山西师范大学');
INSERT INTO school(school) VALUES ('太原师范学院');
INSERT INTO school(school) VALUES ('山西财经大学');
INSERT INTO school(school) VALUES ('山西中医学院');
INSERT INTO school(school) VALUES ('山西工商学院');
INSERT INTO school(school) VALUES ('太原工业学院');
INSERT INTO school(school) VALUES ('山西传媒学院');
INSERT INTO school(school) VALUES ('内蒙古大学');
INSERT INTO school(school) VALUES ('内蒙古科技大学');
INSERT INTO school(school) VALUES ('内蒙古工业大学');
INSERT INTO school(school) VALUES ('内蒙古农业大学');
INSERT INTO school(school) VALUES ('内蒙古医科大学');
INSERT INTO school(school) VALUES ('内蒙古师范大学');
INSERT INTO school(school) VALUES ('内蒙古民族大学');
INSERT INTO school(school) VALUES ('大连理工大学');
INSERT INTO school(school) VALUES ('辽宁大学');
INSERT INTO school(school) VALUES ('沈阳工业大学');
INSERT INTO school(school) VALUES ('沈阳航空航天大学');
INSERT INTO school(school) VALUES ('沈阳理工大学');
INSERT INTO school(school) VALUES ('东北大学');
INSERT INTO school(school) VALUES ('辽宁科技大学');
INSERT INTO school(school) VALUES ('辽宁工程技术大学');
INSERT INTO school(school) VALUES ('辽宁石油化工大学');
INSERT INTO school(school) VALUES ('沈阳化工大学');
INSERT INTO school(school) VALUES ('大连交通大学');
INSERT INTO school(school) VALUES ('辽宁工业大学');
INSERT INTO school(school) VALUES ('沈阳农业大学');
INSERT INTO school(school) VALUES ('中国医科大学');
INSERT INTO school(school) VALUES ('辽宁医学院');
INSERT INTO school(school) VALUES ('大连医科大学');
INSERT INTO school(school) VALUES ('辽宁中医药大学');
INSERT INTO school(school) VALUES ('沈阳药科大学');
INSERT INTO school(school) VALUES ('沈阳医学院');
INSERT INTO school(school) VALUES ('辽宁师范大学');
INSERT INTO school(school) VALUES ('沈阳师范大学');
INSERT INTO school(school) VALUES ('吉林大学');
INSERT INTO school(school) VALUES ('延边大学');
INSERT INTO school(school) VALUES ('长春理工大学');
INSERT INTO school(school) VALUES ('东北电力大学');
INSERT INTO school(school) VALUES ('长春工业大学');
INSERT INTO school(school) VALUES ('吉林建筑大学');
INSERT INTO school(school) VALUES ('吉林化工学院');
INSERT INTO school(school) VALUES ('吉林农业大学');
INSERT INTO school(school) VALUES ('长春中医药大学');
INSERT INTO school(school) VALUES ('东北师范大学');
INSERT INTO school(school) VALUES ('通化师范学院');
INSERT INTO school(school) VALUES ('吉林师范大学');
INSERT INTO school(school) VALUES ('长春师范大学');
INSERT INTO school(school) VALUES ('黑龙江大学');
INSERT INTO school(school) VALUES ('哈尔滨工业大学');
INSERT INTO school(school) VALUES ('哈尔滨理工大学');
INSERT INTO school(school) VALUES ('哈尔滨工程大学');
INSERT INTO school(school) VALUES ('黑龙江科技大学');
INSERT INTO school(school) VALUES ('东北石油大学');
INSERT INTO school(school) VALUES ('佳木斯大学');
INSERT INTO school(school) VALUES ('东北农业大学');
INSERT INTO school(school) VALUES ('东北林业大学');
INSERT INTO school(school) VALUES ('哈尔滨医科大学');
INSERT INTO school(school) VALUES ('黑龙江中医药大学');
INSERT INTO school(school) VALUES ('牡丹江医学院');
INSERT INTO school(school) VALUES ('哈尔滨师范大学');
INSERT INTO school(school) VALUES ('齐齐哈尔大学');
INSERT INTO school(school) VALUES ('牡丹江师范学院');
INSERT INTO school(school) VALUES ('哈尔滨学院');
INSERT INTO school(school) VALUES ('南京大学');
INSERT INTO school(school) VALUES ('苏州大学');
INSERT INTO school(school) VALUES ('东南大学');
INSERT INTO school(school) VALUES ('南京航空航天大学');
INSERT INTO school(school) VALUES ('南京理工大学');
INSERT INTO school(school) VALUES ('江苏科技大学');
INSERT INTO school(school) VALUES ('中国矿业大学');
INSERT INTO school(school) VALUES ('南京工业大学');
INSERT INTO school(school) VALUES ('南京邮电大学');
INSERT INTO school(school) VALUES ('河海大学');
INSERT INTO school(school) VALUES ('江南大学');
INSERT INTO school(school) VALUES ('南京林业大学');
INSERT INTO school(school) VALUES ('江苏大学');
INSERT INTO school(school) VALUES ('南京信息工程大学');
INSERT INTO school(school) VALUES ('南通大学');
INSERT INTO school(school) VALUES ('浙江大学');
INSERT INTO school(school) VALUES ('杭州电子科技大学');
INSERT INTO school(school) VALUES ('浙江工业大学');
INSERT INTO school(school) VALUES ('浙江理工大学');
INSERT INTO school(school) VALUES ('浙江海洋学院');
INSERT INTO school(school) VALUES ('浙江农林大学');
INSERT INTO school(school) VALUES ('浙江中医药大学');
INSERT INTO school(school) VALUES ('浙江师范大学');
INSERT INTO school(school) VALUES ('杭州师范大学');
INSERT INTO school(school) VALUES ('合肥工业大学');
INSERT INTO school(school) VALUES ('中国科学技术大学');
INSERT INTO school(school) VALUES ('安徽大学');
INSERT INTO school(school) VALUES ('安徽工业大学');
INSERT INTO school(school) VALUES ('安徽理工大学');
INSERT INTO school(school) VALUES ('安徽农业大学');
INSERT INTO school(school) VALUES ('厦门大学');
INSERT INTO school(school) VALUES ('福州大学');
INSERT INTO school(school) VALUES ('福建工程学院');
INSERT INTO school(school) VALUES ('福建农林大学');
INSERT INTO school(school) VALUES ('集美大学');
INSERT INTO school(school) VALUES ('福建医科大学');
INSERT INTO school(school) VALUES ('福建中医药大学');
INSERT INTO school(school) VALUES ('福建师范大学');
INSERT INTO school(school) VALUES ('南昌大学');
INSERT INTO school(school) VALUES ('华东交通大学');
INSERT INTO school(school) VALUES ('东华理工大学');
INSERT INTO school(school) VALUES ('南昌航空大学');
INSERT INTO school(school) VALUES ('江西理工大学');
INSERT INTO school(school) VALUES ('江西农业大学');
INSERT INTO school(school) VALUES ('江西中医药大学');
INSERT INTO school(school) VALUES ('赣南医学院');
INSERT INTO school(school) VALUES ('江西师范大学');
INSERT INTO school(school) VALUES ('山东大学');
INSERT INTO school(school) VALUES ('中国海洋大学');
INSERT INTO school(school) VALUES ('山东科技大学');
INSERT INTO school(school) VALUES ('青岛科技大学');
INSERT INTO school(school) VALUES ('济南大学');
INSERT INTO school(school) VALUES ('青岛理工大学');
INSERT INTO school(school) VALUES ('山东建筑大学');
INSERT INTO school(school) VALUES ('山东理工大学');
INSERT INTO school(school) VALUES ('山东农业大学');
INSERT INTO school(school) VALUES ('山东中医药大学');
INSERT INTO school(school) VALUES ('山东财经大学');
INSERT INTO school(school) VALUES ('山东体育学院');
INSERT INTO school(school) VALUES ('郑州大学');
INSERT INTO school(school) VALUES ('华北水利水电大学');
INSERT INTO school(school) VALUES ('河南理工大学');
INSERT INTO school(school) VALUES ('河南工业大学');
INSERT INTO school(school) VALUES ('河南科技大学');
INSERT INTO school(school) VALUES ('中原工学院');
INSERT INTO school(school) VALUES ('河南科技学院');
INSERT INTO school(school) VALUES ('河南中医学院');
INSERT INTO school(school) VALUES ('河南大学');
INSERT INTO school(school) VALUES ('河南师范大学');
INSERT INTO school(school) VALUES ('信阳师范学院');
INSERT INTO school(school) VALUES ('南阳师范学院');
INSERT INTO school(school) VALUES ('武汉大学');
INSERT INTO school(school) VALUES ('华中科技大学');
INSERT INTO school(school) VALUES ('武汉科技大学');
INSERT INTO school(school) VALUES ('长江大学');
INSERT INTO school(school) VALUES ('武汉工程大学');
INSERT INTO school(school) VALUES ('中国地质大学');
INSERT INTO school(school) VALUES ('武汉纺织大学');
INSERT INTO school(school) VALUES ('武汉轻工大学');
INSERT INTO school(school) VALUES ('武汉理工大学');
INSERT INTO school(school) VALUES ('湖北工业大学');
INSERT INTO school(school) VALUES ('华中农业大学');
INSERT INTO school(school) VALUES ('湖北中医药大学');
INSERT INTO school(school) VALUES ('华中师范大学');
INSERT INTO school(school) VALUES ('湖北大学');
INSERT INTO school(school) VALUES ('湖北师范学院');
INSERT INTO school(school) VALUES ('中南财经政法大学');
INSERT INTO school(school) VALUES ('湖北美术学院');
INSERT INTO school(school) VALUES ('湖南大学');
INSERT INTO school(school) VALUES ('中南大学');
INSERT INTO school(school) VALUES ('湘潭大学');
INSERT INTO school(school) VALUES ('湖南科技大学');
INSERT INTO school(school) VALUES ('长沙理工大学');
INSERT INTO school(school) VALUES ('湖南农业大学');
INSERT INTO school(school) VALUES ('中南林业科技大学');
INSERT INTO school(school) VALUES ('湖南中医药大学');
INSERT INTO school(school) VALUES ('湖南师范大学');
INSERT INTO school(school) VALUES ('湖南理工学院');
INSERT INTO school(school) VALUES ('湘南学院');
INSERT INTO school(school) VALUES ('衡阳师范学院');
INSERT INTO school(school) VALUES ('湖南文理学院');
INSERT INTO school(school) VALUES ('湖南科技学院');
INSERT INTO school(school) VALUES ('湖南人文科技学院');
INSERT INTO school(school) VALUES ('湖南商学院');
INSERT INTO school(school) VALUES ('长沙医学院');
INSERT INTO school(school) VALUES ('湖南工程学院');
INSERT INTO school(school) VALUES ('中山大学');
INSERT INTO school(school) VALUES ('华南理工大学');
INSERT INTO school(school) VALUES ('汕头大学');
INSERT INTO school(school) VALUES ('华南农业大学');
INSERT INTO school(school) VALUES ('广东海洋大学');
INSERT INTO school(school) VALUES ('广州医科大学');
INSERT INTO school(school) VALUES ('广东医学院');
INSERT INTO school(school) VALUES ('广州中医药大学');
INSERT INTO school(school) VALUES ('广东药学院');
INSERT INTO school(school) VALUES ('华南师范大学');
INSERT INTO school(school) VALUES ('广西大学');
INSERT INTO school(school) VALUES ('广西科技大学');
INSERT INTO school(school) VALUES ('桂林电子科技大学');
INSERT INTO school(school) VALUES ('桂林理工大学');
INSERT INTO school(school) VALUES ('广西医科大学');
INSERT INTO school(school) VALUES ('广西中医药大学');
INSERT INTO school(school) VALUES ('广西师范大学');
INSERT INTO school(school) VALUES ('广西师范学院');
INSERT INTO school(school) VALUES ('广西民族师范学院');
INSERT INTO school(school) VALUES ('海南大学');
INSERT INTO school(school) VALUES ('琼州学院');
INSERT INTO school(school) VALUES ('海南师范大学');
INSERT INTO school(school) VALUES ('海南医学院');
INSERT INTO school(school) VALUES ('海口经济学院');
INSERT INTO school(school) VALUES ('海南职业技术学院');
INSERT INTO school(school) VALUES ('四川大学');
INSERT INTO school(school) VALUES ('西南交通大学');
INSERT INTO school(school) VALUES ('电子科技大学');
INSERT INTO school(school) VALUES ('西南财经大学');
INSERT INTO school(school) VALUES ('西南石油大学');
INSERT INTO school(school) VALUES ('成都理工大学');
INSERT INTO school(school) VALUES ('西南科技大学');
INSERT INTO school(school) VALUES ('四川理工学院');
INSERT INTO school(school) VALUES ('西华大学');
INSERT INTO school(school) VALUES ('四川农业大学');
INSERT INTO school(school) VALUES ('贵州大学');
INSERT INTO school(school) VALUES ('贵阳医学院');
INSERT INTO school(school) VALUES ('贵阳中医学院');
INSERT INTO school(school) VALUES ('贵州师范大学');
INSERT INTO school(school) VALUES ('云南大学');
INSERT INTO school(school) VALUES ('昆明理工大学');
INSERT INTO school(school) VALUES ('云南农业大学');
INSERT INTO school(school) VALUES ('西南林业大学');
INSERT INTO school(school) VALUES ('昆明医科大学');
INSERT INTO school(school) VALUES ('云南中医学院');
INSERT INTO school(school) VALUES ('云南师范大学');
INSERT INTO school(school) VALUES ('西藏大学');
INSERT INTO school(school) VALUES ('西藏民族学院');
INSERT INTO school(school) VALUES ('西藏藏医学院');
INSERT INTO school(school) VALUES ('西安交通大学');
INSERT INTO school(school) VALUES ('长安大学');
INSERT INTO school(school) VALUES ('西安电子科技大学');
INSERT INTO school(school) VALUES ('西北工业大学');
INSERT INTO school(school) VALUES ('西北大学');
INSERT INTO school(school) VALUES ('西安理工大学');
INSERT INTO school(school) VALUES ('西安科技大学');
INSERT INTO school(school) VALUES ('西安石油大学');
INSERT INTO school(school) VALUES ('陕西科技大学');
INSERT INTO school(school) VALUES ('西安工程大学');
INSERT INTO school(school) VALUES ('陕西中医学院');
INSERT INTO school(school) VALUES ('陕西师范大学');
INSERT INTO school(school) VALUES ('兰州大学');
INSERT INTO school(school) VALUES ('兰州理工大学');
INSERT INTO school(school) VALUES ('甘肃农业大学');
INSERT INTO school(school) VALUES ('西北师范大学');
INSERT INTO school(school) VALUES ('青海大学');
INSERT INTO school(school) VALUES ('青海师范大学');
INSERT INTO school(school) VALUES ('青海民族大学');
INSERT INTO school(school) VALUES ('北方民族大学');
INSERT INTO school(school) VALUES ('宁夏大学');
INSERT INTO school(school) VALUES ('宁夏医科大学');
INSERT INTO school(school) VALUES ('宁夏师范学院');
INSERT INTO school(school) VALUES ('宁夏理工学院');
INSERT INTO school(school) VALUES ('新疆大学');
INSERT INTO school(school) VALUES ('新疆医科大学');
INSERT INTO school(school) VALUES ('新疆师范大学');
INSERT INTO school(school) VALUES ('新疆财经大学');
INSERT INTO school(school) VALUES ('新疆艺术学院');
INSERT INTO school(school) VALUES ('新疆工程学院');
INSERT INTO school(school) VALUES ('其他');

-- create table 'city' and insert pre-defined values;
DROP TABLE IF EXISTS city;
CREATE TABLE IF NOT EXISTS city 
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  city VARCHAR(32) NOT NULL,
  PRIMARY KEY (id)
) ENGINE InnoDB, DEFAULT CHARACTER SET utf8 AUTO_INCREMENT 1;
INSERT INTO city(city) VALUES ('北京');
INSERT INTO city(city) VALUES ('上海');
INSERT INTO city(city) VALUES ('天津');
INSERT INTO city(city) VALUES ('重庆');
INSERT INTO city(city) VALUES ('广州');
INSERT INTO city(city) VALUES ('深圳');
INSERT INTO city(city) VALUES ('成都');
INSERT INTO city(city) VALUES ('西安');
INSERT INTO city(city) VALUES ('南京');
INSERT INTO city(city) VALUES ('沈阳');
INSERT INTO city(city) VALUES ('大连');
INSERT INTO city(city) VALUES ('长春');
INSERT INTO city(city) VALUES ('哈尔滨');
INSERT INTO city(city) VALUES ('南京');
INSERT INTO city(city) VALUES ('杭州');
INSERT INTO city(city) VALUES ('宁波');
INSERT INTO city(city) VALUES ('厦门');
INSERT INTO city(city) VALUES ('济南');
INSERT INTO city(city) VALUES ('青岛');
INSERT INTO city(city) VALUES ('长沙');
INSERT INTO city(city) VALUES ('武汉');
INSERT INTO city(city) VALUES ('石家庄');
INSERT INTO city(city) VALUES ('太原');
INSERT INTO city(city) VALUES ('呼和浩特');
INSERT INTO city(city) VALUES ('吉林');
INSERT INTO city(city) VALUES ('苏州');
INSERT INTO city(city) VALUES ('无锡');
INSERT INTO city(city) VALUES ('合肥');
INSERT INTO city(city) VALUES ('南昌');
INSERT INTO city(city) VALUES ('郑州');
INSERT INTO city(city) VALUES ('南宁');
INSERT INTO city(city) VALUES ('海口');
INSERT INTO city(city) VALUES ('三亚');
INSERT INTO city(city) VALUES ('贵阳');
INSERT INTO city(city) VALUES ('昆明');
INSERT INTO city(city) VALUES ('拉萨');
INSERT INTO city(city) VALUES ('兰州');
INSERT INTO city(city) VALUES ('西宁');
INSERT INTO city(city) VALUES ('银川');
INSERT INTO city(city) VALUES ('乌鲁木齐');
INSERT INTO city(city) VALUES ('台湾');
INSERT INTO city(city) VALUES ('香港');
INSERT INTO city(city) VALUES ('澳门');
INSERT INTO city(city) VALUES ('海外');
INSERT INTO city(city) VALUES ('其它');

-- create table 'recompos'
-- 翻译信息的推荐位置; NO: 不在推荐位置显示；
DROP TABLE IF EXISTS recompos;
CREATE TABLE IF NOT EXISTS recompos
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  recompos VARCHAR(8) NOT NULL,
  PRIMARY KEY (id)
) ENGINE InnoDB, DEFAULT CHARACTER SET utf8 AUTO_INCREMENT 1;

INSERT INTO recompos(recompos) VALUES ('A1');
INSERT INTO recompos(recompos) VALUES ('A2');
INSERT INTO recompos(recompos) VALUES ('A3');
INSERT INTO recompos(recompos) VALUES ('A4');
INSERT INTO recompos(recompos) VALUES ('NO');

-- create table 'user'
DROP TABLE IF EXISTS user;
CREATE TABLE IF NOT EXISTS user
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  email VARCHAR(32) NOT NULL UNIQUE,           /*登录名即邮箱*/
  password VARCHAR(32) NOT NULL,
  tel VARCHAR(16),                             /*电话*/
  mobile VARCHAR(16),                          /*手机*/
  fax VARCHAR(16),                             /*传真*/
  qq VARCHAR(16),                              /*QQ号*/
  weixin VARCHAR(32),                          /*微信*/
  user_type INT UNSIGNED NOT NULL,             /*用户类型，0:个人译员; 1:翻译公司; 2:管理员; 3:超级管理员   关联individual或company后不能修改*/
  coin INT UNSIGNED,                           /*金币数，一定数量则允许用户选择推荐位; 目前版本中金币可通过推荐用户得到*/
  PRIMARY KEY (id)
) ENGINE InnoDB, DEFAULT CHARACTER SET utf8 AUTO_INCREMENT 1000;

-- create table 'individual'
DROP TABLE IF EXISTS individual;
CREATE TABLE IF NOT EXISTS individual
(
  id INT UNSIGNED NOT NULL,
  name VARCHAR(16) NOT NULL,         /*真实姓名*/
  gender INT UNSIGNED NOT NULL,      /*性别, 0:男；1:女*/
  edu_id INT UNSIGNED NOT NULL,      /*教育水平*/
  sch_id INT UNSIGNED NOT NULL,      /*毕业院校*/
  birth_year INT UNSIGNED NOT NULL,  
  city_id INT UNSIGNED NOT NULL,               /*所在城市*/
  mainpage VARCHAR(128),                       /*个人主页,博客等*/
  workstyle INT UNSIGNED NOT NULL DEFAULT 1,   /*工作方式, 0:全职；1:兼职*/
  exp_year INT UNSIGNED NOT NULL DEFAULT 0,    /*工作年限*/
  exp_trans INT UNSIGNED NOT NULL DEFAULT 0,   /*翻译经验，单位：万字，例如15表示15万字*/
  works VARCHAR(256),                          /*翻译作品*/
  introduct VARCHAR(1024),               /*个人简介*/
  photo VARCHAR(256),                    /*照片图片文件名后缀*/
  langcert VARCHAR(256),                 /*语言等级证书图片文件名后缀*/
  transcert VARCHAR(256),                /*翻译证书图片文件名后缀*/
  profcert VARCHAR(256),                 /*专业证书图片文件名后缀*/
  authfile VARCHAR(256),                 /*认证资料图片文件名后缀*/
  auth_pass INT UNSIGNED NOT NULL DEFAULT 0,   /*是否通过认证, 0:待认证; 1:认证通过; 2:认证未通过*/    
  valid_pass INT UNSIGNED NOT NULL DEFAULT 0,  /*是否通过审核, 0:待审核; 1:审核通过; 2:审核未通过*/
  recompos_id INT UNSIGNED NOT NULL,           /*在主页中的推荐位置*/ 
  FOREIGN KEY(edu_id) REFERENCES education(id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
  FOREIGN KEY(sch_id) REFERENCES school(id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
  FOREIGN KEY(city_id) REFERENCES city(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  FOREIGN KEY(recompos_id) REFERENCES recompos(id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
  PRIMARY KEY (id)
) ENGINE InnoDB, DEFAULT CHARACTER SET utf8 AUTO_INCREMENT 1;

-- create table 'individual_transtype'
DROP TABLE IF EXISTS individual_transtype;
CREATE TABLE IF NOT EXISTS individual_transtype
(
  indiv_id INT UNSIGNED NOT NULL,
  transtype_id INT UNSIGNED NOT NULL,
  FOREIGN KEY(indiv_id) REFERENCES individual(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY(transtype_id) REFERENCES transtype(id) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY(indiv_id, transtype_id)
) ENGINE InnoDB, DEFAULT CHARACTER SET utf8;

-- create table 'individual_lang'
DROP TABLE IF EXISTS individual_lang;
CREATE TABLE IF NOT EXISTS individual_lang
(
  indiv_id INT UNSIGNED NOT NULL,
  lang_id INT UNSIGNED NOT NULL,
  FOREIGN KEY(indiv_id) REFERENCES individual(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY(lang_id) REFERENCES language(id) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY(indiv_id, lang_id)
) ENGINE InnoDB, DEFAULT CHARACTER SET utf8;

-- create table 'individual_field'
DROP TABLE IF EXISTS individual_field;
CREATE TABLE IF NOT EXISTS individual_field 
(
  indiv_id INT UNSIGNED NOT NULL,
  field_id INT UNSIGNED NOT NULL,
  FOREIGN KEY(indiv_id) REFERENCES individual(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY(field_id) REFERENCES field(id) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY(indiv_id, field_id)
) ENGINE InnoDB, DEFAULT CHARACTER SET utf8;

-- create table 'individual_doctype'
DROP TABLE IF EXISTS individual_doctype;
CREATE TABLE IF NOT EXISTS individual_doctype 
(
  indiv_id INT UNSIGNED NOT NULL,
  doctype_id INT UNSIGNED NOT NULL,
  FOREIGN KEY(indiv_id) REFERENCES individual(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY(doctype_id) REFERENCES doctype(id) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY(indiv_id, doctype_id)
) ENGINE InnoDB, DEFAULT CHARACTER SET utf8;

-- create table 'company'
DROP TABLE IF EXISTS company;
CREATE TABLE IF NOT EXISTS company
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(64) NOT NULL UNIQUE,            /*公司名称*/
  city_id INT UNSIGNED NOT NULL,               /*所在城市*/
  address VARCHAR(256) NOT NULL,               /*详细地址*/
  website VARCHAR(128) NOT NULL UNIQUE,        /*公司网站*/
  inroduct VARCHAR(2048),                      /*公司简介*/ 
  logo VARCHAR(256),                     /*logo图片文件名后缀*/
  authfile VARCHAR(256),                 /*认证资料图片文件名后缀*/
  auth_pass INT UNSIGNED NOT NULL DEFAULT 0,   /*是否通过认证, 0:待认证; 1:认证通过; 2:认证未通过*/
  valid_pass INT UNSIGNED NOT NULL DEFAULT 0,  /*是否通过审核, 0:待审核; 1:审核通过; 2:审核未通过*/
  recompos_id INT UNSIGNED NOT NULL,           /*在主页中的推荐位置*/ 
  FOREIGN KEY(city_id) REFERENCES city(id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
  FOREIGN KEY(recompos_id) REFERENCES recompos(id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
  PRIMARY KEY (id)
) ENGINE InnoDB, DEFAULT CHARACTER SET utf8 AUTO_INCREMENT 1;

-- create table 'company_transtype'
DROP TABLE IF EXISTS company_transtype;
CREATE TABLE IF NOT EXISTS company_transtype
(
  comp_id INT UNSIGNED NOT NULL,
  transtype_id INT UNSIGNED NOT NULL,
  FOREIGN KEY(comp_id) REFERENCES company(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY(transtype_id) REFERENCES transtype(id) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY(comp_id, transtype_id)
) ENGINE InnoDB, DEFAULT CHARACTER SET utf8;


-- create table 'company_lang'
DROP TABLE IF EXISTS company_lang;
CREATE TABLE IF NOT EXISTS company_lang
(
  comp_id INT UNSIGNED NOT NULL,
  lang_id INT UNSIGNED NOT NULL,
  FOREIGN KEY(comp_id) REFERENCES company(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY(lang_id) REFERENCES language(id) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY(comp_id, lang_id)
) ENGINE InnoDB, DEFAULT CHARACTER SET utf8;


-- create table 'company_field'
DROP TABLE IF EXISTS company_field;
CREATE TABLE IF NOT EXISTS company_field 
(
  comp_id INT UNSIGNED NOT NULL,
  field_id INT UNSIGNED NOT NULL,
  FOREIGN KEY(comp_id) REFERENCES company(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY(field_id) REFERENCES field(id) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY(comp_id, field_id)
) ENGINE InnoDB, DEFAULT CHARACTER SET utf8;


-- create table 'company_doctype'
DROP TABLE IF EXISTS company_doctype;
CREATE TABLE IF NOT EXISTS company_doctype 
(
  comp_id INT UNSIGNED NOT NULL,
  doctype_id INT UNSIGNED NOT NULL,
  FOREIGN KEY(comp_id) REFERENCES company(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY(doctype_id) REFERENCES doctype(id) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY(comp_id, doctype_id)
) ENGINE InnoDB, DEFAULT CHARACTER SET utf8;


-- 管理员
INSERT INTO user(id,email,password,tel,mobile,fax,qq,weixin,user_type,coin) VALUES (1,'yibang886@163.com','yibang887','','','','','',2,0);


-- Sample Data: 个人译员 
INSERT INTO user(email,password,tel,mobile,fax,qq,weixin,user_type,coin) VALUES ('james@163.com','password123!','82158278','18612802724','82158278','281574876','281574876@vchat',0,200);

INSERT INTO individual(id,name,gender,edu_id,sch_id,birth_year,city_id,mainpage,workstyle,exp_year,exp_trans,works,introduct,auth_pass,valid_pass,recompos_id) VALUES (LAST_INSERT_ID(),'LeBron, James',0,2,5,1985,1,'http://lebron.james.page.com',1,4,15,'How to play basketball','认证负责，经验丰富',0,0,3);

INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),1);
INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),3);
INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),5);

INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),62);
INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),69);

INSERT INTO individual_field(indiv_id,field_id) VALUES(LAST_INSERT_ID(),5);

INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),4);
INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),6);
INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),8);


-- Sample Data: 个人译员 
INSERT INTO user(email,password,tel,mobile,fax,qq,weixin,user_type,coin) VALUES ('bryant@163.com','password123!','82158278','18612802724','82158278','281574876','281574876@vchat',0,0);

INSERT INTO individual(id,name,gender,edu_id,sch_id,birth_year,city_id,mainpage,workstyle,exp_year,exp_trans,works,introduct,auth_pass,valid_pass,recompos_id) VALUES (LAST_INSERT_ID(),'Kobe, Bryant',0,2,5,1985,1,'http://kobe.page.com',1,4,15,'Introduction of C++','认证负责，经验丰富',0,0,1);

INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),4);
INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),5);

INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),1);
INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),3);
INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),9);

INSERT INTO individual_field(indiv_id,field_id) VALUES(LAST_INSERT_ID(),1);
INSERT INTO individual_field(indiv_id,field_id) VALUES(LAST_INSERT_ID(),5);

INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),1);
INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),3);
INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),4);


-- Sample Data: 个人译员 
INSERT INTO user(email,password,tel,mobile,fax,qq,weixin,user_type,coin) VALUES ('kirilenko@gmail.com','password123!','82158278','18612802724','82158278','281574876','281574876@vchat',0,400);

INSERT INTO individual(id,name,gender,edu_id,sch_id,birth_year,city_id,mainpage,workstyle,exp_year,exp_trans,works,introduct,auth_pass,valid_pass,recompos_id) VALUES (LAST_INSERT_ID(),'Kirilenko',0,2,5,1985,1,'http://kirilenko.page.com',1,4,15,'Begin with basketball','profound and hardworking',0,0,2);

INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),1);
INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),3);

INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),3);
INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),8);

INSERT INTO individual_field(indiv_id,field_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_field(indiv_id,field_id) VALUES(LAST_INSERT_ID(),10);

INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),4);
INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),6);
INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),8);



-- Sample Data: 个人译员 
INSERT INTO user(email,password,tel,mobile,fax,qq,weixin,user_type,coin) VALUES ('andersen@yahoo.com','password123!','82158278','18612802724','82158278','281574876','281574876@vchat',0,1000);

INSERT INTO individual(id,name,gender,edu_id,sch_id,birth_year,city_id,mainpage,workstyle,exp_year,exp_trans,works,introduct,auth_pass,valid_pass,recompos_id) VALUES (LAST_INSERT_ID(),'Andersen',0,2,5,1985,1,'http://andersen.page.com',1,4,15,'Begin with basketball','profound and hardworking',0,0,5);

INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),3);
INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),6);
INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),5);

INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),1);
INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),4);
INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),7);

INSERT INTO individual_field(indiv_id,field_id) VALUES(LAST_INSERT_ID(),1);
INSERT INTO individual_field(indiv_id,field_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_field(indiv_id,field_id) VALUES(LAST_INSERT_ID(),10);

INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),5);
INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),8);


-- Sample Data: 个人译员 
INSERT INTO user(email,password,tel,mobile,fax,qq,weixin,user_type,coin) VALUES ('arsik@yahoo.com','password123!','82158278','18612802724','82158278','281574876','281574876@vchat',0,300);

INSERT INTO individual(id,name,gender,edu_id,sch_id,birth_year,city_id,mainpage,workstyle,exp_year,exp_trans,works,introduct,auth_pass,valid_pass,recompos_id) VALUES (LAST_INSERT_ID(),'Arsik',0,2,5,1985,1,'http://arsik.page.com',1,4,15,'Programming Beginner','famous professor',0,0,2);

INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),1);
INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),4);

INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),4);
INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),9);

INSERT INTO individual_field(indiv_id,field_id) VALUES(LAST_INSERT_ID(),1);
INSERT INTO individual_field(indiv_id,field_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_field(indiv_id,field_id) VALUES(LAST_INSERT_ID(),3);

INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),1);
INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),3);


-- Sample Data: 个人译员 
INSERT INTO user(email,password,tel,mobile,fax,qq,weixin,user_type,coin) VALUES ('ariza@yahoo.com','password123!','82158278','18612802724','82158278','281574876','281574876@vchat',0,200);

INSERT INTO individual(id,name,gender,edu_id,sch_id,birth_year,city_id,mainpage,workstyle,exp_year,exp_trans,works,introduct,auth_pass,valid_pass,recompos_id) VALUES (LAST_INSERT_ID(),'Ariza',0,2,5,1985,1,'http://ariza.page.com',1,4,15,'C Language Beginner','have 10 years of experience',0,0,1);

INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),1);
INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),3);

INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),4);
INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),9);

INSERT INTO individual_field(indiv_id,field_id) VALUES(LAST_INSERT_ID(),1);
INSERT INTO individual_field(indiv_id,field_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_field(indiv_id,field_id) VALUES(LAST_INSERT_ID(),3);

INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),1);
INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),3);


-- Sample Data: 个人译员 
INSERT INTO user(email,password,tel,mobile,fax,qq,weixin,user_type,coin) VALUES ('durant@yahoo.com','password123!','82158278','18612802724','82158278','281574876','281574876@vchat',0,100);

INSERT INTO individual(id,name,gender,edu_id,sch_id,birth_year,city_id,mainpage,workstyle,exp_year,exp_trans,works,introduct,auth_pass,valid_pass,recompos_id) VALUES (LAST_INSERT_ID(),'Durant, Kevin',0,2,5,1985,1,'http://durant.page.com',1,4,15,'C Language Beginner','have 10 years of experience',0,0,2);

INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),1);
INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),3);

INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),4);
INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),9);

INSERT INTO individual_field(indiv_id,field_id) VALUES(LAST_INSERT_ID(),1);
INSERT INTO individual_field(indiv_id,field_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_field(indiv_id,field_id) VALUES(LAST_INSERT_ID(),3);

INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),1);
INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),3);


-- Sample Data: 个人译员 
INSERT INTO user(email,password,tel,mobile,fax,qq,weixin,user_type,coin) VALUES ('duncan@yahoo.com','password123!','82158278','18612802724','82158278','281574876','281574876@vchat',0,100);

INSERT INTO individual(id,name,gender,edu_id,sch_id,birth_year,city_id,mainpage,workstyle,exp_year,exp_trans,works,introduct,auth_pass,valid_pass,recompos_id) VALUES (LAST_INSERT_ID(),'Duncan, Tim',0,2,5,1985,1,'http://duncan.page.com',1,4,15,'C Language Beginner','have 10 years of experience',0,0,3);

INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),1);
INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),3);

INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),4);
INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),9);

INSERT INTO individual_field(indiv_id,field_id) VALUES(LAST_INSERT_ID(),1);
INSERT INTO individual_field(indiv_id,field_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_field(indiv_id,field_id) VALUES(LAST_INSERT_ID(),3);

INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),1);
INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),3);



-- Sample Data: 个人译员 
INSERT INTO user(email,password,tel,mobile,fax,qq,weixin,user_type,coin) VALUES ('ginobili@yahoo.com','password123!','82158278','18612802724','82158278','281574876','281574876@vchat',0,100);

INSERT INTO individual(id,name,gender,edu_id,sch_id,birth_year,city_id,mainpage,workstyle,exp_year,exp_trans,works,introduct,auth_pass,valid_pass,recompos_id) VALUES (LAST_INSERT_ID(),'Ginobili, Manu',0,2,5,1985,1,'http://ginobili.page.com',1,4,15,'C Language Beginner','have 10 years of experience',0,0,2);

INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),1);
INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),3);

INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),4);
INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),9);

INSERT INTO individual_field(indiv_id,field_id) VALUES(LAST_INSERT_ID(),1);
INSERT INTO individual_field(indiv_id,field_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_field(indiv_id,field_id) VALUES(LAST_INSERT_ID(),3);

INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),1);
INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),3);



-- Sample Data: 个人译员 
INSERT INTO user(email,password,tel,mobile,fax,qq,weixin,user_type,coin) VALUES ('griffin@yahoo.com','password123!','82158278','18612802724','82158278','281574876','281574876@vchat',0,100);

INSERT INTO individual(id,name,gender,edu_id,sch_id,birth_year,city_id,mainpage,workstyle,exp_year,exp_trans,works,introduct,auth_pass,valid_pass,recompos_id) VALUES (LAST_INSERT_ID(),'Griffin, Blak',0,2,5,1985,1,'http://griffin.page.com',1,4,15,'C Language Beginner','have 10 years of experience',0,0,2);

INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),1);
INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),3);

INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),4);
INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),9);

INSERT INTO individual_field(indiv_id,field_id) VALUES(LAST_INSERT_ID(),1);
INSERT INTO individual_field(indiv_id,field_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_field(indiv_id,field_id) VALUES(LAST_INSERT_ID(),3);

INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),1);
INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),3);


-- Sample Data: 个人译员 
INSERT INTO user(email,password,tel,mobile,fax,qq,weixin,user_type,coin) VALUES ('nowitzki@yahoo.com','password123!','82158278','18612802724','82158278','281574876','281574876@vchat',0,100);

INSERT INTO individual(id,name,gender,edu_id,sch_id,birth_year,city_id,mainpage,workstyle,exp_year,exp_trans,works,introduct,auth_pass,valid_pass,recompos_id) VALUES (LAST_INSERT_ID(),'Dirk, Nowitzki',0,2,5,1985,1,'http://nowitzki.page.com',1,4,15,'C Language Beginner','have 10 years of experience',0,0,2);

INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),1);
INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),3);

INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),4);
INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),9);

INSERT INTO individual_field(indiv_id,field_id) VALUES(LAST_INSERT_ID(),1);
INSERT INTO individual_field(indiv_id,field_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_field(indiv_id,field_id) VALUES(LAST_INSERT_ID(),3);

INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),1);
INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),3);



-- Sample Data: 个人译员 
INSERT INTO user(email,password,tel,mobile,fax,qq,weixin,user_type,coin) VALUES ('paul@yahoo.com','password123!','82158278','18612802724','82158278','281574876','281574876@vchat',0,100);

INSERT INTO individual(id,name,gender,edu_id,sch_id,birth_year,city_id,mainpage,workstyle,exp_year,exp_trans,works,introduct,auth_pass,valid_pass,recompos_id) VALUES (LAST_INSERT_ID(),'Chris, Paul',0,2,5,1985,1,'http://paul.chris.com',1,4,15,'C Language Beginner','have 10 years of experience',0,0,2);

INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),1);
INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(LAST_INSERT_ID(),3);

INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),4);
INSERT INTO individual_lang(indiv_id,lang_id) VALUES(LAST_INSERT_ID(),9);

INSERT INTO individual_field(indiv_id,field_id) VALUES(LAST_INSERT_ID(),1);
INSERT INTO individual_field(indiv_id,field_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_field(indiv_id,field_id) VALUES(LAST_INSERT_ID(),3);

INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),1);
INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),2);
INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(LAST_INSERT_ID(),3);





-- Sample Data: 北京设美译达翻译有限公司
INSERT INTO user(email,password,tel,mobile,fax,qq,weixin,user_type,coin) VALUES ('shemeiyida@yahoo.com','password123!','82158278','18612802724','82158278','281574876','281574876@weixin',1,20);
INSERT INTO company(id,name,city_id,address,website,inroduct,auth_pass,valid_pass,recompos_id) VALUES (LAST_INSERT_ID(),'北京设美译达翻译有限公司',1,'北京市朝阳区花园路9号','www.baidu.com','公司规模大，正规，信誉良好，快速准确',0,0,5);

INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),1);  -- 此公司支持笔译
INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),2);  -- 此公司支持口译
INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),3);  -- 此公司支持同声传译
 
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),62);  -- 此公司支持英语翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),49);  -- 此公司支持日语翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),69);  -- 此公司支持简体中文的翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),20);  -- 此公司支持法语的翻译
 
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),1);  -- 此公司支持医学领域的翻译
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),4);  -- 此公司支持外贸领域的翻译
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),7);  -- 此公司支持工程领域的翻译
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),10); -- 此公司支持建筑领域的翻译
 
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),4);   -- 此公司支持图书翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),5);   -- 此公司支持文献翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),6);   -- 此公司支持合同翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),7);   -- 此公司支持协议翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),8);  -- 此公司支持专利翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),9);  -- 此公司支持标书翻译
 

-- Sample Data: 
INSERT INTO user(email,password,tel,mobile,fax,qq,weixin,user_type,coin) VALUES ('huiyida@gmail.com','password123!','82158278','18612802724','82158278','281574876','281574876@weixin',1,30);
INSERT INTO company(id,name,city_id,address,website,inroduct,auth_pass,valid_pass,recompos_id) VALUES (LAST_INSERT_ID(),'汇译达翻译有限公司',2,'上海中山路2号','http://www.baidu.com','公司规模大，信誉良好，快速准确',0,0,2);

INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),1);  -- 此公司支持笔译
INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),2);  -- 此公司支持口译
INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),3);  -- 此公司支持同声传译
 
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),62);  -- 此公司支持英语翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),49);  -- 此公司支持日语翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),69);  -- 此公司支持简体中文的翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),20);  -- 此公司支持法语的翻译
 
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),1);  -- 此公司支持医学领域的翻译
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),4);  -- 此公司支持外贸领域的翻译
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),7);  -- 此公司支持工程领域的翻译
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),10); -- 此公司支持建筑领域的翻译
 
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),4);   -- 此公司支持图书翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),5);   -- 此公司支持文献翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),6);   -- 此公司支持合同翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),7);   -- 此公司支持协议翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),8);  -- 此公司支持专利翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),9);  -- 此公司支持标书翻译



-- Sample Data: 
INSERT INTO user(email,password,tel,mobile,fax,qq,weixin,user_type,coin) VALUES ('365@gmail.com','password123!','82158278','18612802724','82158278','281574876','281574876@weixin',1,50);
INSERT INTO company(id,name,city_id,address,website,inroduct,auth_pass,valid_pass,recompos_id) VALUES (LAST_INSERT_ID(),'北京365翻译公司',1,'北京海淀区学院路2号','http://www.sina.com','汇集各语种专家，为您服务',0,0,2);

INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),2);  -- 此公司支持口译
INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),3);  -- 此公司支持同声传译
 
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),62);  -- 此公司支持英语翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),49);  -- 此公司支持日语翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),69);  -- 此公司支持简体中文的翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),20);  -- 此公司支持法语的翻译
 
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),1);  -- 此公司支持医学领域的翻译
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),4);  -- 此公司支持外贸领域的翻译
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),7);  -- 此公司支持工程领域的翻译
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),10); -- 此公司支持建筑领域的翻译
 
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),4);   -- 此公司支持图书翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),6);   -- 此公司支持合同翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),7);   -- 此公司支持协议翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),8);  -- 此公司支持专利翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),9);  -- 此公司支持标书翻译



-- Sample Data: 
INSERT INTO user(email,password,tel,mobile,fax,qq,weixin,user_type,coin) VALUES ('tianyitimes@163.com','password123!','82158278','18612802724','82158278','281574876','281574876@weixin',1,100);
INSERT INTO company(id,name,city_id,address,website,inroduct,auth_pass,valid_pass,recompos_id) VALUES (LAST_INSERT_ID(),'天译时代翻译公司',3,'天津市清平路路2号','http://www.tianyitimes.com','人力资源丰富，专业领域广',0,0,1);

INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),1);  -- 此公司支持笔译
INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),2);  -- 此公司支持口译
INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),3);  -- 此公司支持同声传译
 
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),62);  -- 此公司支持英语翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),49);  -- 此公司支持日语翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),69);  -- 此公司支持简体中文的翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),20);  -- 此公司支持法语的翻译
 
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),1);  -- 此公司支持医学领域的翻译
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),7);  -- 此公司支持工程领域的翻译
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),10); -- 此公司支持建筑领域的翻译
 
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),4);   -- 此公司支持图书翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),5);   -- 此公司支持文献翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),8);  -- 此公司支持专利翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),9);  -- 此公司支持标书翻译



-- Sample Data: 
INSERT INTO user(email,password,tel,mobile,fax,qq,weixin,user_type,coin) VALUES ('ocean@163.com','password123!','82158278','18612802724','82158278','281574876','281574876@weixin',1,100);
INSERT INTO company(id,name,city_id,address,website,inroduct,auth_pass,valid_pass,recompos_id) VALUES (LAST_INSERT_ID(),'浩海翻译公司',3,'天津市清平路路2号','http://www.ocean.com','人力资源丰富，专业领域广',0,0,1);

INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),1);  -- 此公司支持笔译
INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),2);  -- 此公司支持口译
INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),3);  -- 此公司支持同声传译
 
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),62);  -- 此公司支持英语翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),49);  -- 此公司支持日语翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),69);  -- 此公司支持简体中文的翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),20);  -- 此公司支持法语的翻译
 
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),1);  -- 此公司支持医学领域的翻译
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),7);  -- 此公司支持工程领域的翻译
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),10); -- 此公司支持建筑领域的翻译
 
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),4);   -- 此公司支持图书翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),5);   -- 此公司支持文献翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),8);  -- 此公司支持专利翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),9);  -- 此公司支持标书翻译



-- Sample Data: 
INSERT INTO user(email,password,tel,mobile,fax,qq,weixin,user_type,coin) VALUES ('shangcai@gmail.com','password123!','82158278','18612802724','82158278','281574876','281574876@weixin',1,200);
INSERT INTO company(id,name,city_id,address,website,inroduct,auth_pass,valid_pass,recompos_id) VALUES (LAST_INSERT_ID(),'尚才翻译公司',4,'南京江口路2号','http://www.shangcai.com','人力资源丰富，专业领域广',0,0,2);

INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),1);  -- 此公司支持笔译
INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),2);  -- 此公司支持口译
INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),3);  -- 此公司支持同声传译
 
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),62);  -- 此公司支持英语翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),49);  -- 此公司支持日语翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),69);  -- 此公司支持简体中文的翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),20);  -- 此公司支持法语的翻译
 
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),1);  -- 此公司支持医学领域的翻译
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),7);  -- 此公司支持工程领域的翻译
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),10); -- 此公司支持建筑领域的翻译
 
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),4);   -- 此公司支持图书翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),5);   -- 此公司支持文献翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),8);  -- 此公司支持专利翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),9);  -- 此公司支持标书翻译



-- Sample Data: 
INSERT INTO user(email,password,tel,mobile,fax,qq,weixin,user_type,coin) VALUES ('oudebao@yahoo.com','password123!','82158278','18612802724','82158278','281574876','281574876@weixin',1,300);
INSERT INTO company(id,name,city_id,address,website,inroduct,auth_pass,valid_pass,recompos_id) VALUES (LAST_INSERT_ID(),'欧得宝翻译公司',3,'天津市顺丰路1号','http://www.nvvxe.com/bj/','人力资源丰富，专业领域广',0,0,2);

INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),1);  -- 此公司支持笔译
INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),2);  -- 此公司支持口译
INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),3);  -- 此公司支持同声传译
 
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),62);  -- 此公司支持英语翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),49);  -- 此公司支持日语翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),69);  -- 此公司支持简体中文的翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),20);  -- 此公司支持法语的翻译
 
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),1);  -- 此公司支持医学领域的翻译
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),7);  -- 此公司支持工程领域的翻译
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),10); -- 此公司支持建筑领域的翻译
 
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),4);   -- 此公司支持图书翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),5);   -- 此公司支持文献翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),8);  -- 此公司支持专利翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),9);  -- 此公司支持标书翻译



-- Sample Data: 
INSERT INTO user(email,password,tel,mobile,fax,qq,weixin,user_type,coin) VALUES ('guanyu@yahoo.com','password123!','82158278','18612802724','82158278','281574876','281574876@weixin',1,100);
INSERT INTO company(id,name,city_id,address,website,inroduct,auth_pass,valid_pass,recompos_id) VALUES (LAST_INSERT_ID(),'冠宇翻译公司',2,'上海市顺丰路2号','http://www.muyingguo.com/a/','人力资源丰富，专业领域广',0,0,3);

INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),1);  -- 此公司支持笔译
INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),2);  -- 此公司支持口译
INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),3);  -- 此公司支持同声传译
 
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),62);  -- 此公司支持英语翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),49);  -- 此公司支持日语翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),69);  -- 此公司支持简体中文的翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),20);  -- 此公司支持法语的翻译
 
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),1);  -- 此公司支持医学领域的翻译
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),7);  -- 此公司支持工程领域的翻译
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),10); -- 此公司支持建筑领域的翻译
 
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),4);   -- 此公司支持图书翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),5);   -- 此公司支持文献翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),8);  -- 此公司支持专利翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),9);  -- 此公司支持标书翻译



INSERT INTO user(email,password,tel,mobile,fax,qq,weixin,user_type,coin) VALUES ('xinya@yahoo.com','password123!','82158278','18612802724','82158278','281574876','281574876@weixin',1,100);
INSERT INTO company(id,name,city_id,address,website,inroduct,auth_pass,valid_pass,recompos_id) VALUES (LAST_INSERT_ID(),'新亚翻译网',2,'上海路1号','http://fy88.qiyeztc.com/','人力资源丰富，专业领域广',0,0,3);

INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),1);  -- 此公司支持笔译
INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),2);  -- 此公司支持口译
INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),3);  -- 此公司支持同声传译
 
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),62);  -- 此公司支持英语翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),49);  -- 此公司支持日语翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),69);  -- 此公司支持简体中文的翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),20);  -- 此公司支持法语的翻译
 
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),1);  -- 此公司支持医学领域的翻译
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),7);  -- 此公司支持工程领域的翻译
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),10); -- 此公司支持建筑领域的翻译
 
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),4);   -- 此公司支持图书翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),5);   -- 此公司支持文献翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),8);  -- 此公司支持专利翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),9);  -- 此公司支持标书翻译



INSERT INTO user(email,password,tel,mobile,fax,qq,weixin,user_type,coin) VALUES ('zhutaren@yahoo.com','password123!','82158278','18612802724','82158278','281574876','281574876@weixin',1,300);
INSERT INTO company(id,name,city_id,address,website,inroduct,auth_pass,valid_pass,recompos_id) VALUES (LAST_INSERT_ID(),'筑塔人翻译公司',1,'北京丰台区','http://zhutaren.com/','人力资源丰富，专业领域广',0,0,5);

INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),1);  -- 此公司支持笔译
INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),2);  -- 此公司支持口译
INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),3);  -- 此公司支持同声传译
 
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),62);  -- 此公司支持英语翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),49);  -- 此公司支持日语翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),69);  -- 此公司支持简体中文的翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),20);  -- 此公司支持法语的翻译
 
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),1);  -- 此公司支持医学领域的翻译
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),7);  -- 此公司支持工程领域的翻译
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),10); -- 此公司支持建筑领域的翻译
 
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),4);   -- 此公司支持图书翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),5);   -- 此公司支持文献翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),8);  -- 此公司支持专利翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),9);  -- 此公司支持标书翻译



INSERT INTO user(email,password,tel,mobile,fax,qq,weixin,user_type,coin) VALUES ('xinyitong@yahoo.com','password123!','82158278','18612802724','82158278','281574876','281574876@weixin',1,100);
INSERT INTO company(id,name,city_id,address,website,inroduct,auth_pass,valid_pass,recompos_id) VALUES (LAST_INSERT_ID(),'新译通翻译公司',2,'上海五角场','http://yinyitong.com/','人力资源丰富，专业领域广',0,0,5);

INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),1);  -- 此公司支持笔译
INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),2);  -- 此公司支持口译
INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),3);  -- 此公司支持同声传译
 
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),62);  -- 此公司支持英语翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),49);  -- 此公司支持日语翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),69);  -- 此公司支持简体中文的翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),20);  -- 此公司支持法语的翻译
 
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),1);  -- 此公司支持医学领域的翻译
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),7);  -- 此公司支持工程领域的翻译
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),10); -- 此公司支持建筑领域的翻译
 
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),4);   -- 此公司支持图书翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),5);   -- 此公司支持文献翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),8);  -- 此公司支持专利翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),9);  -- 此公司支持标书翻译




INSERT INTO user(email,password,tel,mobile,fax,qq,weixin,user_type,coin) VALUES ('angel@yahoo.com','password123!','82158278','18612802724','82158278','281574876','281574876@weixin',1,100);
INSERT INTO company(id,name,city_id,address,website,inroduct,auth_pass,valid_pass,recompos_id) VALUES (LAST_INSERT_ID(),'天使翻译公司',2,'上海五角场','http://angel.translation.com/','人力资源丰富，专业领域广',0,0,5);

INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),1);  -- 此公司支持笔译
INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),2);  -- 此公司支持口译
INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),3);  -- 此公司支持同声传译
 
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),62);  -- 此公司支持英语翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),49);  -- 此公司支持日语翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),69);  -- 此公司支持简体中文的翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),20);  -- 此公司支持法语的翻译
 
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),1);  -- 此公司支持医学领域的翻译
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),7);  -- 此公司支持工程领域的翻译
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),10); -- 此公司支持建筑领域的翻译
 
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),4);   -- 此公司支持图书翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),5);   -- 此公司支持文献翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),8);  -- 此公司支持专利翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),9);  -- 此公司支持标书翻译



INSERT INTO user(email,password,tel,mobile,fax,qq,weixin,user_type,coin) VALUES ('ruike@yahoo.com','password123!','82158278','18612802724','82158278','281574876','281574876@weixin',1,200);
INSERT INTO company(id,name,city_id,address,website,inroduct,auth_pass,valid_pass,recompos_id) VALUES (LAST_INSERT_ID(),'瑞科翻译公司',2,'上海五角场','http://ruike.com/','人力资源丰富，专业领域广',0,0,4);

INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),1);  -- 此公司支持笔译
INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),2);  -- 此公司支持口译
INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),3);  -- 此公司支持同声传译
 
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),62);  -- 此公司支持英语翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),49);  -- 此公司支持日语翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),69);  -- 此公司支持简体中文的翻译
INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),20);  -- 此公司支持法语的翻译
 
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),1);  -- 此公司支持医学领域的翻译
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),7);  -- 此公司支持工程领域的翻译
INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),10); -- 此公司支持建筑领域的翻译
 
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),4);   -- 此公司支持图书翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),5);   -- 此公司支持文献翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),8);  -- 此公司支持专利翻译
INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),9);  -- 此公司支持标书翻译
