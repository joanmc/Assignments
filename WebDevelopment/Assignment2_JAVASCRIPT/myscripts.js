var xmlhttp = new XMLHttpRequest();
var input,
    autocomplete,
    options,
    url,
    url_3hr,
    location_value,
    unit_value,
    unit1,
    days_value,
    days1,
    image_src,
    map,
    myLatLng,
    marker,
    datetime1,
    out,
    out2,
    data,
    data_3hr,
    rain,
    rain2,
    table,
    rows,
    rowNum,
    start,
    end,
    content,
    elements,
    array,
    points,
    chart,
    settings,
    i,
    j;

google.maps.event.addDomListener(window, "load", initialize);
document.getElementById("btn").addEventListener("click", function () {
    document.getElementById("details").style.display = 'inline';
    document.getElementById("map").style.display = 'block';
});
document.getElementById("chart").addEventListener("click", function () {
    document.getElementById("chart").style.display = 'none';
});
document.getElementById("details_summ").addEventListener("click", function () { clk('summary'); });
document.getElementById("details_tmin").addEventListener("click", function () { clk('tmin'); });
document.getElementById("details_tmax").addEventListener("click", function () { clk('tmax'); });
document.getElementById("details_rain").addEventListener("click", function () { clk('rain'); });
document.getElementById("details_icon").addEventListener("click", function () { clk('icon'); });
document.getElementById("details_pressure").addEventListener("click", function () { clk('pressure'); });
document.getElementById("details_humidity").addEventListener("click", function () { clk('humidity'); });
document.getElementById("details_wind").addEventListener("click", function () { clk('wind'); });

google.charts.load('current', {'packages': ['corechart']});

// function for google autocomplete in location input box
function initialize() {
    options = {
        language: 'en',
        types: ['(cities)']
    };
    input = document.getElementById('pac-input');
    autocomplete = new google.maps.places.Autocomplete(input, options);
}

//function that shows and hides the columns of the weather forecast tables
function clk(name1) {
    elements = document.getElementsByClassName(name1);
    if (document.form2[name1].checked) {
        for (i = 0; i < elements.length; i += 1) {
            elements[i].style.display = 'table-cell';
        }
    } else {
        for (i = 0; i < elements.length; i += 1) {
            elements[i].style.display = 'none';
        }
    }
}

// function to make request for daily weather forecast when form is submitted
function HTTPrequest(cfunc) {
    document.getElementById("table2").innerHTML = "";
    
    location_value = document.form1.location.value;
    unit1 = document.getElementsByName('unit');
    for (i = 0; i < unit1.length; i += 1) {
        if (unit1[i].checked) {
            unit_value = unit1[i].value;
        }
    }

    days1 = document.getElementsByName('days');
    for (i = 0; i < days1.length; i += 1) {
        if (days1[i].checked) {
            days_value = days1[i].value;
        }
    }

    url = "http://api.openweathermap.org/data/2.5/forecast/daily?q=" + location_value + "&units=" + unit_value + "&cnt=" + days_value + "&mode=json&appid=6ea16fe4508606f2a793eaef8abf2cab";
    
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            data = JSON.parse(xmlhttp.responseText);
            cfunc(data);
        }
    };
    xmlhttp.open("GET", url, true);
    xmlhttp.send();
}

// function the displays daily request response in a table
function myFunction(data) {
    initMap();

    out = '<table id="tbl1" class="tab1">';
    out += '<tr><td class="date">' + "Date and Time <br> (Click Date for more details)" +
                '</td><td class="summary">' + "Summary" +
                '</td><td class="tmin">' + "Minimum Temperature" +
                '</td><td class="tmax">' + "Maximum Temperature" +
                '</td><td class="rain">' + "Predicted Rainfall (mm)" +
                '</td><td class="icon">' + "Icon" +
                '</td><td class="pressure">' + "Pressure" +
                '</td><td class="humidity">' + "Humidity" +
                '</td><td class="wind">' + "Wind Speed" + '</td></tr>';

    for (i = 0; i < days_value; i += 1) {
        datetime1 = new Date(data.list[i].dt * 1000);
        image_src = "images/" + data.list[i].weather[0].icon + ".png";
        rain = (data.list[i].rain || 0);

        out += '<tr><td class="date" onclick="HTTPrequestHour()">' + datetime1 +
                    '</td><td class="summary">' + data.list[i].weather[0].description +
                    '</td><td class="tmin">'  + data.list[i].temp.min +
                    '</td><td class="tmax">' + data.list[i].temp.max +
                    '</td><td class="rain">' + rain +
                    '</td><td class="icon">'  + '<img src="' + image_src + '">' +
                    '</td><td class="pressure">' + data.list[i].pressure +
                    '</td><td class="humidity">' + data.list[i].humidity +
                    '</td><td class="wind">' + data.list[i].speed + "</td></tr>";
    }
    out += "</table>";
    document.getElementById("table").innerHTML = "<h2>" + days_value + " Day Forecast for " + location_value + "</h2>" + out;
}

// function that shows google map for location entered
function initMap() {
    myLatLng = {lat: data.city.coord.lat, lng: data.city.coord.lon};

    map = new google.maps.Map(document.getElementById("map"), {
        zoom: 12,
        center: myLatLng
    });

    marker = new google.maps.Marker({
        position: myLatLng,
        map: map,
        icon: 'images/mapicon.png'
    });
    
    google.maps.event.addListener(marker, "click", function () { info(); });
    
    google.maps.event.addListener(marker, "click", function () {
        if (document.getElementById("chart").style.display == 'block') {
            document.getElementById("chart").style.display = 'none';
        } else {
            document.getElementById("chart").style.display = 'block';
        }
    });
    
}

//function for info window of marker on google map - shown when marker clicked
function info() {
    content = '<div class="infobox"> Weather Summary:' +
                "<br>" + data.list[0].weather[0].description +
                "<br>Temperature: " + data.list[0].temp.day +
                "<br>" + '<img src="' + "images/" + data.list[0].weather[0].icon + ".png" + '">' + '</div>';
                
    var infowindow = new google.maps.InfoWindow();
    infowindow.setContent(content);
    infowindow.open(map, marker);
    drawChart();
}

// function for google chart - called whenthe marker on the map is clicked 
function drawChart() {
    array = [
        ["Day", "Temperature", "Rainfall (mm)", "Wind Speed"],
        ["1", data.list[0].temp.day, data.list[0].rain || 0, data.list[0].speed]
    ];
    
    for (i = 1; i < days_value; i += 1) {
        array.push([ i + 1, data.list[i].temp.day, data.list[i].rain || 0, data.list[i].speed]);
    }
    
    points = google.visualization.arrayToDataTable(array);

    settings = {
        title: 'Weather Data',
        curveType: 'function',
        width: 800,
        height: 500
    };

    chart = new google.visualization.LineChart(document.getElementById('chart'));
    chart.draw(points, settings);
    
}

// function to make request for 3 hour weather forecast when row of daily forecast table is clicked
function HTTPrequestHour() {
    // detect which row was clicked so know what day 3 hour forecast should be displayed for
    table = document.getElementById("tbl1");
    rows = table.getElementsByTagName("tr");
    for (i = 0; i < rows.length; i += 1) {
        rows[i].onclick = function () {
            rowNum = this.rowIndex;
        };
    }

    url_3hr = "http://api.openweathermap.org/data/2.5/forecast?q=" + location_value + "&units=" + unit_value + "&cnt=40&mode=json&appid=6ea16fe4508606f2a793eaef8abf2cab";

    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            data_3hr = JSON.parse(xmlhttp.responseText);
            myFunction2(data_3hr);
        }
    };
    xmlhttp.open("GET", url_3hr, true);
    xmlhttp.send();
}

// function the displays 3 hour request response in a table
function myFunction2(data_3hr) {
    out2 = '<table id="tbl2">' + '<tr><td class="date">' + "Date and Time" +
                '</td><td class="summary">' + "Summary" +
                '</td><td class="tmin">' + "Minimum Temperature" +
                '</td><td class="tmax">' + "Maximum Temperature" +
                '</td><td class="rain">' + "Predicted Rainfall (mm)" +
                '</td><td class="icon">' + "Icon" +
                '</td><td class="pressure">' + "Pressure" +
                '</td><td class="humidity">' + "Humidity" +
                '</td><td class="wind">' + "Wind Speed" + '</td></tr>';
    
    switch (rowNum) {
    case 1:
        start = 0;
        end = start + 8;
        break;
    case 2:
        start = 8;
        end = start + 8;
        break;
    case 3:
        start = 16;
        end = start + 8;
        break;
    case 4:
        start = 24;
        end = start + 8;
        break;
    case 5:
        start = 32;
        end = data_3hr.list.length;
        break;
    }

    for (j = start; j < end; j += 1) {
        datetime1 = new Date(data_3hr.list[j].dt * 1000);
        image_src = "images/" + data_3hr.list[j].weather[0].icon + ".png";
        rain2 = 0;
        if (data_3hr.list[j].hasOwnProperty('rain') && data_3hr.list[j].rain.hasOwnProperty('3h')) {
            rain2 = data_3hr.list[j].rain["3h"];
        }

        out2 += '<tr><td class="date">' + datetime1 +
                    '</td><td class="summary">' + data_3hr.list[j].weather[0].description +
                    '</td><td class="tmin">' + data_3hr.list[j].main.temp_min +
                    '</td><td class="tmax">' + data_3hr.list[j].main.temp_max +
                    '</td><td class="rain">' + rain2 +
                    '</td><td class="icon">' + '<img src="' + image_src + '">' +
                    '</td><td class="pressure">' + data_3hr.list[j].main.pressure +
                    '</td><td class="humidity">' + data_3hr.list[j].main.humidity +
                    '</td><td class="wind">' + data_3hr.list[j].wind.speed + "</td></tr>";
    }
    out2 += "</table>";
    
    document.getElementById("table2").style.display = 'inline';
    document.getElementById("table2").innerHTML = "<h2>3 Hour Forecast for " + location_value + "</h2>" + out2;
    
    document.getElementById("table2").addEventListener("click", function () {
        document.getElementById("table2").style.display = 'none';
    });
}