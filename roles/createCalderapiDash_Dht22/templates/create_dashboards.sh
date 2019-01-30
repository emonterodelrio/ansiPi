#!/bin/bash

function setupDashHeaders() {
#Create dashboard json temp file
cat >$BASE_PATH/temp.json <<EOL
{
	"folderId": 0,
	"overwrite": true,
	"dashboard": {
		"uid": "{{ pi.hostname }}",
		"title": "{{ pi.hostname }}",
		"tags": [],
		"timezone": "browser",
		"version": 0,
		"editable": true,
		"gnetId": null,
		"graphTooltip": 0,
		"links": [],
EOL
}

function setupDashAemetMeteobars() {
#Create dashboard json temp file
cat >>$BASE_PATH/temp.json <<EOL
      {
        "content": "<style>\n.forward {\n  position: absolute;\n  opacity: 0;\n  width: 50%;\n  height: 100%;\n  margin: -70% 0 0 50%;\n  padding: 30% 0 0 0;\n  background-color: #0000ff;\n  font-size: 25pt;\n  text-align: center;\n  font-weight: bold;\n  color: #ffffff;\n  cursor: pointer;\n}\n\n.back {\n  position: absolute;\n  opacity: 0;\n  width: 50%;\n  height: 100%;\n  margin: -70% 0 0 0;\n  padding: 30% 0 0 0;\n  background-color: #ff0000;\n  font-size: 25pt;\n  text-align: center;\n  font-weight: bold;\n  color: #ffffff;\n  cursor: pointer;\n}\n\n.mymeteobars {\n  display: none;\n}\n\n.meteobars_txt {\n  position: absolute;\n  bottom: 10%;\n  left: 10%;\n  color: #0000aa;\n  font-weight: bold;\n}\n\n.meteobars_img {\n  margin:0 0 0 0;\n}\n\n.meteobars_slideshow-container {\n  max-width: 1000px;\n  position: relative;\n  margin: auto;\n}\n\n.meteobars_fade {\n  -webkit-animation-name: fade;\n  -webkit-animation-duration: 0.2s;\n  animation-name: fade;\n  animation-duration: 0.2s;\n  -webkit-user-select: none; /* Safari 3.1+ */\n  -moz-user-select: none; /* Firefox 2+ */\n  -ms-user-select: none; /* IE 10+ */\n  user-select: none; /* Standard syntax */\n}\n\n@-webkit-keyframes meteobars_fade {\n  from {opacity: .4} \n  to {opacity: 1}\n}\n\n@keyframes meteobars_fade {\n  from {opacity: .4} \n  to {opacity: 1}\n}\n\n@media only screen and (max-width: 500px) {\n  .meteobars_text {font-size: 11px}\n}\n\n</style>\n\n<div class=\"meteobars_slideshow-container\">\n\n  <div class=\"mymeteobars meteobars_fade\">\n    <img class=\"meteobars_img\" src=\"/sharedFiles/map_meteobars_0.gif?dummy=123\" alt=\"\">\n    <span class=\"back\" onclick=\"less_meteobars()\">i</span><span class=\"meteobars_txt\">Now</span><span class=\"forward\" onclick=\"more_meteobars()\">d</span>\n  </div>\n\n  <div class=\"mymeteobars meteobars_fade\">\n    <img class=\"meteobars_img\" src=\"/sharedFiles/map_meteobars_1.gif?dummy=123\" alt=\"\">\n    <span class=\"back\" onclick=\"less_meteobars()\">i</span><span class=\"meteobars_txt\">12h</span><span class=\"forward\" onclick=\"more_meteobars()\">d</span>\n  </div>\n\n  <div class=\"mymeteobars meteobars_fade\">\n    <img class=\"meteobars_img\" src=\"/sharedFiles/map_meteobars_2.gif?dummy=123\" alt=\"\">\n    <span class=\"back\" onclick=\"less_meteobars()\">i</span><span class=\"meteobars_txt\">24h</span><span class=\"forward\" onclick=\"more_meteobars()\">d</span>\n  </div>\n\n  <div class=\"mymeteobars meteobars_fade\">\n    <img class=\"meteobars_img\" src=\"/sharedFiles/map_meteobars_3.gif?dummy=123\" alt=\"\">\n    <span class=\"back\" onclick=\"less_meteobars()\">i</span><span class=\"meteobars_txt\">36h</span><span class=\"forward\" onclick=\"more_meteobars()\">d</span>\n  </div>\n\n  <div class=\"mymeteobars meteobars_fade\">\n    <img class=\"meteobars_img\" src=\"/sharedFiles/map_meteobars_4.gif?dummy=123\" alt=\"\">\n    <span class=\"back\" onclick=\"less_meteobars()\">i</span><span class=\"meteobars_txt\">48h</span><span class=\"forward\" onclick=\"more_meteobars()\">d</span>\n  </div>\n\n  <div class=\"mymeteobars meteobars_fade\">\n    <img class=\"meteobars_img\" src=\"/sharedFiles/map_meteobars_5.gif?dummy=123\" alt=\"\">\n    <span class=\"back\" onclick=\"less_meteobars()\">i</span><span class=\"meteobars_txt\">60h</span><span class=\"forward\" onclick=\"more_meteobars()\">d</span>\n  </div>\n\n  <div class=\"mymeteobars meteobars_fade\">\n    <img class=\"meteobars_img\" src=\"/sharedFiles/map_meteobars_6.gif?dummy=123\" alt=\"\">\n    <span class=\"back\" onclick=\"less_meteobars()\">i</span><span class=\"meteobars_txt\">72h</span><span class=\"forward\" onclick=\"more_meteobars()\">d</span>\n  </div>\n\n</div>\n\n<script>\nvar meteobar_slideIndex = 0;\nvar numExecution = 0;\nvar loops = 10;\nvar isEnd = false;\nvar clicks = 0;\nmeteobar_showSlides()\n\nfunction changeOpacity() {\n  var back_span = document.getElementsByClassName(\"back\");\n  var forward_span = document.getElementsByClassName(\"forward\");\n\n  if (clicks == 0) {\n    for (back_span_i = 0; back_span_i < back_span.length; back_span_i++) {\n      back_span[back_span_i].style.opacity = \"0.4\";\n    }\n    for (forward_span_i = 0; forward_span_i < forward_span.length; forward_span_i++) {\n      forward_span[forward_span_i].style.opacity = \"0.4\";\n    }\n  }\n  if (clicks == 1) {\n    for (back_span_i = 0; back_span_i < back_span.length; back_span_i++) {\n      back_span[back_span_i].style.opacity = \"0.2\";\n    }\n    for (forward_span_i = 0; forward_span_i < forward_span.length; forward_span_i++) {\n      forward_span[forward_span_i].style.opacity = \"0.2\";\n    }\n  }\n  if (clicks > 1) {\n    for (back_span_i = 0; back_span_i < back_span.length; back_span_i++) {\n      back_span[back_span_i].style.opacity = \"0\";\n    }\n    for (forward_span_i = 0; forward_span_i < forward_span.length; forward_span_i++) {\n      forward_span[forward_span_i].style.opacity = \"0\";\n    }\n  }\n  clicks++;\n}\n\nfunction more_meteobars() {\n  var meteobar_i;\n  var meteobar_slides = document.getElementsByClassName(\"mymeteobars\");\n  \n  changeOpacity();\n  \n  if (meteobar_slideIndex >= meteobar_slides.length-1) {\n    meteobar_slideIndex = 0\n  }else{\n    meteobar_slideIndex++;\n  }\n\n  for (meteobar_i = 0; meteobar_i < meteobar_slides.length; meteobar_i++) {\n    meteobar_slides[meteobar_i].style.display = \"none\";\n  }\n  meteobar_slides[meteobar_slideIndex].style.display = \"block\";\n  \n}\n\nfunction less_meteobars() {\n  var meteobar_i;\n  var meteobar_slides = document.getElementsByClassName(\"mymeteobars\");\n\n  changeOpacity();\n  \n  if (meteobar_slideIndex == 0) {\n    meteobar_slideIndex = meteobar_slides.length-1\n  }else{\n    meteobar_slideIndex--;\n  }\n\n  for (meteobar_i = 0; meteobar_i < meteobar_slides.length; meteobar_i++) {\n    meteobar_slides[meteobar_i].style.display = \"none\";  \n  }\n  meteobar_slides[meteobar_slideIndex].style.display = \"block\";\n}\n\nfunction meteobar_showSlides() {\n  var meteobar_i;\n  var meteobar_slides = document.getElementsByClassName(\"mymeteobars\");\n  var back_span = document.getElementsByClassName(\"back\");\n  var forward_span = document.getElementsByClassName(\"forward\");\n  \n  for (meteobar_i = 0; meteobar_i < meteobar_slides.length; meteobar_i++) {\n    meteobar_slides[meteobar_i].style.display = \"none\";  \n  }\n\n  if (meteobar_slideIndex >= meteobar_slides.length) {\n    meteobar_slideIndex = 0;\n    numExecution++;\n    for (back_span_i = 0; back_span_i < back_span.length; back_span_i++) {\n      back_span[back_span_i].style.opacity = \"0.2\";\n    }\n    for (forward_span_i = 0; forward_span_i < forward_span.length; forward_span_i++) {\n      forward_span[forward_span_i].style.opacity = \"0.2\";\n    }\n  }\n  \n  if (numExecution == loops) {\n    isEnd=true;\n    var back_span = document.getElementsByClassName(\"back\");\n    var forward_span = document.getElementsByClassName(\"forward\");\n\n    for (back_span_i = 0; back_span_i < back_span.length; back_span_i++) {\n      back_span[back_span_i].style.backgroundColor = \"#ff0000\";\n      back_span[back_span_i].innerHTML = \"<--\";\n      back_span[back_span_i].style.opacity = \"0.4\";\n    }\n    for (forward_span_i = 0; forward_span_i < forward_span.length; forward_span_i++) {\n      forward_span[forward_span_i].style.backgroundColor = \"#0000ff\";\n      forward_span[forward_span_i].innerHTML = \"-->\";\n      forward_span[forward_span_i].style.opacity = \"0.4\";\n    }\n  }\n\n  if ((meteobar_slideIndex == 0) && (isEnd === true)) {\n    meteobar_slides[0].style.display = \"block\";\n  }else{\n    meteobar_slides[meteobar_slideIndex].style.display = \"block\";\n    if (meteobar_slideIndex == 0) {\n      for (back_span_i = 0; back_span_i < back_span.length; back_span_i++) {\n        back_span[back_span_i].style.backgroundColor = \"#0044ff\";\n        back_span[back_span_i].innerHTML = \"\";\n        back_span[back_span_i].style.opacity = \"0.2\";\n      }\n      for (forward_span_i = 0; forward_span_i < forward_span.length; forward_span_i++) {\n        forward_span[forward_span_i].style.backgroundColor = \"#0044ff\";\n        forward_span[forward_span_i].innerHTML = \"\";\n        forward_span[forward_span_i].style.opacity = \"0.2\";\n      }\n    }else{\n      for (back_span_i = 0; back_span_i < back_span.length; back_span_i++) {\n        back_span[back_span_i].style.opacity = \"0\";\n        back_span[back_span_i].style.opacity = \"0\";\n      }\n      for (forward_span_i = 0; forward_span_i < forward_span.length; forward_span_i++) {\n        forward_span[forward_span_i].style.opacity = \"0\";\n        forward_span[forward_span_i].style.opacity = \"0\";\n      }\n    }        \n    if ((meteobar_slideIndex == 0) && (numExecution == 0)) {\n      meteobar_slideIndex++;\n      setTimeout(meteobar_showSlides, 200);\n    }else{\n      meteobar_slideIndex++;\n      setTimeout(meteobar_showSlides, 200);\n    }\n  }\n}\n</script>",
        "gridPos": {
          "h": 7,
          "w": 7,
          "x": 0,
          "y": 0
        },
        "id": 1,
        "links": [],
        "mode": "html",
        "title": "",
        "transparent": true,
        "type": "text"
      },
EOL
}

function setupDashAemetPrediction() {
#Create dashboard json temp file
cat >>$BASE_PATH/temp.json <<EOL
      {
        "content": "<style>\n\n.forward_pred {\n  position: absolute;\n  opacity: 0;\n  width: 50%;\n  height: 100%;\n  margin: -72% 0 0 50%;\n  padding: 30% 0 0 0;\n  background-color: #0000ff;\n  font-size: 25pt;\n  text-align: center;\n  font-weight: bold;\n  color: #ffffff;\n  cursor: pointer;\n}\n\n.back_pred {\n  position: absolute;\n  opacity: 0;\n  width: 50%;\n  height: 100%;\n  margin: -72% 0 0 0;\n  padding: 30% 0 0 0;\n  background-color: #ff0000;\n  font-size: 25pt;\n  text-align: center;\n  font-weight: bold;\n  color: #ffffff;\n  cursor: pointer;\n}\n\n.mypredictions {\n  display: none;\n}\n\n.predictions_txt {\n  position: absolute;\n  bottom: 10%;\n  left: 10%;\n  color: #0000aa;\n  font-weight: bold;\n}\n\n.predictions_img {\n  margin:0 0 0 0;\n}\n\n.predictions_slideshow-container {\n  max-width: 1000px;\n  position: relative;\n  margin: auto;\n}\n\n.predictions_fade {\n  -webkit-animation-name: fade;\n  -webkit-animation-duration: 0.2s;\n  animation-name: fade;\n  animation-duration: 0.2s;\n  -webkit-user-select: none; /* Safari 3.1+ */\n  -moz-user-select: none; /* Firefox 2+ */\n  -ms-user-select: none; /* IE 10+ */\n  user-select: none; /* Standard syntax */\n}\n\n@-webkit-keyframes predictions_fade {\n  from {opacity: .4} \n  to {opacity: 1}\n}\n\n@keyframes predictions_fade {\n  from {opacity: .4} \n  to {opacity: 1}\n}\n\n@media only screen and (max-width: 500px) {\n  .predictions_text {font-size: 11px}\n}\n\n</style>\n<div class=\"predictions_slideshow-container\">\n\n  <div class=\"mypredictions predictions_fade\">\n    <img class=\"predictions_img\" src=\"/sharedFiles/map_pred_0.jpg?dummy=123\" alt=\"\">\n    <span class=\"back_pred\" onclick=\"less()\">i</span><span class=\"predictions_txt\"></span><span class=\"forward_pred\" onclick=\"more()\">d</span>\n  </div>\n\n  <div class=\"mypredictions predictions_fade\">\n    <img class=\"predictions_img\" src=\"/sharedFiles/map_pred_1.jpg?dummy=123\" alt=\"\">\n    <span class=\"back_pred\" onclick=\"less()\">i</span><span class=\"predictions_txt\"></span><span class=\"forward_pred\" onclick=\"more()\">d</span>\n  </div>\n\n  <div class=\"mypredictions predictions_fade\">\n    <img class=\"predictions_img\" src=\"/sharedFiles/map_pred_2.jpg?dummy=123\" alt=\"\">\n    <span class=\"back_pred\" onclick=\"less()\">i</span><span class=\"predictions_txt\"></span><span class=\"forward_pred\" onclick=\"more()\">d</span>\n  </div>\n\n  <div class=\"mypredictions predictions_fade\">\n    <img class=\"predictions_img\" src=\"/sharedFiles/map_pred_3.jpg?dummy=123\" alt=\"\">\n          <span class=\"back_pred\" onclick=\"less()\">i</span><span class=\"predictions_txt\"></span><span class=\"forward_pred\" onclick=\"more()\">d</span>\n  </div>\n\n</div>\n<script>\nvar prediction_slideIndex = 0;\nvar numExecution_pred = 0;\nvar loops_pred = 3;\nvar isEnd_pred = false;\nvar clicks_pred = 0;\nprediction_showSlides()\n\nfunction changeOpacity_pred() {\n  var back_pred_span = document.getElementsByClassName(\"back_pred\");\n  var forward_pred_span = document.getElementsByClassName(\"forward_pred\");\n\n  if (clicks_pred == 0) {\n    for (back_pred_span_i = 0; back_pred_span_i < back_pred_span.length; back_pred_span_i++) {\n      back_pred_span[back_pred_span_i].style.opacity = \"0.2\";\n    }\n    for (forward_pred_span_i = 0; forward_pred_span_i < forward_pred_span.length; forward_pred_span_i++) {\n      forward_pred_span[forward_pred_span_i].style.opacity = \"0.2\";\n    }\n  }\n  if (clicks_pred == 1) {\n    for (back_pred_span_i = 0; back_pred_span_i < back_pred_span.length; back_pred_span_i++) {\n      back_pred_span[back_pred_span_i].style.opacity = \"0.1\";\n    }\n    for (forward_pred_span_i = 0; forward_pred_span_i < forward_pred_span.length; forward_pred_span_i++) {\n      forward_pred_span[forward_pred_span_i].style.opacity = \"0.1\";\n    }\n  }\n  if (clicks_pred > 1) {\n    for (back_pred_span_i = 0; back_pred_span_i < back_pred_span.length; back_pred_span_i++) {\n      back_pred_span[back_pred_span_i].style.opacity = \"0\";\n    }\n    for (forward_pred_span_i = 0; forward_pred_span_i < forward_pred_span.length; forward_pred_span_i++) {\n      forward_pred_span[forward_pred_span_i].style.opacity = \"0\";\n    }\n  }\n  clicks_pred++;\n}\n\nfunction more() {\n  var prediction_i;\n  var prediction_slides = document.getElementsByClassName(\"mypredictions\");\n  \n  changeOpacity_pred();\n  \n  if (prediction_slideIndex >= prediction_slides.length-1) {\n    prediction_slideIndex = 0\n  }else{\n    prediction_slideIndex++;\n  }\n\n  for (prediction_i = 0; prediction_i < prediction_slides.length; prediction_i++) {\n    prediction_slides[prediction_i].style.display = \"none\";\n  }\n  prediction_slides[prediction_slideIndex].style.display = \"block\";\n  \n}\n\nfunction less() {\n  var prediction_i;\n  var prediction_slides = document.getElementsByClassName(\"mypredictions\");\n\n  changeOpacity_pred();\n  \n  if (prediction_slideIndex == 0) {\n    prediction_slideIndex = prediction_slides.length-1\n  }else{\n    prediction_slideIndex--;\n  }\n\n  for (prediction_i = 0; prediction_i < prediction_slides.length; prediction_i++) {\n    prediction_slides[prediction_i].style.display = \"none\";  \n  }\n  prediction_slides[prediction_slideIndex].style.display = \"block\";\n}\n\nfunction prediction_showSlides() {\n  var prediction_i;\n  var prediction_slides = document.getElementsByClassName(\"mypredictions\");\n  var back_pred_span = document.getElementsByClassName(\"back_pred\");\n  var forward_pred_span = document.getElementsByClassName(\"forward_pred\");\n  \n  for (prediction_i = 0; prediction_i < prediction_slides.length; prediction_i++) {\n    prediction_slides[prediction_i].style.display = \"none\";  \n  }\n\n  if (prediction_slideIndex >= prediction_slides.length) {\n    prediction_slideIndex = 0;\n    numExecution_pred++;\n    for (back_pred_span_i = 0; back_pred_span_i < back_pred_span.length; back_pred_span_i++) {\n      back_pred_span[back_pred_span_i].style.opacity = \"0.4\";\n    }\n    for (forward_pred_span_i = 0; forward_pred_span_i < forward_pred_span.length; forward_pred_span_i++) {\n      forward_pred_span[forward_pred_span_i].style.opacity = \"0.4\";\n    }\n  }\n  \n  if (numExecution_pred == loops_pred) {\n    isEnd_pred=true;\n    var back_pred_span = document.getElementsByClassName(\"back_pred\");\n    var forward_pred_span = document.getElementsByClassName(\"forward_pred\");\n\n    for (back_pred_span_i = 0; back_pred_span_i < back_pred_span.length; back_pred_span_i++) {\n      back_pred_span[back_pred_span_i].style.backgroundColor = \"#ff0000\";\n      back_pred_span[back_pred_span_i].innerHTML = \"<--\";\n      back_pred_span[back_pred_span_i].style.opacity = \"0.4\";\n    }\n    for (forward_pred_span_i = 0; forward_pred_span_i < forward_pred_span.length; forward_pred_span_i++) {\n      forward_pred_span[forward_pred_span_i].style.backgroundColor = \"#0000ff\";\n      forward_pred_span[forward_pred_span_i].innerHTML = \"-->\";\n      forward_pred_span[forward_pred_span_i].style.opacity = \"0.4\";\n    }\n  }\n\n  if ((prediction_slideIndex == 0) && (isEnd_pred === true)) {\n    prediction_slides[0].style.display = \"block\";\n  }else{\n    prediction_slides[prediction_slideIndex].style.display = \"block\";\n    if (prediction_slideIndex == 0) {\n      for (back_pred_span_i = 0; back_pred_span_i < back_pred_span.length; back_pred_span_i++) {\n        back_pred_span[back_pred_span_i].style.backgroundColor = \"#0044ff\";\n        back_pred_span[back_pred_span_i].innerHTML = \"\";\n        back_pred_span[back_pred_span_i].style.opacity = \"0.4\";\n      }\n      for (forward_pred_span_i = 0; forward_pred_span_i < forward_pred_span.length; forward_pred_span_i++) {\n        forward_pred_span[forward_pred_span_i].style.backgroundColor = \"#0044ff\";\n        forward_pred_span[forward_pred_span_i].innerHTML = \"\";\n        forward_pred_span[forward_pred_span_i].style.opacity = \"0.4\";\n      }\n    }else{\n      for (back_pred_span_i = 0; back_pred_span_i < back_pred_span.length; back_pred_span_i++) {\n        back_pred_span[back_pred_span_i].style.opacity = \"0\";\n        back_pred_span[back_pred_span_i].style.opacity = \"0\";\n      }\n      for (forward_pred_span_i = 0; forward_pred_span_i < forward_pred_span.length; forward_pred_span_i++) {\n        forward_pred_span[forward_pred_span_i].style.opacity = \"0\";\n        forward_pred_span[forward_pred_span_i].style.opacity = \"0\";\n      }\n    }        \n    if ((prediction_slideIndex == 0) && (numExecution_pred == 0)) {\n      prediction_slideIndex++;\n      setTimeout(prediction_showSlides, 500);\n    }else{\n      prediction_slideIndex++;\n      setTimeout(prediction_showSlides, 500);\n    }\n  }\n}\n</script>",
        "gridPos": {
          "h": 7,
          "w": 7,
          "x": 7,
          "y": 0
        },
        "id": 2,
        "links": [],
        "mode": "html",
        "title": "",
        "transparent": true,
        "type": "text"
      },
EOL
}

function setupDashAemetForecastPrediction() {

cat >>$BASE_PATH/temp.json <<EOL
      {
        "content": "<iframe id=\"forecast_embed\" frameborder=\"0\" src=\"//forecast.io/embed/#lat=40.3232129&lon=-3.8676291&name=M&oacute;stoles&color=#2222ff&text-color=#cccccc&font=Georgia&units=ca\" style=\"margin: 1% 0 0 0; padding: 0; border: none; width:100%; height:100%;\"></iframe>",
        "gridPos": {
          "h": 7,
          "w": 10,
          "x": 14,
          "y": 0
        },
        "id": 3,
        "links": [],
        "mode": "html",
        "title": "",
        "transparent": true,
        "type": "text"
      },
EOL
}

function setupDashMeasures() {

PANEL_ID=3
for i in "${MEASURES[@]}"; do
  ((PANEL_ID++))
  PANEL_TITLE="$(echo $i | cut -d';' -f1)"
  MEASURE_NAME="$(echo $i | cut -d';' -f2)"
  MEASURE_DECIMALS="$(echo $i | cut -d';' -f3)"
  MEASURE_TYPE="$(echo $i | cut -d';' -f4)"
  MEASURE_UNIT="$(echo $i | cut -d';' -f5)"
  MEASURE_UNIT_MIN="$(echo $i | cut -d';' -f6)"
  MEASURE_UNIT_MAX="$(echo $i | cut -d';' -f7)"
  MEASURE_COLOR="$(echo $i | cut -d';' -f8)"
  MEASURE_SELECTOR="$(echo $i | cut -d';' -f9)"
  MEASURE_TH_OP_FILL_COLOR="$(echo $i | cut -d';' -f10)"
  MEASURE_TH_OP_LINE_COLOR="$(echo $i | cut -d';' -f11)"
  MEASURE_TH_OP="$(echo $i | cut -d';' -f12)"
  MEASURE_TH_VALUE="$(echo $i | cut -d';' -f13)"

  echo "@@@  Create panel $PANEL_TITLE---"
  echo Name $MEASURE_NAME
  echo Decimals $MEASURE_DECIMALS
  echo Type $MEASURE_TYPE
  echo Units $MEASURE_UNIT
  echo Color $MEASURE_COLOR
  echo Selector $MEASURE_SELECTOR
  echo Threshold line color $MEASURE_TH_OP_FILL_COLOR
  echo Threshold fill color $MEASURE_TH_OP_LINE_COLOR
  echo Threshold operation $MEASURE_TH_OP
  echo Threshold value $MEASURE_TH_VALUE

  if [[ $(( $PANEL_ID % 2 )) == 0 ]]; then
    X_POSITION=('0')
  else
    X_POSITION=('12')
  fi
cat >>$BASE_PATH/temp.json <<EOL
      {
        "aliasColors": {},
        "bars": false,
        "dashLength": 10,
        "dashes": false,
        "datasource": "{{ influx.db.name }}",
        "fill": 0,
        "gridPos": {
          "h": 7,
          "w": 12,
          "x": $X_POSITION,
          "y": 7
        },
        "id": $PANEL_ID,
        "legend": {
          "avg": false,
          "current": false,
          "max": false,
          "min": false,
          "show": false,
          "total": false,
          "values": false
        },
        "lines": true,
        "linewidth": 1,
        "links": [],
        "nullPointMode": "null",
        "percentage": false,
        "pointradius": 1,
        "points": false,
        "renderer": "flot",
        "seriesOverrides": [
          {
            "alias": "$MEASURE_NAME",
            "color": "$MEASURE_COLOR"
          }
        ],
        "spaceLength": 10,
        "stack": false,
        "steppedLine": false,
        "targets": [
          {
            "alias": "$MEASURE_NAME",
            "groupBy": [
              {
                "params": [
                  "$INTERVAL"
                ],
                "type": "time"
              },
              {
                "params": [
                  "none"
                ],
                "type": "fill"
              }
            ],
            "measurement": "$SENSOR_NAME",
            "orderByTime": "ASC",
            "policy": "default",
            "refId": "A",
            "resultFormat": "time_series",
            "select": [
              [
                {
                  "params": [
                    "value"
                  ],
                  "type": "field"
                },
                {
                  "params": [],
                  "type": "last"
                }
              ]
            ],
            "tags": [
              {
                "key": "host",
                "operator": "=",
                "value": "{{ pi.hostname }}"
              },
              {
                "condition": "AND",
                "key": "name",
                "operator": "=",
                "value": "$MEASURE_NAME"
              }
            ]
          }
        ],
EOL
  if [[ $(( $PANEL_ID % 2 )) == 0 ]]; then
cat >>$BASE_PATH/temp.json <<EOL
        "thresholds": [
          {
            "colorMode": "custom",
            "fill": true,
            "fillColor": "#65c5db33",
            "line": false,
            "lineColor": "#ffffffff",
            "op": "lt",
            "value": -7,
            "yaxis": "left"
          },
          {
            "colorMode": "custom",
            "fill": true,
            "fillColor": "#70dbed11",
            "line": false,
            "op": "lt",
            "value": 12,
            "yaxis": "left"
          },
          {
            "colorMode": "custom",
            "fill": true,
            "fillColor": "#ef843c11",
            "line": false,
            "op": "gt",
            "value": 12,
            "yaxis": "left"
          },
          {
            "colorMode": "custom",
            "fill": true,
            "fillColor": "#bf1b0011",
            "line": false,
            "op": "gt",
            "value": 21,
            "yaxis": "left"
          },
          {
            "colorMode": "custom",
            "fill": true,
            "fillColor": "#bf1b0011",
            "line": false,
            "op": "gt",
            "value": 28,
            "yaxis": "left"
          },
          {
            "colorMode": "custom",
            "fill": true,
            "fillColor": "#bf1b0033",
            "line": false,
            "op": "gt",
            "value": 34,
            "yaxis": "left"
          }
        ],
EOL
  else
cat >>$BASE_PATH/temp.json <<EOL
        "thresholds": [
          {
            "colorMode": "custom",
            "fill": true,
            "fillColor": "rgba(193, 92, 23, 0.1)",
            "line": false,
            "op": "lt",
            "value": 40,
            "yaxis": "left"
          },
          {
            "colorMode": "custom",
            "fill": true,
            "fillColor": "rgba(112, 219, 237, 0.1)",
            "line": false,
            "op": "gt",
            "value": 85,
            "yaxis": "left"
          }
        ],
EOL
  fi
cat >>$BASE_PATH/temp.json <<EOL
        "timeFrom": null,
        "timeShift": null,
        "title": "$PANEL_TITLE",
        "transparent": true,
        "tooltip": {
          "shared": true,
          "sort": 0,
          "value_type": "individual"
        },
        "type": "graph",
        "xaxis": {
          "buckets": null,
          "mode": "time",
          "name": null,
          "show": true,
          "values": []
        },
        "yaxes": [
          {
            "decimals": $MEASURE_DECIMALS,
            "format": "$MEASURE_UNIT",
            "label": null,
            "logBase": 1,
            "max": "$MEASURE_UNIT_MAX",
            "min": "$MEASURE_UNIT_MIN",
            "show": true
          },
          {
            "format": "$MEASURE_TYPE",
            "label": null,
            "logBase": 1,
            "max": "$MEASURE_UNIT_MAX",
            "min": "$MEASURE_UNIT_MIN",
            "show": false
          }
        ],
        "yaxis": {
          "align": false,
          "alignLevel": null
        }
      },
EOL
done
}

function setupDashMeasuresTimeline() {

PANEL_ID=5
$Y_POSITION=7
for j in "${MEASURES_TIMELINE[@]}"; do
  ((Y_POSITION+=8))
  MEASURE_NAME_TIMELINE=$j
    echo 
    echo "-------$MEASURE_NAME_TIMELINE"
  for i in "${MEASURES[@]}"; do
    ((PANEL_ID++))
    PANEL_TITLE="$(echo $i | cut -d';' -f1)"
    MEASURE_NAME="$(echo $i | cut -d';' -f2)"
    MEASURE_DECIMALS="$(echo $i | cut -d';' -f3)"
    MEASURE_TYPE="$(echo $i | cut -d';' -f4)"
    MEASURE_UNIT="$(echo $i | cut -d';' -f5)"
    MEASURE_UNIT_MIN="$(echo $i | cut -d';' -f6)"
    MEASURE_UNIT_MAX="$(echo $i | cut -d';' -f7)"
    MEASURE_COLOR="$(echo $i | cut -d';' -f8)"
    MEASURE_SELECTOR="$(echo $i | cut -d';' -f9)"
    MEASURE_TH_OP_FILL_COLOR="$(echo $i | cut -d';' -f10)"
    MEASURE_TH_OP_LINE_COLOR="$(echo $i | cut -d';' -f11)"
    MEASURE_TH_OP="$(echo $i | cut -d';' -f12)"
    MEASURE_TH_VALUE="$(echo $i | cut -d';' -f13)"
    echo 
    echo 
    echo 
    echo "@@@  Create panel $PANEL_ID $PANEL_TITLE $MEASURE_NAME_TIMELINE at $X_POSITIONx$Y_POSITION -----"
    echo Name $MEASURE_NAME
    echo Decimals $MEASURE_DECIMALS
    echo Type $MEASURE_TYPE
    echo Units $MEASURE_UNIT
    echo Min $MEASURE_UNIT_MIN
    echo Max $MEASURE_UNIT_MAX
    echo Color $MEASURE_COLOR
    echo Selector $MEASURE_SELECTOR
    echo Threshold line color $MEASURE_TH_OP_FILL_COLOR
    echo Threshold fill color $MEASURE_TH_OP_LINE_COLOR
    echo Threshold operation $MEASURE_TH_OP
    echo Threshold value $MEASURE_TH_VALUE

    if [[ $(( $PANEL_ID % 2 )) == 0 ]]; then
      X_POSITION=('0')
    else
      X_POSITION=('12')
    fi
cat >>$BASE_PATH/temp.json <<EOL
      {
        "aliasColors": {},
        "bars": false,
        "dashLength": 10,
        "dashes": false,
        "datasource": "{{ influx.db.name }}",
        "fill": 0,
        "gridPos": {
          "h": 7,
          "w": 12,
          "x": $X_POSITION,
          "y": $Y_POSITION
        },
        "id": $PANEL_ID,
        "legend": {
          "avg": false,
          "current": false,
          "max": false,
          "min": false,
          "show": false,
          "total": false,
          "values": false
        },
        "lines": true,
        "linewidth": 1,
        "links": [],
        "nullPointMode": "null",
        "percentage": false,
        "pointradius": 1,
        "points": false,
        "renderer": "flot",
        "seriesOverrides": [
          {
            "alias": "$MEASURE_NAME",
            "color": "$MEASURE_COLOR"
          }
        ],
        "spaceLength": 10,
        "stack": false,
        "steppedLine": false,
        "targets": [
          {
            "alias": "$MEASURE_NAME",
            "groupBy": [
              {
                "params": [
                  "$INTERVAL"
                ],
                "type": "time"
              },
              {
                "params": [
                  "none"
                ],
                "type": "fill"
              }
            ],
            "measurement": "$SENSOR_NAME",
            "orderByTime": "ASC",
            "policy": "default",
            "refId": "A",
            "resultFormat": "time_series",
            "select": [
              [
                {
                  "params": [
                    "value"
                  ],
                  "type": "field"
                },
                {
                  "params": [],
                  "type": "last"
                }
              ]
            ],
            "tags": [
              {
                "key": "host",
                "operator": "=",
                "value": "{{ pi.hostname }}"
              },
              {
                "condition": "AND",
                "key": "name",
                "operator": "=",
                "value": "$MEASURE_NAME"
              }
            ]
          }
        ],
EOL
  if [[ $(( $PANEL_ID % 2 )) == 0 ]]; then
cat >>$BASE_PATH/temp.json <<EOL
        "thresholds": [
          {
            "colorMode": "custom",
            "fill": true,
            "fillColor": "#65c5db33",
            "line": false,
            "lineColor": "#ffffffff",
            "op": "lt",
            "value": -7,
            "yaxis": "left"
          },
          {
            "colorMode": "custom",
            "fill": true,
            "fillColor": "#70dbed11",
            "line": false,
            "op": "lt",
            "value": 12,
            "yaxis": "left"
          },
          {
            "colorMode": "custom",
            "fill": true,
            "fillColor": "#ef843c11",
            "line": false,
            "op": "gt",
            "value": 12,
            "yaxis": "left"
          },
          {
            "colorMode": "custom",
            "fill": true,
            "fillColor": "#bf1b0011",
            "line": false,
            "op": "gt",
            "value": 21,
            "yaxis": "left"
          },
          {
            "colorMode": "custom",
            "fill": true,
            "fillColor": "#bf1b0011",
            "line": false,
            "op": "gt",
            "value": 28,
            "yaxis": "left"
          },
          {
            "colorMode": "custom",
            "fill": true,
            "fillColor": "#bf1b0033",
            "line": false,
            "op": "gt",
            "value": 34,
            "yaxis": "left"
          }
        ],
EOL
  else
cat >>$BASE_PATH/temp.json <<EOL
        "thresholds": [
          {
            "colorMode": "custom",
            "fill": true,
            "fillColor": "rgba(193, 92, 23, 0.1)",
            "line": false,
            "op": "lt",
            "value": 40,
            "yaxis": "left"
          },
          {
            "colorMode": "custom",
            "fill": true,
            "fillColor": "rgba(112, 219, 237, 0.1)",
            "line": false,
            "op": "gt",
            "value": 85,
            "yaxis": "left"
          }
        ],
EOL
  fi
cat >>$BASE_PATH/temp.json <<EOL
        "timeFrom": "$MEASURE_NAME_TIMELINE",
        "timeShift": null,
        "title": "$PANEL_TITLE",
        "transparent": true,
        "tooltip": {
          "shared": true,
          "sort": 0,
          "value_type": "individual"
        },
        "type": "graph",
        "xaxis": {
          "buckets": null,
          "mode": "time",
          "name": null,
          "show": true,
          "values": []
        },
        "yaxes": [
          {
            "decimals": $MEASURE_DECIMALS,
            "format": "$MEASURE_UNIT",
            "label": null,
            "logBase": 1,
            "max": "$MEASURE_UNIT_MAX",
            "min": "$MEASURE_UNIT_MIN",
            "show": true
          },
          {
            "format": "$MEASURE_TYPE",
            "label": null,
            "logBase": 1,
            "max": "$MEASURE_UNIT_MAX",
            "min": "$MEASURE_UNIT_MIN",
            "show": false
          }
        ],
        "yaxis": {
          "align": false,
          "alignLevel": null
        }
      },
EOL
  done
done
}

function setupDashPanels() {
#Create dashboard json temp file
cat >>$BASE_PATH/temp.json <<EOL
    "panels": [
EOL
setupDashAemetMeteobars;
setupDashAemetPrediction;
setupDashAemetForecastPrediction;
setupDashMeasures;
setupDashMeasuresTimeline;

#Delete last loop "\n," and restore "\n" 
truncate -s-2 $BASE_PATH/temp.json
echo >>$BASE_PATH/temp.json

#fix nulls
sed -i 's/"max": ""/"max": null/g' $BASE_PATH/temp.json
sed -i 's/"min": ""/"min": null/g' $BASE_PATH/temp.json

cat >>$BASE_PATH/temp.json <<EOL

    ],
EOL
}

function setupDashOptions() {
#Create dashboard json temp file
cat >>$BASE_PATH/temp.json <<EOL
		"refresh": "120s",
		"schemaVersion": 16,
		"style": "dark",
		"templating": {
			"list": []
		},
		"time": {
			"from": "now-3h",
			"to": "now"
		},
		"timepicker": {
			"refresh_intervals": [
				"120s"
			],
			"time_options": [
				"5m",
				"15m",
				"1h",
				"6h",
				"12h",
				"24h",
				"2d",
				"7d",
				"30d"
			]
		}
	}
}
EOL
}


###    MAIN    #####################################
BASE_PATH="/tmp/dht22_temp"
USER="{{ grafanaAdminUserReaded.stdout }}"
PASS="{{ grafanaAdminPassReaded.stdout }}"


INTERVAL='$__interval'
HOST="{{ pi.hostname }}"
SENSOR_NAME="dht22"
INFLUX_DS="{{ influx.db.name }}"

DASHBOARD_TITLE="{{ pi.hostname }}"
Y_AXIS="short"

##########################################################
####    MEASURE FORMAT 
##########################################################
#  PANEL_TITLE; MEASURE_NAME;MEASURE_DECIMALS;MEASURE_TYPE;MEASURE_UNIT;MEASURE_COLOR;MEASURE_SELECTOR;MEASURE_TH_OP_FILL_COLOR;MEASURE_TH_OP_LINE_COLOR;MEASURE_TH_OP;MEASURE_TH_VALUE"

#      PANEL_TITLE="$(echo $i | cut -d';' -f1)"
#      MEASURE_NAME="$(echo $i | cut -d';' -f2)"
#      MEASURE_DECIMALS="$(echo $i | cut -d';' -f3)"
#      MEASURE_TYPE="$(echo $i | cut -d';' -f4)"
#      MEASURE_UNIT="$(echo $i | cut -d';' -f5)"
#      MEASURE_UNIT_MIN="$(echo $i | cut -d';' -f6)"
#      MEASURE_UNIT_MAX="$(echo $i | cut -d';' -f7)"
#      MEASURE_COLOR="$(echo $i | cut -d';' -f8)"
#      MEASURE_SELECTOR="$(echo $i | cut -d';' -f9)"
#      MEASURE_TH_OP_FILL_COLOR="$(echo $i | cut -d';' -f10)"
#      MEASURE_TH_OP_LINE_COLOR="$(echo $i | cut -d';' -f11)"
#      MEASURE_TH_OP="$(echo $i | cut -d';' -f12)"
#      MEASURE_TH_VALUE="$(echo $i | cut -d';' -f13)"

MEASURES=("Temperature;temp;2;short;celsius;;;#00ff24;last;#a0000033;#a00000aa;gt;30;" "Humidity;hum;2;humidity;humidity;0;100;#00ffff;last;#0088ff33;#0088ffaa;gt;70")



#One panel of each measure at these times
MEASURES_TIMELINE=( 24h 1w 1M 3M )

setupDashHeaders;
setupDashPanels;
setupDashOptions;

echo $USER
echo $PASS
echo "curl -s -X POST 'http://$USER:$PASS@{{ pi.network.ip }}:3000/api/dashboards/db' \
-H 'Accept: application/json' \
-H 'Content-Type:application/json' \
-d @$BASE_PATH/temp.json | jq ."

#Create dashboard from json file
curl -s -X POST "http://$USER:$PASS@{{ pi.network.ip }}:3000/api/dashboards/db" \
-H "Accept: application/json" \
-H "Content-Type:application/json" \
-d @$BASE_PATH/temp.json | jq . > $BASE_PATH/dashboard-create.log

#Star dashboard
DASH_ID=$(cat $BASE_PATH/dashboard-create.log | grep "\"id\"" | awk '{print $2}' | tr -d ",")
echo "Star to $DASH_ID"
curl -s -X POST "http://$USER:$PASS@{{ pi.network.ip }}:3000/api/user/stars/dashboard/$DASH_ID"
