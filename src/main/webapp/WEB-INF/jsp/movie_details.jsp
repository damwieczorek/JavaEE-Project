<%--
  Created by IntelliJ IDEA.
  User: Damiano
  Date: 17.02.2020
  Time: 20:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
@model ProjekcikASP.Models.Movies
@using Microsoft.AspNet.Identity;
@{
var rating = 0;
if (ViewBag.rating.Count != 0)
{
rating = ViewBag.rating[0].RatingValue;
}

}
@{
ViewBag.Title = Model.MovieName;
}
<script src="https://kit.fontawesome.com/5a29b017d2.js" crossorigin="anonymous"></script>

<div class="card mb-3">
    <iframe class="card-img-top" width="800" height="415" src="@Model.MovieTrailer" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    <h2 class="card-header">@Model.MovieName</h2>
    <div class="card-body">
        <img class="rounded float-left mr-2" style="width:30%; max-height:40%;" src="@Model.MoviePhoto">
        <p class="card-text">@Model.MovieDescription</p>
        <hr />

        <p class="card-text"><a class="text-muted">Reżyseria: </a>@Model.MovieDirector</p>
        <p class="card-text"><a class="text-muted">Gatunek: </a>@Model.Category.Category</p>
        <p class="card-text "><a class="text-muted">Produkcja: </a>@Model.MovieOriginCountry</p>
        <p class="card-text "><a class="text-muted">Premiera: </a>@Model.MovieRealiseDate</p>
        <p class="card-text "><a class="text-muted">Cena: </a>@Model.MovieRentPrice zł/24h</p>


        <div>

            <span class="fa fa-star checked" onmouseover="star(1)" onclick="setStar(1)" onmouseout="delMsg()"></span>
            <span class="fa fa-star" onmouseover="star(2)" onclick="setStar(2)" onmouseout="delMsg()"></span>
            <span class="fa fa-star" onmouseover="star(3)" onclick="setStar(3)" onmouseout="delMsg()"></span>
            <span class="fa fa-star" onmouseover="star(4)" onclick="setStar(4)" onmouseout="delMsg()"></span>
            <span class="fa fa-star" onmouseover="star(5)" onclick="setStar(5)" onmouseout="delMsg()"></span>
            <span class="badge badge-success" id="ratingMsg"></span>
            <br />
            <p class="text-muted">Średnia ocena: <strong> @ViewBag.avg (@ViewBag.allRatings)</strong></p>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="rent">Wypożycz</button>
            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Ustal okres wypożyczenia filmu</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        @using (Html.BeginForm("Create", "RentHistories"))
                        {
                        @Html.AntiForgeryToken()
                        <div class="modal-body">

                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">Okres wypożyczenia(w dniach)</label>
                                <input type="number" class="form-control" id="RentTime" name="RentTime">
                                <input type="hidden" value="@Model.Id" name="MovieId" />
                                <input type="hidden" value="@User.Identity.GetUserId()" name="UserId" />
                                <p class="text-muted" id="result"></p>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Anuluj</button>
                            <input type="submit" value="Akceptuj" class="btn btn-success" />
                        </div>
                        }
                    </div>
                </div>
            </div>

        </div>

    </div>
    @if (User.IsInRole("Admin"))
    {
    <p>
        @Html.ActionLink("Edit", "Edit", new { id = Model.Id }) |
        @Html.ActionLink("Back to List", "Index")
    </p>
    }
    <div id="comments" class="container mb-2">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col">
                        @using (Html.BeginForm("CreateComment", "Movies"))
                        {
                        @Html.AntiForgeryToken()

                        <div class="form-horizontal">
                            <h4>Komentarze</h4>

                            <input type="hidden" value="@Model.Id" name="MovieId" />
                            <input type="hidden" value="@User.Identity.GetUserId()" name="UserId" />

                            <div class="form-group">
                                <textarea class="form-control" id="exampleFormControlTextarea1" name="Comment" rows="5" style="max-width:unset;"></textarea>

                                <input type="submit" value="Dodaj" class="btn btn-primary mt-1 float-right" />

                            </div>

                        </div>
                        }
                    </div>
                </div>
                <hr />
                @foreach (var comment in Model.Comments)
                {
                <div class="row">
                    <div class="col">
                        <p class="card-title"> <span class="badge badge-pill badge-primary"> @comment.User.UserName</span></p>
                        <p class="card-text"> @comment.Comment </p>
                        @if (User.IsInRole("Admin"))
                        {
                        @Html.ActionLink("Delete", "Delete", "Comments", new { id = comment.Id }, null)
                        }
                    </div>
                </div>
                <hr />
                }
            </div>
        </div>
    </div>

</div>






<script>
    document.getElementById("RentTime").onchange = function () {

        var x = '@Model.MovieRentPrice';
        x = x.replace(/,/g, '.');
        var koszt = this.value * parseFloat(x)

        var result = document.getElementById('result')
        result.innerHTML = "Całkowity koszt wypożyczenia: "+koszt.toFixed(2) + " zł"
    };

    function star(x) {
        if (@rating == 0) {
            var stars = document.getElementsByClassName('fa');
            for (var i = 0; i < 5; i++) {
                stars[i].classList.remove('checked')
            }
            for (var i = 0; i < x; i++) {
                stars[i].classList.add('checked')
            }
            var msg = document.getElementById('ratingMsg');
            switch (x) {
                case 1:
                    msg.innerHTML = 'Porażka'
                    break;
                case 2:
                    msg.innerHTML = 'Może być'
                    break;
                case 3:
                    msg.innerHTML = 'Średni'
                    break;
                case 4:
                    msg.innerHTML = 'Dobry'
                    break;
                case 5:
                    msg.innerHTML = 'Wyborny'
                    break;
            }
        }
    }
    function delMsg() {
        document.getElementById('ratingMsg').innerHTML = '';
    }
    function star2(x) {
        var stars = document.getElementsByClassName('fa');
        for (var i = 0; i < 5; i++) {
            stars[i].classList.remove('checked')
        }
        for (var i = 0; i < x; i++) {
            stars[i].classList.add('checked')
        }
        var msg = document.getElementById('ratingMsg');
        switch (x) {
            case 1:
                document.getElementsByClassName('badge').classList.remove('badge-success')
                document.getElementsByClassName('badge').classList.add('badge-danger')
                msg.innerHTML = 'Porażka'
                break;
            case 2:
                msg.innerHTML = 'Może być'
                break;
            case 3:
                msg.innerHTML = 'Średni'
                break;
            case 4:
                msg.innerHTML = 'Dobry'
                break;
            case 5:
                msg.innerHTML = 'Wyborny'
                break;
        }
    }

    star2(@rating);


    function setStar(x) {
        if (@rating == 0) {
            var token = $('input[name="__RequestVerificationToken"]').val();
            var rating = {RatingValue: x, MovieId: '@Model.Id',UserId: '@User.Identity.GetUserId()',__RequestVerificationToken: token}
            $.ajax({
                type: "POST",
                data: rating,

                url: "@Url.Action("AddRatingMovie", "Ratings")",

                success: function (response) {
                    location.reload();
                }
            });
        }

    }


</script>
</body>
</html>
