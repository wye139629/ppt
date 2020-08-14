// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>


import { Controller } from "stimulus"
// import ax from 'axios';
import Rails from '@rails/ujs'; 

export default class extends Controller {
  static targets = ['heart']

  favorite(){
    let board_id = this.data.get("board")

    Rails.ajax({
      url: `/boards/${board_id}/favorite.json`,
      type: 'post',
      success: (result)=>{
        console.log(result);
        if (result["status"] == true){
            this.heartTarget.classList.remove('far')
            this.heartTarget.classList.add('fas')
          }else{
            this.heartTarget.classList.remove('fas')
            this.heartTarget.classList.add('far')
          }
      },
      error: (err) =>{
        console.log(err);
      }
    })



    // const token = document.querySelector('meta[name=csrf-token]').content
    // ax.defaults.headers.common[`X-CSRF-Token`] = token

    // ax.post(`/boards/${board_id}/favorite.json`)
    //   .then((result)=>{
    //     // console.log(result)
    //     if (result.data["status"] == true){
    //       this.heartTarget.classList.remove('far')
    //       this.heartTarget.classList.add('fas')
    //     }else{
    //       this.heartTarget.classList.remove('fas')
    //       this.heartTarget.classList.add('far')
    //     }
    //   })
    //   .catch(function(error){
    //     console.log(error)
    //   })
    
    
  }
  // connect() {
  //   console.log('hi')
  // }
}
