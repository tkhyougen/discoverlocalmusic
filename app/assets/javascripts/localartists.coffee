$(document).on 'ready page:load', ->
  $('#wholikes_list').tagit
    fieldName: 'localartist[tag_list]'
    singleField: true
    availableTags: gon.available_tags  #gon.available_tagsを候補として表示

  #編集時のタグ引継ぎ
  if gon.localartist_tags?
    for tag in gon.localartist_tags
      $('#wholikes_list').tagit 'createTag',tag
