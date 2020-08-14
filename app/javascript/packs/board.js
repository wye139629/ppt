import TurbolinksAdapter from 'vue-turbolinks';
import Vue from 'vue/dist/vue.esm';
import Board from '../componets/board.vue';

Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  // const app = 
  let el = document.querySelector('#board')
  if(el){
    new Vue({
      el,
      // data: () => {
      //   return {
      //     message: "Can you say hello?"
      //   }
      // },
      components: { Board }
    })
  }
  


})