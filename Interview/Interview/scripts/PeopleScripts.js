
function AjaxCall(params) {
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
                        for (var i = 1; i < messageArr.length; i++) {
                            ResponseMessage = ResponseMessage + messageArr[i];
                        }
                    }
                }
            }
        });
    }
    execute(params);
};

function PageData(CurrentPage, TotalPages, People, Search) {
    this.CurrentPage = CurrentPage;
    this.TotalPages = TotalPages;
    this.People = People;
    this.Search = Search;
    PageData.prototype.CreatePage = function () {
        AjaxCall({
            Url: window.top.SI_Window.applicationPath + "/People.aspx/GetPeople",
            Data: Page,
            Delegate: function (result) {
                Page.People = [];
                var data = JSON.parse(result.d);
                if (data.length > 0) {
                    Page.TotalPages = data[0].Total_Pages;
                    data.forEach(person => {
                        Page.People.push(new Person(person.ID, person.Name, person.Surname, person.Age, person.PeopleHobbies));
                    });

                }
                else {
                    Page.TotalPages = 1;
                    if (Page.CurrentPage != 1) {
                        Page.CurrentPage = 1;
                        Page.CreatePage();
                    }

                }
                Page.LoadTablePeople();
            }
        });
    }

    PageData.prototype.LoadTablePeople = function LoadTablePeople() {
        $('#tbl-people tbody').empty();
        Page.People.forEach(person => {
            $('#tbl-people tbody').append(person.BuildRow());
        });

        $('#currPage').text(Page.CurrentPage + ' of ' + Page.TotalPages);
        if (Page.CurrentPage >= Page.TotalPages) {
            $('#btn-next').fadeOut();
        }
        else {
            $('#btn-next').fadeIn();
        }
        if (Page.CurrentPage <= 1) {
            $('#btn-prev').fadeOut();
        }
        else {
            $('#btn-prev').fadeIn();
        }
    }

    PageData.prototype.setUpdateData = function (data) {
        $('#UpdateUser #updateId').val(Page.People.filter(f => f.ID == data)[0].ID);
        $('#UpdateUser #updateName').val(Page.People.filter(f => f.ID == data)[0].Name);
        $('#UpdateUser #updateAge').val(Page.People.filter(f => f.ID == data)[0].Age);
    }
   

    PageData.prototype.Insert = function () {
        var person = new Person();
        person.Name = $('#InsertUser #insertName').val();
        person.Surname = $('#InsertUser #insertSurname').val();
        person.Age = parseInt($('#InsertUser #insertAge').val());
        if (Validate(person.Name, person.Age, person.Surname)) {
            
            AjaxCall({
                Url: window.top.SI_Window.applicationPath + "/People.aspx/InsertPerson",
                Data: person,
                Delegate: function (result) {
                    Page.CreatePage();
                }
            });
        } 
    }

    PageData.prototype.Update = function () {
        var person = new Person();
        person.Name = $('#UpdateUser #updateName').val();
        person.Age = $('#UpdateUser #updateAge').val();
        person.ID = parseInt($('#UpdateUser #updateId').val());
        if (Validate(person.Name, person.Age)) {

            AjaxCall({
                Url: window.top.SI_Window.applicationPath + "/People.aspx/UpdatePerson",
                Data: person,
                Delegate: function (result) {
                    Page.CreatePage();
                }
            });
        }
    }

    PageData.prototype.Delete = function () {
        var person = new Person();
        person.ID = parseInt($('#UpdateUser #updateId').val());

        AjaxCall({
            Url: window.top.SI_Window.applicationPath + "/People.aspx/DeletePerson",
            Data: person,
            Delegate: function (result) {
                Page.CreatePage();
            }
        });
    }
}

function Person(ID, Name, Surname, Age, Hobbies) {
    this.ID = ID;
    this.Name = Name;
    this.Surname = Surname;
    this.Age = Age;
    this.Hobbies = Hobbies;
    Person.prototype.BuildRow = function () {
        var tr = $('<tr></tr>');
        tr.append($('<td>' + this.Name + '</td>'));
        tr.append($('<td>' + this.Surname + '</td>'));
        tr.append($('<td>' + this.Hobbies + '</td>'));
        tr.append($('<td><button onclick="$(\'#UpdateUser\').slideToggle();Page.setUpdateData(' + this.ID + ');">Open</button></td>'));
        return tr;
    }
} 
function Search(value) {
    Page.Search = value;
    Page.CreatePage();
}
function Validate(Name, Age, Surname = null) {
    if (isNaN((Age))) {
        alert("Age must be an integer!");
        return false;
    }
    if (Name.length < 3) {
        alert("Length of Name must be more than 3 characters!");
        return false;
    }
    if (Surname != null && Surname.length < 3) {
        alert("Length of surname must be more than 3 characters!");
        return false;
    }
    return true;
}