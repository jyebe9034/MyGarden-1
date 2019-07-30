<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp" />
<title>나의 정원 - 배송조회</title>
<style>
	/* Variables */
:root {
    --bg: #DBDBDB;
    --gray: #393F4D;
    --gray-l: #f5f5f5;
    --cyan: #B6E4E6;
    --green: #51E5FF;
    --yellow: #FDE74C;
}
/* Reset */
*, *::after, *::before {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
    text-rendering: optimizeLegibility;
    user-select: none;
}
/* Tag */

body{
	padding-top:50px;
	padding-bottom:50px;
}
#wrapper{
    margin:auto;
    display: flex;
    justify-content: center;
    align-items: center;
    width: 85%;
    min-height: 60vh;
    background: var(--bg);
    border-radius:20px;
}
main{
    min-width: 800px;
    height: 300px;
    position: relative;
    transform-style: preserve-3d;
    animation: rotate-container 10s infinite ease-in-out alternate;
}
/* Components */
.way{
    position: absolute;
    top: 0;
    width: 350px;
    height: 350px;
    background: var(--gray);
    border: 50px solid var(--gray-l);
    transform: rotateX(90deg);
    transform-style: preserve-3d;
    border-radius: 15px;
    box-shadow: 2px 2px 100px 0px rgba(0,0,0,0.1);

}
.way-l{ left: 0; }
.way-r{
    right: 0;
    display: flex;
}
.ad{
    position: absolute;
    top: 150px;
    left: 80px;
    transform: rotateY(-20deg);
    font-size: 10px;
    padding: 2px 5px;
    letter-spacing: 2px;
    border-radius: 2px;
    color: white;
    background: var(--gray);
    border: 1px solid white;
    animation: ad-sale 1s linear infinite 1s;
}
.txt{
    position: absolute;
    top: 50px;
    left: calc(50% - 75px);
    width: 150px;

    font-size: 20px;
    padding: 3px 5px;
    letter-spacing: 2px;
    text-align: center;
    color: white;
    background: var(--gray);
    border-radius: 4px;

    box-shadow: 3px 3px 100px 3px rgba(0,0,0,0.2);

}
.way-r .cube{
    height: 300px;
    width: 100px;
    transform:
            rotateX(90deg)
            rotateY(180deg)
            rotateZ(180deg)
            translateY(-80px)
            translateX(20px)
            translateZ(-10px)
            scale(.5);
    ;
}
.bridge{
    width: 50px;
    height: 100px;
    background: var(--green);
    position: absolute;
}
.bridge-l{
    transform:
        rotateX(90deg)
        rotateZ(90deg)
        translateY(-275px)
        translateZ(-125px)
        translateX(150px);
    animation: move-bridge-l 15s linear infinite;
    border-top: 5px solid var(--gray);
    border-bottom: 5px solid var(--gray);
}
.bridge-r{
    transform:
        rotateX(90deg)
        rotateZ(90deg)
        translateY(-475px)
        translateZ(-125px)
        translateX(150px);
    animation: move-bridge-r 15s linear infinite;
    border-top: 5px solid var(--gray);
    border-bottom: 5px solid var(--gray);
}
.cube{
    height: 300px;
    width: 100px;
    position: relative;
    z-index:300;
    transform-style: preserve-3d;
    transform:
            rotateX(90deg)
            rotateY(180deg)
            rotateZ(180deg)
            translateY(-120px)
            translateX(80px)
            translateZ(-10px)
            scale(.75);
    ;
}
.cube__face{
    width: 100%;
    height: 100%;
    position: absolute;
    backface-visibility: hidden;
    display: flex;
    justify-content: center;
    align-items: flex-start;
    flex-direction: row;
    flex-wrap: wrap;
    padding-top: 5px;
    padding-bottom: 20px;
    background: white;
    border: 2px solid white;
    border-bottom: 2px solid var(--gray);
}

.cube__face:hover{
    border: 2px solid var(--green);
    cursor: pointer;
}
.cube__window{
    height: 20px;
    width: 100px;
    margin: 5px 7px 0px;
    border-radius: 3px;
    background: var(--gray-l);
}
.cube__window-light-1{ animation: window-light 4.8s linear infinite .25s;}
.cube__window-light-2{ animation: window-light 3.3s linear infinite;}
.cube__window-light-3{ animation: window-light 4.2s linear infinite 2s;}
.cube__window-light-4{ animation: window-light 3s linear infinite;}
.cube__window-light-5{ animation: window-light 2.5s linear infinite 1s;}
.cube__door{
    height: 40px;
    width: 60%;
    background: var(--gray);
    border-top-left-radius:  2px;
    border-top-right-radius:  2px;
    align-self: flex-end;
    border-bottom: 0;
}
.cube__face--front{
    transform: rotateY(0deg) translateZ(50px);
    padding-bottom: 0px;
}
.cube__face--back{
    transform: rotateY(180deg) translateZ(50px);
}
.cube__face--right{
    transform: rotateY(90deg) translateZ(50px);
}
.cube__face--left{
    transform: rotateY(-90deg) translateZ(50px);
}
.cube__face--top{
    transform: rotateX( 90deg) translateZ(50px);
    height: 100px;
    border: 8px solid white;
    background: var(--gray-l);
}
.cube__face--bottom{
    transform: rotateX(-90deg) translateZ(250px);
    height: 100px;
    background-color: var(--gray);
}


.truck{
    display: flex;
    align-items: flex-end;
    height: 20px;
    width: 40px;
    transform-style: preserve-3d;
    position: relative;
    z-index: 100;
    transform:
        translateX(310px)
        translateY(150px)
        translateZ(150px)
        rotateY(-90deg);
    animation: truck-animation 15s linear infinite ;


}
    .truck-f{
        height: 13px;
        width: 10px;
        margin-right: 1px;
    }
        .truck-f__face{
            height: 13px;
            width: 10px;
            position: absolute;
            background: var(--cyan);
        }
        .truck-f--front{
            transform: rotateY(0deg) translateZ(5px);
            background-image:
                linear-gradient(
                    to bottom,
                    var(--cyan) 0px,
                    var(--cyan) 6px,
                    var(--green) 6px,
                    var(--green) 11px,
                    var(--gray) 11px
                );
        }
        .truck__handle{
            background: var(--gray);
            height: 1px;
            width: 3px;
        }
            .truck-f--front .truck__handle{
                transform: rotateY(0deg) translateX(6px) translateY(8px) translateZ(5px);
            }
        .truck-f--back{
            transform: rotateY(180deg) translateZ(5px);
            background-image:
                linear-gradient(
                    to bottom,
                    var(--cyan) 0px,
                    var(--cyan) 6px,
                    var(--green) 6px,
                    var(--green) 11px,
                    var(--gray) 11px
                );
        }
            .truck-f--back .truck__handle{
                transform: rotateY(180deg) translateX(-1px) translateY(8px) translateZ(5px);
            }
        .truck-f--left{
            transform: rotateY(-90deg) translateZ(5px);
            background-image:
                linear-gradient(
                    to bottom,
                    var(--cyan) 0px,
                    var(--cyan) 6px,
                    var(--green) 6px,
                    var(--green) 11px,
                    var(--gray) 11px
                );
        }
        .truck-f--right{
            transform: rotateY(90deg) translateZ(5px);
        }
        .truck-f--top{
            height: 10px;
            transform: rotateX(90deg) translateZ(5px);
            background-color: var(--green);
        }
        .truck-f--bottom{
            height: 10px;
            transform: rotateX(-90deg) translateZ(8px);
        }
    .truck-b{
        height: 20px;
        width: 30px;
    }
        .truck-b__face{
            height: 20px;
            width: 30px;
            position: absolute;
            background-color: white;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .truck-b--front{
            transform: rotateY(0deg) translateZ(5px);
            border-bottom: 2px solid var(--gray);
        }
        .truck-b--back{
            transform: rotateY(180deg) translateZ(5px);
            border-bottom: 2px solid var(--gray);
        }
        .truck-b--left{
            width: 10px;
            transform: rotateY(-90deg) translateZ(5px);
        }
        .truck-b--right{
            width: 10px;
            transform: rotateY(90deg) translateZ(25px);
            border-bottom: 2px solid var(--gray);
        }
        .truck-b--top{
            height: 10px;
            transform: rotateX(90deg) translateZ(5px);
        }
        .truck-b--bottom{
            height: 10px;
            transform: rotateX(-90deg) translateZ(15px);
        }

    .truck-ls{
        display: flex;
        justify-content: space-between;
        height: 2px;
        width: 8px;
        transform: rotateY(-90deg) translateY(-1px) translateZ(4px);
        position: absolute;
    }
        .truck-l{
            height: 1px;
            width: 1px;
            border-radius: 50%;
            background: var(--window);
        }
        .truck-l:nth-of-type(2){
            height: 1px;
            width: 3px;
            border-radius: 3px;
        }
        .truck-l:nth-of-type(1),
        .truck-l:nth-of-type(3){
            animation: truck-light .5s infinite ease-in;
        }

    .truck-w{
        height: 4px;
        width: 4px;
        border-radius: 50%;
        position: absolute;
        animation: truck-wheel .075s infinite linear alternate;
    }
    .truck-w--lf{
        transform: rotateY(0deg) translateX(1px) translateY(1.5px) translateZ(5px);
    }
    .truck-w--lb{
        transform: rotateY(180deg) translateX(-1px) translateY(1.5px) translateZ(5px);
    }
    .truck-w--rf{
        transform: rotateY(0deg) translateX(25px) translateY(1.5px) translateZ(5px);
    }
    .truck-w--rb{
        transform: rotateY(180deg) translateX(-25px) translateY(1.5px) translateZ(5px);
    }
    .truck-w--rf-2{
        transform: rotateY(0deg) translateX(30px) translateY(1.5px) translateZ(5px);
    }
    .truck-w--rb-2{
        transform: rotateY(180deg) translateX(-30px) translateY(1.5px) translateZ(5px);
    }
/* Animations */
@keyframes rotate-container {
    0%{
        transform:
            perspective(2000px)
            translateZ(-250px)
            rotate3d(-300,0,0,10deg)
            rotateY(-45deg);
    }
    100%{
        transform:
            perspective(2000px)
            translateZ(-250px)
            rotate3d(-300,0,0,15deg)
            rotateY(45deg);
    }
}

@keyframes move-bridge-l {
    0%, 25%, 26%, 100%{
        transform:
            rotateX(90deg)
            rotateZ(90deg)
            translateY(-275px)
            translateZ(-125px)
            translateX(150px);
        background: var(--yellow);
    }

    42%, 96%{
        transform:
            rotateX(90deg)
            rotateZ(90deg)
            translateY(-325px)
            translateZ(-125px)
            translateX(150px);
        background: var(--green);
    }

}
@keyframes move-bridge-r {
    0%, 25%, 26%, 100%{
        transform:
            rotateX(90deg)
            rotateZ(90deg)
            translateY(-475px)
            translateZ(-125px)
            translateX(150px);
        background: var(--yellow);

    }
    42%, 96%{
        transform:
            rotateX(90deg)
            rotateZ(90deg)
            translateY(-425px)
            translateZ(-125px)
            translateX(150px);
            background: var(--green);

    }
}
@keyframes truck-animation {
    0%{
        transform:
            translateX(310px)
            translateY(150px)
            translateZ(150px)
            scale(1.5)
            rotateY(-90deg);
    }
    9%{
        transform:
            translateX(310px)
            translateY(150px)
            translateZ(-150px)
            rotateY(-90deg);
    }
    10%{
        transform:
            translateX(310px)
            translateY(150px)
            translateZ(-150px)
            rotateY(0deg);
    }
    19%{
        transform:
            translateX(0px)
            translateY(150px)
            translateZ(-150px)
            rotateY(0deg);
    }
    20%{
        transform:
            translateX(0px)
            translateY(150px)
            translateZ(-150px)
            rotateY(90deg);
    }
    29%{
        transform:
            translateX(0px)
            translateY(150px)
            translateZ(150px)
            rotateY(90deg);
    }
    30%{
        transform:
            translateX(0px)
            translateY(150px)
            translateZ(150px)
            rotateY(180deg);
    }
    59%{
        transform:
            translateX(750px)
            translateY(150px)
            translateZ(150px)
            rotateY(180deg);
    }
    60%{
        transform:
            translateX(750px)
            translateY(150px)
            translateZ(150px)
            rotateY(270deg);
    }
    69%{
        transform:
            translateX(750px)
            translateY(150px)
            translateZ(-150px)
            rotateY(270deg);
    }
    70%{
        transform:
            translateX(750px)
            translateY(150px)
            translateZ(-150px)
            rotateY(360deg);
    }
    79%{
        transform:
            translateX(450px)
            translateY(150px)
            translateZ(-150px)
            rotateY(360deg);
    }
    80%{
        transform:
            translateX(450px)
            translateY(150px)
            translateZ(-150px)
            rotateY(450deg);
    }
    89%{
        transform:
            translateX(450px)
            translateY(150px)
            translateZ(150px)
            rotateY(450deg);
    }
    90%{
        transform:
            translateX(450px)
            translateY(150px)
            translateZ(150px)
            rotateY(360deg);
    }
    99%{
        transform:
            translateX(310px)
            translateY(150px)
            translateZ(150px)
            rotateY(360deg);
    }
    100%{
        transform:
            translateX(310px)
            translateY(150px)
            translateZ(150px)
            rotateY(360deg);
    }
}


@keyframes truck-light {
    0%{ opacity: .3; }
    100%{ opacity: 1; }
}
@keyframes truck-wheel {
    0%{
        border: 1px solid black;
        border-top: 1px solid var(--wheel);
        background: var(--gray-shadow);
    }
    25%{
        border: 1px solid black;
        border-right: 1px solid var(--wheel);
        background: var(--gray-shadow);
    }
    50%{
        border: 1px solid black;
        border-bottom: 1px solid var(--wheel);
        background: var(--gray-shadow);
    }
    100%{
        border: 1px solid black;
        border-lef: 1px solid var(--wheel);
        background: var(--gray-shadow);
    }
}
@keyframes window-light {
    0%, 50%{ background: var(--gray-l); }
    100%{ background: var(--cyan);}
}
@keyframes ad-sale {
    0%, 50%{ border: 2px solid white; }
    100%{  border: 2px solid var(--green);}
}	



/**
 * Sweetracker
 */

@import url(https://fonts.googleapis.com/earlyaccess/notosanskr.css);


.header-title {
    border-bottom: solid 2px #dddddd;
    margin-bottom: 30px;
    padding-bottom: 10px;

    font-size: 16px;
    font-weight: 500;
    font-style: normal;
    color: #777777;
}

.label-style {
    font-size: 16px;
    color: #3cc6d3;
    font-weight: normal;
}

.info-style {
    font-size: 16px;
    font-weight: normal;
    color: #343434;
}



.table-striped > tbody > tr:nth-of-type(odd) {
    background-color: rgba(54, 198, 211, 0.06);
}

.table > thead > tr > th {
    vertical-align: bottom;
    border-bottom: 2px solid #ddd;
    padding: 11px;
}

.table > tbody > tr > td, .table > tfoot > tr > td {
    padding: 11px;
    line-height: 1.42857143;
    vertical-align: top;
    border-top: 0px;
}

.table-striped > thead {
    font-size: 14px;
    font-weight: 500;
    color: #777777;
}

.table-striped > tbody {
    font-size: 14px;
    font-weight: 300;
    color: #777777;
}

.td-time {
    width: 40%;
}

.td-location {
    width: 40%;
}

.td-status {
    width: 20%;
}

.headerWrapper{
	margin-top:30px;
	padding:30px;
}

.bodyWrapper{
	padding-left:30px;
	padding-right:30px;
}

.myform{
	margin-bottom:3px;
	
}
strong{
	font-size:17px;
}

/* 전체 폰트용 코드  */
@font-face {
	font-family: 'S-CoreDream-3Light';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'Eoe_Zno_L';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_eight@1.0/Eoe_Zno_L.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: 'S-CoreDream-3Light';
}

* {
	font-family: 'Eoe_Zno_L';
}
/* 폰트용 코드  */

</style>
<script>
	$(function(){
		var text = ["나의 정원", "배송 조회"];
		var counter = 0;
		var elem = document.getElementById("txt");
		var inst = setInterval(change, 1500);

		function change() {
		    elem.innerHTML = text[counter];
		    counter++;
		    if (counter >= text.length) {
		        counter = 0;
		    }
		}
		window.addEventListener("DOMContentLoaded", change);
	})
</script>
</head>
<body>
<div id="wrapper">
<main>
    <div class="way way-l">
        <div class="cube">
            <div class="cube__face cube__face--front">
                <div class="cube__window cube__window-light-1"></div>
                <div class="cube__window"></div>
                <div class="cube__window cube__window-light-5"></div>
                <div class="cube__window"></div>
                <div class="cube__window cube__window-light-3"></div>
                <div class="cube__window cube__window-light-1"></div>
                <div class="cube__window"></div>
                <div class="cube__window"></div>
                <div class="cube__window cube__window-light-5"></div>
                <div class="cube__door"></div>
            </div>
            <div class="cube__face cube__face--back">
                <div class="cube__window cube__window-light-1"></div>
                <div class="cube__window"></div>
                <div class="cube__window"></div>
                <div class="cube__window cube__window-light-2"></div>
                <div class="cube__window"></div>
                <div class="cube__window cube__window-light-3"></div>
                <div class="cube__window cube__window-light-1"></div>
                <div class="cube__window"></div>
                <div class="cube__window"></div>
                <div class="cube__window cube__window-light-2"></div>
            </div>
            <div class="cube__face cube__face--right">
                <div class="cube__window cube__window-light-2"></div>
                <div class="cube__window"></div>
                <div class="cube__window cube__window-light-1"></div>
                <div class="cube__window"></div>
                <div class="cube__window "></div>
                <div class="cube__window"></div>
                <div class="cube__window cube__window-light-5"></div>
                <div class="cube__window "></div>
                <div class="cube__window"></div>
                <div class="cube__window cube__window-light-2"></div>
            </div>
            <div class="cube__face cube__face--left">
                <div class="cube__window cube__window-light-3"></div>
                <div class="cube__window"></div>
                <div class="cube__window cube__window-light-5"></div>
                <div class="cube__window "></div>
                <div class="cube__window "></div>
                <div class="cube__window cube__window-light-1"></div>
                <div class="cube__window"></div>
                <div class="cube__window cube__window-light-4"></div>
                <div class="cube__window"></div>
                <div class="cube__window"></div>
            </div>
            <div class="cube__face cube__face--top"></div>
            <div class="cube__face cube__face--bottom"></div>
        </div>
    </div>
    <div class="way way-r">
        <div class="cube">
            <div class="cube__face cube__face--front">
                <div class="cube__window "></div>
                <div class="cube__window"></div>
                <div class="cube__window cube__window-light-2"></div>
                <div class="cube__window"></div>
                <div class="cube__window "></div>
                <div class="cube__window cube__window-light-2"></div>
                <div class="cube__window"></div>
                <div class="cube__window cube__window-light-2"></div>
                <div class="cube__window cube__window-light-1"></div>
                <div class="cube__door"></div>
            </div>
            <div class="cube__face cube__face--back">
                <div class="cube__window cube__window-light-1"></div>
                <div class="cube__window"></div>
                <div class="cube__window"></div>
                <div class="cube__window cube__window-light-2"></div>
                <div class="cube__window cube__window-light-1"></div>
                <div class="cube__window"></div>
                <div class="cube__window"></div>
                <div class="cube__window cube__window-light-2"></div>
                <div class="cube__window"></div>
                <div class="cube__window cube__window-light-2"></div>
            </div>
            <div class="cube__face cube__face--right">
                <div class="cube__window cube__window-light-2"></div>
                <div class="cube__window"></div>
                <div class="cube__window cube__window-light-4"></div>
                <div class="cube__window cube__window-light-3"></div>
                <div class="cube__window cube__window-light-2"></div>
                <div class="cube__window cube__window-light-3"></div>
                <div class="cube__window cube__window-light-5"></div>
                <div class="cube__window cube__window-light-1"></div>
                <div class="cube__window cube__window-light-5"></div>
                <div class="cube__window "></div>
            </div>
            <div class="cube__face cube__face--left">
                <div class="cube__window cube__window-light-5"></div>
                <div class="cube__window"></div>
                <div class="cube__window cube__window-light-5"></div>
                <div class="cube__window cube__window-light-3"></div>
                <div class="cube__window cube__window-light-1"></div>
                <div class="cube__window cube__window-light-2"></div>
                <div class="cube__window"></div>
                <div class="cube__window cube__window-light-3"></div>
                <div class="cube__window"></div>
                <div class="cube__window cube__window-light-4"></div>
            </div>
            <div class="cube__face cube__face--top"></div>
            <div class="cube__face cube__face--bottom"></div>
        </div>
        <div class="cube">
            <div class="cube__face cube__face--front">
                <div class="cube__window "></div>
                <div class="cube__window"></div>
                <div class="cube__window "></div>
                <div class="cube__window"></div>
                <div class="cube__window cube__window-light-5"></div>
                <div class="cube__window cube__window-light-2"></div>
                <div class="cube__window"></div>
                <div class="cube__window cube__window-light-3"></div>
                <div class="cube__window cube__window-light-4"></div>
                <div class="cube__door"></div>
            </div>
            <div class="cube__face cube__face--back">
                <div class="cube__window cube__window-light-2"></div>
                <div class="cube__window"></div>
                <div class="cube__window"></div>
                <div class="cube__window cube__window-light-2"></div>
                <div class="cube__window "></div>
                <div class="cube__window"></div>
                <div class="cube__window cube__window-light-3"></div>
                <div class="cube__window cube__window-light-2"></div>
                <div class="cube__window"></div>
                <div class="cube__window cube__window-light-2"></div>
            </div>
            <div class="cube__face cube__face--right">
                <div class="cube__window cube__window-light-2"></div>
                <div class="cube__window"></div>
                <div class="cube__window cube__window-light-4"></div>
                <div class="cube__window cube__window-light-1"></div>
                <div class="cube__window "></div>
                <div class="cube__window "></div>
                <div class="cube__window "></div>
                <div class="cube__window "></div>
                <div class="cube__window cube__window-light-5"></div>
                <div class="cube__window "></div>
            </div>
            <div class="cube__face cube__face--left">
                <div class="cube__window cube__window-light-5"></div>
                <div class="cube__window"></div>
                <div class="cube__window "></div>
                <div class="cube__window "></div>
                <div class="cube__window "></div>
                <div class="cube__window "></div>
                <div class="cube__window"></div>
                <div class="cube__window cube__window-light-3"></div>
                <div class="cube__window"></div>
                <div class="cube__window cube__window-light-4"></div>
            </div>
            <div class="cube__face cube__face--top"></div>
            <div class="cube__face cube__face--bottom"></div>
        </div>
    </div>
    <div class="bridge bridge-l">
    </div>
    <div class="bridge bridge-r"></div>
    <span class="ad">Farm</span>
    <span class="txt" id="txt">WELCOME</span>

    <div class="truck">
        <div class="truck-f">
            <div class="truck-f__face truck-f--front">
                <div class="truck__handle"></div>
            </div>
            <div class="truck-f__face truck-f--back">
                <div class="truck__handle"></div>
            </div>
            <div class="truck-f__face truck-f--left"></div>
            <div class="truck-f__face truck-f--righ"></div>
            <div class="truck-f__face truck-f--top"></div>
            <div class="truck-f__face truck-f--bottom"></div>
        </div>
        <div class="truck-b">
            <div class="truck-b__face truck-b--front">
                <span class="truck__txt"></span>
            </div>
            <div class="truck-b__face truck-b--back">
                <span class="truck__txt"></span>
            </div>
            <div class="truck-b__face truck-b--left"></div>
            <div class="truck-b__face truck-b--right"></div>
            <div class="truck-b__face truck-b--top"></div>
            <div class="truck-b__face truck-b--bottom"></div>
        </div>

        <div class="truck-ls">
            <div class="truck-l"></div>
            <div class="truck-l"></div>
            <div class="truck-l"></div>
        </div>

        <div class="truck-w truck-w--lf"></div>
        <div class="truck-w truck-w--lb"></div>
        <div class="truck-w truck-w--rf"></div>
        <div class="truck-w truck-w--rb"></div>
        <div class="truck-w truck-w--rf-2"></div>
        <div class="truck-w truck-w--rb-2"></div>

    </div>

</main>
</div>
<div class="container-fluid">
    <div class="panel-body headerWrapper">
        <div class="col-md-12 header-title"><strong>우체국 택배 배송조회</strong></div>
        <div class="col-md-12">
            <div class="form-group row myform">
                <label for="invoice" class="col-xs-2 label-style mr-3">운송장번호</label>
                <div id="invoice" class="col-xs-8 info-style">${s_orderno }</div>
            </div>
            <div class="form-group row myform">
                <label for="to" class="col-xs-2 label-style mr-4">보낸 상품</label>
                <div id="to" class="col-xs-8 info-style">${s_p_title }</div>
            </div>
            <div class="form-group row myform">
                <label for="to" class="col-xs-2 label-style mr-4">받는 사람</label>
                <div id="to" class="col-xs-8 info-style">${shippingDTO.s_m_recipient }</div>
            </div>
            <div class="form-group row myform">
                <label for="from" class="col-xs-2 label-style mr-4">보낸 사람</label>
                <div id="from" class="col-xs-8 info-style">(주)나의 정원</div>
            </div>
            <div class="form-group row myform">
                <label for="adress" class="col-xs-2 label-style mr-4">수령 주소</label>
                <div id="adress" class="col-xs-8 info-style">${shippingDTO.s_m_zipcode} ${shippingDTO.s_m_address1} ${shippingDTO.s_m_address2}</div>
            </div>
        </div>
    </div>
    <div class="col-sm-12 bodyWrapper">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>시간</th>
                <th>현재 위치</th>
                <th>배송 상태</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>2019-07-30 09:30:25</td>
                <td>(주)나의 정원</td>
                <td>인수자등록</td>
            </tr>
            <tr>
              <td>2019-07-30 15:20:15</td>
              <td>성북직영</td>
              <td>집하처리</td>
            </tr>
            <tr>
              <td>2019-07-30 19:11:30</td>
              <td>대전HUB</td>
              <td>간선상차</td>
            </tr>
            <tr>
              <td>2019-07-31 07:08:10</td>
              <td>남서울터미널</td>
              <td>배달전</td>
            </tr>
            <tr>
              <td>2019-07-31 12:15:47</td>
              <td>서울 남대문</td>
              <td>배달출발</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>