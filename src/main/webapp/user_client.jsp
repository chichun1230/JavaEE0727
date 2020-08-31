<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link rel="stylesheet" href="https://unpkg.com/purecss@2.0.3/build/pure-min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User CRUD Page</title>
        <script>
            function updateUser() {
                // 抓取表單資料
                var id = document.getElementById("id").value;
                var name = document.getElementById("name").value;
                var age = document.getElementById("age").value;
                // 建立物件
                var jsonObj = new Object();
                jsonObj.id = id * 1;
                jsonObj.name = name;
                jsonObj.age = age * 1;
                // 將物件轉 json 字串
                var jsonText = JSON.stringify(jsonObj);
                console.log(jsonObj);
                console.log(jsonText);
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("result").innerHTML = this.responseText;
                    }
                };
                var url = "/JavaEE0727/rest/user/" + id;
                xhttp.open("PUT", url, true);
                xhttp.setRequestHeader("Content-type", "application/json;charset=UTF-8");
                xhttp.send(jsonText);
            }
            function addUser() {
                // 抓取表單資料
                var id = document.getElementById("id").value;
                var name = document.getElementById("name").value;
                var age = document.getElementById("age").value;
                // 建立物件
                var jsonObj = new Object();
                jsonObj.id = id * 1;
                jsonObj.name = name;
                jsonObj.age = age * 1;
                // 將物件轉 json 字串
                var jsonText = JSON.stringify(jsonObj);
                console.log(jsonObj);
                console.log(jsonText);
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("result").innerHTML = this.responseText;
                    }
                };
                xhttp.open("POST", "/JavaEE0727/rest/user/", true);
                xhttp.setRequestHeader("Content-type", "application/json;charset=UTF-8");
                xhttp.send(jsonText);
            }
            function queryUsers() {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        var jo = JSON.parse(this.responseText);
                        document.getElementById("result").innerHTML = this.responseText;
                        var table = document.getElementById("userTable");
                        for(var i=0;i<jo.length;i++) {
                            var row = table.insertRow(0);
                            var cell1 = row.insertCell(0);
                            var cell2 = row.insertCell(1);
                            var cell3 = row.insertCell(2);
                            cell1.innerHTML = jo[i].id;
                            cell2.innerHTML = jo[i].name;
                            cell3.innerHTML = jo[i].age;
                        }
                    }
                };
                xhttp.open("GET", "/JavaEE0727/rest/user/all", true);
                xhttp.send();
            }
        </script>
    </head>
    <body style="padding: 20px">

        <form id="user_form" class="pure-form">
            <fieldset>
                <legend>User CRUD</legend>
                ID : <input type="text" id="id" name="id" placeholder="請輸入ID" /><p/>
                Name : <input type="text" id="name" name="name" placeholder="請輸入名字" /><p/>
                Age : <input type="number" id="age" name="age" placeholder="請輸入年齡" /><p/>
                <button type="button" id="add_button"    onclick="addUser()"    class="pure-button pure-button-primary">新增</button>
                <button type="button" id="update_button" onclick="updateUser()" class="pure-button pure-button-primary">修改</button>
                <button type="button" id="query_button"  onclick="queryUsers()" class="pure-button pure-button-primary">查詢</button>
                <button type="reset" class="pure-button pure-button-primary">清除</button>
            </fieldset>
        </form>

        <div id="result"></div>

        <table class="pure-table pure-table-bordered">
            <thead>
                <tr>
                    <th>id</th>
                    <th>name</th>
                    <th>age</th>
                </tr>
            </thead>
            <tbody id="userTable" >
                
            </tbody>
        </table>
    </body>
</html>
