
var sidebarEnhancer = {
    init: function () {
        this.cacheVars();
        this.insertSidebar();
        this.removeUnneededItems();
        this.getActive();
    },

    cacheVars: function () {
        this.sidebarString = String()
            + '<div id="nav" class="craft-sidebar-enhancer system-menu">'
            + '    <span class="site-name">'
            + '        <h2>System</h2>'
            + '    </span>'
            + '    <ul>'
            + '        <li><a href="' + Craft.baseCpUrl + '/settings/general" data-icon="general"><span class="label">General</span></a></li>'
            + '        <li><a href="' + Craft.baseCpUrl + '/settings/routes" data-icon="routes"><span class="label">Routes</span></a></li>'
            + '        <li><a href="' + Craft.baseCpUrl + '/settings/users" data-icon="users"><span class="label">Users</span></a></li>'
            + '        <li><a href="' + Craft.baseCpUrl + '/settings/email" data-icon="mail"><span class="label">Email</span></a></li>'
            + '        <li><a href="' + Craft.baseCpUrl + '/settings/plugins" data-icon="plugin"><span class="label">Plugins</span></a></li>'
            + '    </ul>'
            + '    <span class="site-name">'
            + '        <h2>Content</h2>'
            + '    </span>'
            + '    <ul>'
            + '        <li><a href="' + Craft.baseCpUrl + '/settings/fields" data-icon="field"><span class="label">Fields</span></a></li>'
            + '        <li><a href="' + Craft.baseCpUrl + '/settings/sections" data-icon="section"><span class="label">Sections</span></a></li>'
            + '        <li><a href="' + Craft.baseCpUrl + '/settings/assets" data-icon="assets"><span class="label">Assets</span></a></li>'
            + '        <li><a href="' + Craft.baseCpUrl + '/settings/globals" data-icon="globe"><span class="label">Globals</span></a></li>'
            + '        <li><a href="' + Craft.baseCpUrl + '/settings/categories" data-icon="categories"><span class="label">Categories</span></a></li>'
            + '        <li><a href="' + Craft.baseCpUrl + '/settings/tags" data-icon="tags"><span class="label">Tags</span></a></li>'
            + '    </ul>'
            + '</div>';

        this.activeClass = 'sel';

        this.$globalSidebarNav = document.querySelector('#global-sidebar nav');

        this.$sidebarNavItems = '';

        this.$settingsNavItem = document.querySelector('#nav-settings a');
    },

    insertSidebar: function () {
        this.$globalSidebarNav.insertAdjacentHTML('beforeend', this.sidebarString);

        // re-cache element now that it's in the DOM
        this.$sidebarNavItems = document.querySelectorAll('.system-menu a');
    },

    removeUnneededItems: function () {
        if (Craft.edition < 2) {
            document.querySelector('.craft-sidebar-enhancer [href*="settings/users"]').style.display = 'none';
        }
    },

    getActive: function () {
        var segments = window.location.pathname.split( '/' );
        var length = this.$sidebarNavItems.length;

        for (var i = 0; i < length; i++) {
            var $el = this.$sidebarNavItems[i];
            var name = $el.textContent.toLowerCase();

            if (segments.indexOf(name) !== -1 && segments.indexOf('settings') !== -1) {
                $el.classList.add(this.activeClass);
                this.$settingsNavItem.classList.remove(this.activeClass);
                break;
            }
        }
    }
};

// Call the initialize function
sidebarEnhancer.init();
