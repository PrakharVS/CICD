// Typing animation
const text = "Prakhar Vikram Singh";
let i = 0;
function typeEffect() {
  if (i < text.length) {
    document.getElementById("typing-text").textContent += text.charAt(i);
    i++;
    setTimeout(typeEffect, 100);
  }
}
window.onload = () => {
  document.getElementById("typing-text").textContent = "";
  typeEffect();
};

// Scroll to top button
const scrollTopBtn = document.getElementById("scrollTopBtn");
window.onscroll = function () {
  if (document.documentElement.scrollTop > 200) {
    scrollTopBtn.style.display = "block";
  } else {
    scrollTopBtn.style.display = "none";
  }
};
scrollTopBtn.addEventListener("click", () => {
  window.scrollTo({ top: 0, behavior: "smooth" });
});
