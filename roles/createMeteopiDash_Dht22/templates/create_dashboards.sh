#!/bin/bash

function setupDashHeaders() {
#Create dashboard json temp file
cat >$BASE_PATH/temp.json <<EOL
{
	"folderId": 0,
	"overwrite": true,
	"dashboard": {
		"uid": "MeteoPi",
		"title": "MeteoPi",
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
        "content": "<style>\n    .meteobar_img {\n      width: 100%;\n      height: 100%;\n      position: absolute;\n      top: 0;\n      left: 0;\n    }\n\n    .meteobar_back {\n      z-index:9;\n      width: 50%;\n      margin-left: 0;\n      opacity: 0;\n      background-color: #ff0000;\n      font-size: 25pt;\n      text-align: center;\n      font-weight: bold;\n      color: #ffffff;\n      cursor: pointer;\n    }\n\n    .meteobar_forward {\n      z-index:9;\n      width: 50%;\n      margin-left: 50%;\n      opacity: 0;\n      background-color: #0000ff;\n      font-size: 25pt;\n      text-align: center;\n      font-weight: bold;\n      color: #ffffff;\n      cursor: pointer;\n    }\n\n    .arrow {\n      margin-top: 50%;\n    }\n\n    .meteobar_div {\n      display: none;\n    }\n\n    .meteobar_slideshow-container {\n      margin: auto;\n    }\n\n    .meteobar_fade_effect {\n      -webkit-animation-name: fade;\n      -webkit-animation-duration: 0.2s;\n      animation-name: fade;\n      animation-duration: 0.2s;\n      -webkit-user-select: none; /* Safari 3.1+ */\n      -moz-user-select: none; /* Firefox 2+ */\n      -ms-user-select: none; /* IE 10+ */\n      user-select: none; /* Standard syntax */\n    }\n\n    @-webkit-keyframes meteobar_fade_effect {\n      from {opacity: .4} \n      to {opacity: 1}\n    }\n\n    @keyframes meteobar_fade_effect {\n      from {opacity: .4} \n      to {opacity: 1}\n    }\n\n    @media only screen and (max-width: 500px) {\n      .meteobar_text {font-size: 11px}\n    }\n\n    </style>\n\n    <div class=\"meteobar_slideshow-container\">\n\n      <div class=\"meteobar_div meteobar_fade_effect\">\n        <img class=\"meteobar_img img_scale\" src=\"/sharedFiles/meteobar/meteobar_0.gif?dummy=123\" alt=\"\">\n        <div class=\"meteobar_img meteobar_back\" onclick=\"less_meteobar()\">i</div><div class=\"meteobar_forward meteobar_img\" onclick=\"more_meteobar()\">d</div>\n      </div>\n\n      <div class=\"meteobar_div meteobar_fade_effect\">\n        <img class=\"meteobar_img img_scale\" src=\"/sharedFiles/meteobar/meteobar_1.gif?dummy=123\" alt=\"\">\n        <div class=\"meteobar_img meteobar_back\" onclick=\"less_meteobar()\">i</div><div class=\"meteobar_forward meteobar_img\" onclick=\"more_meteobar()\">d</div>\n      </div>\n\n      <div class=\"meteobar_div meteobar_fade_effect\">\n        <img class=\"meteobar_img img_scale\" src=\"/sharedFiles/meteobar/meteobar_2.gif?dummy=123\" alt=\"\">\n        <div class=\"meteobar_img meteobar_back\" onclick=\"less_meteobar()\">i</div><div class=\"meteobar_forward meteobar_img\" onclick=\"more_meteobar()\">d</div>\n      </div>\n\n      <div class=\"meteobar_div meteobar_fade_effect\">\n        <img class=\"meteobar_img img_scale\" src=\"/sharedFiles/meteobar/meteobar_3.gif?dummy=123\" alt=\"\">\n        <div class=\"meteobar_img meteobar_back\" onclick=\"less_meteobar()\">i</div><div class=\"meteobar_forward meteobar_img\" onclick=\"more_meteobar()\">d</div>\n      </div>\n\n      <div class=\"meteobar_div meteobar_fade_effect\">\n        <img class=\"meteobar_img img_scale\" src=\"/sharedFiles/meteobar/meteobar_4.gif?dummy=123\" alt=\"\">\n        <div class=\"meteobar_img meteobar_back\" onclick=\"less_meteobar()\">i</div><div class=\"meteobar_forward meteobar_img\" onclick=\"more_meteobar()\">d</div>\n      </div>\n\n      <div class=\"meteobar_div meteobar_fade_effect\">\n        <img class=\"meteobar_img img_scale\" src=\"/sharedFiles/meteobar/meteobar_5.gif?dummy=123\" alt=\"\">\n        <div class=\"meteobar_img meteobar_back\" onclick=\"less_meteobar()\">i</div><div class=\"meteobar_forward meteobar_img\" onclick=\"more_meteobar()\">d</div>\n      </div>\n\n      <div class=\"meteobar_div meteobar_fade_effect\">\n        <img class=\"meteobar_img img_scale\" src=\"/sharedFiles/meteobar/meteobar_6.gif?dummy=123\" alt=\"\">\n        <div class=\"meteobar_img meteobar_back\" onclick=\"less_meteobar()\">i</div><div class=\"meteobar_forward meteobar_img\" onclick=\"more_meteobar()\">d</div>\n      </div>\n\n    </div>\n\n    <script>\n    var meteobar_slideIndex = 0;\n    var meteobar_numExecution = 0;\n    var meteobar_loops = 1;\n    var meteobar_isEnd = false;\n    var meteobar_clicks = 0;\n    meteobar_showSlides()\n\n    function changeOpacity() {\n      var meteobar_back_div = document.getElementsByClassName(\"meteobar_back\");\n      var meteobar_forward_div = document.getElementsByClassName(\"meteobar_forward\");\n\n      if (meteobar_clicks == 0) {\n        for (meteobar_back_div_i = 0; meteobar_back_div_i < meteobar_back_div.length; meteobar_back_div_i++) {\n          meteobar_back_div[meteobar_back_div_i].style.opacity = \"0.4\";\n        }\n        for (meteobar_forward_div_i = 0; meteobar_forward_div_i < meteobar_forward_div.length; meteobar_forward_div_i++) {\n          meteobar_forward_div[meteobar_forward_div_i].style.opacity = \"0.4\";\n        }\n      }\n      if (meteobar_clicks == 1) {\n        for (meteobar_back_div_i = 0; meteobar_back_div_i < meteobar_back_div.length; meteobar_back_div_i++) {\n          meteobar_back_div[meteobar_back_div_i].style.opacity = \"0.2\";\n        }\n        for (meteobar_forward_div_i = 0; meteobar_forward_div_i < meteobar_forward_div.length; meteobar_forward_div_i++) {\n          meteobar_forward_div[meteobar_forward_div_i].style.opacity = \"0.2\";\n        }\n      }\n      if (meteobar_clicks > 1) {\n        for (meteobar_back_div_i = 0; meteobar_back_div_i < meteobar_back_div.length; meteobar_back_div_i++) {\n          meteobar_back_div[meteobar_back_div_i].style.opacity = \"0\";\n        }\n        for (meteobar_forward_div_i = 0; meteobar_forward_div_i < meteobar_forward_div.length; meteobar_forward_div_i++) {\n          meteobar_forward_div[meteobar_forward_div_i].style.opacity = \"0\";\n        }\n      }\n      meteobar_clicks++;\n    }\n\n    function more_meteobar() {\n      var meteobar_i;\n      var meteobar_slides = document.getElementsByClassName(\"meteobar_div\");\n      \n      changeOpacity();\n      \n      if (meteobar_slideIndex >= meteobar_slides.length-1) {\n        meteobar_slideIndex = 0\n      }else{\n        meteobar_slideIndex++;\n      }\n\n      for (meteobar_i = 0; meteobar_i < meteobar_slides.length; meteobar_i++) {\n        meteobar_slides[meteobar_i].style.display = \"none\";\n      }\n      meteobar_slides[meteobar_slideIndex].style.display = \"block\";\n      \n    }\n\n    function less_meteobar() {\n      var meteobar_i;\n      var meteobar_slides = document.getElementsByClassName(\"meteobar_div\");\n\n      changeOpacity();\n      \n      if (meteobar_slideIndex == 0) {\n        meteobar_slideIndex = meteobar_slides.length-1\n      }else{\n        meteobar_slideIndex--;\n      }\n\n      for (meteobar_i = 0; meteobar_i < meteobar_slides.length; meteobar_i++) {\n        meteobar_slides[meteobar_i].style.display = \"none\";  \n      }\n      meteobar_slides[meteobar_slideIndex].style.display = \"block\";\n    }\n\n    function meteobar_showSlides() {\n      var meteobar_i;\n      var meteobar_slides = document.getElementsByClassName(\"meteobar_div\");\n      var meteobar_back_div = document.getElementsByClassName(\"meteobar_back\");\n      var meteobar_forward_div = document.getElementsByClassName(\"meteobar_forward\");\n      \n      for (meteobar_i = 0; meteobar_i < meteobar_slides.length; meteobar_i++) {\n        meteobar_slides[meteobar_i].style.display = \"none\";  \n      }\n\n      if (meteobar_slideIndex >= meteobar_slides.length) {\n        meteobar_slideIndex = 0;\n        meteobar_numExecution++;\n        for (meteobar_back_div_i = 0; meteobar_back_div_i < meteobar_back_div.length; meteobar_back_div_i++) {\n          meteobar_back_div[meteobar_back_div_i].style.opacity = \"0.2\";\n        }\n        for (meteobar_forward_div_i = 0; meteobar_forward_div_i < meteobar_forward_div.length; meteobar_forward_div_i++) {\n          meteobar_forward_div[meteobar_forward_div_i].style.opacity = \"0.2\";\n        }\n      }\n      \n      if (meteobar_numExecution == meteobar_loops) {\n        meteobar_isEnd=true;\n        var meteobar_back_div = document.getElementsByClassName(\"meteobar_back\");\n        var meteobar_forward_div = document.getElementsByClassName(\"meteobar_forward\");\n\n        for (meteobar_back_div_i = 0; meteobar_back_div_i < meteobar_back_div.length; meteobar_back_div_i++) {\n          meteobar_back_div[meteobar_back_div_i].style.backgroundColor = \"#ff0000\";\n          meteobar_back_div[meteobar_back_div_i].style.opacity = \"0.4\";\n        }\n        for (meteobar_forward_div_i = 0; meteobar_forward_div_i < meteobar_forward_div.length; meteobar_forward_div_i++) {\n          meteobar_forward_div[meteobar_forward_div_i].style.backgroundColor = \"#0000ff\";\n          meteobar_forward_div[meteobar_forward_div_i].style.opacity = \"0.4\";\n        }\n      }\n\n      if ((meteobar_slideIndex == 0) && (meteobar_isEnd === true)) {\n        meteobar_slides[0].style.display = \"block\";\n      }else{\n        meteobar_slides[meteobar_slideIndex].style.display = \"block\";\n        if (meteobar_slideIndex == 0) {\n          for (meteobar_back_div_i = 0; meteobar_back_div_i < meteobar_back_div.length; meteobar_back_div_i++) {\n            meteobar_back_div[meteobar_back_div_i].style.backgroundColor = \"#0044ff\";\n            meteobar_back_div[meteobar_back_div_i].innerHTML = \"\";\n            meteobar_back_div[meteobar_back_div_i].style.opacity = \"0.2\";\n          }\n          for (meteobar_forward_div_i = 0; meteobar_forward_div_i < meteobar_forward_div.length; meteobar_forward_div_i++) {\n            meteobar_forward_div[meteobar_forward_div_i].style.backgroundColor = \"#0044ff\";\n            meteobar_forward_div[meteobar_forward_div_i].innerHTML = \"\";\n            meteobar_forward_div[meteobar_forward_div_i].style.opacity = \"0.2\";\n          }\n        }else{\n          for (meteobar_back_div_i = 0; meteobar_back_div_i < meteobar_back_div.length; meteobar_back_div_i++) {\n            meteobar_back_div[meteobar_back_div_i].style.opacity = \"0\";\n            meteobar_back_div[meteobar_back_div_i].style.opacity = \"0\";\n          }\n          for (meteobar_forward_div_i = 0; meteobar_forward_div_i < meteobar_forward_div.length; meteobar_forward_div_i++) {\n            meteobar_forward_div[meteobar_forward_div_i].style.opacity = \"0\";\n            meteobar_forward_div[meteobar_forward_div_i].style.opacity = \"0\";\n          }\n        }        \n        if ((meteobar_slideIndex == 0) && (meteobar_numExecution == 0)) {\n          meteobar_slideIndex++;\n          setTimeout(meteobar_showSlides, 200);\n        }else{\n          meteobar_slideIndex++;\n          setTimeout(meteobar_showSlides, 200);\n        }\n      }\n    }\n    </script>",
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

function setupDashAemetAirMass() {
#Create dashboard json temp file
cat >>$BASE_PATH/temp.json <<EOL
      {
        "content": "<style>\n    .airMass_img {\n      width: 100%;\n      height: 100%;\n      position: absolute;\n      top: 0;\n      left: 0;\n    }\n\n    .airMass_back {\n      z-index:9;\n      width: 50%;\n      margin-left: 0;\n      opacity: 0;\n      background-color: #ff0000;\n      font-size: 25pt;\n      text-align: center;\n      font-weight: bold;\n      color: #ffffff;\n      cursor: pointer;\n    }\n\n    .airMass_forward {\n      z-index:9;\n      width: 50%;\n      margin-left: 50%;\n      opacity: 0;\n      background-color: #0000ff;\n      font-size: 25pt;\n      text-align: center;\n      font-weight: bold;\n      color: #ffffff;\n      cursor: pointer;\n    }\n\n    .arrow {\n      margin-top: 50%;\n    }\n\n    .airMass_div {\n      display: none;\n    }\n\n    .airMass_slideshow-container {\n      margin: auto;\n    }\n\n    .airMass_fade_effect {\n      -webkit-animation-name: fade;\n      -webkit-animation-duration: 0.2s;\n      animation-name: fade;\n      animation-duration: 0.2s;\n      -webkit-user-select: none; /* Safari 3.1+ */\n      -moz-user-select: none; /* Firefox 2+ */\n      -ms-user-select: none; /* IE 10+ */\n      user-select: none; /* Standard syntax */\n    }\n\n    @-webkit-keyframes airMass_fade_effect {\n      from {opacity: .4} \n      to {opacity: 1}\n    }\n\n    @keyframes airMass_fade_effect {\n      from {opacity: .4} \n      to {opacity: 1}\n    }\n\n    @media only screen and (max-width: 500px) {\n      .airMass_text {font-size: 11px}\n    }\n\n    </style>\n\n    <div class=\"airMass_slideshow-container\">\n\n      <div class=\"airMass_div airMass_fade_effect\">\n        <img class=\"airMass_img img_scale\" src=\"/sharedFiles/airMass/airMass_0.jpg?dummy=123\" alt=\"\">\n        <div class=\"airMass_img airMass_back\" onclick=\"less_airMass()\">i</div><div class=\"airMass_forward airMass_img\" onclick=\"more_airMass()\">d</div>\n      </div>\n\n      <div class=\"airMass_div airMass_fade_effect\">\n        <img class=\"airMass_img img_scale\" src=\"/sharedFiles/airMass/airMass_1.jpg?dummy=123\" alt=\"\">\n        <div class=\"airMass_img airMass_back\" onclick=\"less_airMass()\">i</div><div class=\"airMass_forward airMass_img\" onclick=\"more_airMass()\">d</div>\n      </div>\n\n      <div class=\"airMass_div airMass_fade_effect\">\n        <img class=\"airMass_img img_scale\" src=\"/sharedFiles/airMass/airMass_2.jpg?dummy=123\" alt=\"\">\n        <div class=\"airMass_img airMass_back\" onclick=\"less_airMass()\">i</div><div class=\"airMass_forward airMass_img\" onclick=\"more_airMass()\">d</div>\n      </div>\n\n      <div class=\"airMass_div airMass_fade_effect\">\n        <img class=\"airMass_img img_scale\" src=\"/sharedFiles/airMass/airMass_3.jpg?dummy=123\" alt=\"\">\n        <div class=\"airMass_img airMass_back\" onclick=\"less_airMass()\">i</div><div class=\"airMass_forward airMass_img\" onclick=\"more_airMass()\">d</div>\n      </div>\n\n      <div class=\"airMass_div airMass_fade_effect\">\n        <img class=\"airMass_img img_scale\" src=\"/sharedFiles/airMass/airMass_4.jpg?dummy=123\" alt=\"\">\n        <div class=\"airMass_img airMass_back\" onclick=\"less_airMass()\">i</div><div class=\"airMass_forward airMass_img\" onclick=\"more_airMass()\">d</div>\n      </div>\n\n      <div class=\"airMass_div airMass_fade_effect\">\n        <img class=\"airMass_img img_scale\" src=\"/sharedFiles/airMass/airMass_5.jpg?dummy=123\" alt=\"\">\n        <div class=\"airMass_img airMass_back\" onclick=\"less_airMass()\">i</div><div class=\"airMass_forward airMass_img\" onclick=\"more_airMass()\">d</div>\n      </div>\n\n      <div class=\"airMass_div airMass_fade_effect\">\n        <img class=\"airMass_img img_scale\" src=\"/sharedFiles/airMass/airMass_6.jpg?dummy=123\" alt=\"\">\n        <div class=\"airMass_img airMass_back\" onclick=\"less_airMass()\">i</div><div class=\"airMass_forward airMass_img\" onclick=\"more_airMass()\">d</div>\n      </div>\n\n      <div class=\"airMass_div airMass_fade_effect\">\n        <img class=\"airMass_img img_scale\" src=\"/sharedFiles/airMass/airMass_7.jpg?dummy=123\" alt=\"\">\n        <div class=\"airMass_img airMass_back\" onclick=\"less_airMass()\">i</div><div class=\"airMass_forward airMass_img\" onclick=\"more_airMass()\">d</div>\n      </div>\n\n      <div class=\"airMass_div airMass_fade_effect\">\n        <img class=\"airMass_img img_scale\" src=\"/sharedFiles/airMass/airMass_8.jpg?dummy=123\" alt=\"\">\n        <div class=\"airMass_img airMass_back\" onclick=\"less_airMass()\">i</div><div class=\"airMass_forward airMass_img\" onclick=\"more_airMass()\">d</div>\n      </div>\n\n      <div class=\"airMass_div airMass_fade_effect\">\n        <img class=\"airMass_img img_scale\" src=\"/sharedFiles/airMass/airMass_9.jpg?dummy=123\" alt=\"\">\n        <div class=\"airMass_img airMass_back\" onclick=\"less_airMass()\">i</div><div class=\"airMass_forward airMass_img\" onclick=\"more_airMass()\">d</div>\n      </div>\n\n      <div class=\"airMass_div airMass_fade_effect\">\n        <img class=\"airMass_img img_scale\" src=\"/sharedFiles/airMass/airMass_10.jpg?dummy=123\" alt=\"\">\n        <div class=\"airMass_img airMass_back\" onclick=\"less_airMass()\">i</div><div class=\"airMass_forward airMass_img\" onclick=\"more_airMass()\">d</div>\n      </div>\n\n      <div class=\"airMass_div airMass_fade_effect\">\n        <img class=\"airMass_img img_scale\" src=\"/sharedFiles/airMass/airMass_11.jpg?dummy=123\" alt=\"\">\n        <div class=\"airMass_img airMass_back\" onclick=\"less_airMass()\">i</div><div class=\"airMass_forward airMass_img\" onclick=\"more_airMass()\">d</div>\n      </div>\n\n      <div class=\"airMass_div airMass_fade_effect\">\n        <img class=\"airMass_img img_scale\" src=\"/sharedFiles/airMass/airMass_12.jpg?dummy=123\" alt=\"\">\n        <div class=\"airMass_img airMass_back\" onclick=\"less_airMass()\">i</div><div class=\"airMass_forward airMass_img\" onclick=\"more_airMass()\">d</div>\n      </div>\n\n      <div class=\"airMass_div airMass_fade_effect\">\n        <img class=\"airMass_img img_scale\" src=\"/sharedFiles/airMass/airMass_13.jpg?dummy=123\" alt=\"\">\n        <div class=\"airMass_img airMass_back\" onclick=\"less_airMass()\">i</div><div class=\"airMass_forward airMass_img\" onclick=\"more_airMass()\">d</div>\n      </div>\n\n      <div class=\"airMass_div airMass_fade_effect\">\n        <img class=\"airMass_img img_scale\" src=\"/sharedFiles/airMass/airMass_14.jpg?dummy=123\" alt=\"\">\n        <div class=\"airMass_img airMass_back\" onclick=\"less_airMass()\">i</div><div class=\"airMass_forward airMass_img\" onclick=\"more_airMass()\">d</div>\n      </div>\n\n      <div class=\"airMass_div airMass_fade_effect\">\n        <img class=\"airMass_img img_scale\" src=\"/sharedFiles/airMass/airMass_15.jpg?dummy=123\" alt=\"\">\n        <div class=\"airMass_img airMass_back\" onclick=\"less_airMass()\">i</div><div class=\"airMass_forward airMass_img\" onclick=\"more_airMass()\">d</div>\n      </div>\n\n      <div class=\"airMass_div airMass_fade_effect\">\n        <img class=\"airMass_img img_scale\" src=\"/sharedFiles/airMass/airMass_16.jpg?dummy=123\" alt=\"\">\n        <div class=\"airMass_img airMass_back\" onclick=\"less_airMass()\">i</div><div class=\"airMass_forward airMass_img\" onclick=\"more_airMass()\">d</div>\n      </div>\n\n      <div class=\"airMass_div airMass_fade_effect\">\n        <img class=\"airMass_img img_scale\" src=\"/sharedFiles/airMass/airMass_17.jpg?dummy=123\" alt=\"\">\n        <div class=\"airMass_img airMass_back\" onclick=\"less_airMass()\">i</div><div class=\"airMass_forward airMass_img\" onclick=\"more_airMass()\">d</div>\n      </div>\n\n      <div class=\"airMass_div airMass_fade_effect\">\n        <img class=\"airMass_img img_scale\" src=\"/sharedFiles/airMass/airMass_18.jpg?dummy=123\" alt=\"\">\n        <div class=\"airMass_img airMass_back\" onclick=\"less_airMass()\">i</div><div class=\"airMass_forward airMass_img\" onclick=\"more_airMass()\">d</div>\n      </div>\n\n      <div class=\"airMass_div airMass_fade_effect\">\n        <img class=\"airMass_img img_scale\" src=\"/sharedFiles/airMass/airMass_19.jpg?dummy=123\" alt=\"\">\n        <div class=\"airMass_img airMass_back\" onclick=\"less_airMass()\">i</div><div class=\"airMass_forward airMass_img\" onclick=\"more_airMass()\">d</div>\n      </div>\n\n      <div class=\"airMass_div airMass_fade_effect\">\n        <img class=\"airMass_img img_scale\" src=\"/sharedFiles/airMass/airMass_20.jpg?dummy=123\" alt=\"\">\n        <div class=\"airMass_img airMass_back\" onclick=\"less_airMass()\">i</div><div class=\"airMass_forward airMass_img\" onclick=\"more_airMass()\">d</div>\n      </div>\n\n      <div class=\"airMass_div airMass_fade_effect\">\n        <img class=\"airMass_img img_scale\" src=\"/sharedFiles/airMass/airMass_21.jpg?dummy=123\" alt=\"\">\n        <div class=\"airMass_img airMass_back\" onclick=\"less_airMass()\">i</div><div class=\"airMass_forward airMass_img\" onclick=\"more_airMass()\">d</div>\n      </div>\n\n      <div class=\"airMass_div airMass_fade_effect\">\n        <img class=\"airMass_img img_scale\" src=\"/sharedFiles/airMass/airMass_22.jpg?dummy=123\" alt=\"\">\n        <div class=\"airMass_img airMass_back\" onclick=\"less_airMass()\">i</div><div class=\"airMass_forward airMass_img\" onclick=\"more_airMass()\">d</div>\n      </div>\n\n    </div>\n\n    <script>\n    var airMass_slideIndex = 0;\n    var airMass_numExecution = 0;\n    var airMass_loops = 1;\n    var airMass_isEnd = false;\n    var airMass_clicks = 0;\n    airMass_showSlides()\n\n    function changeOpacity() {\n      var airMass_back_div = document.getElementsByClassName(\"airMass_back\");\n      var airMass_forward_div = document.getElementsByClassName(\"airMass_forward\");\n\n      if (airMass_clicks == 0) {\n        for (airMass_back_div_i = 0; airMass_back_div_i < airMass_back_div.length; airMass_back_div_i++) {\n          airMass_back_div[airMass_back_div_i].style.opacity = \"0.4\";\n        }\n        for (airMass_forward_div_i = 0; airMass_forward_div_i < airMass_forward_div.length; airMass_forward_div_i++) {\n          airMass_forward_div[airMass_forward_div_i].style.opacity = \"0.4\";\n        }\n      }\n      if (airMass_clicks == 1) {\n        for (airMass_back_div_i = 0; airMass_back_div_i < airMass_back_div.length; airMass_back_div_i++) {\n          airMass_back_div[airMass_back_div_i].style.opacity = \"0.2\";\n        }\n        for (airMass_forward_div_i = 0; airMass_forward_div_i < airMass_forward_div.length; airMass_forward_div_i++) {\n          airMass_forward_div[airMass_forward_div_i].style.opacity = \"0.2\";\n        }\n      }\n      if (airMass_clicks > 1) {\n        for (airMass_back_div_i = 0; airMass_back_div_i < airMass_back_div.length; airMass_back_div_i++) {\n          airMass_back_div[airMass_back_div_i].style.opacity = \"0\";\n        }\n        for (airMass_forward_div_i = 0; airMass_forward_div_i < airMass_forward_div.length; airMass_forward_div_i++) {\n          airMass_forward_div[airMass_forward_div_i].style.opacity = \"0\";\n        }\n      }\n      airMass_clicks++;\n    }\n\n    function more_airMass() {\n      var airMass_i;\n      var airMass_slides = document.getElementsByClassName(\"airMass_div\");\n      \n      changeOpacity();\n      \n      if (airMass_slideIndex >= airMass_slides.length-1) {\n        airMass_slideIndex = 0\n      }else{\n        airMass_slideIndex++;\n      }\n\n      for (airMass_i = 0; airMass_i < airMass_slides.length; airMass_i++) {\n        airMass_slides[airMass_i].style.display = \"none\";\n      }\n      airMass_slides[airMass_slideIndex].style.display = \"block\";\n      \n    }\n\n    function less_airMass() {\n      var airMass_i;\n      var airMass_slides = document.getElementsByClassName(\"airMass_div\");\n\n      changeOpacity();\n      \n      if (airMass_slideIndex == 0) {\n        airMass_slideIndex = airMass_slides.length-1\n      }else{\n        airMass_slideIndex--;\n      }\n\n      for (airMass_i = 0; airMass_i < airMass_slides.length; airMass_i++) {\n        airMass_slides[airMass_i].style.display = \"none\";  \n      }\n      airMass_slides[airMass_slideIndex].style.display = \"block\";\n    }\n\n    function airMass_showSlides() {\n      var airMass_i;\n      var airMass_slides = document.getElementsByClassName(\"airMass_div\");\n      var airMass_back_div = document.getElementsByClassName(\"airMass_back\");\n      var airMass_forward_div = document.getElementsByClassName(\"airMass_forward\");\n      \n      for (airMass_i = 0; airMass_i < airMass_slides.length; airMass_i++) {\n        airMass_slides[airMass_i].style.display = \"none\";  \n      }\n\n      if (airMass_slideIndex >= airMass_slides.length) {\n        airMass_slideIndex = 0;\n        airMass_numExecution++;\n        for (airMass_back_div_i = 0; airMass_back_div_i < airMass_back_div.length; airMass_back_div_i++) {\n          airMass_back_div[airMass_back_div_i].style.opacity = \"0.2\";\n        }\n        for (airMass_forward_div_i = 0; airMass_forward_div_i < airMass_forward_div.length; airMass_forward_div_i++) {\n          airMass_forward_div[airMass_forward_div_i].style.opacity = \"0.2\";\n        }\n      }\n      \n      if (airMass_numExecution == airMass_loops) {\n        airMass_isEnd=true;\n        var airMass_back_div = document.getElementsByClassName(\"airMass_back\");\n        var airMass_forward_div = document.getElementsByClassName(\"airMass_forward\");\n\n        for (airMass_back_div_i = 0; airMass_back_div_i < airMass_back_div.length; airMass_back_div_i++) {\n          airMass_back_div[airMass_back_div_i].style.backgroundColor = \"#ff0000\";\n          airMass_back_div[airMass_back_div_i].style.opacity = \"0.4\";\n        }\n        for (airMass_forward_div_i = 0; airMass_forward_div_i < airMass_forward_div.length; airMass_forward_div_i++) {\n          airMass_forward_div[airMass_forward_div_i].style.backgroundColor = \"#0000ff\";\n          airMass_forward_div[airMass_forward_div_i].style.opacity = \"0.4\";\n        }\n      }\n\n      if ((airMass_slideIndex == 0) && (airMass_isEnd === true)) {\n        airMass_slides[0].style.display = \"block\";\n      }else{\n        airMass_slides[airMass_slideIndex].style.display = \"block\";\n        if (airMass_slideIndex == 0) {\n          for (airMass_back_div_i = 0; airMass_back_div_i < airMass_back_div.length; airMass_back_div_i++) {\n            airMass_back_div[airMass_back_div_i].style.backgroundColor = \"#0044ff\";\n            airMass_back_div[airMass_back_div_i].innerHTML = \"\";\n            airMass_back_div[airMass_back_div_i].style.opacity = \"0.2\";\n          }\n          for (airMass_forward_div_i = 0; airMass_forward_div_i < airMass_forward_div.length; airMass_forward_div_i++) {\n            airMass_forward_div[airMass_forward_div_i].style.backgroundColor = \"#0044ff\";\n            airMass_forward_div[airMass_forward_div_i].innerHTML = \"\";\n            airMass_forward_div[airMass_forward_div_i].style.opacity = \"0.2\";\n          }\n        }else{\n          for (airMass_back_div_i = 0; airMass_back_div_i < airMass_back_div.length; airMass_back_div_i++) {\n            airMass_back_div[airMass_back_div_i].style.opacity = \"0\";\n            airMass_back_div[airMass_back_div_i].style.opacity = \"0\";\n          }\n          for (airMass_forward_div_i = 0; airMass_forward_div_i < airMass_forward_div.length; airMass_forward_div_i++) {\n            airMass_forward_div[airMass_forward_div_i].style.opacity = \"0\";\n            airMass_forward_div[airMass_forward_div_i].style.opacity = \"0\";\n          }\n        }        \n        if ((airMass_slideIndex == 0) && (airMass_numExecution == 0)) {\n          airMass_slideIndex++;\n          setTimeout(airMass_showSlides, 200);\n        }else{\n          airMass_slideIndex++;\n          setTimeout(airMass_showSlides, 200);\n        }\n      }\n    }\n    </script>",
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
setupDashAemetAirMass;
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

DASHBOARD_TITLE="MeteoPi"
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
