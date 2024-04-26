-- 코드를 작성해주세요
SELECT
    YEAR(A.DIFFERENTIATION_DATE) AS YEAR
    , (B.SIZE - A.SIZE_OF_COLONY) AS YEAR_DEV           -- 최대크기 - 해당크기
    , A.ID
FROM
    ECOLI_DATA AS A
    , (
        SELECT
            YEAR(DIFFERENTIATION_DATE) AS YEAR
            , MAX(SIZE_OF_COLONY) AS SIZE
        FROM
            ECOLI_DATA
        GROUP BY
            YEAR
      ) AS B   -- (년도, 년도 별 최대 크기) 쿼리
WHERE
    YEAR(A.DIFFERENTIATION_DATE) = B.YEAR  -- 년도별 JOIN 
ORDER BY
    YEAR, YEAR_DEV     -- 년도 오름차순 및 편차 오름차순