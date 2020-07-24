# # tag-it
$(document).on 'ready page:load', ->
  $('#user_tag_list').tagit
    fieldName: 'user[tag_list]'
    singleField: true
#
  if gon.user_tags?
    for tag in gon.user_tags
      $('#user_tag_list').tagit 'createTag',tag
