# 小类
SELECT * FROM bm_category WHERE level = 2 and store_id = 17

# 手机小类
SELECT * FROM bm_category WHERE level = 2 AND name = '手机' // pc_id=20937 category_id=281 parent_id=187
SELECT * FROM bm_goods WHERE category_id = 281 AND name like '%苹果%'