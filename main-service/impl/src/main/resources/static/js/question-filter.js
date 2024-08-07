$(document).ready(function () {
    window.page = 0;
    $('#prev-btn').prop('disabled', true);

    $('#prev-btn').on('click', function () {
        if (window.page === 1) {
            $('#prev-btn').prop('disabled', true);
        }
        window.page -= 1;
        update_stream();
    });

    $('#next-btn').on('click', function () {
        if (window.page === 0) {
            $('#prev-btn').prop('disabled', false);
        }
        window.page += 1;
        update_stream();
    });

    update_stream();

    $('#find-button').on('click', function () {
        window.page = 0;
        $('#prev-btn').prop('disabled', true);
        update_stream();
    });
});

function update_stream() {
    let options = '';
    options += 'page='+ window.page + '&size=10&'

    let search = $('#search').val();
    options += 'search=' + search + '&';
    if ($('#no-answers-checkbox').prop('checked')) {
        options += 'noAnswers=true&';
    }
    let show_first = $('#show-first input[type="radio"]:checked').val();
    options += 'showFirst=' + show_first + '&';

    let status = $('#status input[type="radio"]:checked').val();
    if (status !== 'all') {
        options += 'status=' + status + '&';
    }

    $('#selected-tags span').each(function () {
        let spanText = $(this).text();
        options += 'tags=' + spanText + '&'
    });

    $.getJSON("/questions/filter?" + options, function (response) {
        $('#questions-stream').empty();

        response.forEach(function (question) {
            $('#questions-stream').append(
                '<div class="question">' +
                    '<div class="question-stats">' +
                        '<span>' + question.countAnswers  + ' ответов</span><br>' +
                        '<span>' + question.views + ' просмотров </span><br>' +
                        '<span>' + question.createdDate + '</span><br>' +
                        '<span> Статус: ' + question.status + '</span>' +
                    '</div>' +
                    '<div class="question-info">' +
                        '<div style="color: royalblue">' +
                            '<a href="' + '/questions/' + question.id + '" style="text-decoration: none"><h3>' + question.title + '</h3></a>' +
                        '</div>' +
                        '<div id="tags-' + question.id + '">' +
                        '</div>' +
                        '<div class="question-author-info">' +
                        '<a href="/users/'+ question.author.id +'" class="user-link">' +
                            '<img src="' + question.author.profileImage + '" class="article-profile-mini-img">' +
                            '<span style="color:royalblue;">' + question.author.username + '</span>' +
                        '</a>' +
                        '</div>' +
                    '</div>' +
                '</div>'
            );

            question.tags.forEach(function (tag) {
                $('#tags-' + question.id).append('<span class="tag-style">' + tag.name + '</span>')
            });
        });
    });
}