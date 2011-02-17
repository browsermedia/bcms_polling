function _ajax_request(url, data, callback, type, method) {
    if (jQuery.isFunction(data)) {
        callback = data;
        data = {};
    }

    data = (data ? data + "&" : "") + "authenticity_token=" + encodeURIComponent(AUTH_TOKEN);

    return jQuery.ajax({
        type: method,
        url: url,
        data: data,
        success: callback,
        dataType: type
    });
}

jQuery.extend({
    put: function(url, data, callback, type) {
        return _ajax_request(url, data, callback, type, 'PUT');
    },
    delete_: function(url, data, callback, type) {
        return _ajax_request(url, data, callback, type, 'DELETE');
    }
});

function showResults(id, add_return_link) {
    var pollUrl = '/polls/' + id + '/results?return=' + add_return_link;
    $('div#vote-' + id).load(pollUrl);
}

$(document).ready(function() {
    $('a.vote-this').click(function(eventObject) {
        $.put(eventObject.target);
        showResults($(this).attr('data-poll-id'), false);
        return false;
    });

    $('.show-results').click(function(eventObject) {
        showResults($(this).attr('data-poll-id'), true);
        return false;
    });

});
