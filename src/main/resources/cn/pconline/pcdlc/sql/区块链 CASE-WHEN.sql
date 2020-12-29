需求: 导出标签id为11和21的所有软件, 包括电脑安卓和苹果
PS: 11=区块链应用, 21=区块链游戏

SELECT fm.dl_master_id ID, fm.`name` 软件名称, CASE fm.dl_channel_id
        WHEN 1 THEN
                '电脑'
        WHEN 1481 THEN
                '安卓'
        WHEN 876 THEN
                '苹果'
        ELSE
                ''
END 平台, mi.week_count 周下载量
FROM dl_front_master fm, dl_master_info mi, dl_master_label_relation lr
WHERE fm.dl_master_id = mi.dl_master_id
AND fm.`status` = 1
AND fm.dl_channel_id IN (1, 1481, 876)
AND fm.dl_master_id = lr.dl_master_id
AND lr.dl_label_id IN (11, 21)