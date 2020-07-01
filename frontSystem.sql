/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2020/5/7 17:21:01                            */
/*==============================================================*/


drop table if exists t_carLease;

drop table if exists t_complain;

drop table if exists t_personalCar;

drop table if exists t_personalContract;

drop table if exists t_reserve;

/*==============================================================*/
/* Table: t_carLease                                            */
/*==============================================================*/
create table t_carLease
(
   pk_carLeaseID        int not null,
   f_leaseStartDate     timestamp,
   f_leaseEndDate       timestamp,
   f_price              float,
   f_leaseStatus        int comment '1：代表出租。2：代表出售',
   fk_carID             int,
   primary key (pk_carLeaseID)
);

alter table t_carLease comment '车位租赁表';

/*==============================================================*/
/* Table: t_complain                                            */
/*==============================================================*/
create table t_complain
(
   pk_complainID        int not null comment '投诉表ID',
   f_complainInfo       varchar(255) comment '投诉信息',
   f_date               timestamp comment '投诉日期',
   f_adminCheckStatus   int comment '投诉状态(1代表投诉成功，2代表投诉失败)',
   f_complainRealName   varchar(32) comment '投诉人真实姓名',
   f_complainPhone      varchar(16) comment '投诉人电话',
   f_complainIdentityNum varchar(24) comment '投诉人身份证号码',
   f_beComplainRealName varchar(32) comment '被投诉人真实姓名',
   f_beComplainPhone    varchar(16) comment '被投诉人电话',
   f_beComplainIdentityNum varchar(24) comment '被投诉人身份证号',
   fk_carLeaseID        int,
   primary key (pk_complainID)
);

alter table t_complain comment '投诉表';

/*==============================================================*/
/* Table: t_personalCar                                         */
/*==============================================================*/
create table t_personalCar
(
   pk_carID             int not null auto_increment comment '车位ID',
   f_carPropertyNum     varchar(48) comment '车位产权编号',
   f_carAddress         varchar(64) comment '车位地址',
   f_carNumber          varchar(16) comment '车位编号',
   f_propertyCopy       varchar(64) comment '产权复印件',
   f_realName           varchar(32) comment '车主真实姓名',
   f_phone              varchar(16) comment '电话号码',
   f_identityNum        varchar(24) comment '身份证号',
   primary key (pk_carID)
);

alter table t_personalCar comment '个人车位表';

/*==============================================================*/
/* Table: t_personalContract                                    */
/*==============================================================*/
create table t_personalContract
(
   pk_contractID        int not null auto_increment comment '合同ID',
   f_contractNumber     varchar(32) comment '合同编号',
   f_buyStatus          int comment '买方签约状态(1代表已签约，0代表未签约)',
   f_sellStatus         int comment '卖方签约状态（1代表已签约，0代表未签约）',
   f_adminCheckStatus   int comment '管理员审核状态（1代表已审核，0代表未审核）',
   f_dealPrice          float comment '成交价格',
   f_implementDate      timestamp comment '合同生效日期',
   f_buyRealName        varchar(32) comment '买方真实姓名',
   f_buyPhone           varchar(16) comment '买方电话号码',
   f_buyIdentityNum     varchar(24) comment '买方身份证',
   f_sellRealName       varchar(32) comment '卖方真实姓名',
   f_sellPhone          varchar(16) comment '卖方电话号码',
   f_sellIdentityNum    varchar(24) comment '卖方身份证',
   fk_carLeaseID        int,
   primary key (pk_contractID)
);

alter table t_personalContract comment '个人合约';

/*==============================================================*/
/* Table: t_reserve                                             */
/*==============================================================*/
create table t_reserve
(
   pk_reserveID         int not null auto_increment comment '预定ID',
   f_leaveMessage       varchar(255) comment '留言信息',
   f_date               timestamp comment '留言日期',
   f_reserveStatus      int comment '预定状态（1代表预定成功，2代表正在预定，3代表预定失败）',
   f_ownerRealName      varchar(32) comment '车主真实姓名',
   f_ownerPhone         varchar(16) comment '车主手机号',
   f_ownerIdentityNum   varchar(24) comment '车主身份证号',
   f_reserveRealName    varchar(32) comment '预定人真实姓名',
   f_reservePhone       varchar(16) comment '预定人电话号码',
   f_reserveIdentityNum varchar(24) comment '预定人身份证号',
   fk_carLeaseID        int,
   primary key (pk_reserveID)
);

alter table t_reserve comment '预定车位信息表';

