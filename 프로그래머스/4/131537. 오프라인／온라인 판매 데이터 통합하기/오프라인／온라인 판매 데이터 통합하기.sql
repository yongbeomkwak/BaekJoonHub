SELECT DATE_Format(SALES_DATE, '%Y-%m-%d') as SALES_DATE, -- '2022-05-24'형식으로 포맷
           PRODUCT_ID, -- 제품 ID
           USER_ID,  -- 회원 ID
           SALES_AMOUNT -- 판매량
        FROM ONLINE_SALE -- 온라인 고객
        WHERE Month(SALES_DATE) = 3
union -- 쿼리의 결과를 합치고, 중복된 ROW는 제거한다. (오프라인/온라인의 쿼리 결과를 합친다는 의미)
    SELECT DATE_Format(SALES_DATE, '%Y-%m-%d') as SALES_DATE, -- '2022-05-24'형식으로 포맷
           PRODUCT_ID, 
           Null as USER_ID, -- 오프라인 고객은 USER_ID가 없으므로 NULL값으로 채우고 
           SALES_AMOUNT -- 판매량
        FROM OFFLINE_SALE -- 오프라인
        WHERE Month(SALES_DATE) = 3 -- 판매일자가 3월인 모든 데이터(오프라인&온라인)를 출력
ORDER BY SALES_DATE, PRODUCT_ID, USER_ID -- 다 오름차순 정렬