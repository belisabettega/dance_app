import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Shall we dance?"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };