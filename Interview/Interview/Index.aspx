<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Interview.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
        <link href="Styles/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="Styles/Calendar.css" rel="stylesheet" type="text/css" />
        <link href="Styles/StylesMain.css" rel="stylesheet" type="text/css" />
        <link href="Styles/StylesSupport.css" rel="stylesheet" type="text/css" />
        <link href="Styles/StylesColor.css" rel="stylesheet" type="text/css" />
        <script src="Scripts/jquery.js" type="text/javascript"></script>
        <script src="Scripts/jquery-ui.js" type="text/javascript"></script>
        <script src="Scripts/Validation.js" type="text/javascript"></script>
        <script src="Scripts/Functions.js" type="text/javascript"></script>
    
</head>
<body>
    <div>
        <h1 class="title">Welcome</h1>
        <div id="navDiv">
            <ul class="tab-strip"> 
                <li class="selected"><a onclick="showQuestion(this,0);" href="javascript:void(0);">Main</a></li>
                <li><a onclick="showQuestion(this,1);" href="javascript:void(0);">1. (Saturdays) <i class="important">[20 min]</i></a></li>
                <li><a onclick="showQuestion(this,2);" href="javascript:void(0);">2. (Anagram) <i class="important">[20 min]</i></a></li>  
                <li><a onclick="showQuestion(this,5);" href="javascript:void(0);">3. (Combine) <i class="important">[20 min]</i></a></li>
                <li><a onclick="showQuestion(this,6);" href="javascript:void(0);">4. (Largest Number) <i class="important">[20 min]</i></a></li>                          
                <li><a onclick="showQuestion(this,4);" href="javascript:void(0);">5. (Hex) <i class="important">[20 min]</i></a></li>
                <li><a onclick="showQuestion(this,3);" href="javascript:void(0);">6. (Circle) <i class="important">[20 min]</i></a></li>
                <li><a onclick="showQuestion(this,8);" href="javascript:void(0);">Bonus (SQL And JS) <i class="important">[60 min]</i></a></li>
                <li><a onclick="showQuestion(this,7);" href="javascript:void(0);">Bonus (XML and XSS) <i class="important">[60 min]</i></a></li>
            </ul>

        </div>
        <div id="contentDiv" class="content content-actions">
            <div id="QDiv0">
                <p>
                    This is a practical test designed to test the following:
                </p>
                <p>
                    * General coding logic<br />
                    * Java-Script knowledge<br />
                    * .NET Knowledge<br />
                </p>
                <p>
                    There are 8 Questions in total, each with various intended errors and omissions in the code.<br />
                    Each question can be viewed bly clicking on the question tab.<br />
                    Questions do not have to be completed in order. <br />
                </p>
                <p>
                    Included in each page is JQuery loaded as well as JQuery-ui.<br />
                    This test will require the use of Ajax calls, and the use of Webforms.<br />
                    A generic Ajax exectue function has been written and included.<br />
                    The ajax function signature:<br />
                </p>
                <div style="text-align:left;padding-left:35%" class="important">
                    NB.
                    <br />Ajax Functions you need to edit are in the Ajax.aspx.cs File,
                    <br />JS Functions you need to edit are in scripts/Functions.js
                    <br />Question Functions are in the questions folder
                    <br />Bonus (XML and XSS) must be completed in DataPage.aspx.cs
                </div>
                <div style="text-align:left;padding-left:35%" class="">
<pre>
AjaxCall({
    Url: string <comment>//The method URL. SI_Window.applicationPath can be used to retrieve the main url.</comment>
    Data: object <comment>// Data required by the method</comment>
    Delegate: function (result) {
        <comment>// any custom function that must execute after the call is completed</comment>
        <comment>// data returned can be accessed in result.d</comment>
    }
});
</pre>
                </div>
                <p>
                    JQuery funciton can be called with the standard '$' shorthand.<br />
                    When selecting elements with JQuery:<br />
                    document.getElementByID('[id]') = $('#[id]')<br />
                    document.getElementsByClassName('[class]') = $('.[class]') <br />
                    document.getElementsByTagName('[tagname]') = $('[tagname]')<br />
                </p>
                <p>
                    Bonus points may be applied to questions that have been answered efficiently,<br />
                    Commented Correctly<br />
                    And where validations have been added effectivley<br />

                </p>
            </div>
            <div id="QDiv1" style="display:none;">
                <p>
                    Write a function that counts the number of Saturdays of the given 
                    year and months.
                    Example: CountSaturdays(2017, 5) would return 4
                </p>
                <div class="question-center">
                    <div>
                        <input id="dpQuestion1" type="text" class="textboxes thin datetime" />
                    </div>
                    <div>
                        <a onclick="CalculateSaturDays();" href="javascript:void(0);" class="customaction">Count Saturdays</a>
                    </div>
                    <div>
                        <span id="spnQ1"></span>
                    </div>
                </div>
            </div>
            <div id="QDiv2" style="display:none;">
                <p>
                    Write a function that test for anagramity.<br />
                    Am anagram is a word that containts exactly the same letters and <br />
                    frequency thereof as another word.<br />
                    for example, the word anagram can be rearranged into "nagaram"<br />
                </p>
                <div class="question-center">
                    <div>
                        <label>Word 1</label><input id="txtW1" type="text" class="textboxes thin" />
                        <label>Word 2</label><input id="txtW2" type="text" class="textboxes thin" />
                    </div>
                    <div>
                        <a onclick="TestAnagram();" href="javascript:void(0);" class="customaction">Test Anagram</a>
                    </div>
                    <div>
                        <span id="spnQ2"></span>
                    </div>
                </div>
            </div>
            <div id="QDiv3" style="display:none;">
                <p>
                    Write a function that checks wheter two Circles on the same pane with<br />
                    X, Y and Radius properties currently collide or not.<br />
                    Write implementation in Circle.cs<br />
                    Assume multiply and division operations are very slow, can you optimize this function?<br />
                </p>
                <div class="question-center">
                    <div>
                        <div class="divider">
                            <div><label>Circle 1 X Coordinate</label><input id="intX1" type="text" class="textboxes thin numeric" /></div>
                            <div><label>Circle 1 Y Coordinate</label><input id="intY1" type="text" class="textboxes thin numeric" /></div>
                            <div><label>Circle 1 Radius</label><input id="intR1" type="text" class="textboxes thin numeric" /></div>
                        </div>
                        <div class="divider">
                            <div><label>Circle 2 X Coordinate</label><input id="intX2" type="text" class="textboxes thin numeric" /></div>
                            <div><label>Circle 2 Y Coordinate</label><input id="intY2" type="text" class="textboxes thin numeric" /></div>
                            <div><label>Circle 2 Radius</label><input id="intR2" type="text" class="textboxes thin numeric" /></div>
                        </div>
                    </div>
                    <div>
                        <a onclick="CircleCollide();" href="javascript:void(0);" class="customaction">Test Collision</a>
                    </div>
                    <div>
                        <span id="spnQ3"></span>
                    </div>
                </div>
            </div>
            <div id="QDiv4" style="display:none;">
                <p>
                    Write a function that converts a hex color string to the relevant rgb or rgba alternative.<br />
                    PS. Convert.ToUInt32(hex, 16) takes a 2 letter hex string and converts that to the relevant value out of 255.<br />
                    <br /><br />
                    <div style="text-align:left;padding-left:25%">
                        Step 1. Convert #fabc32 to rgb(250,188,50)<br />
                        Step 2. Convert #fb3 to rgb(255,187,51) <i class="important">#fb3 is the same as #ffbb33</i><br />
                        step 3. Convert #3fcabfcc to rgba(63,202,191,0.8) <i class="important">The 'a' value in rgba is a percentage of 255</i><br />                  
                        step 4. Convert #3acd to rgba(51,170,204,0.87)<br />
                    </div>
                </p>
                <div class="question-center">
                    <div>
                        <div class="divider">
                            <label>Hex Color Value</label><input id="txtHexVal" onchange="convertHex(this);" type="text" class="textboxes thin" value="#ff00ff" />
                            <div class="colorshow colorshowHex" style="background-color:#ff00ff;"></div>
                        </div>
                        <div class="divider">
                            <label>Hex Color Value</label><div id="lblrgbVal" class="textboxes thin">Hex Color Value</div>
                            <div class="colorshow colorshowRGB"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="QDiv5" style="display:none;"> 
                <p>
                    Write a function that combines two lists by alternatingly <br />
                    taking elements. For example: given the two <br />
                    lists[a, b, c] and[1, 2, 3], the function should return [a, 1, b, 2, c, 3].<br />
                </p>
                <div class="question-center">
                    <div>
                        <div class="divider">
                            <div>
                                <label>List A</label>
                                <select id="ddlList1" class="textboxes thin">
                                    <option value="A" selected="true" >A</option>
                                    <option value="B">B</option>
                                    <option value="C">C</option>
                                </select>
                            </div>
                        </div>
                        <div class="divider">
                            <div>
                                <label>List B</label>
                                <select id="ddlList2" class="textboxes thin">
                                    <option value="1" selected="true" >1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div>
                        <a onclick="ListCombine();" href="javascript:void(0);" class="customaction">Combine</a>
                    </div>
                    <div>
                        <span id="spnQ5"></span>
                    </div>
                </div>
            </div>
            <div id="QDiv6" style="display:none;">
                <p>
                    Write a function that given a list of non negative integers, <br />
                    arranges them such that they form the largest possible number.<br />
                    For example, given[50, 2, 1, 9], the largest formed number is 95021.<br />
                </p>
                <div class="question-center">
                    <div>
                        <div class="divider">
                            <div>
                                <label>List Of Values</label>
                                <select id="ddlListValues" class="textboxes thin">
                                    <option value="50" selected="true" >50</option>
                                    <option value="2">2</option>
                                    <option value="1">1</option>
                                    <option value="9">9</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div>
                        <a onclick="CreateNumber();" href="javascript:void(0);" class="customaction">Combine</a>
                    </div>
                    <div>
                        <span id="spnQ6"></span>
                    </div>
                </div>
            </div>
            <div id="QDiv8" style="display:none;" >
                <p>
                    
                </p>
                <br /><br />
                    <div style="text-align:left;padding-left:25%">

                        <h3>Testing Your Database Skills is important!</h3>

                        Step 1. Make Table <i class="important">[People]</i>'s ID auto increment<br />
                        Step 2. Create Table <i class="important">[PersonHobbies]</i> with Columns PersonID and HobbyID<br />
                        Step 3. Populate <i class="important">[PersonHobbies]</i> with some data (does not matter how you do it, as long as the data is there)<br />
                        Step 4. Edit the Stored Procedure <i class="important">[GetPeople]</i> to make the '<i class="important">@Search</i>' parameter work on the persons name<br />
                        Step 5. Edit the Stored Procedure <i class="important">[GetPeople]</i>  to make paging work '<i class="important">@page_number</i>' is the current page.<br />
                        Step 6. Edit the Stored Procedure's <i class="important">[InsertPerson]</i> , <i class="important">[UpdatePerson]</i>, <i class="important">[DeletePerson]</i> to make them work.<br />
                        Step 7. Use <i class="important">Stuff and ForXML</i> or any other method to combine the persons hobbies into a comma delimitted list<br />
                        <br />
                        <h3>Being able to use javascript is vital to creating a good user experience!</h3>

                        Step 1. Make the <i class="important">next page</i> button work increment the next current page number<br />
                        Step 2. Make the <i class="important">search textbox</i> query the database for new results on the change method<br />
                        Step 3. Using the Insert function as a basis, Make the <i class="important">Update and Delete function</i> work (Make sure that the results are instantly visible in the table)<br />
                        Step 4. Implement <i class="important">validation</i> on Insert and Update values to make sure names and surnames are atleast 3 letters and that age is a number.
                        (For time purposes you can just use alert)<br />
                        Step 5. Display Hobbies (The comma delimited list, you created earlier) in the table per employee<br />
                        <br />
                        <h3>Being able to communicate between front end and backend is probably the most important part of the job</h3>
                        Step 1. Using the Update function as a basis, create the <i class="important">Insert and Delete Web Methods</i><br />
                    </div>
                <div class="question-center">
                    <div >
                        <a onclick="LoadFrame2();" href="javascript:void(0);" class="customaction">Load Data</a>
                    </div>
                    <div class="frmDiv" style="top:350px">
                        <iframe id="ifrm2" name="Content" width="100%" height="100%" frameborder="0" src="" scrolling="no"></iframe>
                    </div>
                </div>
            </div>
            <div id="QDiv7" style="display:none;" >
                <p>
                    When clicking on the buttin the system application will load a page inside the iframe. <br />
                    The page loaded displays a static view of xml data mapped with an xslt style sheet. <br />
                    Due to the nature of xml certain characters are not allowed i.e. &, <, >  <br />
                    Data was captured on another system that accepts the text data as is, and when the xml is created for syncing the illegal characters are automatically xml encoded.<br />
                    Due to the xml encoding of the illegal characters the mapping no longer works as intended as, the xml encoded characters are not always the same as html encoding.<br />
                    Write a method that will clean the xml data and when mapped to the xslt it will ensure the data is displayed correctly.
                    
                </p>
                <br /><br />
                    <div style="text-align:left;padding-left:25%">
                        Step 1. Fix the Html Formatting Issues<br />
                        Step 2. Fix the XSS Issue (The script tag should be shown as text and should never run)<br />
                    </div>
                <div class="question-center">
                    <div >
                        <a onclick="LoadFrame();" href="javascript:void(0);" class="customaction">Load Data</a>
                    </div>
                    <div class="frmDiv" style="top:200px">
                        <iframe id="ifrm" name="Content" width="100%" height="100%" frameborder="0" src="" scrolling="no"></iframe>
                    </div>
                </div>
            </div>
        </div>
     </div>
    <script type="text/javascript">

        TypeControls();
        Window.AppUrl = '<%=AppUrl%>';
        var SI_Window = { applicationPath: '<%=AppUrl%>' };
    </script>
    <style>
        .important{
            color:red;
        }
    </style>
</body>
</html>
