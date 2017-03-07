###
	(c) 2017 Digital Humanities Lab, Utrecht University
	Author: Julian Gonggrijp
###

define [
	'backbone'
	'underscore'
	'googlemaps'
	'templates'
], (bb, _, gmaps, JST) ->
	'use strict'
	
	center =
		lat: -28.699929
		lng: -59.0452857
	zoom = 6
	mapSettings = {center, zoom}
	markers = _.flatten({
		lat: center.lat + y
		lng: center.lng + x
	} for x in [-2..2] for y in [-2..2])
	console.log markers
	
	class MapView extends bb.View
		template: JST['map']
		el: 'main'
		render: ->
			@$el.html @template {}
			mapElem = @$ '#map'
			console.log mapElem
			@map = new gmaps.Map mapElem[0], mapSettings
			console.log @map
			@markers = (new gmaps.Marker {
				position: marker
				map: @map
			} for marker in markers)
			console.log @markers
			@
