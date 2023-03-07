import { createWebHashHistory, createRouter } from "vue-router";

import dashboard from './Components/dashboard.vue';
import searchComponent from './Components/searchComponent.vue';

const routes = [
    {
        path: '/',
        name: 'Search',
        component: searchComponent
    },
    {
        path: '/dashboard',
        name: 'Dashboard',
        component: dashboard
    }
];

const router = createRouter({
    history: createWebHashHistory(),
    routes
});

export default router;