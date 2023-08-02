<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
    
    <form action="/app/member/send-one" method="post">
    	<input type="submit">
    </form>
</body>
</html>
<script>
var crypto = require("crypto");
var axios = require("axios");

var now = new Date().toISOString();
// 16진수 64자의 랜덤 값 생성
var genRanHex = size =>
  [...Array(size)]
    .map(() => Math.floor(Math.random() * 16).toString(16))
    .join("");
var salt = genRanHex(64);
var message = now + salt;
var apiKey = "NCSRQ4MAHHI6QWOM";
var apiSecret = "WMY9PPXVO9D5MHLWIN1PLATU2A4UDYYD";
var signature = crypto.createHmac("sha256", apiSecret).update(message).digest("hex");

// 생성한 시그니처를 사용하여 API 호출
var uri = `https://api.coolsms.co.kr/messages/v4/list?limit=1`;
axios
  .get(uri, {
    headers: {
      Authorization: `HMAC-SHA256 apiKey=${apiKey}, date=${now}, salt=${salt}, signature=${signature}`
    }
  })
  .then(res => {
    console.log(res.data);
  })
  .catch(error => {
    console.log(error.response.data);
  });
    
    
</script>