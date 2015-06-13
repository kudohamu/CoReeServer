$(function() {
  $("#cloth_icon").change(function(e) {
    if(e.target.files.length == 0) {
      $(".clothsNew__iconThumb img").attr({"src": ""});
      return;
    }
    var rc = this;
    var file = e.target.files[0];
    var reader = new FileReader();
    reader.onload = function(upload) {
      $(".clothsNew__iconThumb img").attr({"src": upload.target.result});
    };
    reader.readAsDataURL(file);
  });

  $("#big_category").change(function() {
    var index = $(this).prop("selectedIndex");

    var small_category = [];
    switch(index+1) {
      case 1:
        small_category = [
          "Tシャツ", 
          "シャツ",
          "ポロシャツ",
          "スウェット",
          "タンクトップ",
          "キャミソール"
        ];
        break;
      case 2:
        small_category = [
          "セーター",
          "ベスト",
          "パーカー",
          "カーディガン",
          "テーラード",
          "デニム",
          "ライダース",
          "ブルゾン",
          "ミリタリー",
          "ダウンベスト",
          "ダウンジャケット",
          "ダッフル",
          "ピー"
        ];
        break;
      case 3:
        small_category = [
          "デニム",
          "パンツ",
          "カーゴ",
          "チノ",
          "スラックス",
          "スキニー"
        ];
        break;
      case 4:
        small_category = [
          "スカート",
          "デニムスカート"
        ];
        break;
      case 5:
        small_category = [
          "ワンピース",
          "シャツワンピース",
          "チュニック",
          "ドレス"
        ];
        break;
      case 6:
        small_category = [
          "スニーカー",
          "サンダル",
          "ブーツ",
          "パンプス",
          "革靴"
        ];
        break;
      case 7:
        small_category = [
          "キャップ",
          "ハット",
          "ニット",
          "ベレー帽",
          "サンバイザー"
        ];
        break;
    }

    $("#cloth_small_category").html("");

    for(var i = 0; i < small_category.length; i++) {
      $("#cloth_small_category").append($("<option>").val(small_category[i]).text(small_category[i]));
    }
  });

  $("#cloth_color1").change(function() {
    var index = $(this).prop("selectedIndex");

    var colors = [
      "なし",
      "ホワイト系",
      "ブラック系",
      "グレー系",
      "ブラウン系",
      "ベージュ系",
      "グリーン系",
      "ブルー系",
      "パープル系",
      "イエロー系",
      "ピンク系",
      "レッド系",
      "オレンジ系",
      "シルバー系",
      "ゴールド系"
    ];

    $("#cloth_color2").html("");
    for(var i = 0; i < colors.length; i++) {
      if (index != i-1) {
        $("#cloth_color2").append($("<option>").val(colors[i]).text(colors[i]));
      }
    }
  });
})
