$.extend(true, window.App, {Views: {Common: {SortableList: {}}}})

class App.Views.Common.SortableList
  constructor: (@el) ->
    @update_url = @el.attr('data-sortable-list')
    @init_sortable()

  init_sortable: ->
    @el.sortable
      update: (e, ui) =>
        data = {
          positions: [],
          target: @parse_dom_id($(ui.item))
        }

        @el.find('li').each (index, element) =>
          el_id = @parse_dom_id($(element))
          data.positions.push({id: el_id, position: index})

        $.ajax
          type: 'PATCH'
          url: @update_url
          data: data
  
  parse_dom_id: (el) =>
    parts = el.attr('id').match(/[a-zAZ\-\_\d]+_(\d+)$/)
    parts[parts.length - 1]

$ ->
  $("[data-sortable-list]").each ->
    new App.Views.Common.SortableList($(this))