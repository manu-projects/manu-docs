$(document).ready(function(){
    $(".outline-2").each(function(){
        var title = $(this).children("h2");
        var title_id_org = title.attr('id');
        var title_id_nuevo = title.clone()
            .text().toLowerCase()
            .replace(/ /gi, '-')
            .replace(/[\(\)]/gi, ''); // removemos los paréntesis para evitar errores

        title.attr('id', title_id_nuevo);
        var nav_title = $("a[href$='"+title_id_org+"']");
        nav_title.attr('href', '#'+title_id_nuevo);
    });

    $(".outline-3").each(function(){
        var title = $(this).children("h3");
        var title_id_org = title.attr('id');
        var title_id_nuevo = title.clone()
            .text().toLowerCase()
            .replace(/ /gi, '-')
            .replace(/[\(\)]/gi, ''); // removemos los paréntesis para evitar errores

        title.attr('id', title_id_nuevo);
        var nav_title = $("a[href$='"+title_id_org+"']");

        nav_title.attr('href', '#'+title_id_nuevo);
    });
});
