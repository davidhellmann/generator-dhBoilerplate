<template>
  <h2>Hello World</h2>
  <div class="vue__inner">
    <p>
      {{ message }}
    </p>
  </div>
</template>

<style>

</style>

<script>
  export default{
    data(){
      return{
        message: 'hello vue'
      }
    }
  }
</script>
