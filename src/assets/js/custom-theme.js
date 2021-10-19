$(document).ready(function(){
    // $("img").each(function(){
    //     var path = $(this).attr('src');
    //     var image_name = path.split("/").pop();
    //     var new_path = "img/" + image_name;
	  //     $(this).attr('src', new_path);
    // });

    $(".outline-2").each(function(){
        var title = $(this).children("h2");
        var title_id_org = title.attr('id');
        var title_id_nuevo = title.clone()
            .text().toLowerCase()
            .replace(/[\s]/gi, '-')
            // removemos todos los caracteres que no sean alfanumericos
            .replace(/\`|\~|\!|\@|\#|\$|\%|\^|\&|\*|\(|\)|\+|\=|\[|\{|\]|\}|\||\\|\'|\<|\,|\.|\>|\?|\/|\""|\;|\:/g, '');
          // .replace(/[\(|\)|\"]/gi, ''); // removemos los paréntesis para evitar errores
        // cambiamos las referencias
        title.attr('id', title_id_nuevo);

        // cambiamos los hipervinculos del menu izquierdo
        var nav_title = $("a[href$='"+title_id_org+"']");
        nav_title.attr('href', '#'+title_id_nuevo);
    });

    $(".outline-3").each(function(){
        var title = $(this).children("h3");
        var title_id_org = title.attr('id');
        var title_id_nuevo = title.clone()
            .text().toLowerCase()
            .replace(/\s/gi, '-')
            // removemos todos los caracteres que no sean alfanumericos
            .replace(/\`|\~|\!|\@|\#|\$|\%|\^|\&|\*|\(|\)|\+|\=|\[|\{|\]|\}|\||\\|\'|\<|\,|\.|\>|\?|\/|\""|\;|\:/g, '');

        // cambiamos las referencias
        title.attr('id', title_id_nuevo);

        // cambiamos los hipervinculos del menu izquierdo
        var nav_title = $("a[href$='"+title_id_org+"']");
        nav_title.attr('href', '#'+title_id_nuevo);
    });

    var seccionNueva = "<span class='badge badge-new'>Nuevo</span>";
    var seccionActualizada = "<span class='badge badge-updated'>Actualizado</span>";
    var seccionPendiente= "<span class='badge badge-waiting'>Pendiente</span>";
    var seccionDesarrollando= "<span class='badge badge-doing'>Desarrollando</span>";

    var item = $('h2[id$="-documentado"]').parent().find("ul li");

    item.html(function(buscayreemplaza, reemplaza) { // reemplazamos
        return reemplaza.replace(/\[NUEVO\]/g, seccionNueva);
    });

    item.html(function(buscayreemplaza, reemplaza) { // reemplazamos
        return reemplaza.replace(/\[ACTUALIZADO\]/g, seccionActualizada);
    });

    item.html(function(buscayreemplaza, reemplaza) { // reemplazamos
        return reemplaza.replace(/\[PENDIENTE\]/g, seccionPendiente);
    });

    item.html(function(buscayreemplaza, reemplaza) { // reemplazamos
        return reemplaza.replace(/\[DESARROLLANDO\]/g, seccionDesarrollando);
    });

    /**********************************************************************************/

    // para evitar agregar el icono de extern link
    if ( window.location.pathname == '/' ){
        $("a").addClass("internal-link");

    } else {
    }
});
