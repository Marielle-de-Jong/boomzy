const initScroll = () => {
  const scrollButton = document.querySelector("#scroll-button");
  if(scrollButton) {
    const scrollTarget = document.querySelector(scrollButton.dataset.location)
    scrollTarget.scrollIntoView({ behavior: 'smooth' })
  }
}

export { initScroll };
