$(document).on 'turbolinks:load', ->
    $('.tree-toggle').click ->
        $(this).find('i').toggleClass('fa-plus fa-minus')
        $(this).parent().children('ul.tree').toggle 200
        return