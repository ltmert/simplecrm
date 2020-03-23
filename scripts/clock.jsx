var wakeuptime = 7;
var noon = 12;
var lunchtime = 12;
var naptime = lunchtime + 2;
var saletime;
var evening = 18;

// Getting it to show the current time on the page
var showCurrentTime = function()
{
    // display the string on the webpage
    var clock = document.getElementById('clock');
 
    var currentTime = new Date();
 
    var hours = currentTime.getHours();
    var minutes = currentTime.getMinutes();
    var seconds = currentTime.getSeconds();
    var meridian = "AM";
 
    // Set hours
	  if (hours >= noon)
	  {
		  meridian = "PM";
	  }

	  if (hours > noon)
	  {
		  hours = hours - 12;
	  }
 
    // Set Minutes
    if (minutes < 10)
    {
        minutes = "0" + minutes;
    }
 
    // Set Seconds
    if (seconds < 10)
    {
        seconds = "0" + seconds;
    }
 
    // put together the string that displays the time
    var clockTime = hours + ':' + minutes + ':' + seconds + " " + meridian + "!";
 
    clock.innerText = clockTime;
};

// Getting the clock to increment on its own and change out messages and pictures
var updateClock = function() 
{
  var time = new Date().getHours();
  var messageText;
  var image = "/media/startup-vector-free-icon-set-02.png";

  var timeEventJS = document.getElementById("timeEvent");
  var CompanyImageJS = document.getElementById('CompanyImage');
  
  if (time == saletime)
  {
    image = "/simplecrm/media/startup-vector-free-icon-set-03.png";
    messageText = "Your Business";
  }
  else if (time == wakeuptime)
  {
    image = "/simplecrm/media/startup-vector-free-icon-set-04.png";
    messageText = "Your Goals";
  }
  else if (time == lunchtime)
  {
    image = "/simplecrm/media/startup-vector-free-icon-set-05.png";
    messageText = "Your Sales";
  }
  else if (time == naptime)
  {
    image = "/simplecrm/media/startup-vector-free-icon-set-06.png";
    messageText = "Stay in Control";
  }
  else if (time < noon)
  {
    image = "/simplecrm/media/startup-vector-free-icon-set-07.png";
    messageText = "Let's have numbers";
  }
  else if (time >= evening)
  {
    image = "/simplecrm/media/startup-vector-free-icon-set-08.png";
    messageText = "Let's move the data";
  }
  else
  {
    image = "/simplecrm/media/startup-vector-free-icon-set-09.png";
    messageText = "CRM";
  }

  console.log(messageText); 
  timeEventJS.innerText = messageText;
  CompanyImage.src = image;
  
  showCurrentTime();
};
updateClock();

// Getting the clock to increment once a second
var oneSecond = 1000;
setInterval( updateClock, oneSecond);


// Getting the Sale Time Button To Work
var saleButton = document.getElementById("saleTimeButton");

var saleEvent = function()
{
    if (saletime < 0) 
    {
        saletime = new Date().getHours();
        saleTimeButton.innerText = "Sale Over!";
        saleTimeButton.style.backgroundColor = "#0A8DAB";
    }
    else
    {
        saletime = -1;
        saleTimeButton.innerText = "Sale Time!";
        saleTimeButton.style.backgroundColor = "#222";
    }
};

saleButton.addEventListener("click", saleEvent);
saleEvent(); 


// Activates Wake-Up selector
var wakeUpTimeSelector =  document.getElementById("wakeUpTimeSelector");

var wakeUpEvent = function()
{
    wakeuptime = wakeUpTimeSelector.value;
};

wakeUpTimeSelector.addEventListener("change", wakeUpEvent);


// Activates Lunch selector
var lunchTimeSelector =  document.getElementById("lunchTimeSelector");

var lunchEvent = function()
{
    lunchtime = lunchTimeSelector.value;
};

lunchTimeSelector.addEventListener("change", lunchEvent);


// Activates Nap-Time selector
var napTimeSelector =  document.getElementById("napTimeSelector");

var napEvent = function()
{
    naptime = napTimeSelector.value;
};

napTimeSelector.addEventListener("change", napEvent);