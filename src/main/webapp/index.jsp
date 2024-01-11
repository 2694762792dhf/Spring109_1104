<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <style>
        /* 移除所有input为number的默认样式 */
        input[type="number"] {
            -moz-appearance: textfield;
            appearance: textfield;
        }

        input[type="number"]::-webkit-inner-spin-button,
        input[type="number"]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
    </style>
    <script>
        function toggleInput() {
            var selectElement = document.getElementById("bankDefaultSelect");
            var inputContainer = document.getElementById("bankDefaultInputContainer");

            // 清空已有的输入框
            inputContainer.innerHTML = "";

            if (selectElement.value === "有") {
                // 创建提示语句并添加到第一列
                var hintElement = document.createElement("td");
                hintElement.innerText = "银行违约金额:";

                // 创建并添加新的输入框到第二列
                var inputElement = document.createElement("input");
                inputElement.type = "number";
                inputElement.name = "BankMoney";

                var inputCell = document.createElement("td");
                inputCell.appendChild(inputElement);

                // 添加到容器
                inputContainer.appendChild(hintElement);
                inputContainer.appendChild(inputCell);
            }
        }
    </script>
    <script src="static/js/jquery.min.js"></script>
<%--    <script>--%>
<%--        $(document).ready(function () {--%>
<%--            $('[name=submit]').on('click', function () {--%>
<%--                // alert('suc')--%>
<%--                let name=$('[name=name]').val();--%>
<%--                let code=$('[name=code]').val();--%>
<%--                let home=$('[name=home]').val();--%>
<%--                let money=$('[name=money]').val();--%>
<%--                let BankMoney=$('[name=BankMoney]').val();--%>
<%--                $.ajax({--%>
<%--                    method:'post',--%>
<%--                    url:'${pageContext.request.contextPath}/ClientController.do',--%>
<%--                    data:JSON.stringify({name:name,code:code,home:home,money:money,BankMoney:BankMoney}),--%>
<%--                    contentType:'application/json',--%>
<%--                    success:function (data){--%>
<%--                        // alert('异步调用springmvc接口成功!'+JSON.stringify(data))--%>
<%--                        // alert(data.name+"\n"+data.salary)--%>
<%--                        // $('#staff').html('<div>姓名：'+data.name+'</div>'+'<span>薪资：'+data.salary+'</span>')--%>
<%--                    },--%>
<%--                    error:function () {--%>
<%--                        alert('调用失败！');--%>
<%--                    }--%>
<%--                });--%>
<%--            });--%>

<%--        });--%>
<%--    </script>--%>
</head>
<body>
<h2>1104报表</h2>
<form action="<%=request.getContextPath()%>/ClientController.do" method="post" accept-charset="UTF-8" enctype="application/x-www-form-urlencoded">
    <table border="1">
        <tr>
            <td>姓名:</td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>身份证号:</td>
            <td><input type="text" name="code"></td>
        </tr>
        <tr>
            <td>住址:</td>
            <td><input type="text" name="home"></td>
        </tr>
        <tr>
            <td>收入:</td>
            <td><input type="text" name="money"></td>
        </tr>
        <tr>
            <td>有无银行违约:</td>
            <td>
                <select id="bankDefaultSelect" onchange="toggleInput()">
                    <option value="无">无</option>
                    <option value="有">有</option>
                </select>
            </td>
        </tr>
        <tr id="bankDefaultInputContainer">
            <!-- 这里作为容器，用于放置动态添加的输入框和提示语句 -->
        </tr>
        <tr><td colspan="2"><input type="submit" name="submit" value="提交"></td></tr>
    </table>
</form>
</body>
</html>


