if (!RedactorPlugins) var RedactorPlugins = {};

RedactorPlugins.removeformat = function()
{
    return {
        init: function()
        {
            var button = this.button.add('removeformat', 'Remove Format');
            this.button.addCallback(button, this.removeformat.insertCleanHtml);
            // if you don't like the icon, just get rid of the next line
            // this.button.setIcon(button, '<i style="display:block;width: 16px;height: 16px;background-repeat: no-repeat;background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA90lEQVQ4T7XTu0qDQRBA4S9YGW1EO3tBOwtbL9gKNmLnmwiiRvAtRCxthBDEykuqvIEgCIJgKTYieGVgA39Ckt3GabbY3TNnZmdr+MW34TGGC2zjs/9YLQFiHRZfaOFnEKQUUMd5yrBZzVQK6N6JcnpsSwDVhNGv/wMEfVQMtC0pYQK72MEsnnGGBt6rgFEGTRzgAXPYxzRWcwbHWEA83Qpu4hLucIlOicESJnGN2wRaQwzYac4gpm8Kbyl7WAQkLGbwkgM8YQvRyH6D+D8nOcARFrGB5UoP2rhCOweIPxCNe8Uh7jGPPYxjvQvIzFDP9mOag3ihjz/6LUTXhvPu6gAAAABJRU5ErkJggg==);"></i>');

        },

        insertCleanHtml: function()
        {

            var isRedactorSelected = this.selection.isRedactor();
            if (this.selection.isRedactor()) {
                
                // remove what already can be removed
                this.inline.removeFormat();
                this.inline.removeAllAttr();
                this.inline.removeAllClass();

                // get the current selection
                var html = this.selection.html();
                // Strip out html
                html = html.replace(/(<([^p>]+)>)/ig,"");

                // buffer
                this.buffer.set();

                // Replace selection with clean text
                this.selection.replace(html);

                // Sync code
                this.code.sync();
            }

        }
    };
};
