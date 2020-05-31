# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


  $(document).on 'ready page:load', ->
    $('#tag_list1').tagit()
      # singleField: true,
      # availableTags: myProject.all_tag_list

  $(document).on 'ready page:load', ->
    $('#tag_list2').tagit()
      # singleField: true,
      # availableTags: myProject.all_tag_list
