PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE searchIndex(id INTEGER PRIMARY KEY, name TEXT, type TEXT, path TEXT);
INSERT INTO "searchIndex" VALUES(1,'bond','Resource','resource_types.html#bond');
INSERT INTO "searchIndex" VALUES(2,'bridge','Resource','resource_types.html#bridge');
INSERT INTO "searchIndex" VALUES(3,'cgroup','Resource','resource_types.html#cgroup');
INSERT INTO "searchIndex" VALUES(4,'command','Resource','resource_types.html#command');
INSERT INTO "searchIndex" VALUES(5,'cron','Resource','resource_types.html#cron');
INSERT INTO "searchIndex" VALUES(6,'default_gateway','Resource','resource_types.html#default_gateway');
INSERT INTO "searchIndex" VALUES(7,'file','Resource','resource_types.html#file');
INSERT INTO "searchIndex" VALUES(8,'group','Resource','resource_types.html#group');
INSERT INTO "searchIndex" VALUES(9,'host','Resource','resource_types.html#host');
INSERT INTO "searchIndex" VALUES(10,'iis_app_pool','Resource','resource_types.html#iis_app_pool');
INSERT INTO "searchIndex" VALUES(11,'iis_website','Resource','resource_types.html#iis_website');
INSERT INTO "searchIndex" VALUES(12,'interface','Resource','resource_types.html#interface');
INSERT INTO "searchIndex" VALUES(13,'ipfilter','Resource','resource_types.html#ipfilter');
INSERT INTO "searchIndex" VALUES(14,'ipnat','Resource','resource_types.html#ipnat');
INSERT INTO "searchIndex" VALUES(15,'iptables','Resource','resource_types.html#iptables');
INSERT INTO "searchIndex" VALUES(16,'kernel_module','Resource','resource_types.html#kernel_module');
INSERT INTO "searchIndex" VALUES(17,'linux_kernel_parameter','Resource','resource_types.html#linux_kernel_parameter');
INSERT INTO "searchIndex" VALUES(18,'lxc','Resource','resource_types.html#lxc');
INSERT INTO "searchIndex" VALUES(19,'mail_alias','Resource','resource_types.html#mail_alias');
INSERT INTO "searchIndex" VALUES(20,'package','Resource','resource_types.html#package');
INSERT INTO "searchIndex" VALUES(21,'php_config','Resource','resource_types.html#php_config');
INSERT INTO "searchIndex" VALUES(22,'port','Resource','resource_types.html#port');
INSERT INTO "searchIndex" VALUES(23,'ppa','Resource','resource_types.html#ppa');
INSERT INTO "searchIndex" VALUES(24,'process','Resource','resource_types.html#process');
INSERT INTO "searchIndex" VALUES(25,'routing_table','Resource','resource_types.html#routing_table');
INSERT INTO "searchIndex" VALUES(26,'selinux','Resource','resource_types.html#selinux');
INSERT INTO "searchIndex" VALUES(27,'service','Resource','resource_types.html#service');
INSERT INTO "searchIndex" VALUES(28,'user','Resource','resource_types.html#user');
INSERT INTO "searchIndex" VALUES(29,'windows_feature','Resource','resource_types.html#windows_feature');
INSERT INTO "searchIndex" VALUES(30,'windows_registry_key','Resource','resource_types.html#windows_registry_key');
INSERT INTO "searchIndex" VALUES(31,'yumrepo','Resource','resource_types.html#yumrepo');
INSERT INTO "searchIndex" VALUES(32,'zfs','Resource','resource_types.html#zfs');
CREATE UNIQUE INDEX anchor ON searchIndex (name, type, path);
COMMIT;