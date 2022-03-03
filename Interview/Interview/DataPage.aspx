<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataPage.aspx.cs" Inherits="Interview.DataPage" %>

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
    <script type="text/javascript">
        function showDetails(el, dvNo) {
            $('.tab-strip').find('.selected').removeClass('selected');

            if (dvNo == 1) {
                $('#ContentDiv2').hide();
                $('#ContentDiv1').show();

            }
            else {
                $('#ContentDiv1').hide();
                $('#ContentDiv2').show();
            }
            $(el).parent().addClass('selected');
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="navDiv">
            <ul class="tab-strip">
                <li><a onclick="showDetails(this,1);" href="javascript:void(0);">Details 1</a></li>
                <li><a onclick="showDetails(this,2);" href="javascript:void(0);">Details 2</a></li>
            </ul>
        </div>
        <div id="ContentDiv1" class="content top"  runat="server"></div>
        <div id="ContentDiv2" class="content top" style="display:none;" runat="server"></div>
    </form>
</body>
</html>
