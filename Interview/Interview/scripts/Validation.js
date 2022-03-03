function simpleDateFormat(date) {
    return date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
}


function ValidateField(control, validationType) {
    switch (validationType) {
        case "Integer": ValidateInteger(control); break;
        case "Decimal": ValidateDecimal(control); break;
        case "Date": ValidateDate(control); break;
        case "Required": ValidateRequired(control); break;
    }
}

function ValidateRequired(input) {
    var result = input.value;
    if (result == "") {
        input.style.color = "Red";
        input.style.backgroundColor = "Pink";
        input.title = "This field is required.";
        foundError = true;
    }
    else {
        input.style.color = "Black";
        input.style.backgroundColor = "White";
        input.title = "";
    }
}

function ValidateDate(input) {
    var valid = true;

    if ((input == "") || (input.indexOf("/") < 0)) {
        valid = false;
    }
    else {
        var dateArr = input.split("/");

        if (dateArr.length < 3) {
            valid = false;
        }
        else {
            var day, month, year;
            if (dateArr[0].length == 4) {
                year = dateArr[0];
                if (parseInt(dateArr[1], 10) > 12) {
                    day = dateArr[1];
                    month = dateArr[2];
                }
                else {
                    day = dateArr[2];
                    month = dateArr[1];
                }
            }
            else {
                year = dateArr[2];
                if (parseInt(dateArr[1], 10) > 12) {
                    day = dateArr[1];
                    month = dateArr[0];
                }
                else {
                    day = dateArr[0];
                    month = dateArr[1];
                }
            }

            if ((parseInt(year, 10) % 4) == 0) {
                valid = CheckDaysLeapYear(month, day);
            }
            else {
                valid = CheckDaysNormalYear(month, day);
            }
        }
    }
    return valid;
}

function CheckDaysNormalYear(month, day) {
    if (parseInt(day, 10) > 0) {
        switch (parseInt(month, 10)) {
            case 1: return day < 32;
            case 2: return day < 29;
            case 3: return day < 32;
            case 4: return day < 31;
            case 5: return day < 32;
            case 6: return day < 31;
            case 7: return day < 32;
            case 8: return day < 32;
            case 9: return day < 31;
            case 10: return day < 32;
            case 11: return day < 31;
            case 12: return day < 32;
            default: return false;
        }
    }
    else {
        return false;
    }
}

function CheckDaysLeapYear(month, day) {
    if (parseInt(day, 10) > 0) {
        switch (parseInt(month, 10)) {
            case 1: return day < 32;
            case 2: return day < 30;
            case 3: return day < 32;
            case 4: return day < 31;
            case 5: return day < 32;
            case 6: return day < 31;
            case 7: return day < 32;
            case 8: return day < 32;
            case 9: return day < 31;
            case 10: return day < 32;
            case 11: return day < 31;
            case 12: return day < 32;
            default: return false;
        }
    }
    else {
        return false;
    }
}

function ValidateDecimal(input) {
    var valid = true;
    var exp = new RegExp("^\\s*([-\\+])?(\\d+)?(\\.(\\d+))?\\s*$");
    if (input.value.match(exp) == null)
        valid = false;

    if (!valid) {
        input.style.color = "Red";
        input.style.backgroundColor = "Pink";
        input.title = "Invalid field value. Please type a decimal value.";
        foundError = true;
    }
    else {
        input.style.color = "Black";
        input.style.backgroundColor = "White";
        input.title = "";
    }
}

function ValidateInteger(input) {
    var valid = true;
    var exp = /^\s*[-\+]?\d+\s*$/;
    if (input.value.match(exp) == null)
        valid = false;

    if (!valid) {
        input.style.color = "Red";
        input.style.backgroundColor = "Pink";
        input.title = "Invalid field value. Please type a numeric value.";
        foundError = true;
    }
    else {
        input.style.color = "Black";
        input.style.backgroundColor = "White";
        input.title = "";
    }
}

function CheckTimeValidation(timeStr) {
    // Checks if time is in HH:MM:SS AM/PM format.
    // The seconds and AM/PM are optional.

    var timePat = /^(\d{1,2}):(\d{2})(:(\d{2}))?(\s?(AM|am|PM|pm))?$/;

    var matchArray = timeStr.match(timePat);
    if (matchArray == null) {
        return false;
    }
    hour = matchArray[1];
    minute = matchArray[2];
    second = matchArray[4];
    ampm = matchArray[6];

    if (second == "") {
        second = null;
    }
    if (ampm == "") {
        ampm = null;
    }

    if (hour < 0 || hour > 23) {
        return false;
    }
    if (hour > 12 && ampm != null) {
        return false;
    }
    if (minute < 0 || minute > 59) {
        return false;
    }
    if (second != null && (second < 0 || second > 59)) {
        return false;
    }
    return true;
}

function checkValidID(ID) {
    try {
        if (ID.length != 13)
            return false;

        for (var i = 0; i < ID.length; i++) {
            var tt = parseInt(ID.charAt(i), 10);
        }
        return true;
    }
    catch (e) {
        return false;
    }
}

function checkValidID_Old(ID) {
    try {
        if (ID.length != 13)
            return false;

        var oddTotal = parseInt('0');
        for (i = 0; i < 12; i += 2)
            oddTotal += parseInt(ID.charAt(i));

        var even = "";
        for (i = 1; i < 13; i += 2)
            even = even + ID.charAt(i);

        even = parseInt(even) * 2;
        even = "" + even;

        var evenTotal = parseInt('0');
        for (i = 0; i < even.length; ++i)
            evenTotal += parseInt(even.charAt(i));

        var ans = oddTotal + evenTotal;
        ans = "" + ans;

        var testnum = 10 - parseInt(ans.charAt(1));
        testnum = "" + testnum;

        var testdigit = testnum.charAt(testnum.length - 1);

        if (testdigit == ID.charAt(12))
            return true;
        else
            return false;
    }
    catch (e) {
        return false;
    }
}

function ValidateNumbers(e, box, number_length, decimal_length) {
    var value = null;

    if (typeof e.target != 'undefined' && typeof e.target != "undefined") {
        value = e.target.value;
    }
    else {
        value = e.srcElement.value;
    }

    var reg = /(-)?(\d+)(\.\d+)?/
    var match = value.match(reg)
    if (!match || !match[2]) {
        e.target.value = '0.00';
        return false;
    }

    var number = match[2].substr(0, number_length)
    var decimal = match[3] ? match[3].substr(0, decimal_length + 1) : '';
    if (typeof e.target != 'undefined' && typeof e.target != "undefined") {
        e.target.value = (match[1] ? '-' : '') + number + decimal;
    }
    else {
        e.srcElement.value = (match[1] ? '-' : '') + number + decimal;
    }
    return true;
}

function IsSpecialKey(keynum) {
    switch (keynum) {
        case 8: return true; break; // backspace
        case 9: return true; break; // tab
        case 37: return true; break; // left arrow
        case 39: return true; break; // right arrow
        case 46: return true; break; // delete
        case 16: return true; break; // shift
    }
    return false;
}

function IsNumericCode(keynum) {
    if ((keynum == 189 || keynum == 109) || (keynum >= 48 && keynum <= 57) || (keynum >= 96 && keynum <= 105))
        return true;
    else
        return false;
}

function AddZeroes(box, decimal_length) {
    box.value = Round(box.value, decimal_length);
}

function Round(value, decimal_length) {
    if (isNaN(value)) return "";
    var roundValue = Math.pow(10, decimal_length);
    value = Math.round(value * roundValue) / roundValue;
    value = value + "";
    var decimal_string = "";
    var numeric_string = "";
    var contains_decimal = value.indexOf(".") > 0;
    if (contains_decimal)
        number_string = value.split(".")[0] + "";
    else
        number_string = value;
    if (number_string.replace("-", "").length == 0)
        number_string += "0";
    if (decimal_length > 0 && contains_decimal)
        decimal_string = value.split(".")[1] + "";
    value = number_string + (decimal_length > 0 && contains_decimal ? "." + decimal_string : "");
    if (decimal_length > 0 && !contains_decimal)
        value += ".";
    for (var i = 0; i < decimal_length - decimal_string.length; i++) {
        value += "0";
    }
    return value;
}

var TypeControls = function (container) {
    var params = container ? typeof container == "string" ? null : container : null;
    container = params && params.Container ? params.Container + " " : container && typeof container == "string" ? container + " " : null;
    var checkForApproot = function () {
        try {
            return appRoot;
        }
        catch (e) { return false; }
    };
    try {
        if ($) {
            if (params && params.jQueryContext)
                $ = params.jQueryContext;
            $(document, params && params.Window ? params.Window : null).ready(function () {
                $((container ? container : "") + "input[type=\"text\"].numeric")
                    .live("focus", function () {
                        if ($(this).attr("originalValue") == null)
                            $(this).attr("originalValue", $(this).val());
                        $(this).val("");
                    })
                    .live("change", function (e) {
                        var numbers = $(this).attr("numberLength") == undefined ? 9 : parseInt($(this).attr("numberLength"), 10);
                        var decimals = $(this).attr("decimalLength") == undefined ? 2 : parseInt($(this).attr("decimalLength"), 10);
                        if (!IsSpecialKey(e.which)) {
                            $(this).removeAttr("originalValue");
                        }
                        return ValidateNumbers(e, $(this)[0], numbers, decimals);
                    })
                    .live("blur", function () {
                        if ($(this).attr("originalValue") != null)
                            $(this).val($(this).attr("originalValue"));
                        else
                            $(this).val($(this).val() == "" ? "0.00" : $(this).val());
                        var decimals = $(this).attr("decimalLength") == undefined ? 2 : parseInt($(this).attr("decimalLength"), 10);
                        AddZeroes($(this)[0], decimals);
                    })
                    .each(function () {
                        if ($(this).hasClass("not-specified")) {
                            $(this).width($(this).width() - 25);
                            var na = $("<input id=\"" + $(this).attr("id") + "-notspecified\" type=\"checkbox\" style=\"float: left;\" />");
                            na.click(function () {
                                if ($(this).is(":checked")) {
                                    $(this).next("span").next("input").show();
                                    $(this).next("span").html("&nbsp;");
                                    $(this).next("span").next("input").focus();
                                }
                                else {
                                    $(this).next("span").next("input").hide();
                                    $(this).next("span").text("Not Specified").css("padding", "3px 0px");
                                }
                            });
                            $(this).before(na);

                            na.after("<span style=\"padding: 3px 0 0 0\">&nbsp;</span>");
                            if ($(this).val().length == 0) {
                                na.attr("checked", "");
                                na.next("span").text("Not Specified");
                                $(this).hide();
                            }
                            else
                                na.attr("checked", "true");
                        }
                    });
                if ($.datepicker) {
                    $((container ? container : "") + "input[type=\"text\"].datetime:not(.custom)")
                        .keydown(function () { return false; })
                        .datepicker({
                            dateFormat: "dd M yy",
                            buttonImage: SI_Window.applicationPath + "/Images/calendar.gif",
                            buttonImageOnly: true,
                            showOn: "both",
                            buttonText: "Open Calendar",
                            changeMonth: true,
                            changeYear: true,
                            constrainInput: true,
                            yearRange: "c-60:c+10",
                            showAnim: "",
                            beforeShow: function (txtbox, instance) {
                                var docViewTop = $(window).scrollTop();
                                var docViewBottom = docViewTop + $(window).height();
                                var docHeight = $(window).height();

                                var elemTop = $(txtbox).offset().top;
                                var elemBottom = elemTop + $(txtbox).height();
                                var elemHeight = $(txtbox).height();
                                if ((docHeight - elemBottom) <= 150) {
                                    instance.dpDiv.css({ marginTop: (-elemHeight + 14) + 'px' });
                                }
                                else {
                                    instance.dpDiv.css({ marginTop: '0px' });
                                }
                                instance.dpDiv.click(function (e) {
                                    e.stopPropagation();
                                });
                            },
                            onClose: function (txtbox, instance) {
                                if ($(this).val() == "")
                                    $(this).addClass("defaultValue");
                                else
                                    $(this).removeClass("defaultValue");
                            }
                        })
                        .each(function () {
                            if ($(this).hasClass("not-specified")) {
                                $(this).width($(this).width() - 25);
                                var na = $("<input id=\"" + $(this).attr("id") + "-notspecified\" type=\"checkbox\" style=\"float: left;\" />");
                                na.click(function () {
                                    if ($(this).is(":checked")) {
                                        $(this).next("span").next("input").show().next("img").show();
                                        $(this).next("span").html("&nbsp;");
                                        $(this).next("span").next("input").focus();
                                        $(this).next("span").css({ "width": 0, "padding": 0 });
                                    }
                                    else {
                                        $(this).next("span").next("input").hide().next("img").hide();
                                        $(this).next("span").text("Not Specified");
                                        $(this).next("span").css({ "width": "auto", "padding": "3px 0" });
                                    }
                                });
                                $(this).before(na);
                                na.after("<span style=\"padding: 3px 0; display:inline-block; float:left; width:auto;\">&nbsp;</span>");
                                if ($(this).val().length == 0) {
                                    na.attr("checked", "");
                                    na.next("span").text("Not Specified");
                                    $(this).next("img").hide();
                                    $(this).hide();
                                }
                                else
                                    na.attr("checked", "true");
                            }
                        });
                }

                if ($.fn.datetimepicker) {
                    $((container ? container : "") + "input[type=\"text\"].datetimeselect")
                        .keydown(function () { return false; })
                        .datetimepicker({
                            dateFormat: "dd M yy",
                            buttonImage: SI_Window.applicationPath + "/Images/calendar.gif",
                            buttonImageOnly: true,
                            showOn: "both",
                            buttonText: "Open Calendar",
                            changeMonth: true,
                            changeYear: true,
                            constrainInput: true,
                            yearRange: "c-60:c+10",
                            showAnim: "",
                            beforeShow: function (txtbox, instance) {
                                var docViewTop = $(window).scrollTop();
                                var docViewBottom = docViewTop + $(window).height();
                                var docHeight = $(window).height();

                                var elemTop = $(txtbox).offset().top;
                                var elemBottom = elemTop + $(txtbox).height();
                                var elemHeight = $(txtbox).height();
                                if ((docHeight - elemBottom) <= 150) {
                                    instance.dpDiv.css({ marginTop: (-elemHeight + 14) + 'px' });
                                }
                                else {
                                    instance.dpDiv.css({ marginTop: '0px' });
                                }
                            }
                        });
                }

                var AjaxUpload = function (fileElement, uploadUrl, delegate) {
                    $.ajaxFileUpload({
                        url: uploadUrl,
                        secureuri: false,
                        fileElementId: fileElement,
                        dataType: "json",
                        success: function (result) {
                            if (delegate) delegate(result);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            if (delegate) delegate();
                        }
                    });
                };

                var RenderAjaxUpload = function (element) {
                    var uploadRoot = checkForApproot() ? appRoot : "../../..";
                    var container = $("<span id=\"" + element.attr("id") + "_container\" class=\"ajaxUpload-container-parent\"></span>");
                    container.append("<span class=\"ajaxUpload-container\"></span>");
                    var button = $("<a id=\"" + element.attr("id") + "_button\" href=\"javascript:void(0);\" class=\"Buttons ajaxUpload-button\">Upload File</a>");
                    var file = $("<input id=\"" + element.attr("id") + "_file\" type=\"file\" class=\"ajaxUpload-file\" name=\"ajaxfile\"/>");
                    file.fadeTo(0, 0);
                    var hidden = $("<input type=\"hidden\" id=\"" + element.attr("id") + "_hidden\" name=\"" + element.attr("id") + "_hidden\" value=\"" + element.val() + "\"/>");
                    var changeEvent = $.data(element[0], "upload") ? $.data(element[0], "upload").changeEvent : null;

                    container.find("span").append(button);
                    container.find("span").append(file);
                    container.find("span").append(hidden);

                    if (hidden.val() != "")
                        container.addClass("hasfile");

                    element.outerHTML(container.outerHTML());

                    button = $("#" + button.attr("id"));
                    file = $("#" + file.attr("id"));
                    hidden = $("#" + hidden.attr("id"));

                    if (hidden.val() != "") {
                        $("#" + button.attr("id")).hide();
                        $("#" + file.attr("id")).hide();
                        var text = $("#" + hidden.attr("id")).val().split("|")[0];
                        if (text.length > 15)
                            text = text.substring(0, 15) + "...";
                        var anchor = $("<a href=\"" + uploadRoot + "/Pages/download_file.aspx?fileurl=" + $("#" + hidden.attr("id")).val().split("|")[1] + "&filename=" + $("#" + hidden.attr("id")).val().split("|")[0] + "\" target=\"_blank\" class=\"attachment ajaxUpload-attachment\" title=\"" + $("#" + hidden.attr("id")).val().split("|")[0] + "\">" + text + "</a>");
                        $(anchor).hover(function (event) { event.stopPropagation(); });
                        $("#" + hidden.attr("id")).parent().after(anchor);
                        var clear = $("<a href=\"javascript:void(0);\" class=\"attachment ajaxUpload-clearAttachment\" title=\"Clear File\">-</a>");
                        $(clear).hover(function (event) { event.stopPropagation(); });
                        $(clear).click(function (event) {
                            if (confirm("Are you sure you want to clear this file?")) {
                                $(this).trigger("click.custom");
                                $(anchor).remove();
                                $(this).remove();
                                $("#" + hidden.attr("id")).val("");
                                $("#" + button.attr("id")).show();
                                $("#" + file.attr("id")).show();
                                element.removeClass("hasfile");
                                if (changeEvent)
                                    changeEvent();
                            }
                            event.stopPropagation();
                        });
                        $(anchor).after(clear);
                    }

                    file.unbind("click");
                    file.unbind("change");
                    var uploadCount = 0;

                    file.click(function () {
                        $(this).one(
                            "change",
                            function () {
                                if (uploadCount == 0) {
                                    element.addClass("hasfile");
                                    uploadCount++;
                                    $(this).parent().append("<img src=\"" + SI_Window.applicationPath + "/Images/ajax-loader.gif\" style=\"position:absolute\" /><span class=\"errormessage\" style=\"display:inline-block; padding:3px 3px 3px 20px;\">Uploading file...</span>");
                                    $(this).parent().find("input").hide();
                                    $(this).parent().parent().find("a").hide();
                                    var uploadParams = element.attr("uploadparameters") ? element.attr("uploadparameters") : "?fieldid=" + $(this).attr("id").split("_")[0] + "_" + $(this).attr("id").split("_")[1] + "";
                                    AjaxUpload(
                                        $(this).attr("id"),
                                        SI_Window.applicationPath + "/Pages/document_upload.aspx" + uploadParams,
                                        function (result) {
                                            var ctxParams = uploadParams;
                                            if (result && result.Name == "Error") {

                                                var stockElement = "<input type=\"text\" id=\"" + element.attr("id") + "\" name=\"" + element.attr("id") + "\" class=\"ajaxupload\" value uploadparameters=\"" + ctxParams + "\" />"
                                                $("#" + element.attr("id") + "_container").outerHTML(stockElement);
                                                RenderAjaxUpload($("#" + element.attr("id")));
                                                var msg = "Your File has not been uploaded" + "<br>" + result.Url;
                                                SI_Window.UI.ShowMessage(msg, null, null);
                                            }
                                            else {
                                                UI.AjaxCall({
                                                    Url: SI_Window.applicationPath + "/Pages/document_upload.aspx/Render_Attachment",
                                                    Data: { elementId: element.attr("id") },
                                                    Delegate: function (result) {
                                                        $("#" + element.attr("id") + "_container").outerHTML(result.d);
                                                        if (changeEvent) {
                                                            changeEvent({
                                                                Name: $(result.d).val().split("|")[0],
                                                                Url: $(result.d).val().split("|")[1]
                                                            });
                                                            $.data($("#" + element.attr("id"))[0], "upload", {
                                                                changeEvent: changeEvent
                                                            });
                                                        }
                                                        RenderAjaxUpload($("#" + element.attr("id")));
                                                    }
                                                });
                                            }
                                        }
                                    );
                                }
                                uploadCount++;
                            });
                    });
                    button.parent().hover(
                        function () {
                            button.addClass("ButtonsHover");
                        },
                        function () {
                            button.removeClass("ButtonsHover");
                        }
                    );
                };

                $((container ? container : "") + "input[type=\"text\"].ajaxupload").each(function () {
                    RenderAjaxUpload($(this));
                });
            });
        }

        $("#details").scroll(function () {
            $(".ui-datepicker").hide();
        });
    }
    catch (e) {

    }
};

TypeControls();

var _FORMATTING = function () {
    this.Dates = function (obj) {
        for (var p in obj) {
            var re = /\D{4}\((\d{13})\)/;
            if (typeof obj[p] === "string" && re.exec(obj[p])) {
                var m = re.exec(obj[p]);
                if (m)
                    obj[p] = new Date(parseInt(m[1]));
            }
            if (typeof obj[p] === "object") {
                obj[p] = this.Dates(obj[p]);
            }
        }
        return obj;
    };
};

var FORMATTING = new _FORMATTING();
