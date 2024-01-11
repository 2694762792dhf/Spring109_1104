<%--
  Created by IntelliJ IDEA.
  User: 26947
  Date: 2024/1/10
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>报送表</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        function toggleInput() {
            var selectElement = document.getElementById("bankDefaultSelect");
            var inputContainer = document.getElementById("bankDefaultInputContainer");

            // 清空已有的输入框
            inputContainer.innerHTML = "";

            if (selectElement.value === "有" && ${account.bankMoney != null}) {
                // 创建提示语句并添加到第一列
                var hintElement = document.createElement("td");
                hintElement.innerText = "银行违约金额:";

                // 创建并添加新的输入框到第二列
                var inputElement = document.createElement("input");
                inputElement.type = "number";
                inputElement.name = "BankMoney";
                inputElement.value = "${account.bankMoney}";

                var inputCell = document.createElement("td");
                inputCell.appendChild(inputElement);

                // 添加到容器
                inputContainer.appendChild(hintElement);
                inputContainer.appendChild(inputCell);

            }
        }

    </script>
</head>
<body>
<form method="post" action="<%=request.getContextPath()%>/sendData.do" enctype="application/x-www-form-urlencoded">
    <table border="1">
        <tr>
            <td>姓名:</td>
            <td><input type="text" name="name" value="${account.name}"></td>
        </tr>
        <tr>
            <td>身份证号:</td>
            <td><input type="text" name="code" value="${account.code}"></td>
        </tr>
        <tr>
            <td>住址:</td>
            <td><input type="text" name="home" value="${account.home}"></td>
        </tr>
        <tr>
            <td>收入:</td>
            <td><input type="text" name="money" value="${account.money}"></td>
        </tr>
            <td>有无银行违约:</td>
            <td>
                <select id="bankDefaultSelect" onchange="toggleInput()">
                    <option value="无">无</option>
                    <option value="有">有</option>
                </select>
            </td>
        </tr>
        <tr id="bankDefaultInputContainer"></tr>
        <tr><td colspan="2"><input type="submit" name="submit" value="报送"></td></tr>
    </table>
</form>
</body>
</html>
