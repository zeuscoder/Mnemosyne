<script setup lang="ts">
import { RouterLink, RouterView } from 'vue-router'
import HelloWorld from './components/HelloWorld.vue'
import { userRequest } from '@/apis/api/user'
import { onMounted } from 'vue'

onMounted(() => {
  userRequest({}).then((res: any) => {
    console.log('res: ', res)
  })
})
// docker run -p 6379:6379 --name redis -v /root/zeus-project/Mnemosyne-project/redis:/data \
// -v /root/zeus-project/Mnemosyne-project/redis/conf/redis.conf:/etc/redis/redis.conf \
// -d redis redis-server /etc/redis/redis.conf

// docker run -p 3306:3306 --name mysql \
// -v /root/zeus-project/Mnemosyne-project/mysql/log:/var/log/mysql \
// -v /root/zeus-project/Mnemosyne-project/mysql/data:/var/lib/mysql \
// -v /root/zeus-project/Mnemosyne-project/mysql/conf:/etc/mysql \
// -e MYSQL_ROOT_PASSWORD=root \
// -d mysql:5.7

// docker run -p 3306:3306 --name mysql -v /root/zeus-project/Mnemosyne-project/mysql/conf:/etc/mysql/conf.d -v /root/zeus-project/Mnemosyne-project/mysql/log:/logs -v /root/zeus-project/Mnemosyne-project/mysql/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root -d mysql:5.7

</script>

<template>
  <header>
    <img alt="Vue logo" class="logo" src="@/assets/logo.svg" width="125" height="125" />

    <div class="wrapper">
      <HelloWorld msg="You did it!" />

      <nav>
        <RouterLink to="/">Home</RouterLink>
        <RouterLink to="/about">About</RouterLink>
      </nav>
    </div>
  </header>

  <RouterView />
</template>

<style scoped>
header {
  line-height: 1.5;
  max-height: 100vh;
}

.logo {
  display: block;
  margin: 0 auto 2rem;
}

nav {
  width: 100%;
  font-size: 12px;
  text-align: center;
  margin-top: 2rem;
}

nav a.router-link-exact-active {
  color: var(--color-text);
}

nav a.router-link-exact-active:hover {
  background-color: transparent;
}

nav a {
  display: inline-block;
  padding: 0 1rem;
  border-left: 1px solid var(--color-border);
}

nav a:first-of-type {
  border: 0;
}

@media (min-width: 1024px) {
  header {
    display: flex;
    place-items: center;
    padding-right: calc(var(--section-gap) / 2);
  }

  .logo {
    margin: 0 2rem 0 0;
  }

  header .wrapper {
    display: flex;
    place-items: flex-start;
    flex-wrap: wrap;
  }

  nav {
    text-align: left;
    margin-left: -1rem;
    font-size: 1rem;

    padding: 1rem 0;
    margin-top: 1rem;
  }
}
</style>
