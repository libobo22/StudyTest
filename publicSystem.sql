/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2020/5/7 17:14:40                            */
/*==============================================================*/


drop table if exists t_admin;

drop table if exists t_bill;

drop table if exists t_dealRecord;

drop table if exists t_log;

drop table if exists t_login;

drop table if exists t_login_role;

drop table if exists t_message;

drop table if exists t_permission;

drop table if exists t_personalID;

drop table if exists t_role;

drop table if exists t_role_permission;

/*==============================================================*/
/* Table: t_admin                                               */
/*==============================================================*/
create table t_admin
(
   pk_adminID           int not null auto_increment comment '管理员ID',
   f_jobNumber          varchar(16) comment '工号',
   f_phone              varchar(16) comment '电话号码',
   f_realName           varchar(32) comment '真实姓名',
   fk_loginID           int,
   primary key (pk_adminID)
);

alter table t_admin comment '管理员表';

/*==============================================================*/
/* Table: t_bill                                                */
/*==============================================================*/
create table t_bill
(
   pk_billID            int not null auto_increment comment '账单表ID',
   f_dealType           varchar(16) comment '交易记录',
   f_expend             float comment '支出',
   f_income             float comment '收入',
   f_dealRemark         varchar(64) comment '交易备注',
   f_dealDate           timestamp comment '交易日期',
   fk_dealRecordID      int,
   fk_personalID        int,
   primary key (pk_billID)
);

alter table t_bill comment '账单表';

/*==============================================================*/
/* Table: t_dealRecord                                          */
/*==============================================================*/
create table t_dealRecord
(
   pk_dealRecordID      int not null auto_increment comment '成交记录ID',
   f_date               timestamp comment '成交时间',
   f_type               int comment '成交类型(1代表租出，2代表租入，3代表购买，4代表出售)',
   f_buyRealName        varchar(32) comment '买方/租户名',
   f_buyPhone           varchar(16) comment '买方电话',
   f_buyEmail           varchar(48) comment '买方邮件地址',
   f_sellRealName       varchar(32) comment '卖方/出租用户真实姓名',
   f_sellPhone          varchar(16) comment '卖方电话',
   f_sellEmail          varchar(32) comment '卖方邮件地址',
   f_carPropertyNum     varchar(48) comment '车位产权证编号',
   f_carAddress         varchar(64) comment '车位地址',
   f_carNumber          varchar(16) comment '车位编号',
   f_dealRecordNum      varchar(32),
   primary key (pk_dealRecordID)
);

alter table t_dealRecord comment '成交记录';

/*==============================================================*/
/* Table: t_log                                                 */
/*==============================================================*/
create table t_log
(
   pk_logID             int not null auto_increment comment '日志ID',
   f_logType            int comment '日志类型（1表示前台，2表示后台）',
   f_operationType      int comment '操作类型（1代表登录，2代表操作）',
   f_logInfo            varchar(64) comment '日志描述',
   f_datetime           timestamp comment '时间',
   f_loginName          varchar(32) comment '登录名',
   f_ip                 varchar(32) comment 'ip地址',
   primary key (pk_logID)
);

alter table t_log comment '日志表';

/*==============================================================*/
/* Table: t_login                                               */
/*==============================================================*/
create table t_login
(
   pk_loginID           int not null auto_increment comment '登录ID',
   f_loginName          varchar(48) comment '登录名',
   f_loginPwd           varchar(48) comment '登录密码',
   f_status             int comment '1代表正常，0代表不可用',
   primary key (pk_loginID)
);

alter table t_login comment '登录表';

/*==============================================================*/
/* Table: t_login_role                                          */
/*==============================================================*/
create table t_login_role
(
   pk_loginRoleID       int not null auto_increment comment 'ID',
   fk_loginID           int comment '登录外键',
   fk_roleID            int comment '角色外键',
   primary key (pk_loginRoleID)
);

alter table t_login_role comment '登录与角色的中间表';

/*==============================================================*/
/* Table: t_message                                             */
/*==============================================================*/
create table t_message
(
   pk_messageID         int not null auto_increment comment '消息ID',
   f_datetime           timestamp comment '消息时间',
   f_messageType        int comment '消息类型(1表示交易，2表示通知)',
   f_status             int comment '消息状态（1-已读、2-未读）',
   f_content            varchar(255) comment '消息内容',
   fk_loginID           int,
   primary key (pk_messageID)
);

alter table t_message comment '消息表';

/*==============================================================*/
/* Table: t_permission                                          */
/*==============================================================*/
create table t_permission
(
   pk_permissionID      int not null auto_increment comment '权限ID',
   f_permissionName     varchar(32) comment '权限名',
   f_url                varchar(128) comment '资源路径',
   primary key (pk_permissionID)
);

alter table t_permission comment '权限表';

/*==============================================================*/
/* Table: t_personalID                                          */
/*==============================================================*/
create table t_personalID
(
   pk_personalID        int not null auto_increment comment '个人信息ID',
   f_realName           varchar(32) comment '真实姓名',
   f_homeAddress        varchar(48) comment '家庭地址',
   f_phone              varchar(16) comment '手机号码',
   f_identityNum        varchar(24) comment '身份证号',
   f_job                varchar(16) comment '职业',
   f_email              varchar(48) comment '邮箱地址',
   f_dealNum            int comment '成交次数',
   f_complainNum        int comment '被投诉次数',
   fk_loginID           int,
   primary key (pk_personalID)
);

alter table t_personalID comment '个人信息表';

/*==============================================================*/
/* Table: t_role                                                */
/*==============================================================*/
create table t_role
(
   pk_roleID            int not null auto_increment comment '角色ID',
   f_roleName           varchar(32) comment '角色名',
   f_roleInfo           varchar(32) comment '角色描述',
   primary key (pk_roleID)
);

alter table t_role comment '角色表';

/*==============================================================*/
/* Table: t_role_permission                                     */
/*==============================================================*/
create table t_role_permission
(
   pk_rolePermissionID  int not null auto_increment comment 'ID',
   fk_roleID            int comment '角色外键',
   fk_permissionID      int comment '权限外键',
   primary key (pk_rolePermissionID)
);

alter table t_role_permission comment '角色与权限中间表';

alter table t_login_role add constraint FK_Reference_1 foreign key (fk_loginID)
      references t_login (pk_loginID) on delete restrict on update restrict;

alter table t_login_role add constraint FK_Reference_2 foreign key (fk_roleID)
      references t_role (pk_roleID) on delete restrict on update restrict;

alter table t_role_permission add constraint FK_Reference_3 foreign key (fk_roleID)
      references t_role (pk_roleID) on delete restrict on update restrict;

alter table t_role_permission add constraint FK_Reference_4 foreign key (fk_permissionID)
      references t_permission (pk_permissionID) on delete restrict on update restrict;

