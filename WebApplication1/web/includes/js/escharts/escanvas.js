


(function($) {
    $.fn.escanvas = function(options) {
        var settings = $.extend({ 
            fillStyle: "",
            shadowColor: "",
            shadowBlur: 0,
            strokeStyle: "",
            strokeWidth: 0,
            type: "",
            layer: true,
            x: 150,
            y: 150,
            radius: 50,
            width: 200,
            height: 100,
            sides: 60,
            bringToFront: true,
            draggable: false,
           
        }, options);


        return this.each(function() {
            var $this = $(this);
            if (settings.type == "Polygon") {
                $this.drawPolygon(settings);
            } else if (settings.type == "arc") {

                $this.drawArc(settings);

            } else if (settings.type == "bezier") {

                $this.drawBezier(settings);

            } else if (settings.type == "ellipse") {

                $this.drawEllipse(settings);

            } else if (settings.type == "graph") {

                $this.drawGraph(settings);

            }
            else if (settings.type == "image") {

                $this.drawImage(settings);

            }
            else if (settings.type == "layers") {

                $this.drawLayers(settings);

            }
            else if (settings.type == "line") {

                $this.drawLine(settings);

            }
            else if (settings.type == "quadratic") {

                $this.drawQuadratic(settings);

            }
            else if (settings.type == "rect") {

                $this.drawRect(settings);

            }
            else if (settings.type == "text") {

                $this.drawText(settings);

            }
            else if (settings.type == "vector") {

                $this.drawVector(settings);

            }


        });

    };
})(jQuery);