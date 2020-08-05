module MovieHelper
  def movie(url)
    pattern = %r{\A.*/(?:watch\?)?(?:v=)?(?:feature=[a-z_]+&)?(?:v=)?([a-zA-Z0-9=_-]+)(?:&feature=[a-z_]*)?(?:\?t=[0-9]+)?\z}
    movie_id = url.match(pattern)[1]
    src = "https://www.youtube.com/embed/#{movie_id}"
    content_tag(
      :iframe,
      "",
      width: 560,
      height: 315,
      src: src,
      class: "youtube embed-responsive-item",
      frameborder: 0,
      allow: "accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture",
      allowfullscreen: true,
    )
  end
end
