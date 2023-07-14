<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>접수한 환자조회</title>
        <script src="https://kit.fontawesome.com/794ac64f16.js" crossorigin="anonymous"></script>
        <style>
            .main-area {
   				 width: 1200px;
    			height: 600px;
    			margin: auto;
    			margin-top: 20px; /* Add this line */
}

            .title-area {
                text-align: center;
                display: flex;
                flex-direction: row;
                justify-content: space-between;
            }

            #title {
                font-size: 35px;
            }

            .search-area {
                display: flex;
                align-items: center;
            }



            .search-area input[type="text"] {
                padding: 5px;
                margin-right: 20px;
                width: 300px;
                height: 30px;
                border: 1px solid gray;
                border-radius: 10px;
            }



            .list-area {
                margin-top: 20px;
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

            .list-area {
                margin-top: 20px;

                background: #FFFFFF;
                border: 1px solid #C4C4C4;
                box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
                border-radius: 20px;
            }

            .list-area table {
                border-collapse: collapse;
                width: 100%;


                width: 100%;

            }

            .list-area th,
            .list-area td {
                padding: 20px;
                border-bottom: 1px solid #ddd;
                text-align: center;
            }

            .list-area th {
                font-size: 20px;
                font-weight: normal;

            }

           


           
			
			
.list-area td:nth-child(4) {
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
}

            .number-area {
                text-align: center;
            }

            .number-area a {
                display: inline-block;
                margin: 5px;
                padding: 8px 12px;
                text-decoration: none;
                border: none;
                color: inherit;
                font-size: 20px;
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

            .list-area th input[type="checkbox"] {
                appearance: none;
                width: 20px;
                height: 20px;
                border: 2px solid #C4C4C4;
                border-radius: 3px;
                outline: none;
                vertical-align: middle;
                position: relative;
                top: 2px;
                cursor: pointer;
            }

            .list-area td input[type="checkbox"] {
                appearance: none;
                width: 20px;
                height: 20px;
                border: 2px solid #C4C4C4;
                border-radius: 3px;
                outline: none;
                vertical-align: middle;
                position: relative;
                top: 2px;
                cursor: pointer;
            }

            .list-area td input[type="checkbox"]:checked {
                background-color: lightgray;
                border-color: lightgray;
            }

            .list-area th input[type="checkbox"]:checked {
                background-color: lightgray;
                border-color: lightgray;
            }

            #content{
                display: grid;
                grid-template-columns: 300px 1620px;
                height:1500px
            }

#div01{
    font-family: 'Inter';
    font-style: normal;
    font-weight: 700;
    font-size: 20px;
    line-height: 30px;
    color: #FFFFFF;
    background: #5A8CF2;
}
        </style>
    </head>

    <body>
        <header>
            <%@ include file="/WEB-INF/views/common/member/header.jsp" %>
        </header>


        <div id="content">
            <div id="wrap">
                <%@ include file="/WEB-INF/views/common/member/side-bar.jsp" %>
            </div>


            <div class="main-area">
                <div class="title-area">
                    <span id="title">접수한 환자 조회</span>

                    <form action="" class="search-area">
                        <label for="search" class="category-area">
                            <select name="search" id="search">
                                <option value="writer">작성자</option>
                                <option value="title">제목</option>
                            </select>


                        </label>
                        <input type="text" id="search-input">
                        <a href="" id="search-icon"><i class="fa-solid fa-magnifying-glass"></i></a>
                    </form>

                    
                </div>
                <br>
                <br>
                <br>
                <br>
                <br>

                <div class="list-area">
                    <table>
                        <th>이름</th>
                        <th>생년월일</th>
                        <th>성별</th>
                        <th>이메일</th>
                        <th></th>

                        <tr>
                            <td>홍길동</td>
                            <td>2023-06-13</td>
                            <td>남</td>
                            <td>dnslrpdla@naver.com</td>
                            <td><div id="div01">진료</div></td>
                        </tr>

                        <tr>
                            <td>홍길동</td>
                            <td>2023-06-13</td>
                        </tr>

                        <tr>
                            <td>홍길동</td>
                            <td>2023-06-13</td>
                        </tr>

                        <tr>
                            <td>홍길동</td>
                            <td>2023-06-13</td>
                        </tr>

                        <tr>
                            <td>홍길동</td>
                            <td>2023-06-13</td>
                        </tr>

                        <tr>
                            <td>홍길동</td>
                            <td>2023-06-13</td>
                        </tr>

                        <tr>
                            <td>홍길동</td>
                            <td>2023-06-13</td>
                        </tr>

                        <tr>
                            <td>홍길동</td>
                            <td>2023-06-13</td>
                        </tr>

                        <tr>
                            <td>홍길동</td>
                            <td>2023-06-13</td>
                        </tr>

                        <tr>
                            <td>홍길동</td>
                            <td>2023-06-13</td>
                        </tr>




                    </table>
                </div>
                <br>
                <br>
                <br>

                <div class="number-area">
                    <a id="previous" href="">
                        < </a>
                            <a href=""> 1 </a>
                            <a href=""> 2 </a>
                            <a href=""> 3 </a>
                            <a href=""> 4 </a>
                            <a href=""> 5 </a>
                            <a id="after" href=""> > </a>
                </div>
            </div>

        </div>

        <footer>
            <%@ include file="/WEB-INF/views/common/member/footer.jsp" %>
        </footer>

        
    </body>

    </html>