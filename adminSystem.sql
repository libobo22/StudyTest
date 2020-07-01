/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2020/5/7 17:33:00                            */
/*==============================================================*/


DROP TABLE IF EXISTS t_cbdCar;

DROP TABLE IF EXISTS t_cbdCarLease;

DROP TABLE IF EXISTS t_company;

DROP TABLE IF EXISTS t_externalContract;

DROP TABLE IF EXISTS t_lesseeContract;

DROP TABLE IF EXISTS t_performance;

/*==============================================================*/
/* Table: t_cbdCar                                              */
/*==============================================================*/
CREATE TABLE t_cbdCar
(
   pk_cbdCarID          INT NOT NULL AUTO_INCREMENT COMMENT 'CBD车位ID',
   f_carAddress         VARCHAR(64) COMMENT '车位地址',
   f_carNumber          VARCHAR(16) COMMENT '车位编号',
   f_leaseStatus        INT COMMENT '租赁状态(1代表已租赁，2代表未租赁)',
   f_inOrOutStatus      INT COMMENT '1代表内部车位，2代表外部车位',
   f_cbdCarStatus       INT COMMENT '1代表有效，0代表无效',
   fk_externalContractID INT,
   PRIMARY KEY (pk_cbdCarID)
);

ALTER TABLE t_cbdCar COMMENT 'CBD车位信息表';

/*==============================================================*/
/* Table: t_cbdCarLease                                         */
/*==============================================================*/
CREATE TABLE t_cbdCarLease
(
   pk_cbdCarLeaseID     INT NOT NULL AUTO_INCREMENT,
   fk_cbdCarID          INT,
   fk_lesseeContractID  INT,
   PRIMARY KEY (pk_cbdCarLeaseID)
);

ALTER TABLE t_cbdCarLease COMMENT 'cbd车位租赁表';

/*==============================================================*/
/* Table: t_company                                             */
/*==============================================================*/
CREATE TABLE t_company
(
   pk_companyID         INT NOT NULL AUTO_INCREMENT COMMENT '企业ID',
   f_loginName          VARCHAR(32) COMMENT '企业登录ID',
   f_loginPwd           VARCHAR(32) COMMENT '企业登录密码',
   f_companyName        VARCHAR(32) COMMENT '企业名称',
   f_floor              INT COMMENT '楼层',
   f_linkman            VARCHAR(32) COMMENT '联系人',
   f_linkPhone          VARCHAR(16) COMMENT '联系电话',
   PRIMARY KEY (pk_companyID)
);

ALTER TABLE t_company COMMENT '企业表';

/*==============================================================*/
/* Table: t_externalContract                                    */
/*==============================================================*/
CREATE TABLE t_externalContract
(
   pk_externalContractID INT NOT NULL AUTO_INCREMENT COMMENT '外部合约ID',
   f_contractCompany    VARCHAR(32) COMMENT '合同单位',
   f_linkman            VARCHAR(32) COMMENT '联系人',
   f_linkPhone          VARCHAR(16) COMMENT '联系电话',
   f_companyAddress     VARCHAR(64) COMMENT '车位所属单位详细地址',
   f_contractStartDate  TIMESTAMP COMMENT '合同生效日期',
   f_contractEndDate    TIMESTAMP COMMENT '合同截止日期',
   f_dealPrice          FLOAT COMMENT '成交价格',
   f_contractOfCopy     VARCHAR(64) COMMENT '合同复印件',
   f_contractNumber     VARCHAR(32) COMMENT '合同编号',
   f_contractExtensionNumber VARCHAR(32) COMMENT '续约合同编号',
   f_contractStatus     INT COMMENT '合同状态(1代表有效，0代表无效)',
   PRIMARY KEY (pk_externalContractID)
);

ALTER TABLE t_externalContract COMMENT '外部合约表';

/*==============================================================*/
/* Table: t_lesseeContract                                      */
/*==============================================================*/
CREATE TABLE t_lesseeContract
(
   pk_lesseeContractID  INT NOT NULL AUTO_INCREMENT COMMENT '租户合约ID',
   f_companyName        VARCHAR(32) COMMENT '企业名称',
   f_linkman            VARCHAR(32) COMMENT '联系人',
   f_linkPhone          VARCHAR(16) COMMENT '联系电话',
   f_contractStartDate  TIMESTAMP COMMENT '合同生效时间',
   f_contractEndDate    TIMESTAMP COMMENT '合同截至时间',
   f_dealPrice          FLOAT COMMENT '成交价格',
   f_contractOfCopy     VARCHAR(64) COMMENT '合同复印件',
   f_contractNumber     VARCHAR(32) COMMENT '合同编号',
   f_contractExtensionNumber VARCHAR(32) COMMENT '续约合同编号',
   f_contractStatus     INT COMMENT '合同状态(1代表有效，0代表无效)',
   fk_companyID         INT,
   PRIMARY KEY (pk_lesseeContractID)
);

ALTER TABLE t_lesseeContract COMMENT '租户合约表';

/*==============================================================*/
/* Table: t_performance                                         */
/*==============================================================*/
CREATE TABLE t_performance
(
   pk_performanceID     INT NOT NULL AUTO_INCREMENT COMMENT 'ID',
   f_responseTime       INT COMMENT '响应时间',
   f_type               VARCHAR(16) COMMENT '业务类型',
   f_methodName         VARCHAR(32) COMMENT '方法名',
   f_info               VARCHAR(32) COMMENT '描述',
   PRIMARY KEY (pk_performanceID)
);

ALTER TABLE t_performance COMMENT '性能统计表';

