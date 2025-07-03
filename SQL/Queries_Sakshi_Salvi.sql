--Retrieve distinct school languages

SELECT DISTINCT SCHOOL_LANGUAGE 
FROM ADDITIONAL_DETAILS;

--Retrieve all high schools sorted by name descending

SELECT SCHOOL_NAME 
FROM SCHOOL_DETAILS 
WHERE SCHOOL_LEVEL = 'Secondary' 
ORDER BY SCHOOL_NAME DESC;

--Find all schools that are in a specific region (e.g., 'North')

SELECT s.SCHOOL_NAME, b.REGION_NAME 
FROM SCHOOL_DETAILS s 
INNER JOIN BOARD_DETAILS b ON s.BOARD_ID = b.BOARD_ID 
WHERE b.REGION_NAME = 'North Region';

--Find schools that are not Secondary level

SELECT SCHOOL_NAME, SCHOOL_LEVEL 
FROM SCHOOL_DETAILS 
WHERE SCHOOL_LEVEL NOT IN ('Secondary');

--Find the number of schools per school type

SELECT SCHOOL_TYPE, COUNT(SCHOOL_TYPE) AS TOTAL_SCHOOLS 
FROM ADDITIONAL_DETAILS 
GROUP BY SCHOOL_TYPE;

--Find the number of schools under each board, but only show boards with more than 2 schools

SELECT b.BOARD_NAME, COUNT(s.SCHOOL_ID) AS SCHOOL_COUNT 
FROM SCHOOL_DETAILS s 
INNER JOIN BOARD_DETAILS b ON s.BOARD_ID = b.BOARD_ID 
GROUP BY b.BOARD_NAME 
HAVING COUNT(s.SCHOOL_ID) >= 2;

--Categorizing Schools

SELECT SCHOOL_NAME, SCHOOL_LEVEL, 
    CASE 
        WHEN SCHOOL_LEVEL = 'Elementary' THEN 'Primary'
        WHEN SCHOOL_LEVEL = 'Secondary' THEN 'High School'
        ELSE 'Other'
    END AS SCHOOL_CATEGORY
FROM SCHOOL_DETAILS;

--Create a View to Count Schools per Board

CREATE VIEW School_Count_By_Board AS
SELECT 
    b.BOARD_NAME,
    b.REGION_NAME,
    COUNT(s.SCHOOL_ID) AS TOTAL_SCHOOLS
FROM BOARD_DETAILS b
LEFT JOIN SCHOOL_DETAILS s ON b.BOARD_ID = s.BOARD_ID
GROUP BY b.BOARD_NAME, b.REGION_NAME
ORDER BY TOTAL_SCHOOLS DESC;

SELECT *
FROM School_Count_By_Board;













