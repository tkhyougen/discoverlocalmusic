
$(document).on 'ready page:load', ->
  $('#wholikes_list').tagit
    fieldName: 'localartist[tag_list]'
    singleField: true
    # availableTags: gon.available_tags

  if gon.localartist_tags?
    for tag in gon.localartist_tags
      $('#wholikes_list').tagit 'createTag',tag
