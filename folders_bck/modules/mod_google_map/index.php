<?php


function mod_google_map($p,$l){
    
    
    
    $r="<div class='maptitle'>".$l['map'].'</div><iframe width="'.$p['width'].'" height=""'.$p['height'].'" '
            . 'frameborder="0" scrolling="no" marginheight="0" marginwidth="0" '
            . 'src="https://maps.google.com.eg/?ie=UTF8&amp;ll='.$p['lu'].'&amp;spn='.$p['lg'].'&amp;t=m&amp;z=6&amp;output=embed"></iframe><br /><small>'
            . '<a href="https://maps.google.com.eg/?ie=UTF8&amp;ll=26.9061,30.876837&amp;spn=11.525818,19.753418&amp;t=m&amp;z=6&amp;source=embed" style="color:#0000FF;text-align:left">عرض خريطة بحجم أكبر</a></small>';
    
    
    return $r;
    
}