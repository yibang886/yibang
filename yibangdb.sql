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
INSERT INTO language(language) VALUES('德语');
INSERT INTO language(language) VALUES('达尔金语');
INSERT INTO language(language) VALUES('东干语');
INSERT INTO language(language) VALUES('丹麦语');
INSERT INTO language(language) VALUES('俄语');
INSERT INTO language(language) VALUES('法语');
INSERT INTO language(language) VALUES('梵文');
INSERT INTO language(language) VALUES('芬兰语');
INSERT INTO language(language) VALUES('菲律宾语');
INSERT INTO language(language) VALUES('格鲁吉亚语');
INSERT INTO language(language) VALUES('韩语');
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
INSERT INTO language(language) VALUES('日语');
INSERT INTO language(language) VALUES('瑞典语');
INSERT INTO language(language) VALUES('塞尔维亚语');
INSERT INTO language(language) VALUES('斯瓦西里语');
INSERT INTO language(language) VALUES('斯洛文尼亚语');
INSERT INTO language(language) VALUES('泰语');
INSERT INTO language(language) VALUES('土耳其语');
INSERT INTO language(language) VALUES('乌尔都语');
INSERT INTO language(language) VALUES('乌克兰语');
INSERT INTO language(language) VALUES('希伯来语');
INSERT INTO language(language) VALUES('希腊语');
INSERT INTO language(language) VALUES('匈牙利语');
INSERT INTO language(language) VALUES('西班牙语');
INSERT INTO language(language) VALUES('英语');
INSERT INTO language(language) VALUES('印古什语');
INSERT INTO language(language) VALUES('亚美尼亚语');
INSERT INTO language(language) VALUES('印地语');
INSERT INTO language(language) VALUES('越南语');
INSERT INTO language(language) VALUES('意大利语');
INSERT INTO language(language) VALUES('印度尼西亚语');
INSERT INTO language(language) VALUES('中文-简体');
INSERT INTO language(language) VALUES('中文-繁体');
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
INSERT INTO school(school) VALUES ('北京交通大学');
INSERT INTO school(school) VALUES ('人民大学');
INSERT INTO school(school) VALUES ('北航');
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
INSERT INTO city(city) VALUES ('南京');
INSERT INTO city(city) VALUES ('海外');
INSERT INTO city(city) VALUES ('其他');

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
  works VARCHAR(64),                           /*翻译作品*/
  introduct VARCHAR(1024) NOT NULL,            /*个人简介*/
  photo_suffix VARCHAR(64),                    /*照片图片文件名后缀*/
  langcert_suffix VARCHAR(64),                 /*语言等级证书图片文件名后缀*/
  transcert_suffix VARCHAR(64),                /*翻译证书图片文件名后缀*/
  profcert_suffix VARCHAR(64),                 /*专业证书图片文件名后缀*/
  authfile_suffix VARCHAR(64),                 /*认证资料图片文件名后缀*/
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
  inroduct VARCHAR(1024),                      /*公司简介*/ 
  logo_suffix VARCHAR(64),                     /*logo图片文件名后缀*/
  authfile_suffix VARCHAR(64),                 /*认证资料图片文件名后缀*/
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
INSERT INTO user(email,password,tel,mobile,fax,qq,weixin,user_type,coin) VALUES ('watermelon-wxr@163.com','password123!','82158278','18612802724','82158278','281574876','281574876@weixin',0,0);

INSERT INTO individual(id,name,gender,edu_id,sch_id,birth_year,city_id,mainpage,workstyle,exp_year,exp_trans,works,introduct,auth_pass,valid_pass,recompos_id) VALUES (LAST_INSERT_ID(),'James',0,2,5,1985,1,'http://yuanguo.page.com',1,4,15,'C语言入门','认证负责，经验丰富',0,0,3);

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



-- Sample Data: 北京设美译达翻译有限公司
INSERT INTO user(email,password,tel,mobile,fax,qq,weixin,user_type,coin) VALUES ('yuanguo.h_001@yahoo.com','password123!','82158278','18612802724','82158278','281574876','281574876@weixin',1,1000);
INSERT INTO company(id,name,city_id,address,website,inroduct,auth_pass,valid_pass,recompos_id) VALUES (LAST_INSERT_ID(),'北京设美译达翻译有限公司',1,'北京市朝阳区花园路9号','www.baidu.com','公司规模大，正规，信誉良好，快速准确',0,0,1);

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
 

-- Sample Data: 365翻译公司
-- INSERT INTO company(name,logo,descrip,tel,mobile,email,address) VALUES ('365翻译公司','logo/365.jpeg','全国快速网上报价，行业No1；10年行业经验，80种语言互译，60个专业领域','021-12341234','86+15810535719','365@gmail.com','上海松江路31号');
-- 
-- INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),3);  -- 此公司支持笔译
-- INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),4);  -- 此公司支持口译
-- INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),5);  -- 此公司支持同声传译
-- INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),7);  -- 此公司支持速记
-- 
-- INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),5);  -- 此公司支持英语翻译
-- INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),11); -- 此公司支持日语翻译
-- INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),3);  -- 此公司支持简体中文的翻译
-- INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),6);  -- 此公司支持法语的翻译
-- INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),9);  -- 此公司支持葡萄牙语的翻译
-- INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),15);  -- 此公司支持蒙古语的翻译
-- 
-- INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),3);  -- 此公司支持医学领域的翻译
-- INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),6);  -- 此公司支持外贸领域的翻译
-- INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),12); -- 此公司支持建筑领域的翻译
-- INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),13); -- 此公司支持航空领域的翻译
-- INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),14); -- 此公司支持化工领域的翻译
-- INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),20); -- 此公司支持造纸领域的翻译
-- INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),21); -- 此公司支持印刷领域的翻译
-- 
-- INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),6);   -- 此公司支持图书翻译
-- INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),8);   -- 此公司支持合同翻译
-- INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),9);   -- 此公司支持协议翻译
-- INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),11);  -- 此公司支持标书翻译
-- INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),23);  -- 此公司支持审计翻译
-- INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),24);  -- 此公司支持广告翻译
