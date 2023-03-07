import { createWebHashHistory, createRouter } from "vue-router";

import searchComponent from './Components/searchComponent.vue';

const routes = [
    {
        path: '/',
        name: 'Search',
        component: searchComponent
    }
];

const router = createRouter({
    history: createWebHashHistory(),
    routes
});

export default router;
