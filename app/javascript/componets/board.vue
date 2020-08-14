<template>
  <div>
    <ul>
      <li v-for='board in boards'>
        {{board.title}}
      </li>
    </ul>
  </div>
</template>

<script>
import rails from '@rails/ujs';
export default {
  data: function(){
    return{
      boards:[],
    }
  },
  beforeCreate: function(){
    rails.ajax({
      url:'/api/v2/boards.json',
      type:'GET',
      success:(data)=>{
        this.boards = data;
      },
      error:(error)=>{}
    });
  },
}
</script>