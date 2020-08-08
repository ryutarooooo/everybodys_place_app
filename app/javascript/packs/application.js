// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
// require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

require("bootstrap/dist/js/bootstrap")
require("@fortawesome/fontawesome-free/js/all")

// カレンダー
require('flatpickr')
require('flatpickr/dist/l10n/ja')
import moment from 'moment'
import 'moment/locale/ja'
require("cropper/dist/cropper")
import Cropper from 'cropperjs';



window.addEventListener('DOMContentLoaded', () => {
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


  var avatar = document.getElementById('avatar');
  if (avatar) {
    var image = document.getElementById('image');
    var input = document.getElementById('input');
    var $progress = $('.progress');
    var $progressBar = $('.progress-bar');
    var $alert = $('.alert');
    var $modal = $('#modal');
    var cropper;

    $('[data-toggle="tooltip"]').tooltip();

    input.addEventListener('change', function (e) {
      var files = e.target.files;
      var done = function (url) {
        input.value = '';
        image.src = url;
        $alert.hide();
        $modal.modal('show');
      };
      var reader;
      var file;
      var url;

      if (files && files.length > 0) {
        file = files[0];

        if (URL) {
          done(URL.createObjectURL(file));
        } else if (FileReader) {
          reader = new FileReader();
          reader.onload = function (e) {
            done(reader.result);
          };
          reader.readAsDataURL(file);
        }
      }
    });

    $modal.on('shown.bs.modal', function () {
      cropper = new Cropper(image, {
        aspectRatio: 1,
        viewMode: 3,
      });
    }).on('hidden.bs.modal', function () {
      cropper.destroy();
      cropper = null;
    });

    document.getElementById('crop').addEventListener('click', function () {
      var initialAvatarURL;
      var canvas;

      $modal.modal('hide');

      if (cropper) {
        canvas = cropper.getCroppedCanvas({
          width: 160,
          height: 160,
        });
        initialAvatarURL = avatar.src;
        avatar.src = canvas.toDataURL();
        $progress.show();
        $alert.removeClass('alert-success alert-warning');
        canvas.toBlob(function (blob) {
          var formData = new FormData();

          formData.append('user[profile_image]', blob, 'avatar.jpg');
          $.ajax('/mypage', {
            method: 'PATCH',
            data: formData,
            processData: false,
            contentType: false,

            xhr: function () {
              var xhr = new XMLHttpRequest();

              xhr.upload.onprogress = function (e) {
                var percent = '0';
                var percentage = '0%';

                if (e.lengthComputable) {
                  percent = Math.round((e.loaded / e.total) * 100);
                  percentage = percent + '%';
                  $progressBar.width(percentage).attr('aria-valuenow', percent).text(percentage);
                }
              };

              return xhr;
            },

            success: function () {
              $alert.show().addClass('alert-success').text('保存しました');
            },

            error: function () {
              avatar.src = initialAvatarURL;
              $alert.show().addClass('alert-warning').text('保存に失敗しました');
            },

            complete: function () {
              $progress.hide();
            },
          });
        });
      }
    });
  }

  const mension = document.getElementById("mention")
  document.querySelectorAll(".box-name").forEach(boxName => {
    boxName.addEventListener("click", e => {
      const name = e.target.innerText
      const userId = e.target.dataset.user_id
      mension.value = `@${name}`;
      

    })
  })










  // var fileName;
  // // 画像ファイル選択後のプレビュー処理
  // $('form').on('change', 'input[type="file"]', function (event) {
  //   var file = event.target.files[0];
  //   fileName = file.name;
  //   var reader = new FileReader();
  //   var $crop_area_box = $('#crop_area_box');
  //   // 画像ファイル以外の場合は何もしない
  //   if (file.type.indexOf('image') < 0) {
  //     return false;
  //   }
  //   // ファイル読み込みが完了した際のイベント登録
  //   reader.onload = (function (file) {
  //     return function (event) {

  //       //既存のプレビューを削除
  //       $crop_area_box.empty();
  //       // .prevewの領域の中にロードした画像を表示するprofile_imageタグを追加
  //       $crop_area_box.append($('<img>').attr({
  //         src: event.target.result,
  //         id: "crop_profile_image",
  //         title: file.name
  //       }));
  //       // プレビュー処理に対して、クロップ出来る処理を初期化設定
  //       initCrop();
  //     };
  //   })(file);
  //   reader.readAsDataURL(file);
  // });

  // var cropper;

  // function initCrop() {
  //   cropper = new Cropper(crop_profile_image, {
  //     dragMode: 'move', // 画像を動かす設定
  //     aspectRatio: 1 / 1, // 正方形やで！
  //     restore: false,
  //     guides: false,
  //     center: false,
  //     highlight: false,
  //     cropBoxMovable: true,
  //     cropBoxResizable: false,
  //     toggleDragModeOnDblclick: false,
  //     minCropBoxWidth: 150,
  //     minCropBoxHeight: 150,
  //     ready: function () {
  //       var croppable = true;
  //     }
  //   });
  //   // 初回表示時
  //   crop_profile_image.addEventListener('ready', function (e) {
  //     cropping(e);
  //   });
  //   // 画像をドラッグした際の処理
  //   crop_profile_image.addEventListener('cropend', function (e) {
  //     cropping(e);
  //   });
  //   // 画像を拡大・縮小した際の処理
  //   crop_profile_image.addEventListener('zoom', function (e) {
  //     cropping(e);
  //   });
  // }

  // // クロップ処理した画像をプレビュー領域に表示
  // var croppedCanvas;

  // function cropping(e) {
  //   croppedCanvas = cropper.getCroppedCanvas({
  //     width: 300,
  //     height: 300,
  //   });
  //   // `$('<img>'{src: croppedCanvas.toDataURL()});` 的に書きたかったけど、jQuery力が足りず・・・
  //   var croppedProfileImage = document.createElement('img');
  //   croppedProfileImage.src = croppedCanvas.toDataURL();
  //   // crop_preview.innerHTML = '';
  //   // crop_preview.appendChild(croppedprofile_image);
  // }

  // // Submit時に実行するPOST処理
  // $('#submitBtn').on('click', function (event) {
  //   // クロップ後のファイルをblobに変換し、AjaxでForm送信
  //   croppedCanvas.toBlob(function (blob) {
  //     const fileOfBlob = new File([blob], fileName);
  //     var formData = new FormData();
  //     // `user[profile_image]` は `user` modelに定義した `mount_uploader :profileImage, profileImageUploader` のコト
  //     formData.append('user[profile_image]', fileOfBlob);
  //     $.ajax({
  //       url: '/mypage',
  //       type: "patch", // POSTの方が良いのかな？
  //       data: formData,
  //       processData: false, // 余計な事はせず、そのままSUBMITする設定？
  //       contentType: false,
  //     })
  //     // .done(
  //     //   () => alert("success")
  //     // ).fail(
  //     //   () => alert("error")
  //     // );
  //   });
  // });
});