SELECT name, DECODE(substr(birthdate,4,5),'12/10','�������� �մϴ�','�����̾ƴմϴ�')
from student;

select name,substr(birthdate,4,5)
from student;

select name, DECODE(substr(TO_CHAR(birthdate,'mmdd'),1),'1210','���������մϴ�','�����̾ƴմϴ�')
from student;

