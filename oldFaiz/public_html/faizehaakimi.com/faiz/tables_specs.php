<?php
 
 
 
 
$specs['site_setting']=array(

  'sun_c'=>array(
		'type'=>'input',
		'name'=>'sun_c',
		'title'=>'sun cairo',
		
	),
      'sun_s'=>array(
		'type'=>'input',
		'name'=>'sun_s',
		'title'=>'sun shaam',
		
	),
      'sun_q'=>array(
		'type'=>'input',
		'name'=>'sun_q',
		'title'=>'sun quds',
		
	),
  'sun_m'=>array(
		'type'=>'input',
		'name'=>'sun_m',
		'title'=>'sun muth',
		
	)
)
 ;
 
$specs['reservation_groups']=array(


    
  
    'gorup_code'=>array(
	'type'=>'input',
		'name'=>'gorup_code',
		'title'=>'Group Code',		
        //'select_data_table'=>'clients',
      //  'select_title_fild'=>'name',
	//	'select_id_fild'=>''
	) ,
    
       
    
    'no_adults'=>array(
		'type'=>'input',
		'name'=>'no_adults',
		'title'=>'Number of Adults',
		
	) ,
    'no_children'=>array(
		'type'=>'input',
		'name'=>'no_children',
		'title'=>'Number of Children',
		
	) ,
    'no_infant'=>array(
		'type'=>'input',
		'name'=>'no_infant',
		'title'=>'Number of infants',
		
	) ,
    
  

    
    'ar_date'=>array(
		'type'=>'date',
		'name'=>'ar_date',
		'title'=>'Arrival Date',
	) ,
    
        'ar_type'=>array(
	'type'=>'select',
		'name'=>'ar_type',
		'title'=>'Arrival Type',		
       'select_data'=>array( 'By Air'=>'By Air','By Road'=>'By Road')
	) 
    
    ,
      'ar_airline'=>array(
	'type'=>'input',
		'name'=>'ar_airline',
		'title'=>'Arrival Airline',		
       
	) ,
    
      'ar_f_number'=>array(
	'type'=>'input',
		'name'=>'ar_f_number',
		'title'=>'Arrival Flight Number',		
       
	) ,
    
    
 

 'ar_time'=>array(
	'type'=>'input',
		'name'=>'ar_time',
		'title'=>'Arrival Time',		
       
	) ,
    
     'ar_ex_time'=>array(
	'type'=>'input',
		'name'=>'ar_ex_time',
		'title'=>'Expected Arrival Time (Bus)',		
       
	) ,

     'de_date'=>array(
	'type'=>'date',
		'name'=>'de_date',
		'title'=>'Departure Date',		
       
	) ,
 
     'de_type'=>array(
	'type'=>'select',
		'name'=>'de_type',
		'title'=>'Departure Type',
        'select_data'=>array( 'By Air'=>'By Air','By Road'=>'By Road')
          //'select_data_table'=>'clients',
      //  'select_title_fild'=>'name',
	//	'select_id_fild'=>''
        
      	
       
	) ,
    
    
     'de_airline'=>array(
	'type'=>'input',
		'name'=>'de_airline',
		'title'=>'Departure Airline',		
       
	) ,
    
    
    
     'de_f_number'=>array(
	'type'=>'input',
		'name'=>'de_f_number',
		'title'=>'Departure Flight Number',		
       
	) ,
    
    
    
    
     'de_time'=>array(
	'type'=>'input',
		'name'=>'de_time',
		'title'=>'Departure Time',		
       
	) ,
    
 
     'de_ex_time'=>array(
	'type'=>'input',
		'name'=>'de_ex_time',
		'title'=>'Expected Departure Time (Bus)',		
       
	) ,
    
    
    
     
     'brochure'=>array(
	'type'=>'pic',
		'name'=>'brochure',
		'title'=>'brochure',		
       
	) ,
    
    
    'nights'=>array(
	'type'=>'input',
		'name'=>'nights',
		'title'=>'nights',		
       
	) ,
    
      'anywar_nots'=>array(
	'type'=>'richeditor',
		'name'=>'anywar_nots',
		'title'=>'anywar_nots',		
       
	) ,
    
     'more'=>array(
	'type'=>'richeditor',
		'name'=>'more',
		'title'=>'more',		
       
	) ,
        
//												
//							

       
);





















$specs['reservation_groups_stting']=array(

'dir_name'=>array(
		'type'=>'input',
		'name'=>'dir_name',
		'title'=>'Dir name',
		'required'=>'1',
	) ,
    'c_number'=>array(
		'type'=>'input',
		'name'=>'c_number',
		'title'=>'C Number',
		'required'=>'1',
	) ,
    
  
    'res_mail'=>array(
	'type'=>'select',
		'name'=>'res_mail',
		'title'=>'Res Mail',		
        'select_data_table'=>'mails_groups',
        'select_title_fild'=>'title',
		'select_id_fild'=>'id'
	) ,
    'mail_anyways'=>array(
	'type'=>'select',
		'name'=>'mail_anyways',
		'title'=>'mail anyways',		
        'select_data_table'=>'mails_groups',
        'select_title_fild'=>'title',
		'select_id_fild'=>'id'
	) ,
    
    
    
    
    
    
    
        'eidt_mail'=>array(
	'type'=>'select',
		'name'=>'eidt_mail',
		'title'=>'Edit  Mail',		
        'select_data_table'=>'mails_groups',
        'select_title_fild'=>'title',
		'select_id_fild'=>'id'
	) ,
    
        'anyways'=>array(
	'type'=>'richeditor',
		'name'=>'anyways',
		'title'=>'anyways',		
       
	) ,
    
       'anyways_mail'=>array(
	'type'=>'richeditor',
		'name'=>'anyways_mail',
		'title'=>'anyways mail',		
       
	) ,
  
    
       'room_msg'=>array(
	'type'=>'richeditor',
		'name'=>'room_msg',
		'title'=>'room_msg',		
       
	) ,
    
    


    
    
    
    'singleRoomMsg'=>array(
		'type'=>'input',
		'name'=>'singleRoomMsg',
		'title'=>'singleRoomMsg',
	
	) ,
    
        'send_mails'=>array(
		'type'=>'input',
		'name'=>'send_mails',
		'title'=>'send mails',
	
	) 
    
    
    
    
    
    
    
    

    ,
    
        'singleRoomMsg'=>array(
		'type'=>'input',
		'name'=>'singleRoomMsg',
		'title'=>'singleRoomMsg',
	
	) 
    
    ,
    
        'SeasonStart'=>array(
		'type'=>'input',
		'name'=>'SeasonStart',
		'title'=>'SeasonStart',
	
	) 
    
    ,
    
        'SeasonEnd'=>array(
		'type'=>'input',
		'name'=>'SeasonEnd',
		'title'=>'SeasonEnd',
	
	) 
    
    ,
    
        'hideField'=>array(
		  'type'=>'select',
		'name'=>'hideField',
		'title'=>'hideField',
  		
       'select_data'=>array( 'double'=>'double','triple'=>'triple','quad'=>'quad')
	
	) 
    
    
    
        
);

$specs['clients']=array(

   'code'=>array(
		'type'=>'input',
		'name'=>'code',
		'title'=>'Group Code',
		
	),
'name'=>array(
		'type'=>'input',
		'name'=>'name',
		'title'=>'Group Name',
		'required'=>'1',
	) ,
    
 'contact_person'=>array(
		'type'=>'input',
		'name'=>'contact_person',
		'title'=>'Contact Person',

	)
    
    ,'moblie'=>array(
		'type'=>'input',
		'name'=>'moblie',
		'title'=>'Mobile',
		
	)
    ,
    'email'=>array(
		'type'=>'input',
		'name'=>'email',
		'title'=>'email',
		
	)
    
    
     ,
    'password'=>array(
		'type'=>'input',
		'name'=>'password',
		'title'=>'password',
		
	)
    
    
    ,
    'more'=>array(
		'type'=>'input',
		'name'=>'more',
		'title'=>'More',
	
    )
    
);
$specs['a_detail_type']=array(
	'title'=>array(
		'type'=>'input',
		'name'=>'title',
		'title'=>'Title',
		'required'=>'1',
	) 
    );



$specs['packges_config']=array(
	'pkg_title'=>array(
		'type'=>'input',
		'name'=>'pkg_title',
		'title'=>'Packge Title',
		'required'=>'1',
	),
    
    'pkg_dir'=>array(
		'type'=>'input',
		'name'=>'pkg_dir',
		'title'=>'Packge Dir',
	
	),
    
       'packges'=>array(
        'type'=>'input',
		'name'=>'packges',
		'title'=>'Packges [num1;num1...]',		
        
		
	) 
    ,
      'planner_show'=>array(
        'type'=>'checkbox',
		'name'=>'planner_show',
		'title'=>'Planner Setp show',		
     
     
    ),
     
       'planner_title'=>array(
        'type'=>'input',
		'name'=>'planner_title',
		'title'=>'Planner Setp Title',		
     
     
      ),
      'lawazim_show'=>array(
        'type'=>'checkbox',
		'name'=>'lawazim_show',
		'title'=>'Show Lawazim Table',	
		
	),
    'calendar_form_dates'=>array(
		'type'=>'input',
		'name'=>'calendar_form_dates',
		'title'=>'Calendar From Dates [D1;D2]',
	
	)
    ,
    'calendar_to_dates'=>array(
		'type'=>'input',
		'name'=>'calendar_to_dates',
		'title'=>'Calendar To Dates [D1;D2]',
		
	)
    ,
  
  
    
        'email_add'=>array(
        'type'=>'select',
		'name'=>'email_add',
		'title'=>'Add Mail',		
        'select_data_table'=>'mails',
        'select_title_fild'=>'title',
		'select_id_fild'=>'id'
		
	),
    

      'email_edit'=>array(
        'type'=>'select',
		'name'=>'email_edit',
		'title'=>'Edit Mail',		
        'select_data_table'=>'mails',
        'select_title_fild'=>'title',
		'select_id_fild'=>'id'
		
	),
    
      'email_delete'=>array(
        'type'=>'select',
		'name'=>'email_delete',
		'title'=>'Delete Mail',		
        'select_data_table'=>'mails',
        'select_title_fild'=>'title',
		'select_id_fild'=>'id'
		
	),
   
    
    
         'send_mails'=>array(
        'type'=>'input',
		'name'=>'send_mails',
		'title'=>' Send To Mails [M1;M2] ',		
      
		
	),
   
    
    	 'more'=>array(
        'type'=>'textarea',
		'name'=>'more',
		'title'=>'Default More',		
      
		
	),
   
    );




$specs['mails']=array(

	'title'=>array(
		'type'=>'input',
		'name'=>'title',
		'title'=>'Title',
		'required'=>'1',
	),
    	
        
    	'subject'=>array(
		'type'=>'input',
		'name'=>'subject',
		'title'=>'Subject',
		'required'=>'1',
	),
        
   
    'template'=>array(
		'type'=>'textarea',
		'name'=>'template',
		'title'=>'Tamplate',
	
	)
    
    
    
    );





$specs['mails_groups']=array(

	'title'=>array(
		'type'=>'input',
		'name'=>'title',
		'title'=>'Title',
		'required'=>'1',
	),
    	
        
    	'subject'=>array(
		'type'=>'input',
		'name'=>'subject',
		'title'=>'Subject',
		'required'=>'1',
	),
        
   
    'template'=>array(
		'type'=>'textarea',
		'name'=>'template',
		'title'=>'Tamplate',
	
	)
    
    
    
    );




$specs['feadback_mail']=array(

	'days_after_chout'=>array(
		'type'=>'input',
		'name'=>'days_after_chout',
		'title'=>'send mail n days after checkout',
		'required'=>'1',
	),
    	
  
  'mail_template'=>array(
        'type'=>'select',
		'name'=>'mail_template',
		'title'=>'Mail Template',		
        'select_data_table'=>'mails',
        'select_title_fild'=>'title',
		'select_id_fild'=>'id'
		
	),
    
    
    );



$specs['rep_mail']=array(
	'title'=>array(
		'type'=>'input',
		'name'=>'title',
		'title'=>'Title',
		'required'=>'1',
	),
    
    'mail'=>array(
		'type'=>'input',
		'name'=>'mail',
		'title'=>'E-Mail',
		'required'=>'1',
	)
    );


$specs['a_glance']=array(
	'title'=>array(
		'type'=>'input',
		'name'=>'title',
		'title'=>'Title',
		'required'=>'1',
	),
    
    

  	'img'=>array(
		'type'=>'pic',
		'name'=>'img',
		'title'=>'Image',
		'required'=>'1',
	),
    
      	'fulltext'=>array(
		'type'=>'textarea',
		'name'=>'fulltext',
		'title'=>'Full Text',
		'required'=>'1',
	),
    
    	'category'=>array(
		'type'=>'select',
		'name'=>'category',
		'title'=>'Category',
		'required'=>'1',
        'select_data_table'=>'a_glance_categorey',
        'select_title_fild'=>'title',
		'select_id_fild'=>'id'
	),
    
    
    	'entrance_fee'=>array(
		'type'=>'input',
		'name'=>'entrance_fee',
		'title'=>'Entrance Fee',
		
	),
    	'visiting_hours'=>array(
		'type'=>'input',
		'name'=>'visiting_hours',
		'title'=>'Visiting Hours',
	
	),
    	'traveling_time'=>array(
		'type'=>'input',
		'name'=>'traveling_time',
		'title'=>'Traveling Time',
	
	),
     'order'=>array(
		'type'=>'input',
		'name'=>'order',
		'title'=>'Order',
	),
       's_tabel'=>array(
		'type'=>'checkbox',
		'name'=>'s_tabel',
		'title'=>'Hide Table',
	),
    
);



$specs['a_glance_categorey']=array(
	'title'=>array(
		'type'=>'input',
		'name'=>'title',
		'title'=>'Title',
		'required'=>'1',
	),
    
     'order'=>array(
		'type'=>'input',
		'name'=>'order',
		'title'=>'Order',
	),
    
    
    
    
    
);




$specs['hadiya']=array(
	'title'=>array(
		'type'=>'input',
		'name'=>'title',
		'title'=>'Title',
		'required'=>'1',
	),
    
     'comment'=>array(
		'type'=>'textarea',
		'name'=>'comment',
		'title'=>'Comment',
	),
    
    
    
    
    
);



$specs['hotel_rooms']=array(
	'id_hotel'=>array(
		'type'=>'select',
		'name'=>'id_hotel',
		'title'=>'Hotel',
         'select_data_table'=>'a_detail',
       'select_title_fild'=>'title',
'select_id_fild'=>'id',
	),
    
     'id_rooms'=>array(
	   'type'=>'select',
		'name'=>'id_rooms',
		'title'=>'Rooms Type',
        'select_data_table'=>'h_rooms',
        'select_title_fild'=>'title',
        'select_id_fild'=>'id',
	),
    
    'rooms_num'=>array(
		'type'=>'input',
		'name'=>'rooms_num',
		'title'=>'Rooms Numbers',
	),
    
     
    
    
   'ad_mnum'=>array(
		'type'=>'input',
		'name'=>'ad_mnum',
		'title'=>'Adults Numbers',
	),
    
      'ad_ch_num'=>array(
		'type'=>'input',
		'name'=>'ad_ch_num',
		'title'=>'Children Numbers',
	),
    
    
    
    
      'ad_inum'=>array(
		'type'=>'input',
		'name'=>'ad_inum',
		'title'=>'Infants Numbers',
	),
    
     'open'=>array(
		'type'=>'checkbox',
		'name'=>'open',
		'title'=>'Open',
	),
    
    
   
);

$specs['my_status_adds']=array(
	'title'=>array(
		'type'=>'input',
		'name'=>'title',
		'title'=>'title',
		'required'=>'1',
	),
    
    
    
    
    
    
);



$specs['my_status']=array(
	'title'=>array(
		'type'=>'select',
		'name'=>'title',
		'title'=>'Status',
         'select_data_table'=>'my_status_adds',
       'select_title_fild'=>'title',
'select_id_fild'=>'title',
		'required'=>'1',
	),
    
    	'nots'=>array(
		'type'=>'textarea',
		'name'=>'nots',
		'title'=>'Nots',
	
	),
    
    
    );





$specs['g_uest']=array(
	'name'=>array(
		'type'=>'input',
		'name'=>'name',
		'title'=>'Name',
	),
    'Email'=>array(
		'type'=>'input',
		'name'=>'Email',
		'title'=>'Email',
	),
    'Telephone'=>array(
		'type'=>'input',
		'name'=>'Telephone',
		'title'=>'Telephone',
	),
    'Place_of_Res'=>array(
		'type'=>'input',
		'name'=>'Place_of_Res',
		'title'=>'Place_of_Res',
	),
    'Nationality'=>array(
		'type'=>'input',
		'name'=>'Nationality',
		'title'=>'Nationality',
	),
        'Profession'=>array(
		'type'=>'input',
		'name'=>'Profession',
		'title'=>'Profession',
	),
    'Telephone'=>array(
		'type'=>'input',
		'name'=>'Telephone',
		'title'=>'Telephone',
	),
    'nots'=>array(
		'type'=>'input',
		'name'=>'nots',
		'title'=>'Nots',
	),
    'Comments'=>array(
		'type'=>'input',
		'name'=>'Comments',
		'title'=>'Comments',
	),
  'R_Friendly'=>array(
		'type'=>'input',
		'name'=>'R_Friendly',
		'title'=>'R_Friendly',
	),
 'R_Knowledgeable'=>array(
		'type'=>'input',
		'name'=>'R_Knowledgeable',
		'title'=>'R_Knowledgeable',
	),
 'R_Helpful'=>array(
		'type'=>'input',
		'name'=>'R_Helpful',
		'title'=>'R_Helpful',
	),
     're_Greeting'=>array(
		'type'=>'input',
		'name'=>'re_Greeting',
		'title'=>'re_Greeting',
	),
    're_Check_out'=>array(
		'type'=>'input',
		'name'=>'re_Check_out',
		'title'=>'re_Check_out',
	),
   're_Check_In'=>array(
		'type'=>'input',
		'name'=>'re_Check_In',
		'title'=>'re_Check_In',
	),
   'Cleanliness'=>array(
		'type'=>'input',
		'name'=>'Cleanliness',
		'title'=>'Cleanliness',
	),
  'First_Impression'=>array(
		'type'=>'input',
		'name'=>'First_Impression',
		'title'=>'First_Impression',
	),
'Everything_in_workingg_order'=>array(
		'type'=>'input',
		'name'=>'Everything_in_workingg_order',
		'title'=>'Everything in workingg order',
	),
  'Food_Quality'=>array(
		'type'=>'input',
		'name'=>'Food_Quality',
		'title'=>'Food_Quality',
	),
  'Hygiene'=>array(
		'type'=>'input',
		'name'=>'Hygiene',
		'title'=>'Hygiene',
	),
  'Menu_Variety'=>array(
		'type'=>'input',
		'name'=>'Menu_Variety',
		'title'=>'Menu_Variety',
	),
  'Service_Quality'=>array(
		'type'=>'input',
		'name'=>'Service_Quality',
		'title'=>'Service_Quality',
	),
  'Laundry'=>array(
		'type'=>'input',
		'name'=>'Laundry',
		'title'=>'Laundry',
	),
  'st_Friendly'=>array(
		'type'=>'input',
		'name'=>'st_Friendly',
		'title'=>'st_Friendly',
	),
      'st_Helpful'=>array(
		'type'=>'input',
		'name'=>'st_Helpful',
		'title'=>'st_Helpful',
	),
  'st_Knowledgeable'=>array(
		'type'=>'input',
		'name'=>'st_Knowledgeable',
		'title'=>'st_Knowledgeable',
	),
  'Expectations'=>array(
		'type'=>'input',
		'name'=>'Expectations',
		'title'=>'Expectations',
	),
    );
$specs['a_detail']=array(
	'title'=>array(
		'type'=>'input',
		'name'=>'title',
		'title'=>'Title',
	),  "pid"=>array(
    'type'=>'select',
		'name'=>'pid',
		'title'=>'pid ',
        
        'select_data'=>array( '3'=>'ALL','0'=>'Faiz','1'=>'LB')
        
        ),
    
	'mail'=>array(
		'type'=>'input',
		'name'=>'mail',
		'title'=>'Email ',
	),
  
        
        
    'type'=>array(
		'type'=>'select',
		'name'=>'type',
		'title'=>'Type ',
        'select_data_table'=>'a_detail_type',
'select_title_fild'=>'title',
'select_id_fild'=>'id'
	)
);
$specs['p_to_reservation']=array(
	'title'=>array(
		'type'=>'input',
		'name'=>'title',
		'title'=>'Title',
	),
	'message'=>array(
		'type'=>'textarea',
		'name'=>'message',
		'title'=>'Text',
		'required'=>'1',
	),
	'pub'=>array(
		'type'=>'checkbox',
		'name'=>'pub',
		'title'=>'Published',
	),
);
$specs['atricals']=array(
	'title'=>array(
		'type'=>'input',
		'name'=>'title',
		'title'=>'Title',
		'required'=>'1',
	),
	'pic'=>array(
		'type'=>'pic',
		'name'=>'pic',
		'title'=>'Photo',
		'required'=>'0',
	),
	'post'=>array(
		'type'=>'textarea',
		'name'=>'post',
		'title'=>'Post',
		'required'=>'1',
	),
	'published'=>array(
		'type'=>'input',
		'name'=>'published',
		'title'=>'Post Date',
	),
);


$specs['admin_menu_type']=array(
	'title'=>array(
		'type'=>'input',
		'name'=>'title',
		'title'=>'Title',
		'required'=>'1',
	),

    'order'=>array(
		'type'=>'input',
		'name'=>'order',
		'title'=>'Order',
	),	'enable'=>array(
		'type'=>'checkbox',
		'name'=>'enable',
		'title'=>'publish',
	),
    );




$specs['packges']=array(
	'title'=>array(
		'type'=>'input',
		'name'=>'title',
		'title'=>'Title',
		'required'=>'1',
	),

    	'post'=>array(
		'type'=>'textarea',
		'name'=>'post',
		'title'=>'Post',
		'required'=>'1',
        ),
        'url'=>array(
		'type'=>'input',
		'name'=>'url',
		'title'=>'External url',
	),
    
	'enable'=>array(
		'type'=>'checkbox',
		'name'=>'enable',
		'title'=>'publish',
	),
    'order'=>array(
		'type'=>'input',
		'name'=>'order',
		'title'=>'Order',
	),
);
$specs['news']=array(
	'title'=>array(
		'type'=>'input',
		'name'=>'title',
		'title'=>'Title',
		'required'=>'1',
	),
	'post'=>array(
		'type'=>'textarea',
		'name'=>'long_text',
		'title'=>'Post',
		'required'=>'1',
	),
        	'url'=>array(
		'type'=>'input',
		'name'=>'url',
		'title'=>'url',
	),
	'enable'=>array(
		'type'=>'checkbox',
		'name'=>'enable',
		'title'=>'publish',
	),
);
$specs['home_photos']=array(
	'pic'=>array(
		'type'=>'pic',
		'name'=>'pic',
		'title'=>'pic',
		'required'=>'1',
	),
	'enable'=>array(
		'type'=>'checkbox',
		'name'=>'enable',
		'title'=>'publish',
	),
);
$specs['atricals_cats']=array(
	'title'=>array(
		'type'=>'input',
		'name'=>'title',
		'title'=>'Title',
		'required'=>'1',
	),
);
$specs['photos_cats']=array(
	'title'=>array(
		'type'=>'input',
		'name'=>'title',
		'title'=>'Title',
		'required'=>'1',
	),
);
$specs['photos']=array(
	'title'=>array(
		'type'=>'input',
		'name'=>'title',
		'title'=>'Title',
		'required'=>'1',
	),
'path'=>array(
		'type'=>'pic',
		'name'=>'path',
		'title'=>'Photo',
		'required'=>'1',
	),
'cat_id'=>array(
		'type'=>'select',
		'name'=>'cat_id',
		'title'=>'Cat',
		'required'=>'1',
		'select_data_table'=>'photos_cats'
	),
     'order'=>array(
		'type'=>'input',
		'name'=>'order',
		'title'=>'Order',
	),
	'enable'=>array(
		'type'=>'checkbox',
		'name'=>'enable',
		'title'=>'publish',
	),
    
);
$specs['users']=array(
	'username'=>array(
		'type'=>'input',
		'name'=>'username',
		'title'=>'Username',
		'required'=>'1',
	),
	'password'=>array(
		'type'=>'password',
		'name'=>'password',
		'title'=>'Password',
		'required'=>'1',
	),
	'title'=>array(
		'type'=>'input',
		'name'=>'title',
		'title'=>'Title',
		'required'=>'1',
	),
	'email'=>array(
		'type'=>'input',
		'name'=>'email',
		'title'=>'Email',
		'class'=>'validate-email',
	),
'city'=>array(
	'type'=>'select',
		'name'=>'u_city',
		'title'=>'City',
'select_data_table'=>'citys',
'select_title_fild'=>'title',
'select_id_fild'=>'title'
),


/*	're_lev'=>array(
		'type'=>'checkbox',
		'name'=>'re_lev',
		'title'=>'Reservation Leve',
		'required'=>'1',
	),
    	'w_lev'=>array(
		'type'=>'checkbox',
		'name'=>'w_lev',
		'title'=>'WebSite Leve',
		'required'=>'1',
	),
'l_rep'=>array(
		'type'=>'checkbox',
		'name'=>'l_rep',
		'title'=>' L rep',
	),
	'f_lev'=>array(
		'type'=>'checkbox',
		'name'=>'f_lev',
		'title'=>'F Leve',
		'required'=>'1',
	),*/
);
$specs['pages']=array(
	'title'=>array(
		'type'=>'input',
		'name'=>'title',
		'title'=>'Page title',
		'required'=>'1',
	),
	'name'=>array(
		'type'=>'input',
		'name'=>'name',
		'title'=>'Page Name',
		'required'=>'1',
	),
	'dcontent'=>array(
		'type'=>'richeditor',
		'name'=>'dcontent',
		'title'=>'Content',
		'required'=>'1',
	),
	'disable'=>array(
		'type'=>'checkbox',
		'name'=>'disable',
		'title'=>'Disable',
	),
);
$specs['faq']=array(
	'qustion'=>array(
		'type'=>'textarea',
		'name'=>'qustion',
		'title'=>'Question',
		'required'=>'1',
	),
	'answer'=>array(
		'type'=>'textarea',
		'name'=>'answer',
		'title'=>'Answer',
		'required'=>'1',
	),
	'posted'=>array(
		'type'=>'date',
		'name'=>'posted',
		'title'=>'Posted',
	),
	'enable'=>array(
		'type'=>'checkbox',
		'name'=>'enable',
		'title'=>'publish',
	),
    'order'=>array(
		'type'=>'input',
		'name'=>'order',
		'title'=>'Order',
	),
);
$specs['photos_cats']=array(
	'title'=>array(
		'type'=>'input',
		'name'=>'title',
		'title'=>'Cat title',
		'required'=>'1',
	),
	'enable'=>array(
		'type'=>'checkbox',
		'name'=>'enable',
		'title'=>'publish',
	),
);
$specs['photos']=array(
	'title'=>array(
		'type'=>'input',
		'name'=>'title',
		'title'=>'Photo Title',
		'required'=>'1',
	),
'path'=>array(
		'type'=>'pic',
		'name'=>'path',
		'title'=>'Photo file',
		'required'=>'1',
	),
'cat_id'=>array(
		'type'=>'select',
		'name'=>'cat_id',
		'title'=>'Catgory',
		'required'=>'1',
		'select_data_table'=>'photos_cats'
	),
	'enable'=>array(
		'type'=>'checkbox',
		'name'=>'enable',
		'title'=>'publish',
	),
    'order'=>array(
		'type'=>'input',
		'name'=>'order',
		'title'=>'Order',
	),
);



$specs['reservation']=array(
	'other'=>array(
		'type'=>'input',
		'name'=>'--',
		'title'=>'Other',
	),
	'id_group'=>array(
		'type'=>'input',
		'name'=>'id_group',
		'title'=>'Group ID',
		'required'=>'1',
	),
    'name'=>array(
		'type'=>'input',
		'name'=>'name',
		'title'=>'Name',
		'required'=>'1',
	),
'check_in'=>array(
		'type'=>'date',
		'name'=>'check_in',
		'title'=>'CheckIn',
	),
'check_out'=>array(
		'type'=>'date',
		'name'=>'check_out',
		'title'=>'CheckOut',
	),
'fu_chekin'=>array(
		'type'=>'input',
		'name'=>'fu_checkin',
		'title'=>' V_CheckIn',
	),
'fu_chekout'=>array(
		'type'=>'input',
		'name'=>'fu_checkout',
		'title'=>'V_Checkout',
	),
'arriving_from'=>array(
		'type'=>'input',
		'name'=>'arriving_from',
		'title'=>'Arriving From',
	),
'tour_operator'=>array(
		'type'=>'input',
		'name'=>'tour_operator',
		'title'=>'Tour Operator',
	),
'email'=>array(
		'type'=>'input',
		'name'=>'email',
		'title'=>'Email',
	),
'Nights'=>array(
		'type'=>'input',
		'name'=>'Nights',
		'title'=>'No Of Nights',
	),
'mor'=>array(
		'type'=>'input',
		'name'=>'mor',
		'title'=>'More',
	),
 'Accomodation'=>array(
		'type'=>'input',
		'name'=>'Accomodation',
		'title'=>'Accomodation Detail',
	),	
    'Accomodation2'=>array(
		'type'=>'select',
		'name'=>'Accomodation',
		'title'=>'Accomodation Detail',
'select_data_table'=>'a_detail',
	'select_title_fild'=>'title',
		'select_id_fild'=>'id'
	),
   
    'awazim_amount'=>array(
		'type'=>'input',
		'name'=>'awazim_amount',
		'title'=>'Lawazim amount',
	),
 'adult_child_infant'=>array(
		'type'=>'input',
		'name'=>'adult_child_infant',
		'title'=>'A/I/C',
	),
 'time_of_arrival'=>array(
		'type'=>'input',
		'name'=>'time_of_arrival',
		'title'=>'Time Of Arrival',
	),
 'gender'=>array(
		'type'=>'input',
		'name'=>'gender',
		'title'=>'gender',
	),
 'age'=>array(
		'type'=>'input',
		'name'=>'age',
		'title'=>'age',
	),
 'ejamaat'=>array(
		'type'=>'input',
		'name'=>'ejamaat',
		'title'=>'ejamaat',
	),
 'individual_id'=>array(
		'type'=>'input',
		'name'=>'individual_id',
		'title'=>'individual_id',
	),
    'time_of_departure'=>array(
		'type'=>'input',
		'name'=>'time_of_departure',
		'title'=>'Time Of departure',
	),
     'flight Details'=>array(
		'type'=>'input',
		'name'=>'flight Details',
		'title'=>'flight Details',
	), 
    'fu_id'=>array(
		'type'=>'input',
        'name'=>'fu_id',
		'title'=>'voucher ID',
	),
'v_rmk'=>array(
		'type'=>'input',
        'name'=>'v_rmk ',
		'title'=>'v Remarks',
	),
 'arrived'=>array(
		'type'=>'checkbox',
		'name'=>'arrived',
		'title'=>'arrived',
	),
      //   carrier _flight Details  // ejamaat time_of_departure    individual_id  gender  age     time_of_arrival  adult_child_infant    awazim_amount  lawazim_paid
    'lawazim_paid'=>array(
		'type'=>'checkbox',
    'name'=>'lawazim_paid',
		'title'=>'lawazim_paid',
	),
);
$specs['reservation2']=array(
	'ex_days'=>array(
		'type'=>'input',
		'name'=>'ex_days',
		'title'=>'Ex days',
	),
    'ex_status'	=>array(
		'type'=>'input',
		'name'=>'ex_status',
		'title'=>'Ex status',
	),
     'ex_lawazim'	=>array(
		'type'=>'input',
		'name'=>'ex_lawazim',
		'title'=>'New Lawazim',
	),
	'id_group'=>array(
		'type'=>'input',
		'name'=>'id_group',
		'title'=>'Group ID',
		'required'=>'1',
	),
    'name'=>array(
		'type'=>'input',
		'name'=>'name',
		'title'=>'Name',
		'required'=>'1',
	),
'check_in'=>array(
		'type'=>'input',
		'name'=>'check_in',
		'title'=>'CheckIn',
	),
'check_out'=>array(
		'type'=>'input',
		'name'=>'check_out',
		'title'=>'CheckOut',
	),
'Nights'=>array(
		'type'=>'input',
		'name'=>'Nights',
		'title'=>'No Of Nights',
	),
  'awazim_amount'=>array(
		'type'=>'input',
		'name'=>'awazim_amount',
		'title'=>'Lawazim amount',
	),
 'adult_child_infant'=>array(
		'type'=>'input',
		'name'=>'adult_child_infant',
		'title'=>'A/I/C',
	),
 'gender'=>array(
		'type'=>'input',
		'name'=>'gender',
		'title'=>'gender',
	),
 'age'=>array(
		'type'=>'input',
		'name'=>'age',
		'title'=>'age',
	),
 'ejamaat'=>array(
		'type'=>'input',
		'name'=>'ejamaat',
		'title'=>'ejamaat',
	),
 'individual_id'=>array(
		'type'=>'input',
		'name'=>'individual_id',
		'title'=>'individual_id',
	),
      //   carrier _flight Details  // ejamaat time_of_departure    individual_id  gender  age     time_of_arrival  adult_child_infant    awazim_amount  lawazim_paid
    'lawazim_paid'=>array(
		'type'=>'checkbox',
    'name'=>'lawazim_paid',
		'title'=>'lawazim_paid',
	),
);


$specs['planner_options']=array(
	'title'=>array(
		'type'=>'input',
		'name'=>'title',
		'title'=>'Title',
		'required'=>'1',
	),
     	'img'=>array(
		'type'=>'pic',
		'name'=>'img',
		'title'=>'Image',
		'required'=>'1',
	)
    ,
    
    'body'=>array(
		'type'=>'textarea',
		'name'=>'body',
		'title'=>'Body',
	),


)
;

$specs['lwazim_calc']=array(
	'title'=>array(
		'type'=>'input',
		'name'=>'title',
		'title'=>'Title',
		'required'=>'1',
	),
'days_from'=>array(
		'type'=>'input',
		'name'=>'pkfrom',
		'title'=>'Days From',
	),
    'days_to'=>array(
		'type'=>'input',
		'name'=>'daysto',
		'title'=>'Days To',
	),
    'bs_day'=>array(
		'type'=>'input',
		'name'=>'bs_day',
		'title'=>'bk days',
	),
'val_ad'=>array(
		'type'=>'input',
		'name'=>'val_ad',
		'title'=>'Price for Adults',
	),
'val_ch'=>array(
		'type'=>'input',
		'name'=>'val_ch',
		'title'=>'Price for Children',
	),

'ex_ad'=>array(
		'type'=>'input',
		'name'=>'ex_ad',
		'title'=>'Extra Days_ad',
	),
    'ex_ch'=>array(
		'type'=>'input',
		'name'=>'ex_ch',
		'title'=>'Extra Days_ch',
	),
    
    'trans_ad'=>array(
		'type'=>'input',
		'name'=>'trans_ad',
		'title'=>'Price for Adults (without transportaion)',
	),
'trans_ch'=>array(
		'type'=>'input',
		'name'=>'trans_ch',
		'title'=>'Price for Children (without transportaion)',
	),
    
    'ex_ad_w'=>array(
		'type'=>'input',
		'name'=>'ex_ad_w',
		'title'=>'Extra Days_ad (without transportaion) ',
	),
    'ex_ch_w'=>array(
		'type'=>'input',
		'name'=>'ex_ch_w',
		'title'=>'Extra Days_ch (without transportaion) ',
	),
    
        'g_days'=>array(
		'type'=>'checkbox',
		'name'=>'j_days',
		'title'=>'Just days',
	),
    
    
    
      'publish'=>array(
		'type'=>'checkbox',
		'name'=>'publish',
		'title'=>'Publish',
	),
    
         'v_n_prs'=>array(
		'type'=>'checkbox',
		'name'=>'v_n_prs',
		'title'=>'View  Night per',
	),
    
    
     'planner_Show'=>array(
		'type'=>'checkbox',
		'name'=>'planner_Show',
		'title'=>'Show Planner Step',
	),
    
     'planner_Show_intro'=>array(
		'type'=>'checkbox',
		'name'=>'planner_Show_intro',
		'title'=>'Show Planner Intro',
	),
    
    
    
    'planner_Show_options'=>array(
		'type'=>'checkbox',
		'name'=>'planner_Show_options',
		'title'=>'Show Options for Planner',
	),
      
    'planner_Show_all'=>array(
		'type'=>'checkbox',
		'name'=>'planner_Show_all',
		'title'=>'Show All Options for Planner',
	),
    
      'ch_max'=>array(
		'type'=>'input',
		'name'=>'ch_max',
		'title'=>'selection maximum',
	),
    
     'ch_maxex'=>array(
		'type'=>'input',
		'name'=>'ch_maxex',
		'title'=>'selection maximum pur ex night',
	),
       'planner_Show_itmes'=>array(
		'type'=>'input',
		'name'=>'planner_Show_itmes',
		'title'=>'Show  Options IDs',
	),
    
    
       'planner_intro_code'=>array(
		'type'=>'textarea',
		'name'=>'planner_intro_code',
		'title'=>'Planner Intro Code',
	),
    
       
    
    
);





$specs['gbook']=array(
	'name'=>array(
		'type'=>'input',
		'name'=>'name',
		'title'=>'Name',
		'required'=>'1',
	),
'con'=>array(
		'type'=>'input',
		'name'=>'con',
		'title'=>'Contery',
		'required'=>'1',
	),
'comment'=>array(
		'type'=>'textarea',
		'name'=>'comment',
		'title'=>'Comment',
		'required'=>'1',
	),
	'approved'=>array(
		'type'=>'checkbox',
		'name'=>'approved',
		'title'=>'Approved',
	),
);




$specs['pages_cats']=array(
	'title'=>array(
		'type'=>'input',
		'name'=>'title',
		'title'=>'Title',
		'required'=>'1',
	),
	'url'=>array(
		'type'=>'input',
		'name'=>'url',
		'title'=>'External url',
	),
	'sub_cat'=>array(
		'type'=>'select',
		'name'=>'sub_cat',
		'title'=>'Parent Cat',
		'select_data_table'=>'pages_cats',
		'select_title_fild'=>'title',
		'select_id_fild'=>'id',
	),
'type'=>array(
		'type'=>'select',
		'name'=>'type',
		'title'=>'Type',
	'select_data_table'=>'menu_type',
	'select_title_fild'=>'title',
	'select_id_fild'=>'title',
	),
	'order'=>array(
		'type'=>'input',
		'name'=>'order',
		'title'=>'Order',
	),
	'page_id'=>array(
		'type'=>'select',
		'name'=>'page_id',
		'title'=>'OR Internal Page',
		'select_data_table'=>'pages',
		'select_title_fild'=>'title',
		'select_id_fild'=>'id',
	),
);







$specs['admin_menu']=array(
	'title'=>array(
		'type'=>'input',
		'name'=>'title',
		'title'=>'Title',
		'required'=>'1',
	),
	'url'=>array(
		'type'=>'input',
		'name'=>'url',
		'title'=>'External url',
	),
	'sub_cat'=>array(
		'type'=>'select',
		'name'=>'sub_cat',
		'title'=>'Parent Cat',
		'select_data_table'=>'pages_cats',
		'select_title_fild'=>'title',
		'select_id_fild'=>'id',
	)
    
    ,'enable'=>array(
		'type'=>'checkbox',
		'name'=>'enable',
		'title'=>'publish',
	),
    
'l_box'=>array(
		'type'=>'checkbox',
		'name'=>'l_box',
		'title'=>'Light Box',
   
	),
    
    
    
	'ord'=>array(
		'type'=>'input',
		'name'=>'ord',
		'title'=>'Order',
	),
/*	'page_id'=>array(
		'type'=>'select',
		'name'=>'page_id',
		'title'=>'OR Internal Page',
		'select_data_table'=>'pages',
		'select_title_fild'=>'title',
		'select_id_fild'=>'id',
	),*/
);










$specs['h_rooms']=array(
	'title'=>array(
		'type'=>'input',
		'name'=>'title',
		'title'=>'Title',
		'required'=>'1',
	),

    	'ad_num'=>array(
		'type'=>'input',
		'name'=>'ad_num',
		'title'=>'Ad_num',
	),
    	'ch_num'=>array(
		'type'=>'input',
		'name'=>'ch_num',
		'title'=>'Ch_num',
	),
	
    
    	'in_num'=>array(
		'type'=>'input',
		'name'=>'in_num',
		'title'=>'In_num',
       
	),
    
    

	'enable'=>array(
		'type'=>'checkbox',
		'name'=>'enable',
		'title'=>'Enable',
	),
	
);




$specs['discount']=array(
	'num_p'=>array(
		'type'=>'input',
		'name'=>'num_p',
		'title'=>'The number of people',
		'required'=>'1',
	),
	'discount'=>array(
		'type'=>'input',
		'name'=>'discount',
		'title'=>'Discount',
        'required'=>'1',
	),

	'enable'=>array(
		'type'=>'checkbos',
		'name'=>'enable',
		'title'=>'Enable',
	),
	
);








$specs['gbook_f']=array(
	'qe'=>array(
		'type'=>'input',
		'name'=>'qe',
		'title'=>'Question',
		'required'=>'1',
	),
	'ans'=>array(
		'type'=>'input',
		'name'=>'ans',
		'title'=>'Answer',
        'required'=>'1',
	),

	'enable'=>array(
		'type'=>'checkbox',
		'name'=>'enable',
		'title'=>'Enable',
	),
	
);



















?>