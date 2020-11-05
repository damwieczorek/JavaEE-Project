function calcPrice(x) {



    var koszt = document.getElementById('rentTime').value * parseFloat(x)

    var result = document.getElementById('result')
    result.innerHTML = "Całkowity koszt wypożyczenia: "+koszt.toFixed(2) + " zł"
};

function star(x) {
    if (0== 0) {
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

star2(x);


function setStar(x) {
    if (0 == 0) {
        var token = $('input[name="__RequestVerificationToken"]').val();
        var rating = {RatingValue: x, MovieId: '@Model.Id',UserId: '@User.Identity.GetUserId()',__RequestVerificationToken: token}
        $.ajax({
            type: "POST",
            data: rating,

            url: "",

            success: function (response) {
                location.reload();
            }
        });
    }

}
