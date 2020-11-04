if (document.URL.match( /users/ ) && document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('prof-image-list');
    const createImageHTML = (blob) => {
      const imageElement = document.createElement('div');
      const blobImage = document.createElement('img');
      blobImage.setAttribute('class', "edit-prof-img");
      blobImage.setAttribute('src', blob);
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    };
    document.getElementById('user_image').addEventListener('change', function(e){
      const imageContent = document.getElementById('edit_prof_img');
      if (imageContent){
        imageContent.remove();
      }
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      createImageHTML(blob);
    });
  });
} else if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('restaurant-image-list');
    const createImageHTML = (blob) => {
      const imageElement = document.createElement('div');
      const blobImage = document.createElement('img');
      blobImage.setAttribute('class', "restaurant-img");
      blobImage.setAttribute('src', blob);
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    };
    document.getElementById('restaurant_image').addEventListener('change', function(e){
      const imageContent = document.querySelector('img');
      if (imageContent){
        imageContent.remove();
      }
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      createImageHTML(blob);
    });
  });
}