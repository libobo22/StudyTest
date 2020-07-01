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
   pk_adminID           int not null auto_increment comment '����ԱID',
   f_jobNumber          varchar(16) comment '����',
   f_phone              varchar(16) comment '�绰����',
   f_realName           varchar(32) comment '��ʵ����',
   fk_loginID           int,
   primary key (pk_adminID)
);

alter table t_admin comment '����Ա��';

/*==============================================================*/
/* Table: t_bill                                                */
/*==============================================================*/
create table t_bill
(
   pk_billID            int not null auto_increment comment '�˵���ID',
   f_dealType           varchar(16) comment '���׼�¼',
   f_expend             float comment '֧��',
   f_income             float comment '����',
   f_dealRemark         varchar(64) comment '���ױ�ע',
   f_dealDate           timestamp comment '��������',
   fk_dealRecordID      int,
   fk_personalID        int,
   primary key (pk_billID)
);

alter table t_bill comment '�˵���';

/*==============================================================*/
/* Table: t_dealRecord                                          */
/*==============================================================*/
create table t_dealRecord
(
   pk_dealRecordID      int not null auto_increment comment '�ɽ���¼ID',
   f_date               timestamp comment '�ɽ�ʱ��',
   f_type               int comment '�ɽ�����(1���������2�������룬3������4�������)',
   f_buyRealName        varchar(32) comment '��/�⻧��',
   f_buyPhone           varchar(16) comment '�򷽵绰',
   f_buyEmail           varchar(48) comment '���ʼ���ַ',
   f_sellRealName       varchar(32) comment '����/�����û���ʵ����',
   f_sellPhone          varchar(16) comment '�����绰',
   f_sellEmail          varchar(32) comment '�����ʼ���ַ',
   f_carPropertyNum     varchar(48) comment '��λ��Ȩ֤���',
   f_carAddress         varchar(64) comment '��λ��ַ',
   f_carNumber          varchar(16) comment '��λ���',
   f_dealRecordNum      varchar(32),
   primary key (pk_dealRecordID)
);

alter table t_dealRecord comment '�ɽ���¼';

/*==============================================================*/
/* Table: t_log                                                 */
/*==============================================================*/
create table t_log
(
   pk_logID             int not null auto_increment comment '��־ID',
   f_logType            int comment '��־���ͣ�1��ʾǰ̨��2��ʾ��̨��',
   f_operationType      int comment '�������ͣ�1�����¼��2���������',
   f_logInfo            varchar(64) comment '��־����',
   f_datetime           timestamp comment 'ʱ��',
   f_loginName          varchar(32) comment '��¼��',
   f_ip                 varchar(32) comment 'ip��ַ',
   primary key (pk_logID)
);

alter table t_log comment '��־��';

/*==============================================================*/
/* Table: t_login                                               */
/*==============================================================*/
create table t_login
(
   pk_loginID           int not null auto_increment comment '��¼ID',
   f_loginName          varchar(48) comment '��¼��',
   f_loginPwd           varchar(48) comment '��¼����',
   f_status             int comment '1����������0��������',
   primary key (pk_loginID)
);

alter table t_login comment '��¼��';

/*==============================================================*/
/* Table: t_login_role                                          */
/*==============================================================*/
create table t_login_role
(
   pk_loginRoleID       int not null auto_increment comment 'ID',
   fk_loginID           int comment '��¼���',
   fk_roleID            int comment '��ɫ���',
   primary key (pk_loginRoleID)
);

alter table t_login_role comment '��¼���ɫ���м��';

/*==============================================================*/
/* Table: t_message                                             */
/*==============================================================*/
create table t_message
(
   pk_messageID         int not null auto_increment comment '��ϢID',
   f_datetime           timestamp comment '��Ϣʱ��',
   f_messageType        int comment '��Ϣ����(1��ʾ���ף�2��ʾ֪ͨ)',
   f_status             int comment '��Ϣ״̬��1-�Ѷ���2-δ����',
   f_content            varchar(255) comment '��Ϣ����',
   fk_loginID           int,
   primary key (pk_messageID)
);

alter table t_message comment '��Ϣ��';

/*==============================================================*/
/* Table: t_permission                                          */
/*==============================================================*/
create table t_permission
(
   pk_permissionID      int not null auto_increment comment 'Ȩ��ID',
   f_permissionName     varchar(32) comment 'Ȩ����',
   f_url                varchar(128) comment '��Դ·��',
   primary key (pk_permissionID)
);

alter table t_permission comment 'Ȩ�ޱ�';

/*==============================================================*/
/* Table: t_personalID                                          */
/*==============================================================*/
create table t_personalID
(
   pk_personalID        int not null auto_increment comment '������ϢID',
   f_realName           varchar(32) comment '��ʵ����',
   f_homeAddress        varchar(48) comment '��ͥ��ַ',
   f_phone              varchar(16) comment '�ֻ�����',
   f_identityNum        varchar(24) comment '���֤��',
   f_job                varchar(16) comment 'ְҵ',
   f_email              varchar(48) comment '�����ַ',
   f_dealNum            int comment '�ɽ�����',
   f_complainNum        int comment '��Ͷ�ߴ���',
   fk_loginID           int,
   primary key (pk_personalID)
);

alter table t_personalID comment '������Ϣ��';

/*==============================================================*/
/* Table: t_role                                                */
/*==============================================================*/
create table t_role
(
   pk_roleID            int not null auto_increment comment '��ɫID',
   f_roleName           varchar(32) comment '��ɫ��',
   f_roleInfo           varchar(32) comment '��ɫ����',
   primary key (pk_roleID)
);

alter table t_role comment '��ɫ��';

/*==============================================================*/
/* Table: t_role_permission                                     */
/*==============================================================*/
create table t_role_permission
(
   pk_rolePermissionID  int not null auto_increment comment 'ID',
   fk_roleID            int comment '��ɫ���',
   fk_permissionID      int comment 'Ȩ�����',
   primary key (pk_rolePermissionID)
);

alter table t_role_permission comment '��ɫ��Ȩ���м��';

alter table t_login_role add constraint FK_Reference_1 foreign key (fk_loginID)
      references t_login (pk_loginID) on delete restrict on update restrict;

alter table t_login_role add constraint FK_Reference_2 foreign key (fk_roleID)
      references t_role (pk_roleID) on delete restrict on update restrict;

alter table t_role_permission add constraint FK_Reference_3 foreign key (fk_roleID)
      references t_role (pk_roleID) on delete restrict on update restrict;

alter table t_role_permission add constraint FK_Reference_4 foreign key (fk_permissionID)
      references t_permission (pk_permissionID) on delete restrict on update restrict;

