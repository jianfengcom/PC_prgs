SELECT * FROM pcbest_ecard WHERE grant_time > '2020-12-12 0:0:0'
SELECT * FROM pcbest_ecard WHERE passport_id = 49189886

SELECT * FROM pcbest_ecard WHERE ecard_number IN

UPDATE pcbest_ecard SET passport_id = NULL, `status` = 0, grant_time = NULL WHERE
ecard_number IN ('2578-34BF-08AF-C09B','DCE2-1ABF-69BE-6B93','E7E7-4157-2E75-CB64')


UPDATE pcbest_ecard SET passport_id = 10086, `status` = 1, grant_time = '2020-12-12 12:12:12' WHERE
ecard_number IN ('',)