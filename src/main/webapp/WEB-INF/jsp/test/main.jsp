<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>

   <script>
      const test = function () {
         let param = [];
         
         $("input[name='test']:checked").each(function () {
            param.push($(this).val());
         })
         
         $.ajax({
            url : '/test/checkboxTest',
            type : 'POST',
//             headers: {"content-type":"application/json"},
//             data : JSON.stringify(param),
            data : {
               tl : param,
            },
            dataType : 'text',
            success : function(data) {
               console.log(data);
            },
            error : function(xhr, status, error) {
               console.log(error);
            }
         })
      }
   </script>
   
   <div>
      <input name="test" type="checkbox" value="1" /> test1
      <input name="test" type="checkbox" value="2" /> test2
      <button onclick="test();">전송</button>
   </div>
</body>
</html>