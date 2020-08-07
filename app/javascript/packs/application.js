// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

require("bootstrap/dist/js/bootstrap")
require("@fortawesome/fontawesome-free/js/all")
require('jquery');
// カレンダー
require('flatpickr')
require('flatpickr/dist/l10n/ja')
import moment from 'moment'
import 'moment/locale/ja'
require("cropper/dist/cropper")
import Cropper from 'cropperjs';



document.addEventListener("turbolinks:load", () => {

  flatpickr.localize(flatpickr.l10ns.ja)
  // カレンダーの表示
  flatpickr('#start-time', {
    disableMobile: true,
    enableTime: true,
    minDate: "today",
    dateFormat: "Y-m-d H:i",
  })
  flatpickr('#end-time', {
    disableMobile: true,
    enableTime: true,
    minDate: "today",
    dateFormat: "Y-m-d H:i",
  })

  const searchWord = function () {
    let searchText = $(this).val().toLowerCase(),
      targetText;

    $('p.prefecture').each(function () {
      targetText = $(this).text().toLowerCase();

      if (targetText.indexOf(searchText) != -1) {

        $(this).parents('div.box30').removeClass('d-none');
      } else {
        $(this).parents('div.box30').addClass('d-none');
      }
    });
  };

  // searchWordの実行
  $('#search-text').on('input', searchWord);



  var fileName;
  // 画像ファイル選択後のプレビュー処理
  $('form').on('change', 'input[type="file"]', function (event) {
    var file = event.target.files[0];
    fileName = file.name;
    var reader = new FileReader();
    var $crop_area_box = $('#crop_area_box');
    // 画像ファイル以外の場合は何もしない
    if (file.type.indexOf('image') < 0) {
      return false;
    }
    debugger
    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function (file) {
      return function (event) {

        //既存のプレビューを削除
        $crop_area_box.empty();
        // .prevewの領域の中にロードした画像を表示するprofile_imageタグを追加
        $crop_area_box.append($('<img>').attr({
          src: event.target.result,
          id: "crop_profile_image",
          title: file.name
        }));
        // プレビュー処理に対して、クロップ出来る処理を初期化設定
        initCrop();
      };
    })(file);
    reader.readAsDataURL(file);
  });

  var cropper;

  function initCrop() {
    cropper = new Cropper(crop_profile_image, {
      dragMode: 'move', // 画像を動かす設定
      aspectRatio: 1 / 1, // 正方形やで！
      restore: false,
      guides: false,
      center: false,
      highlight: false,
      cropBoxMovable: true,
      cropBoxResizable: false,
      toggleDragModeOnDblclick: false,
      minCropBoxWidth: 300,
      minCropBoxHeight: 300,
      ready: function () {
        var croppable = true;
      }
    });
    // 初回表示時
    crop_profile_image.addEventListener('ready', function (e) {
      cropping(e);
    });
    // 画像をドラッグした際の処理
    crop_profile_image.addEventListener('cropend', function (e) {
      cropping(e);
    });
    // 画像を拡大・縮小した際の処理
    crop_profile_image.addEventListener('zoom', function (e) {
      cropping(e);
    });
  }

  // クロップ処理した画像をプレビュー領域に表示
  var croppedCanvas;

  function cropping(e) {
    croppedCanvas = cropper.getCroppedCanvas({
      width: 300,
      height: 300,
    });
    // `$('<img>'{src: croppedCanvas.toDataURL()});` 的に書きたかったけど、jQuery力が足りず・・・
    var croppedProfileImage = document.createElement('img');
    croppedProfileImage.src = croppedCanvas.toDataURL();
    // crop_preview.innerHTML = '';
    // crop_preview.appendChild(croppedprofile_image);
  }

  // Submit時に実行するPOST処理
  $('#submitBtn').on('click', function (event) {
    // クロップ後のファイルをblobに変換し、AjaxでForm送信
    croppedCanvas.toBlob(function (blob) {
      const fileOfBlob = new File([blob], fileName);
      var formData = new FormData();
      // `user[profile_image]` は `user` modelに定義した `mount_uploader :profileImage, profileImageUploader` のコト
      formData.append('user[profile_image]', fileOfBlob);
      // userのID取得
      const user_id = $('#user_id').val();
      $.ajax('/mypage', {
        method: "PATCH", // POSTの方が良いのかな？
        data: formData,
        processData: false, // 余計な事はせず、そのままSUBMITする設定？
        contentType: false,
        success: function (res) {
          // DOM操作にしたほうがいいのかな？その場合、アップロード後に実行するなどのポーリング処理的なサムシングが必要になりそう・・・
          // なので、とりあえず簡単に`location.reload`しちゃう
          location.reload();
        },
        error: function (res) {
          console.error('画像の投稿に失敗しました');
        }
      });
      // S3にアップロードするため画質を50%落とす
    });
  });

});