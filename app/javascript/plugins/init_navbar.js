const initNavbar = () => {
  window.onscroll = function() {scrollFunction()};

  const navbar = document.querySelector(".navbar");
  const burger = document.querySelector("#navbarDropdown");
  const dropdown = document.querySelector(".dropdown-menu");
  const navLogo = document.querySelector("#nav-logo")

  function scrollFunction() {
    if (document.body.scrollTop > 80 || document.documentElement.scrollTop > 80) {
      navbar.style.height = "50px";
      navbar.style.opacity = "0.8";
      burger.style.height = "40px";
      burger.style.width = "40px";
      dropdown.style.margin = "22px 0px 0px -16px";
      navLogo.style.fontSize = "27px";
      navbar.classList.add("transition")
      burger.classList.add("transition")
      dropdown.classList.add("transition")
      navLogo.classList.add("transition")
    } else {
      navbar.style.height = "60px";
      burger.style.height = "45px";
      burger.style.width = "45px";
      navbar.style.opacity = "1";
      dropdown.style.margin = "32px 0px 0px -16px";
      navLogo.style.fontSize = "35px";
    }
  }
};

export { initNavbar };
