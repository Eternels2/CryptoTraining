import { Controller } from "stimulus"
import Swiper, { Navigation, Pagination, Autoplay } from 'swiper';

export default class extends Controller {
  // static targets = [ "output" ]

  connect() {
    console.log("swiper conected")
    const swiper = new Swiper('.swiper', {

      modules: [Navigation, Pagination, Autoplay],
      // Optional parameters
      loop: true,

      // If we need pagination
      // pagination: {
      //   el: '.swiper-pagination',
      // },

      // // Navigation arrows
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      autoplay: {
        delay: 2500,
      },

      // // And if we need scrollbar
      // scrollbar: {
      //   el: '.swiper-scrollbar',
      // },
    });
  }
}
