$(document).ready(function () {

    window.addEventListener("message", function (event) {
        if (event.data.displayhud == true) {
            $('.bar2').show();
            update(event.data.speed, 1);
        };

        if (event.data.displayhud == false) {

            $(".bar2").hide();
            update(event.data.speed, 1);

        };

    });
});

$("#close").click(function () {
    $('.container').css('display', 'none');
    $.post('http://diamond_trunk/escape', JSON.stringify({}));
});

function setSpeed () {
  let speedM = 0;
  let gear = 0;
  let rpm = 0;
   setInterval(function(){
     if (speedM > 160){
        speedM = 0;
        rpm = 0;
      }
     if (speedM > 1 && speedM< 30){
       gear = 1;
     } else if (speedM > 30 && speedM < 50) {
       gear = 2;
          } else if (speedM > 50 &&   speedM < 70) {
       gear = 3;
     } else if (speedM > 70 &&   speedM < 100)      {
       gear = 4;
          } else if (speedM > 100)      {
       gear = 5;
     }
     
     speedM++;
     if (rpm < 1){
      rpm += .03; 
     }
       update(speedM,1);

   }, 40);
  
}

function update(speed, gas) {
    document.getElementsByClassName('kmh')[0].innerHTML = speed + "KM/H";
}

