<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name = "viewport" content="width=device-width, initial-scale = 1">
<title>2019. 12. 16. 오전 9:15:08</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
</style>
</head>
<body>
<!-- http://taeyo.net/Columns/View.aspx?SEQ=100&PSEQ=9&IDX=1
   4.[계층형 게시판(답변형,쓰레드형 게시판)]
   하나의 글에 트리 형태로 다른 사람이 답변을 달 수 있는 구조
   
   5.계층형게시판의 로직 이해(그룹칼럼/그룹순서/깊이 칼럼추가)
    1) ref / step / depth  3가지 칼럼 추가
    -게시글을 하나의 그룹으로 묶어줄 칼럼이 필요
    -그룹안에서의 순서를 나타내는 칼럼 필요
    -깊이를 나타내는 칼럽이 추가(새글/답글/답글의답글 등)
    
    
    
    [글목록페이지] update 부모게시글보다 step 큰 것들은 1씩 증가      order ref desc,step asc         
3       세번째올라온글           3 /  0  / 0    
2      두번째올라온글         2 /  0  / 0    
   6    ㄴ2-답글            2 /  1  / 1
   5   ㄴ 6-답글            2 /  2  / 2
   4    ㄴ2-답글            2 /  3  / 1
   5   ㄴ 4-답글            2 /  4  / 2
1        첫번째올라온글         1 /  0  / 0    

[DB저장]
seq    subject            ref/ step /depth
1        첫번째올라온글          1 /  0   /  0
            ref:새글이냐답글이냐(부모게시글의 seq넘어오면 답글아니면 새글)
               seq값과 동일하게 줌
                  step:0 그그룹에서 첫번째글
                        depth:0 들여쓰기 필요없음(새글이니까)
2      두번째올라온글         2 /  0  / 0
3       세번째올라온글           3 /  0  / 0
   부모게시글(seq 2)    부모그룹(ref==)  step+=1    depth+=1
4    2-답글               2 /      3      /   1
5    4-답글               2 /      4      /   2
6    2-답글               2 /      1       /   1
7    6-답글               2 /      2       /   2


글쓰기 2가지 종류
새글이냐 답글이냐 ? 구별하는 방법은 부모글의 정보가 넘어는가 안오는가?

1) 새글
insert  ref(==seq)/step(+1)/depth(+1)

2) 답글
update 부모게시글보다 step 큰 것들은 1씩 증가 
insert  ref(==seq)/step(+1)/depth(+1)
    
     2) thread(ref+step) / depth  2가지 칼럼 추가
     새글 seq(1)     2*1000 /   0
     답글                  부모글의 thread값/ depth
      ㄱ.  update  where  같은 그룹 1001<= thread-1 <1998
      ㄴ.  insert   1988-1 / depth +1 
     -그룹 (1~1000) 
     -같은 그룹 부모글 보다 thread가 작은것들은 depth 1감소
[목록출력] order by thread desc
3  새글               3000       /     0 
2  새글               2000       /     0 
   4  ㄴ2-답글         1998      /     1
1  새글               1000       /     0
 

[DB 저장]
가정) 댓글 1000개가 안넘는다 기준 thread   /    depth
1  새글               1000       /     0 
2  새글               2000       /     0 
3  새글               3000       /     0 
               부모글thread-1   /   depth+1
4 2-답글               1998      /    1
-->

<a href="/jspPro/days20/replyboard/list.do">/jspPro/days20/replyboard/list.do</a>





<script>
$(function(){});
</script>
</body>
</html>