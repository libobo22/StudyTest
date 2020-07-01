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
   f_leaseStatus        int comment '1��������⡣2���������',
   fk_carID             int,
   primary key (pk_carLeaseID)
);

alter table t_carLease comment '��λ���ޱ�';

/*==============================================================*/
/* Table: t_complain                                            */
/*==============================================================*/
create table t_complain
(
   pk_complainID        int not null comment 'Ͷ�߱�ID',
   f_complainInfo       varchar(255) comment 'Ͷ����Ϣ',
   f_date               timestamp comment 'Ͷ������',
   f_adminCheckStatus   int comment 'Ͷ��״̬(1����Ͷ�߳ɹ���2����Ͷ��ʧ��)',
   f_complainRealName   varchar(32) comment 'Ͷ������ʵ����',
   f_complainPhone      varchar(16) comment 'Ͷ���˵绰',
   f_complainIdentityNum varchar(24) comment 'Ͷ�������֤����',
   f_beComplainRealName varchar(32) comment '��Ͷ������ʵ����',
   f_beComplainPhone    varchar(16) comment '��Ͷ���˵绰',
   f_beComplainIdentityNum varchar(24) comment '��Ͷ�������֤��',
   fk_carLeaseID        int,
   primary key (pk_complainID)
);

alter table t_complain comment 'Ͷ�߱�';

/*==============================================================*/
/* Table: t_personalCar                                         */
/*==============================================================*/
create table t_personalCar
(
   pk_carID             int not null auto_increment comment '��λID',
   f_carPropertyNum     varchar(48) comment '��λ��Ȩ���',
   f_carAddress         varchar(64) comment '��λ��ַ',
   f_carNumber          varchar(16) comment '��λ���',
   f_propertyCopy       varchar(64) comment '��Ȩ��ӡ��',
   f_realName           varchar(32) comment '������ʵ����',
   f_phone              varchar(16) comment '�绰����',
   f_identityNum        varchar(24) comment '���֤��',
   primary key (pk_carID)
);

alter table t_personalCar comment '���˳�λ��';

/*==============================================================*/
/* Table: t_personalContract                                    */
/*==============================================================*/
create table t_personalContract
(
   pk_contractID        int not null auto_increment comment '��ͬID',
   f_contractNumber     varchar(32) comment '��ͬ���',
   f_buyStatus          int comment '��ǩԼ״̬(1������ǩԼ��0����δǩԼ)',
   f_sellStatus         int comment '����ǩԼ״̬��1������ǩԼ��0����δǩԼ��',
   f_adminCheckStatus   int comment '����Ա���״̬��1��������ˣ�0����δ��ˣ�',
   f_dealPrice          float comment '�ɽ��۸�',
   f_implementDate      timestamp comment '��ͬ��Ч����',
   f_buyRealName        varchar(32) comment '����ʵ����',
   f_buyPhone           varchar(16) comment '�򷽵绰����',
   f_buyIdentityNum     varchar(24) comment '�����֤',
   f_sellRealName       varchar(32) comment '������ʵ����',
   f_sellPhone          varchar(16) comment '�����绰����',
   f_sellIdentityNum    varchar(24) comment '�������֤',
   fk_carLeaseID        int,
   primary key (pk_contractID)
);

alter table t_personalContract comment '���˺�Լ';

/*==============================================================*/
/* Table: t_reserve                                             */
/*==============================================================*/
create table t_reserve
(
   pk_reserveID         int not null auto_increment comment 'Ԥ��ID',
   f_leaveMessage       varchar(255) comment '������Ϣ',
   f_date               timestamp comment '��������',
   f_reserveStatus      int comment 'Ԥ��״̬��1����Ԥ���ɹ���2��������Ԥ����3����Ԥ��ʧ�ܣ�',
   f_ownerRealName      varchar(32) comment '������ʵ����',
   f_ownerPhone         varchar(16) comment '�����ֻ���',
   f_ownerIdentityNum   varchar(24) comment '�������֤��',
   f_reserveRealName    varchar(32) comment 'Ԥ������ʵ����',
   f_reservePhone       varchar(16) comment 'Ԥ���˵绰����',
   f_reserveIdentityNum varchar(24) comment 'Ԥ�������֤��',
   fk_carLeaseID        int,
   primary key (pk_reserveID)
);

alter table t_reserve comment 'Ԥ����λ��Ϣ��';

