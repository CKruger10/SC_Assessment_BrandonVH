function showQuestion(el, QuestionNo) {
    $('.tab-strip').find('.selected').removeClass('selected');

    $('#contentDiv').find('div').each(function () {
        $(this).hide();
    });

    $(el).parent().addClass('selected');
    $('#QDiv' + QuestionNo).find('div').show();
    $('#QDiv' + QuestionNo).show();
}

function AjaxCall (params) {
    var execute = function (params) {
        $.ajax({
            url: params.Url,
            type: params.Type ? params.Type : "POST",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            headers: params.Headers ? params.Headers : null,
            beforeSend: params.BeforeSend ? params.BeforeSend : null,
            data: params.Data ? (function () {
                var toReturn = JSON.stringify(params.Data);
                if (!toReturn) {
                    var copied = jQuery.extend(true, {}, params.Data);
                    toReturn = JSON.stringify(copied);
                }
                return toReturn;
            })() : null,
            async: !(params.IsSync),
            success: function (result) {
                if (params.ForceJson) {
                    result.d = JSON.parse(result.d);
                }


                if (params.Delegate)
                    params.Delegate(result);
                if (params.Settings && (params.Settings.KeepProcessing || !(params.Settings.DoProcessing != null ? params.Settings.DoProcessing : true))) {
                    return true;
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                if (params.Error) {
                    params.Error(XMLHttpRequest, textStatus, errorThrown);
                    console.log(XMLHttpRequest);
                    console.log(textStatus);
                    console.log(errorThrown);
                    return;
                }

                var ResponseMessage = "";

                var AjaxResponse = XMLHttpRequest.responseText.split(',');

                if (AjaxResponse.length > 0) {
                    var MessageIdx = AjaxResponse[0].indexOf("Message");
                    if (MessageIdx > -1) {
                        var messageArr = AjaxResponse[0].split(':');
                        for (var i = 1 ; i < messageArr.length; i++) {
                            ResponseMessage = ResponseMessage + messageArr[i];
                        }
                    }
                }
            }
        });
    }
    execute(params);
};

function CalculateSaturDays() {
    var postData = $('#dpQuestion1').val();

    AjaxCall({
        Url: SI_Window.applicationPath + "/Ajax.aspx/CalculateSaturdays",
        Data: { date: postData },
        Delegate: function (result) {
            $('#spnQ1').html(result.d);
        }
    });
}

function TestAnagram() {
    var word1 = $('#txtW1').val();
    var word2 = $('#txtW2').val();

    AjaxCall({
        Url: SI_Window.applicationPath + "/Ajax.aspx/TestAnagram",
        Data: {
            w1: word1,
            w2: word2
        },
        Delegate: function (result) {
            debugger;
            $('#spnQ2').html(result.d);
        }
    });
}

function CircleCollide() {
    var C1 = {
        X: $('#intX1').val(),
        Y: $('#intY1').val(),
        Radius: $('#intR1').val()
    };

    AjaxCall({
        Url: SI_Window.applicationPath + "/Ajax.aspx/CircleCollide",
        Data: {
            c1: C1,
            c2: C2
        },
        Delegate: function (result) {
            $('#spnQ3').html(result.d);
        }
    });

}

function convertHex(el) {
    $('.colorshowHex').css({ "background-color": $(el).val() });

    AjaxCall({
        Url: SI_Window.applicationPath + "/Ajax.aspx/HexToRGB",
        Data: {
            hex: $(el).val(),
        },
        Delegate: function (result) {
            $('#lblrgbVal').html(result.d)

            $('.colorshowRGB').css({ "background-color": result.d });
        }
    });

}

function ListCombine() {
    var ListA = [];
    var ListB = [];
    $('#ddlList1 option').each(function () {
        ListA.push($(this).val());
    });
    $('#ddlList2 option').each(function () {
        ListB.push($(this).val());
    });
    console.log(SI_Window.applicationPath + "/Ajax.aspx/ListCombine");
    AjaxCall({
        Url: SI_Window.applicationPath + "/Ajax.aspx/ListCombine",
        Data: {
            A: ListA,
            B: ListB
        },
        Delegate: function (result) {
            $('#spnQ5').html(result.d)

        }
    });
}

function CreateNumber() {
    var list = [];
    $('#ddlListValues option').each(function () {
        list.push($(this).val());
    });
    AjaxCall({
        Url: SI_Window.applicationPath + "/Ajax.aspx/CreateNumber",
        Data: {
            Data: list,
        },
        Delegate: function (result) {
            $('#spnQ6').html(result.d)

        }
    });
}

function LoadFrame() {
    document.getElementById("ifrm").setAttribute("src", SI_Window.applicationPath + "/DataPage.aspx");
}

function LoadFrame2() {
    document.getElementById("ifrm2").setAttribute("src", SI_Window.applicationPath + "/People.aspx");
}