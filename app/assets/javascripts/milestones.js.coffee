# Milestones js

ready = ->

	$("#milestone_name").hide()

	$("#milestone_milestone_type").change(->
  		$("#milestone_name")[(if $(this).val() is "Custom" then "show" else "hide")] "fast"
	).change()

$(document).ready ready
$(document).on 'page:change', ready