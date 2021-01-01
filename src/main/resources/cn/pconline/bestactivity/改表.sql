ALTER TABLE `pcbest_account_ecard` DROP COLUMN `wx_id`;
ALTER TABLE `pcbest_account_ecard` DROP COLUMN `name`;
ALTER TABLE `pcbest_account_ecard` DROP COLUMN `head_icon`;

ALTER TABLE `pcbest_account_ecard_share` DROP COLUMN `share_id`;
ALTER TABLE `pcbest_account_ecard_share` DROP COLUMN `help_id`;

ALTER TABLE `pcbest_account_ecard_share` ADD COLUMN `share_pid` bigint(11) DEFAULT NULL COMMENT '分享方 - 通行证ID' AFTER `id`;
ALTER TABLE `pcbest_account_ecard_share` ADD COLUMN `help_pid` bigint(11) DEFAULT NULL COMMENT '助力方 - 通行证ID' AFTER `id`;


1.备份 pcbest_account_ecard 和 pcbest_account_ecard_share

2.截断 pcbest_account_ecard 和 pcbest_account_ecard_share

3.执行上面语句