$(document).on 'ready page:load', ->
  $('#wholikes_list').tagit
    fieldName: 'localartist[tag_list]'
    singleField: true
    availableTags: gon.available_tags  #gon.available_tagsを入力候補として表示

  #edit時のタグ引継ぎ
  if gon.localartist_tags?
    for tag in gon.localartist_tags
      $('#wholikes_list').tagit 'createTag',tag
