$(document).on('keydown', function() {
    switch(event.keyCode) {
        case 27: // ESC
            //Inventory.Close();
            break;
    }
});

$(document).on('keydown', function(data) {
    if(data.which == 78) {
      $.post("http://krovi-voip/talkOn", JSON.stringify({}));
    }
});

$(document).on("keyup", function(data) {
    if(data.which == 78) {
      $.post("http://krovi-voip/talkOff", JSON.stringify({}));
    }
});

var moneyTimeout = null;
var CurrentProx = 0;
var moveup = true;
var movedown = true;

(() => {
    PSHud = {};

    PSHud.Open = function(data) {
        $(".money-cash").css("display", "block");
        // $(".money-bank").css("display", "block");
        $("#cash").html(data.cash);
        // $("#bank").html(data.bank);
    };

    PSHud.Close = function() {

    };

    PSHud.Show = function(data) {
        if(data.type == "cash") {
            $(".money-cash").fadeIn(150);
            //$(".money-cash").css("display", "block");
            $("#cash").html(Math.round(data.cash * 10) / 10);
            setTimeout(function() {
                $(".money-cash").fadeOut(750);
            }, 3500)
        } else if(data.type == "bank") {
            $(".money-bank").fadeIn(150);
            $(".money-bank").css("display", "block");
            $("#bank").html(Math.round(data.bank * 10) / 10);
            setTimeout(function() {
                $(".money-bank").fadeOut(750);
            }, 3500)
        }
    };

    PSHud.ToggleSeatbelt = function(data) {
        if (data.seatbelt) {
            $(".car-seatbelt-info img").attr('src', './seatbelt-on.png');
        } else {
            $(".car-seatbelt-info img").attr('src', './seatbelt.png');
        }
    };

    PSHud.ToggleHarness = function(data) {
        if (data.toggle) {
            $(".car-seatbelt-info").html('&nbsp;&nbsp;&nbsp;&nbsp;<span class="seatbelt-text">Harness</div>');
        } else {
            $(".car-seatbelt-info").html('&nbsp;&nbsp;&nbsp;&nbsp;<img src="./seatbelt-on.png">');
        }
    }

    PSHud.UpdateNitrous = function(data) {
        if (data.toggle) {
            if (data.active) {
                $("#nos-amount").css({"color":"#fcb80a"});
            } else {
                $("#nos-amount").css({"color":"#fff"});
            }
            $("#nos-amount").html(data.level);
        } else {
            $("#nos-amount").html("0");
            $("#nos-amount").css({"color":"#fff"});
        }
    }

    PSHud.CarHud = function(data) {
        if (data.show) {

            if (moveup) {

                moveup = false
                movedown = true

                $('.circle-progress5').animate({ top: "0px"}, 'fast');
                $('.circle-progress1').animate({ top: "0px"}, 'fast');
                $('.circle-progress2').animate({ top: "0px"}, 'fast');
                $('.circle-progress3').animate({ top: "0px"}, 'fast');
                $('.circle-progress4').animate({ top: "0px"}, 'fast');
                $('.circle-progress5').animate({ top: "0px"}, 'fast');
                $('.circle-progress6').animate({ top: "0px"}, 'fast');
                
                $('.fa-heartbeat').animate({ top: "14px"}, 'fast');
                $('.fa-user-shield').animate({ top: "16px"}, 'fast');
                $('.fa-lungs').animate({ top: "14px"}, 'fast');
                $('.fa-hamburger').animate({ top: "16px"}, 'fast');
                $('.fa-glass-whiskey').animate({ top: "14px"}, 'fast');
                $('.fa-brain').animate({ top: "14px"}, 'fast');

            }
            $(".ui-car-container").fadeIn();
        } else {

            if (movedown) {
                movedown = false
                moveup = true

                $('.circle-progress1').animate({ top: "215px"}, 'fast');
                $('.circle-progress2').animate({ top: "215px"}, 'fast');
                $('.circle-progress3').animate({ top: "215px"}, 'fast');
                $('.circle-progress4').animate({ top: "215px"}, 'fast');
                $('.circle-progress5').animate({ top: "215px"}, 'fast');
                $('.circle-progress6').animate({ top: "215px"}, 'fast');


                $('.fa-heartbeat').animate({ top: "231px"}, 'fast');
                $('.fa-user-shield').animate({ top: "230px"}, 'fast');
                $('.fa-lungs').animate({ top: "229px"}, 'fast');
                $('.fa-hamburger').animate({ top: "228px"}, 'fast');
                $('.fa-glass-whiskey').animate({ top: "228px"}, 'fast');
                $('.fa-brain').animate({ top: "228px"}, 'fast');

            }
            $(".ui-car-container").fadeOut();
        }
    };

    PSHud.UpdateHud = function(data) {
        var Show = "block";
        if (data.show) {
            Show = "none";
            $(".ui-container").css("display", Show);
            $(".hudcontainer").css("display", Show);
            return;
        }else if(!data.togglehud) {
            Show = "none";
            $(".hudcontainer").css("display", Show);
            return
        }
        $(".hudcontainer").css("display", Show);
        $(".ui-container").css("display", Show);


        // HP Bar
        circleProgress1.value = data.health-100;
        circleProgress2.value = data.armor;
        circleProgress4.value = data.hunger;
        circleProgress5.value = data.thirst;
        circleProgress6.value = data.stress;
        if (data.inwater) {
            $(".circle-progress-value5").css("stroke","#83a4ec")
            circleProgress3.value = data.oxygen*10;
        } 
        else {
            $(".circle-progress-value5").css("stroke","#7fcdff")
            circleProgress3.value = data.stamina
        }

        $('.time-text').html(data.time.hour + ':' + data.time.minute);
        $("#fuel-amount").html((data.fuel).toFixed(0));
        $("#speed-amount").html(data.speed);

        if (data.street2 != "" && data.street2 != undefined) {
            $(".ui-car-street").html(data.street1 + ' | ' + data.street2 + ' | ' + data.area_zone);
        } else {
            $(".ui-car-street").html(data.street1 + ' | ' + data.area_zone);
        }

        if (data.engine < 600) {
            $(".car-engine-info img").attr('src', './engine-red.png');
            $(".car-engine-info").fadeIn(150);
        } else if (data.engine < 800) {
            $(".car-engine-info img").attr('src', './engine.png');
            $(".car-engine-info").fadeIn(150);
        } else {
            if ($(".car-engine-info").is(":visible")) {
                $(".car-engine-info").fadeOut(150);
            }
        }
    };

    PSHud.UpdateProximity = function(data) {
        if (data.prox == 1) {
            $("[data-voicetype='1']").fadeIn(150);
            $("[data-voicetype='2']").fadeOut(150);
            $("[data-voicetype='3']").fadeOut(150);
        } else if (data.prox == 2) {
            $("[data-voicetype='1']").fadeIn(150);
            $("[data-voicetype='2']").fadeIn(150);
            $("[data-voicetype='3']").fadeOut(150);
        } else if (data.prox == 3) {
            $("[data-voicetype='1']").fadeIn(150);
            $("[data-voicetype='2']").fadeIn(150);
            $("[data-voicetype='3']").fadeIn(150);
        }
        CurrentProx = data.prox;
    }

    PSHud.SetTalkingState = function(data) {
        if (!data.IsTalking) {
            $(".voice-block").animate({"background-color": "rgb(255, 255, 255)"}, 150);
        } else {
            $(".voice-block").animate({"background-color": "#fc4e03"}, 150);
        }
    }

    PSHud.Update = function(data) {
        if(data.type == "cash") {
            $(".money-cash").css("display", "block");
            $("#cash").html(data.cash);
            if (data.minus) {
                $(".money-cash").append('<p class="moneyupdate minus">-<span id="cash-symbol">&dollar;&nbsp;</span><span><span id="minus-changeamount">' + data.amount + '</span></span></p>')
                $(".minus").css("display", "block");
                setTimeout(function() {
                    $(".minus").fadeOut(750, function() {
                        $(".minus").remove();
                        $(".money-cash").fadeOut(750);
                    });
                }, 3500)
            } else {
                $(".money-cash").append('<p class="moneyupdate plus">+<span id="cash-symbol">&dollar;&nbsp;</span><span><span id="plus-changeamount">' + data.amount + '</span></span></p>')
                $(".plus").css("display", "block");
                setTimeout(function() {
                    $(".plus").fadeOut(750, function() {
                        $(".plus").remove();
                        $(".money-cash").fadeOut(750);
                    });
                }, 3500)
            }
        }
    };

    PSHud.UpdateCompass = function(data) {
        if (data.toggle == true) {
            $(".compass-container").fadeIn(150);
            $(".compass-ui").fadeIn(150);
            var amt = (data.heading * 0.1133333333333333);
            if (data.lookside == "left") {
                $(".compass-ui").css({
                    "right": (-30.6 - amt) + "vh"
                });
            } else {
                $(".compass-ui").css({
                    "right": (-30.6 + -amt) + "vh"
                });
            }
        } else {
           $(".compass-container").fadeOut(150);
           $(".compass-ui").fadeOut(150);
        }

    }

    PSHud.UpdateMeters = function(data) {
        var str = data.amount.toString();
        var l = str.length;
        $(".meters-text").html(data.amount + " <span style='position: relative; top: -.49vh; font-size: 1.2vh;'>miles</span>");
    }

    window.onload = function(e) {
        window.addEventListener('message', function(event) {
            switch(event.data.action) {
                case "open":
                    PSHud.Open(event.data);
                    break;
                case "close":
                    PSHud.Close();
                    break;
                case "update":
                    PSHud.Update(event.data);
                    break;
                case "show":
                    PSHud.Show(event.data);
                    break;
                case "hudtick":
                    PSHud.UpdateHud(event.data);
                    break;
                case "car":
                    PSHud.CarHud(event.data);
                    break;
                case "seatbelt":
                    PSHud.ToggleSeatbelt(event.data);
                    break;
                case "harness":
                    PSHud.ToggleHarness(event.data);
                    break;
                case "nitrous":
                    PSHud.UpdateNitrous(event.data);
                    break;
                case "proximity":
                    PSHud.UpdateProximity(event.data);
                    break;
                case "talking":
                    PSHud.SetTalkingState(event.data);
                    break;
                case "UpdateCompass":
                    PSHud.UpdateCompass(event.data);
                    break;
                case "UpdateDrivingMeters":
                    PSHud.UpdateMeters(event.data);
                    break;

            }
        })
    }

    var circleProgress1 = new CircleProgress(".progress1");
    circleProgress1.max = 100;
    circleProgress1.value = 0;
    circleProgress1.textFormat = "none"

    var circleProgress2 = new CircleProgress(".progress2");
    circleProgress2.max = 100;
    circleProgress2.value = 0;
    circleProgress2.textFormat = "none"

    var circleProgress3 = new CircleProgress(".progress3");
    circleProgress3.max = 100;
    circleProgress3.value = 0;
    circleProgress3.textFormat = "none"

    var circleProgress4 = new CircleProgress(".progress4");
    circleProgress4.max = 100;
    circleProgress4.value = 0;
    circleProgress4.textFormat = "none"

    var circleProgress5 = new CircleProgress(".progress5");
    circleProgress5.max = 100;
    circleProgress5.value = 0;
    circleProgress5.textFormat = "none"


    var circleProgress6 = new CircleProgress(".progress6");
    circleProgress6.max = 100;
    circleProgress6.value = 0;
    circleProgress6.textFormat = "none"
})();


