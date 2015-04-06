/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


jQuery.fn.center = function(absolute) {
    return this.each(function() {
        var t = jQuery(this);

        t.css({
            position: absolute ? 'absolute' : 'fixed',
            left: '50%',
            top: '50%',
            zIndex: '11199'
        }).css({
            marginLeft: '-' + (t.outerWidth() / 2) + 'px',
            marginTop: '-' + (t.outerHeight() / 2) + 'px'
        });

        if (absolute) {
            t.css({
                marginTop: parseInt(t.css('marginTop'), 10) + jQuery(window).scrollTop(),
                marginLeft: parseInt(t.css('marginLeft'), 10) + jQuery(window).scrollLeft()
            });
        }
    });
};


postionsClass = function()
{

    this.postions = function() {

        $(".toTopCenter").center();

        $(".toLeftCenter").center();

        $(".toRightCenter").center();

        $(".toBottomCenter").center();


        $(".toTop").css({
            position: 'fixed',
            top: '10px',
            marginTop: "0",
            zIndex: '99'
        })

        $(".toLeft").css({
            position: 'fixed',
            left: '10px', marginLeft: '0',
        })

        $(".toRight").css({
            position: 'fixed',
            right: '10px', marginLeft: '0',
        })


        $(".toBottom").css({
            position: 'fixed',
            bottom: '10px',
            marginTop: "0",
        })

        $(".toTopCenter").css({
            position: 'fixed',
            top: '10px', marginTop: "0",
          
        })

        $(".toLeftCenter").css({
            position: 'fixed',
            left: '10px', marginLeft: '0'
       
        })

        $(".toRightCenter").css({
            position: 'fixed',
            right: '10px', marginLeft: '0',
            left: "auto"
    
        })


        $(".toBottomCenter").css({
            position: 'fixed',
            bottom: '10px',
            marginTop: "0",
            top: "auto"
       
        })
        $(".toTopRight").css({
            position: 'fixed',
            top: '10px',
            right: '10px'
      
        })
        $(".toTopLeft").css({
            position: 'fixed',
            top: '10px',
            left: '10px',
            bottom: 'auto',
            right: 'auto'
       
        })
        $(".toTopRight").css({
            position: 'fixed',
            top: '10px',
            left: 'auto',
            bottom: 'auto',
            right: '10px'
      
        })

        $(".toBottomRight").css({
            position: 'fixed',
            top: 'auto',
            left: 'auto',
            bottom: '10px',
            right: '10px'
        })
        $(".toBottomLeft").css({
            position: 'fixed',
            top: 'auto',
            left: '10px',
            bottom: '10px',
            right: 'auto'
        })
    }
    this._updatePostions = function() {
        this.postions();
    }
}


$(function() {
    var postions = new postionsClass();
    postions._updatePostions();
})

