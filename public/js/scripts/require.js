function require_template(templateName) {
    var tmpl_dir = 'js/template';
    var tmpl_url = tmpl_dir + '/' + templateName + '.tmpl';
    var tmpl_string = '';

    $.ajax({
        url: tmpl_url,
        method: 'GET',
        async: false,
        contentType: 'text',
        success: function (data) {
            tmpl_string = data;
        }
    });

    $('head').append( tmpl_string );
}

function require_js(templateName) {
    var tmpl_url = templateName;
    var tmpl_string = '';

    $.ajax({
        url: tmpl_url,
        method: 'GET',
        async: false,
        contentType: 'text',
        success: function (data) {
            tmpl_string = data;
        }
    });

    $('head').append('<script>' + tmpl_string + '<\/script>');
}