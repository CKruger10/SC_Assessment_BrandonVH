<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="People.aspx.cs" Inherits="Interview.People" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Styles/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="Styles/Calendar.css" rel="stylesheet" type="text/css" />
    <link href="Styles/StylesMain.css" rel="stylesheet" type="text/css" />
    <link href="Styles/StylesSupport.css" rel="stylesheet" type="text/css" />
    <link href="Styles/StylesColor.css" rel="stylesheet" type="text/css" />
    <link href="Styles/InformationProfile.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery.js" type="text/javascript"></script>
    <script src="Scripts/PeopleScripts.js" type="text/javascript"></script>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }

        thead {
            background-color: #0E385B;
            color: white;
            font-weight: bolder;
        }

        tbody {
            font-size: 0.8rem;
        }

        table td, table th {
            min-width: 100px;
            padding: 5px;
        }

        table td {
            border-right: 1px solid #eee;
            border-left: 1px solid #eee;
        }

        table tr:nth-child(even) {
            background-color: whitesmoke;
        }

        .table-header {
            clear: both;
            padding: 2px;
        }

        button {
            background-color: #0E385B;
            color: white;
            padding: 5px;
            border: 0px none;
            float: right;
            margin: 2px;
        }

        .table-footer button {
            margin: 0px;
            font-style: italic;
        }

        .form {
            position: relative;
            display: inline-block;
            float: right;
            width: 35vw;
            padding: 25px;
            margin: 5px;
            border: 1px solid #0E385B;
        }

            .form input, .form select {
                display: inline-block;
                width: 100%;
            }
    </style>
</head>
<body>

    <div class="form" id="UpdateUser" style="display: none;">
        <h2>Update User</h2>
        <input id="updateId" style="display: none;" />
        <label>Name</label>
        <input id="updateName" class="textboxes thin" />
        <br />
        <br />
        <label>Age</label>
        <input id="updateAge" class="textboxes thin" />

        <button onclick="$('#UpdateUser').slideToggle();Page.Update()">Save</button>
        <button onclick="$('#UpdateUser').slideToggle();Page.Delete()">Delete</button>
        <button onclick="$('#UpdateUser').slideToggle();">Cancel</button>
    </div>
    <div class="form" id="InsertUser" style="display: none;">
        <h2>Insert User</h2>

        <label>Name</label>
        <input id="insertName" class="textboxes thin" />
        <label>Surname</label>
        <input id="insertSurname" class="textboxes thin" />
        <label>Age</label>
        <input id="insertAge" class="textboxes thin" />

        <button onclick="$('#InsertUser').slideToggle();Page.Insert()">Save</button>
        <button onclick="$('#InsertUser').slideToggle();">Cancel</button>
    </div>
    <div class="table-header">
        <label>Search</label>
        <input class="textboxes thin" onkeyup="Search(this.value);" />
    </div>
    <table id="tbl-people">
        <thead>
            <tr>
                <th>Name
                </th>
                <th>Surnamethis
                </th>
                <th>Favourite hobby
                </th>
                <th>
                    <button onclick="$('#InsertUser').slideToggle();">Create</button></th>
            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
    <div class="table-footer">
        <button id="btn-next" style="padding-right: 15px;" onclick="Page.CurrentPage += 1;Page.CreatePage();">next</button>
        <button id="currPage" style="cursor: default">1 of 3</button>
        <button id="btn-prev" style="padding-left: 15px;" onclick="Page.CurrentPage -= 1;Page.CreatePage();">prev</button>
    </div>

    <script>
        var Page = new PageData(1, 10, [], '');
        Page.CreatePage();
    </script>
</body>
</html>