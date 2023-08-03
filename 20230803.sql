SELECT name, DECODE(substr(birthdate,4,5),'12/10','생일축하 합니다','생일이아닙니다')
from student;

select name,substr(birthdate,4,5)
from student;

select name, DECODE(substr(TO_CHAR(birthdate,'mmdd'),1),'1210','생일축하합니다','생일이아닙니다')
from student;

