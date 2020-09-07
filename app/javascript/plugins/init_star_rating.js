import "jquery-bar-rating";
import $ from 'jquery'; // <-- if you're NOT using a Le Wagon template (cf jQuery section)

const initStarRating = () => {
  const starRating = document.querySelector("#review_rating")

  if (starRating) {
    $(starRating).barrating({
      theme: 'css-stars'
    });
  }
};

export { initStarRating };
