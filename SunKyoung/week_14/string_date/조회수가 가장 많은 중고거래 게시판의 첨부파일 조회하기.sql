-- 코드를 입력하세요
SELECT CONCAT('/home/grep/src/',BOARD_ID,'/',FILE_ID, FILE_NAME, FILE_EXT) FILE_PATH
# 첨부파일 경로는 FILE_ID 기준으로 내림차순 정렬
FROM (SELECT * FROM USED_GOODS_FILE ORDER BY FILE_ID DESC) AS USF
# 조회수가 가장 높은 게시물은 딱 하나 뿐이므로 그것과 같은 BOARD_ID를 찾음
WHERE BOARD_ID = (
    SELECT BOARD_ID FROM USED_GOODS_BOARD
    WHERE VIEWS = (SELECT MAX(VIEWS) FROM USED_GOODS_BOARD)
);
