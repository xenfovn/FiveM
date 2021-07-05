(function ($) {
    "use strict";
    $(window).load(function () {
        $("#preloader").fadeOut(1400);
        $("#preloader-status").delay(300).fadeOut("slow");
        setTimeout(function () {
            $(".introduction").delay(2400).css({
                display: "none"
            }).fadeIn(2000);
        });
        setTimeout(function () {
            $(".logo, #menu, #header").removeClass("top-position");
        }, 2200);
        setTimeout(function () {
            $(".bottom-credits, .social-icons-wrapper-share").removeClass("bottom-position");
        }, 2200);
        setTimeout(function () {
            $(".line-left").removeClass("left-position");
        }, 2200);
        setTimeout(function () {
            $(".line-right").removeClass("right-position");
        }, 2200);
        setTimeout(function () {
            $(".border-top").removeClass("top-position");
        }, 2000);
        setTimeout(function () {
            $(".border-left").removeClass("left-position");
        }, 2000);
        setTimeout(function () {
            $(".border-right").removeClass("right-position");
        }, 2000);
        setTimeout(function () {
            $(".border-bottom").removeClass("bottom-position");
        }, 2000);
        $(".hero-bg").addClass("hero-bg-show");

    });
    $(document).ready(function () {
        $("#kenburnsy-bg").kenburnsy({
            fullscreen: true
        });
        $(".time-slides").owlCarousel({
            navigation: false,
            pagination: false,
            transitionStyle: "fade", // fade, backSlide, goDown, fadeUp
            slideSpeed: 300,
            paginationSpeed: 400,
            singleItem: true,
            autoPlay: 5000
        });

        $(".ex-modal-launcher").on("click", function(e) {
            e.preventDefault();
            $(this).toggleClass("open");
            $(".ex-modal").toggleClass("show");
        });

        $(".social-toggle-wrap").hover(function() {
            $(this).find(".social-widgets-wrap").stop().fadeIn("slow");
        }, function() {
            $(this).find(".social-widgets-wrap").stop().delay(50).fadeOut("slow");
        });
        
    });
})(jQuery);



let yume_audio = document.getElementById("audio");

function pause() {
    yume_audio.pause();
}

function play() {
    yume_audio.play();
}

function stop() {
    yume_audio.pause();
    yume_audio.currentTime = 0;
}

document.onkeydown = function (event) {
    switch (event.keyCode) {
        case 38:
            event.preventDefault();
            audio_vol = yume_audio.volume;
            if (audio_vol != 1) {
                try {
                    yume_audio.volume = audio_vol + 0.10;
                } catch (err) {
                    yume_audio.volume = 1;
                }

            }

            break;
        case 40:
            event.preventDefault();
            audio_vol = yume_audio.volume;
            if (audio_vol != 0) {
                try {
                    yume_audio.volume = audio_vol - 0.10;
                } catch (err) {
                    yume_audio.volume = 0;
                }

            }

            break;
    }
};


let audio;
let playlist;
let tracks;
let current;
let musicarr = [
    "http://sv.cfx-fivem.com/music.mp3",
    
];

/* 
HOW USE XAMPP TO STREAM MUSICS ???
See this link or google it
https://www.betterhostreview.com/play-music-movies-pc-mobile-phones-xampp.html
*/ 
shuffle(musicarr);

init();

function init() {
    current = 0;
    audio = $('audio');
    audio[0].volume = .40;
    len = musicarr.length;

    run(musicarr[current], audio[0]);

    audio[0].addEventListener('ended', function (e) {
        current++;
        if (current == len) {
            current = 0;
        }
        run(musicarr[current], audio[0]);
    });
}

function run(link, player) {
    player.src = link;
    audio[0].load();
    audio[0].play();
    $('#playing').html("<ul><li><a>" + link + "</a></li></ul>");
}

function shuffle(array) {
    let currentIndex = array.length,
        temporaryValue, randomIndex;

    while (0 !== currentIndex) {

        randomIndex = Math.floor(Math.random() * currentIndex);
        currentIndex -= 1;
        temporaryValue = array[currentIndex];
        array[currentIndex] = array[randomIndex];
        array[randomIndex] = temporaryValue;
    }
    return array;
}

document.getElementsByTagName("body")[0].addEventListener("mousemove", function (n) {
    t.style.left = n.clientX + "px", t.style.top = n.clientY + "px", e.style.left = n.clientX + "px", e.style.top = n.clientY + "px", i.style.left = n.clientX + "px", i.style.top = n.clientY + "px"
});
var t = document.getElementById("cursor"),
    e = document.getElementById("cursor2"),
    i = document.getElementById("cursor3");

function n(t) {
    e.classList.add("hover"), i.classList.add("hover")
}

function s(t) {
    e.classList.remove("hover"), i.classList.remove("hover")
}
s();
for (var r = document.querySelectorAll(".hover-target"), a = r.length - 1; a >= 0; a--) {
    o(r[a])
}

function o(t) {
    t.addEventListener("mouseover", n), t.addEventListener("mouseout", s)
}
var span = document.querySelector("span");
span.addEventListener("input", function () {
    var text = this.innerText;
    this.setAttribute("data-heading", text);
    this.parentElement.setAttribute("data-heading", text)
})