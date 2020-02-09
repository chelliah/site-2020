import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home'
import MyWork from './views/MyWork'
import About from './views/About'

Vue.use(Router)

export const routes = [
  {
    path: '/',
    name: 'home',
    className: 'home',
    component: Home,
    props: {
      label: 'Home'
    }
  },
  {
    path: '/about',
    name: 'about',
    className: 'about',
    component: About,
    props: {
      label: 'About'
    }
  },
  {
    path: '/my-work',
    name: 'my-work',
    className: 'my-work',
    component: MyWork,
    props: {
      label: 'My Work'
    }
  },
]

export default new Router({
  routes
})
