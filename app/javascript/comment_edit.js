function click() {
  const commentEditBtn = document.getElementById('comment-edit-btn');
  articles.forEach((article) => {
    article.addEventListener('click', () => {
      console.log("マウスオーバー");
    });
  });
}

window.addEventListener('load', click);