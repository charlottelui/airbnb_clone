import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Reduce  Reuse  Recycle 🌍"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };

