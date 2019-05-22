$(document).on('ready page:load', function() {
	if (typeof tinyMCE != 'undefined') {
		tinyMCE.init({
			selector : 'textarea.tinymce',
			toolbar  : [
				'styleselect | bold italic | undo redo image media | link | charmap | numlist bullist | codesample | fullscreen preview'
			],
			plugins  : '  - image, link, charmap, lists, advlist, codesample, fullscreen, media, preview'
		});
	}
	else {
		setTimeout(arguments.callee, 50);
	}
});
