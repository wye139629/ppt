<template>
  <div>
    <h1>{{ message }}</h1>
    <h2>{{message}}</h2>
    <Ad></Ad>
  </div>
</template>

<script>
import Ad from 'componets/ui/ad.vue';
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  },
  component:{ Ad }
}
</script>

<style scoped>
h1 {
  color:green;
  font-size: 2em;
  text-align: center;
}
</style>
