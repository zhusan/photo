function select_selectize(){
	$('#tag_list').selectize({
	    persist: false,
	    maxItems: null,
	    valueField: 'id',
	    labelField: 'name',
	    searchField: ['name', 'id'],
	    render: {
	        item: function(item, escape) {
	            return '<div>' +
	                (item.name ? '<span class="name">' + escape(item.name) + '</span>' : '') +
	            '</div>';
	        },
	        option: function(item, escape) {
	            var label = item.name || item.id;
	            var caption = item.name ? item.id : null;
	            return '<div>' +
	                '<span class="label">' + escape(label) + '</span>' +
	            '</div>';
	        }
	    }
	});
}
