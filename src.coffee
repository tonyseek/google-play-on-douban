ICON_URL = "http://developer.android.com/images/brand/en_app_rgb_wo_60.png"

extract_play_url = (callback) =>
  edit_url = $(".th-modify a").attr("href")

  $.get edit_url, source: "userscript", (response) =>
    parent = $("<html>").html(response) # fake element
    play_url = parent.find(".desc-item-app_url .value").text().trim()
    callback?(play_url)

$ =>
  extract_play_url (play_url) =>

    if not play_url then return

    play_icon = $("<i>").css
      background: "url('#{ICON_URL}') no-repeat 0 0"
      width: "172px"
      height: "60px"
      display: "block"
      margin: "0 0 20px 0"

    download_channel = $("<a>").insertBefore($(".download-channel"))
    download_channel.append(play_icon).attr
      href: play_url
      target: "_blank"
      rel: "nofollow"
