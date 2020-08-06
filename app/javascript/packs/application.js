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

// moment動作確認
// moment.locale('ja')
// console.log(moment().format('M月D日（dd）'))

// cropper 画像切り抜き
import Cropper from 'cropperjs';

document.addEventListener("turbolinks:load", () => {
  const image = document.getElementById('image');
  const cropper = new Cropper(image, {
    aspectRatio: 16 / 9,
    crop(event) {
      console.log(event.detail.x);
      console.log(event.detail.y);
      console.log(event.detail.width);
      console.log(event.detail.height);
      console.log(event.detail.rotate);
      console.log(event.detail.scaleX);
      console.log(event.detail.scaleY);
    },
  });

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
});