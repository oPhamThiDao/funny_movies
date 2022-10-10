// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"

import jquery from "jquery"
window.jQuery = jquery
window.$ = jquery

$(function(){
  $(".like-movie").click(function(e){
    reactionMovie("like", this);
  })

  $(".dislike-movie").click(function(e){
    reactionMovie("dislike", this);
  })

  function reactionMovie(status, e) {
    var target = $(e).closest(".movie-reaction");

    if (status === target.data("status")) {
      status = "none"
    }

    $.ajax({
      url: "reaction/" + target.data("id"),
      type: "PATCH",
      data: { "status": status },
      dataType: "json",
      beforeSend: function(xhr) {
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
      },
      success: function(result)
      {
        if (result.code === "ok") {
          target.data("status", status);
          target.find("button").removeClass("active");
          target.find(".like-movie i").text(` ${result.likes_count}`)
          target.find(".dislike-movie i").text(` ${result.dislikes_count}`)

          if (status != "none") {
            target.find(`.${status}-movie`).addClass("active")
          }
        }
      }
    });
  }
})
