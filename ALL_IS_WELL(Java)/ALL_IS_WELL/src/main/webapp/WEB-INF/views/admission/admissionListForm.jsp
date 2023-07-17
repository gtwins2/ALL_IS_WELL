<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입원 기록</title>
<style>
   
   #wrap{
      width: 1920px;
      height: 1500px;
      display: grid;
      grid-template-columns: 300px 1620px;
   }
   
   .title-area {
            display: flex;
            align-items: center;
           
        }

          .search-area {
            display: flex;
            align-items: center;
            margin-left: 50px;
        }

        

        .search-area input[type="text"] {
            padding: 5px;
            margin-right: 20px;
            width: 500px;
            height: 30px;
            border: 1px solid gray;
            border-radius: 10px;
        }

        .category-area {
            display: flex;
            align-items: center;
            
        }

        .category-area label {
            margin-right: 5px;
        }

        .category-area select {
            padding: 5px;
            border-radius: 10px;
            border: 1px solid gray;
            height: 40px;
        }

        .category-icon {
            margin-right: 5px;
            color: #555;
        }

        .category-icon::before {
            font-family: "Font Awesome 5 Free";
            content: "\f0a5";
            font-weight: 900;
        }

        #search-icon {
            color: gray;
        }

        #title {
            margin-left: 500px;
            font-size: 35px;

        }

       
        .list-area {
  margin: 0 auto;
  margin-top: 20px;
  width: 1200px;
  height: 1000px;
  background: #FFFFFF;
  border: 1px solid #C4C4C4;
  box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
  border-radius: 20px;
  overflow: auto;
}

.list-area table {
  width: 100%;
  border-collapse: collapse;
}

.list-area th,
.list-area td {
  padding: 33px;
  border-bottom: 1px solid #ddd;
  text-align: center;
}

.list-area th {
  font-size: 25px;
  font-weight: normal;

}

.list-area th:first-child,
.list-area td:first-child {
  width: 20%;
}

.list-area th:last-child,
.list-area td:last-child {
  width: 30%;
}


        .number-area {
            text-align: center;
        }

        .number-area a {
    display: inline-block;
    margin: 5px;
    padding: 8px 12px;
    text-decoration: none;
    border:none;
    color: inherit;
    font-size: 25px;
}

#previous {
    color: #5A8CF2;
}

#after {
    color: #5A8CF2;
}
.number-area a:hover {
    color: #5A8CF2;
}

</style>
</head>
<body>
   
   <header>
      <%@include file="/WEB-INF/views/common/member/header.jsp" %>
   </header>
   
   <main id="wrap">
      <%@ include file="/WEB-INF/views/common/member/side-bar.jsp" %>
		
		
		 <div class="title-area">
            <div id="title">입원기록</div>

            <form action="" class="search-area">
                <label for="search" class="category-area">
                    <select name="search" id="search">
                        <option value="writer">환자명</option>
                        <option value="title">제목</option>
                    </select>
                    

                </label>
                <input type="text" id="search-input">
               <a href="" id="search-icon"><i class="fa-solid fa-magnifying-glass"></i></a>
            </form>
        </div>
        <br>
        <br>

        <hr>
        <br>
        <br>
        <br>

        <div class="list-area">
            <table>
                <th>환자명</th>
                <th>입원일</th>
                <th>퇴원일</th>
                <th>사유</th>

                <tr>
                    <td>송준섭</td>
                    <td>2023-07-03</td>
                    <td>2023-07-03</td>
                    <td>디스크 수술</td>
                </tr>

                <tr>
                    <td>송준섭</td>
                    <td>2023-07-03</td>
                    <td>2023-07-03</td>
                    <td>디스크 수술</td>
                </tr>

                <tr>
                    <td>송준섭</td>
                    <td>2023-07-03</td>
                    <td>2023-07-03</td>
                    <td>디스크 수술</td>
                </tr>

                <tr>
                    <td>송준섭</td>
                    <td>2023-07-03</td>
                    <td>2023-07-03</td>
                    <td>디스크 수술</td>
                </tr>

                <tr>
                    <td>송준섭</td>
                    <td>2023-07-03</td>
                    <td>2023-07-03</td>
                    <td>디스크 수술</td>
                </tr>

                <tr>
                    <td>송준섭</td>
                    <td>2023-07-03</td>
                    <td>2023-07-03</td>
                    <td>디스크 수술</td>
                </tr>

                <tr>
                    <td>송준섭</td>
                    <td>2023-07-03</td>
                    <td>2023-07-03</td>
                    <td>디스크 수술</td>
                </tr>

                <tr>
                    <td>송준섭</td>
                    <td>2023-07-03</td>
                    <td>2023-07-03</td>
                    <td>디스크 수술</td>
                </tr>

                <tr>
                    <td>송준섭</td>
                    <td>2023-07-03</td>
                    <td>2023-07-03</td>
                    <td>디스크 수술</td>
                </tr>

                <tr>
                    <td>송준섭</td>
                    <td>2023-07-03</td>
                    <td>2023-07-03</td>
                    <td>디스크 수술</td>
                </tr>




                

            </table>
        </div>
        <br>
        <br>
        <br>
        <div class="number-area">
            <a id="previous" href=""> < </a>
            <a href=""> 1 </a>
            <a href=""> 2 </a>
            <a href=""> 3 </a>
            <a href=""> 4 </a>
            <a href=""> 5 </a>
            <a id="after" href=""> > </a>
        </div>
   </main>

   <footer>
      <%@ include file="/WEB-INF/views/common/member/footer.jsp" %>
   </footer>
</body>
</html>
