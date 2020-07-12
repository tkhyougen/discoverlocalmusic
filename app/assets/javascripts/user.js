$(function() {
  function readURL(input) {
      if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
  $('#image_preview').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
      }
  }
  $("#user_image").change(function(){
      readURL(this);
  });
});

// ユーザー登録のコメントカウント
$(function(){
 $("#input-text").on("keyup", function() {
   let countNum = String($(this).val().length);
   $("#counter").text(countNum + "文字");
 });
});


// $(document).ready(
//   function(){
//   $('#wholikes_list').tagit
//     fieldName: 'localartist[tag_list]'
//     singleField: true
//   });
