<script>
    document.onreadystatechange = () => {
        const _html = document.getElementsByTagName('html')[0];

        _html.classList.remove('no-js');
        _html.classList.add('js');

        switch (document.readyState) {
            case 'loading':
                _html.classList.add('app_loading');

                break;
            case 'interactive':
                _html.classList.add('app_interactive');

                break;
            case 'complete':
                _html.classList.remove('app_loading');
                _html.classList.remove('app_interactive');
                _html.classList.add('app_complete');

                break;
        }
    }
</script>
