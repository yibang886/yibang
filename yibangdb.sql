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

INSERT INTO transtype(transtype) VALUES('全部');
INSERT INTO transtype(transtype) VALUES('笔译');
INSERT INTO transtype(transtype) VALUES('口译');
INSERT INTO transtype(transtype) VALUES('同声传译');
INSERT INTO transtype(transtype) VALUES('本地化');
INSERT INTO transtype(transtype) VALUES('速记');

-- create table 'language' and insert pre-defined set of languages;
DROP TABLE IF EXISTS language;
CREATE TABLE IF NOT EXISTS language
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  language VARCHAR(32) NOT NULL,
  PRIMARY KEY (id)
) ENGINE InnoDB, DEFAULT CHARACTER SET utf8 AUTO_INCREMENT 1;

INSERT INTO language(language) VALUES('全部');
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

-- create table 'field' and insert pre-defined set of fields;
DROP TABLE IF EXISTS field;
CREATE TABLE IF NOT EXISTS field 
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  field VARCHAR(32) NOT NULL,
  PRIMARY KEY (id)
) ENGINE InnoDB, DEFAULT CHARACTER SET utf8 AUTO_INCREMENT 1;

INSERT INTO field(field) VALUES('全部');
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

-- create table 'doctype' and insert pre-defined set of doc types;
DROP TABLE IF EXISTS doctype;
CREATE TABLE IF NOT EXISTS doctype
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  doctype VARCHAR(32) NOT NULL,
  PRIMARY KEY (id)
) ENGINE InnoDB, DEFAULT CHARACTER SET utf8 AUTO_INCREMENT 1;

INSERT INTO doctype(doctype) VALUES('全部');
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

-- create table 'mainpos'
-- 翻译信息在主页中的推荐位置; NO: 不在推荐位置显示；
DROP TABLE IF EXISTS mainpos;
CREATE TABLE IF NOT EXISTS mainpos
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  mainpos VARCHAR(8) NOT NULL,
  PRIMARY KEY (id)
) ENGINE InnoDB, DEFAULT CHARACTER SET utf8 AUTO_INCREMENT 1;

INSERT INTO mainpos(mainpos) VALUES ('NO');
INSERT INTO mainpos(mainpos) VALUES ('A1');
INSERT INTO mainpos(mainpos) VALUES ('A2');
INSERT INTO mainpos(mainpos) VALUES ('A3');

-- create table 'searchpos'
-- 翻译信息在搜索页中的推荐位置; NO: 不在推荐位置显示；
DROP TABLE IF EXISTS searchpos;
CREATE TABLE IF NOT EXISTS searchpos
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  searchpos VARCHAR(8) NOT NULL,
  PRIMARY KEY (id)
) ENGINE InnoDB, DEFAULT CHARACTER SET utf8 AUTO_INCREMENT 1;

INSERT INTO searchpos(searchpos) VALUES ('NO');
INSERT INTO searchpos(searchpos) VALUES ('B1');
INSERT INTO searchpos(searchpos) VALUES ('B2');
INSERT INTO searchpos(searchpos) VALUES ('B3');

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
  srvcount INT UNSIGNED NOT NULL DEFAULT 0,    /*该用户发布的翻译服务数, 当前版本中最多为1*/
  refcount INT UNSIGNED NOT NULL DEFAULT 0,    /*该用户推荐的用户数, 推荐数到一定数量则允许用户选择推荐位*/
  PRIMARY KEY (id)
) ENGINE InnoDB, DEFAULT CHARACTER SET utf8 AUTO_INCREMENT 1;

-- create table 'individual'
DROP TABLE IF EXISTS individual;
CREATE TABLE IF NOT EXISTS individual
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id INT UNSIGNED NOT NULL,     /*发布者*/
  name VARCHAR(16) NOT NULL,         /*真实姓名*/
  gender INT UNSIGNED NOT NULL,      /*性别, 0:男；1:女*/
  edu_id INT UNSIGNED NOT NULL,      /*教育水平*/
  sch_id INT UNSIGNED NOT NULL,      /*毕业院校*/
  birth_year INT UNSIGNED NOT NULL,  
  city_id INT UNSIGNED NOT NULL,               /*所在城市*/
  mainpage VARCHAR(128),                       /*个人主页,博客等*/
  workstyle INT UNSIGNED NOT NULL DEFAULT 1,   /*工作方式, 0:全职；1:兼职*/
  lang_cert VARCHAR(64),                       /*语言等级证书*/
  trans_cert VARCHAR(64),                      /*翻译证书*/
  prof_cert VARCHAR(64),                       /*专业证书*/
  exp_year INT UNSIGNED NOT NULL DEFAULT 0,    /*工作年限*/
  exp_trans INT UNSIGNED NOT NULL DEFAULT 0,   /*翻译经验，单位：万字，例如15表示15万字*/
  works VARCHAR(64),                           /*翻译作品*/
  introduct VARCHAR(1024) NOT NULL,            /*个人简介*/
  photo VARCHAR(64),
  auth_file VARCHAR(64),                       /*认证资料路径*/
  auth_pass INT UNSIGNED NOT NULL DEFAULT 0,   /*是否通过认证, 0:未通过; 1:通过*/    
  mpos_id INT UNSIGNED NOT NULL,               /*在主页中的推荐位置*/ 
  spos_id INT UNSIGNED NOT NULL,               /*在搜索页中的推荐位置*/
  FOREIGN KEY(user_id) REFERENCES user(id) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY(edu_id) REFERENCES education(id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
  FOREIGN KEY(sch_id) REFERENCES school(id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
  FOREIGN KEY(city_id) REFERENCES city(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  FOREIGN KEY(mpos_id) REFERENCES mainpos(id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
  FOREIGN KEY(spos_id) REFERENCES searchpos(id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
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
  user_id INT UNSIGNED NOT NULL,               /*发布者*/
  name VARCHAR(64) NOT NULL UNIQUE,            /*公司名称*/
  city_id INT UNSIGNED NOT NULL,               /*所在城市*/
  address VARCHAR(256),                        /*详细地址*/
  website VARCHAR(128) NOT NULL,               /*公司网站*/
  inroduct VARCHAR(1024),                      /*公司简介*/ 
  logo VARCHAR(64),                            /*logo图片路径*/
  auth_file VARCHAR(64),                       /*认证资料路径*/
  auth_pass INT UNSIGNED NOT NULL DEFAULT 0,   /*是否通过认证, 0:未通过; 1:通过*/
  FOREIGN KEY(user_id) REFERENCES user(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  FOREIGN KEY(city_id) REFERENCES city(id) ON DELETE RESTRICT ON UPDATE RESTRICT, 
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

-- Sample Data: 个人译员 
INSERT INTO user(email,password,tel,mobile,fax,qq,weixin) VALUES ('yuanguo.h_001@yahoo.com','password123!','82158278','18612802724','82158278','281574876','281574876@weixin');

INSERT INTO individual(user_id,name,gender,edu_id,sch_id,birth_year,city_id,mainpage,workstyle,lang_cert,trans_cert,prof_cert,exp_year,exp_trans,works,introduct,photo,auth_file,auth_pass,mpos_id,spos_id) VALUES (1,'霍远国',0,2,5,1985,1,'http://yuanguo.page.com',1,'individual/lang_cert/1/langcert.crt','individual/trans_cert/1/transcert.crt','individual/prof_cert/1/profcert.crt',4,15,'C语言入门','认证负责，经验丰富','individual/photo/1/photo.bitmap','individual/auth_file/1/authfile.png',1,3,2);

INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(1,2);
INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(1,6);
INSERT INTO individual_transtype(indiv_id,transtype_id) VALUES(1,5);

INSERT INTO individual_lang(indiv_id,lang_id) VALUES(1,63);
INSERT INTO individual_lang(indiv_id,lang_id) VALUES(1,70);

INSERT INTO individual_field(indiv_id,field_id) VALUES(1,6);

INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(1,2);
INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(1,3);
INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(1,4);
INSERT INTO individual_doctype(indiv_id,doctype_id) VALUES(1,6);

-- Sample Data: 北京设美译达翻译有限公司
-- INSERT INTO company(name,logo,descrip,tel,mobile,email,address) VALUES ('北京设美译达翻译有限公司','logo/shemeiyida.jpeg','正规，信誉良好，快速准确','010-82158278','86+18612802724','watermelon-wxr@163.com','北京海淀科学院南路1号');
-- 
-- INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),3);  -- 此公司支持笔译
-- INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),4);  -- 此公司支持口译
-- INSERT INTO company_transtype(comp_id,transtype_id) VALUES (LAST_INSERT_ID(),5);  -- 此公司支持同声传译
-- 
-- INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),5);  -- 此公司支持英语翻译
-- INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),11); -- 此公司支持日语翻译
-- INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),3);  -- 此公司支持简体中文的翻译
-- INSERT INTO company_lang(comp_id,lang_id) VALUES (LAST_INSERT_ID(),6);  -- 此公司支持法语的翻译
-- 
-- INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),3);  -- 此公司支持医学领域的翻译
-- INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),6);  -- 此公司支持外贸领域的翻译
-- INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),9);  -- 此公司支持工程领域的翻译
-- INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),12); -- 此公司支持建筑领域的翻译
-- INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),13); -- 此公司支持航空领域的翻译
-- INSERT INTO company_field(comp_id,field_id) VALUES (LAST_INSERT_ID(),14); -- 此公司支持化工领域的翻译
-- 
-- INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),6);   -- 此公司支持图书翻译
-- INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),7);   -- 此公司支持文献翻译
-- INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),8);   -- 此公司支持合同翻译
-- INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),9);   -- 此公司支持协议翻译
-- INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),10);  -- 此公司支持专利翻译
-- INSERT INTO company_doctype(comp_id,doctype_id) VALUES(LAST_INSERT_ID(),11);  -- 此公司支持标书翻译
-- 
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
