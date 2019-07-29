<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<title>습도 상승</title>

<style>
#canvas {
	position: absolute;
	top: 0px;
	left: 0px;
}

.cloud {
	background: rgba(255, 255, 255, 1);
	width: 170px;
	height: 50px;
	position: absolute;
	top: 50px;
	left: 220px;
	margin-left: -170px;
	z-index: 100;
	transform: translate(0, 0);
	animation: float 2s 0s infinite alternate linear;
	border-radius: 50%;
}

.cloud::before {
	content: "";
	width: 100px;
	height: 75px;
	border-radius: 100%;
	position: absolute;
	background: white;
	top: -20px;
	left: -5px;
}

.cloud::after {
	content: "";
	width: 100px;
	height: 70px;
	border-radius: 100%;
	position: absolute;
	background: white;
	right: -5px;
	top: -20px;
}

.cloudy {
	width: 100px;
	height: 70px;
	border-radius: 100%;
	position: absolute;
	background: white;
	right: -2px;
	top: 10px;
}

.clody::before {
	content: "";
	width: 150px;
	height: 120px;
	border-radius: 100%;
	position: absolute;
	background: white;
	top: 20px;
	left: -100px;
}

@
keyframes float {from { transform:translate(0, -50%);
	
}

to {
	transform: translate(-5%, -50%);
}
}
</style>
</head>
<body>
	<canvas id="canvas"></canvas>
	<div class="cloud">
		<div class="cloudy"></div>
	</div>


	<script>
            requestAnimFrame = (function() {
                return function(callback) {
                    window.setTimeout(callback, 1000/60);
                };
            })();

            var canvas = document.getElementById('canvas');
            var ctx = canvas.getContext('2d');

            var width = 0;
            var height = 0;
            var ltp = window.innerWidth / 2 - 30;

            window.onresize = function onresize() {
                width = canvas.width = window.innerWidth;
                height = canvas.height = window.innerHeight;
                ltp = window.innerWidth / 2 - 30;
            }

            window.onresize();

            var mouse = {
                X : 0,
                Y : 0
            }

            window.onmousemove = function onmousemove(event) {
                mouse.X = event.clientX;
                mouse.Y = event.clientY;
            }

            var particles = [];
            var drops = [];

            function Rain(X, Y, i) {
                if (!i) {
                    i = 2;
                }
                while (i--) {
                    particles.push( 
                        {
                            deltaX : (Math.random() * 0.25),
                            deltaY : (Math.random() * 9) + 1,
                            X : X,
                            Y : 110+Y,
                            alpha : 1,
                            col: "hsla(200,100%,80%,1)",
                        })
                }
            }

            function explosion(X, Y, col, i) {
                if (!i) {
                    i = 5;
                }
                while (i--) {
                    drops.push( 
                        {
                            deltaX : (Math.random() * 4-2	),
                            deltaY : (Math.random() * -4 ),
                            X : X,
                            Y : Y,
                            radius : 0.7 + Math.floor(Math.random() * 1.4),
                            alpha : 1,
                            colour : col
                        })
                }
            }

            function render(ctx) {

                ctx.save();
                var grd=ctx.createLinearGradient(width/2,0,width/2,height);

                grd.addColorStop(1,"rgba(79,115,135,1)");
                ctx.fillStyle=grd;
                ctx.fillRect(0,0,width,height);

                var visibleParticles = particles;
                var visibleDrops = drops;
                var tau = Math.PI * 2;

                for (var i = 0, activeParticles; activeParticles = visibleParticles[i]; i++) {
                    ctx.globalAlpha = activeParticles.alpha;
                    ctx.fillStyle = activeParticles.col;
                    ctx.fillRect(activeParticles.X/2, activeParticles.Y, activeParticles.deltaY/4, activeParticles.deltaY);
                }

                for (var i = 0, activeDrops; activeDrops = visibleDrops[i]; i++) {
                    ctx.globalAlpha = activeDrops.alpha;
                    ctx.fillStyle = activeDrops.col;
                    ctx.beginPath();
                    ctx.arc(activeDrops.X/2, activeDrops.Y, activeDrops.radius, 0, tau);
                    ctx.fill();
                }
                ctx.strokeStyle = "black";
                ctx.lineWidth = 1;
                ctx.restore();
            }

            function update() {

                var visibleParticles = particles;
                var visibleDrops = drops;

                for (var i = 0, activeParticles; activeParticles = visibleParticles[i]; i++) {
                    activeParticles.X += activeParticles.deltaX;
                    activeParticles.Y += activeParticles.deltaY+5;
                    if (activeParticles.Y > height-15) {
                        visibleParticles.splice(i--, 1);
                        explosion(activeParticles.X, activeParticles.Y, activeParticles.col);
                    }
                }

                for (var i = 0, activeDrops; activeDrops = visibleDrops[i]; i++) {
                    activeDrops.X += activeDrops.deltaX;
                    activeDrops.Y += activeDrops.deltaY;
                    activeDrops.radius -= 0.075;
                    if (activeDrops.alpha > 0) {
                        activeDrops.alpha -= 0.005;
                    } else {
                        activeDrops.alpha = 0;
                    }
                    if (activeDrops.radius < 0) {
                        visibleDrops.splice(i--, 1);
                    }
                }

                var i = 2;
                while (i--) {
                    Rain(ltp+Math.floor((Math.random()*340)), -15);
                }
            }

            (function start() {
                requestAnimFrame(start);
                update();
                render(ctx);
            })();
        </script>
</body>
</html>