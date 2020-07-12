# # tag-it
$(document).on 'ready page:load', ->
  $('#user_tag_list').tagit
    fieldName: 'user[tag_list]'
    singleField: true
#
  if gon.user_tags?
    for tag in gon.user_tags
      $('#user_tag_list').tagit 'createTag',tag



# $(document).on 'ready page:load', ->
#   $('#tag_list2').tagit()
#
#
# $(document).on 'ready page:load', ->
#   $('#tag_list2').tagit
#     fieldName: 'user[userartist_list]'
#     singleField: true
