<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//code.jquery.com/jquery-2.2.4.min.js"></script>
<style type="text/css">
    .zt-skill-bar {
        color: #fff;
        font-size: 11px;
        line-height: 25px;
        height: 25px;
        margin-bottom: 5px;

        background-color: rgba(0,0,0,0.1);

        -webkit-border-radius: 2px;
           -moz-border-radius: 2px;
            -ms-border-radius: 2px;
                border-radius: 2px;

    }

    .zt-skill-bar * {
        webkit-transition: all 0.5s ease;
          -moz-transition: all 0.5s ease;
           -ms-transition: all 0.5s ease;
            -o-transition: all 0.5s ease;
               transition: all 0.5s ease;
    }

    .zt-skill-bar div {
        background-color: #ffc600;
        position: relative;
        padding-left: 25px;
        width: 0;

        -webkit-border-radius: 2px;
           -moz-border-radius: 2px;
           -ms- border-radius: 2px;
                border-radius: 2px;
    }

    .zt-skill-bar span {
        display: block;
        position: absolute;
        right: 0;
        top: 0;
        height: 100%;
        padding: 0 5px 0 10px;
        background-color: #1a1a1a;

        -webkit-border-radius: 0 2px 2px 0;
           -moz-border-radius: 0 2px 2px 0;
            -ms-border-radius: 0 2px 2px 0;
                border-radius: 0 2px 2px 0;
    }

    .zt-skill-bar span:before {
        content: "";
        position: absolute;
        width: 6px;
        height: 6px;
        top: 50%;
        left: -3px;
        margin-top: -3px;
        background-color: #1a1a1a;

        -webkit-transform: rotate(45deg);
           -moz-transform: rotate(45deg);
            -ms-transform: rotate(45deg);
                transform: rotate(45deg);
    }

    

</style>
</head>
<body>
<script type="text/javascript">
(function($) {
  "use strict";
  $(function() {
    function animated_contents() {
      $(".zt-skill-bar > div ").each(function(i) {
        var $this = $(this),
          skills = $this.data('width');

        $this.css({
          'width': skills + '%'
        });

      });
    }

    if (jQuery().appear) {
      $('.zt-skill-bar').appear().on('appear', function() {
        animated_contents();
      });
    } else {
      animated_contents();
    }
  });
}(jQuery));
</script>

<div class="zt-span6 last">
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <h3><strong>진행율 바</strong></h3>
  <div class="zt-skill-bar">
    <div data-width="88" style="">쇼핑몰<span>88%</span></div>
  </div>
  <div class="zt-skill-bar">
    <div data-width="92" style="">웹사이트/모바일<span>92%</span></div>
  </div>
  <div class="zt-skill-bar">
    <div data-width="82" style=";">패키지<span>82%</span></div>
  </div>
  <div class="zt-skill-bar">
    <div data-width="97" style=";">C.I/B.I/네이밍<span>125%</span></div>
  </div>
  <div class="zt-skill-bar">
    <div data-width="60" style=";">HTML5/CSS3<span>60%</span></div>
  </div>
</div>


</body>
</html>