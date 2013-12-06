# Projects js

ready = ->

	$("#project_name").hide()

	$("#project_project_type").change(->
  		$("#project_name")[(if $(this).val() is "Custom" then "show" else "hide")] "fast"
	).change()

$(document).ready ready
$(document).on 'page:change', ready