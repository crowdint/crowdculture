namespace :entries do
  desc "Add entries to database"
  task :populate => :environment do
    avatar = URI.parse(URI.encode("http://24.media.tumblr.com/tumblr_ma02gsYo3k1qj2zw8o1_1280.jpg".to_s))
    Entry.create(title:"another monday meeting @crowdint", 
          feed_id:1, 
          published_date:"Sep 7th, 2012 6:00pm", 
          entry_id:"http://culture.crowdint.com/post/31078799481", 
          img_url:"http://24.media.tumblr.com/tumblr_ma02gsYo3k1qj2zw8o1_1280.jpg", 
          content_type:"image", 
          avatar:avatar)

    avatar = URI.parse(URI.encode("http://25.media.tumblr.com/tumblr_ma61haKzWj1qj2zw8o1_r1_1280.jpg".to_s))
    Entry.create(title:"playing ping pong is really hard, but someone has to do it", 
          feed_id:1, 
          published_date:"Sep 10th, 2012 11:24pm", 
          entry_id:"http://culture.crowdint.com/post/31316678744", 
          img_url:"http://25.media.tumblr.com/tumblr_ma61haKzWj1qj2zw8o1_r1_1280.jpg", 
          content_type:"image", 
          avatar:avatar)

    avatar = URI.parse(URI.encode("http://25.media.tumblr.com/tumblr_ma02cg1kuX1qj2zw8o1_1280.jpg".to_s))
    Entry.create(title:"a pretty good monday breakfast", 
          feed_id:1, 
          published_date:"Sep 7th, 2012 5:57pm", 
          entry_id:"http://culture.crowdint.com/post/31078615060", 
          img_url:"http://25.media.tumblr.com/tumblr_ma02cg1kuX1qj2zw8o1_1280.jpg", 
          content_type:"image", 
          avatar:avatar)

    avatar = URI.parse(URI.encode("http://25.media.tumblr.com/tumblr_m9fjfpV2tf1qj2zw8o1_1280.jpg".to_s))
    Entry.create(title:"The aftermath of our retrospective meeting", 
          feed_id:1, 
          published_date:"Aug 27th, 2012 3:57pm", 
          entry_id:"http://culture.crowdint.com/post/30332472692", 
          img_url:"http://25.media.tumblr.com/tumblr_m9fjfpV2tf1qj2zw8o1_1280.jpg", 
          content_type:"image", 
          avatar:avatar)

    avatar = URI.parse(URI.encode("http://25.media.tumblr.com/tumblr_m9fj869FAW1qj2zw8o1_r2_1280.jpg".to_s))
    Entry.create(title:"Almost all of Crowd Interactive", 
          feed_id:1, 
          published_date:"Aug 27th, 2012 3:52pm", 
          entry_id:"http://culture.crowdint.com/post/30332202764", 
          img_url:"http://25.media.tumblr.com/tumblr_m9fj869FAW1qj2zw8o1_r2_1280.jpg", 
          content_type:"image", 
          avatar:avatar,
          box_size:2)
    
     avatar = URI.parse(URI.encode("http://24.media.tumblr.com/tumblr_m9fcyhYQ1Z1qj2zw8o1_1280.jpg".to_s))
     Entry.create(title:"awesome dinner at Espetus, San Francisco, CA.", 
          feed_id:1, 
          published_date:"Aug 27th, 2012 1:37pm", 
          entry_id:"http://culture.crowdint.com/post/30324705885", 
          img_url:"http://24.media.tumblr.com/tumblr_m9fcyhYQ1Z1qj2zw8o1_1280.jpg", 
          content_type:"image", 
          avatar:avatar)

     avatar = nil
     Entry.create(title:"Hip, hip, hooray! ", 
          feed_id:1, 
          published_date:"Jul 30th, 2012 5:15pm", 
          entry_id:"http://culture.crowdint.com/post/28359851873", 
          img_url:"http://cl.ly/image/2b2X2q3l3z1u", 
          content_type:"link", 
          avatar:avatar)

     avatar = URI.parse(URI.encode("http://25.media.tumblr.com/tumblr_m7dakxzNV91qj2zw8o1_1280.jpg".to_s))
     Entry.create(title:"Having a good time in our new house!", 
          feed_id:1, 
          published_date:"Jul 18th, 2012 1:43pm", 
          entry_id:"http://culture.crowdint.com/post/27492023871", 
          img_url:"http://25.media.tumblr.com/tumblr_m7dakxzNV91qj2zw8o1_1280.jpg", 
          content_type:"image", 
          avatar:avatar)

     avatar = URI.parse(URI.encode("http://25.media.tumblr.com/tumblr_m7da1qokjT1qj2zw8o1_1280.jpg".to_s))
     Entry.create(title:"Some of the Desperate Crowd Wives and Marina Magaa testing UX design.", 
          feed_id:1, 
          published_date:"Jul 18th, 2012 1:32pm", 
          entry_id:"http://culture.crowdint.com/post/27491322349", 
          img_url:"http://25.media.tumblr.com/tumblr_m7da1qokjT1qj2zw8o1_1280.jpg", 
          content_type:"image", 
          avatar:avatar)

     avatar = URI.parse(URI.encode("http://24.media.tumblr.com/tumblr_m7d9pidFOG1qj2zw8o1_1280.jpg".to_s))
     Entry.create(title:"Some of the new Crowders enjoying our past Code Retreat", 
          feed_id:1, 
          published_date:"Jul 18th, 2012 1:24pm", 
          entry_id:"http://culture.crowdint.com/post/27490881135", 
          img_url:"http://24.media.tumblr.com/tumblr_m7d9pidFOG1qj2zw8o1_1280.jpg", 
          content_type:"image", 
          avatar:avatar)

     avatar = URI.parse(URI.encode("http://25.media.tumblr.com/tumblr_m6ft6nKGf51qj2zw8o1_1280.jpg".to_s))
     Entry.create(title:"Another day, another #CodeRetreat @Crowdint ", 
           feed_id:1, 
           published_date:"Jun 30th, 2012 11:47am", 
           entry_id:"http://culture.crowdint.com/post/26213854937", 
           img_url:"http://25.media.tumblr.com/tumblr_m6ft6nKGf51qj2zw8o1_1280.jpg", 
           content_type:"image", 
           avatar:avatar)

     avatar = URI.parse(URI.encode("http://25.media.tumblr.com/tumblr_m68lxaD2qG1qj2zw8o1_1280.jpg".to_s))
     Entry.create(title:"@crowdosito having a good time.", 
           feed_id:1, 
           published_date:"Jun 26th, 2012 2:27pm", 
           entry_id:"http://culture.crowdint.com/post/25939846997", 
           img_url:"http://25.media.tumblr.com/tumblr_m68lxaD2qG1qj2zw8o1_1280.jpg", 
           content_type:"image", 
           avatar:avatar)

     avatar = URI.parse(URI.encode("http://25.media.tumblr.com/tumblr_m5xug0ZVSZ1qj2zw8o1_1280.jpg".to_s))
     Entry.create(title:"Desperate Crowdwives", 
           feed_id:1, 
           published_date:"Jun 20th, 2012 6:57pm", 
           entry_id:"http://culture.crowdint.com/post/25534560051", 
           img_url:"http://25.media.tumblr.com/tumblr_m5xug0ZVSZ1qj2zw8o1_1280.jpg", 
           content_type:"image", 
           avatar:avatar)

     avatar = URI.parse(URI.encode("http://25.media.tumblr.com/tumblr_m5xpqpU34Z1qj2zw8o1_1280.jpg".to_s))
     Entry.create(title:"Tres amigos", 
           feed_id:1, published_date:"Jun 20th, 2012 5:16pm", 
           entry_id:"http://culture.crowdint.com/post/25527863072", 
           img_url:"http://25.media.tumblr.com/tumblr_m5xpqpU34Z1qj2zw8o1_1280.jpg", 
           content_type:"image", 
           avatar:avatar)

     avatar = URI.parse(URI.encode("http://25.media.tumblr.com/tumblr_m5xjo7Mydv1qj2zw8o1_r3_1280.jpg".to_s))
     Entry.create(title:"Having something to eat before continuing.", 
           feed_id:1, 
           published_date:"Jun 20th, 2012 3:04pm", 
           entry_id:"http://culture.crowdint.com/post/25519299560", 
           img_url:"http://25.media.tumblr.com/tumblr_m5xjo7Mydv1qj2zw8o1_r3_1280.jpg", 
           content_type:"image", 
           avatar:avatar)

     avatar = URI.parse(URI.encode("http://24.media.tumblr.com/tumblr_m5xjb1dUww1qj2zw8o1_1280.jpg".to_s))
     Entry.create(title:"Working at Crowd Interactive is really hard work.", 
           feed_id:1, 
           published_date:"Jun 20th, 2012 2:56pm", 
           entry_id:"http://culture.crowdint.com/post/25518802306", 
           img_url:"http://24.media.tumblr.com/tumblr_m5xjb1dUww1qj2zw8o1_1280.jpg", 
           content_type:"image", 
           avatar:avatar)

     avatar = URI.parse(URI.encode("http://24.media.tumblr.com/tumblr_m5mqk5WMLd1qj2zw8o1_1280.jpg".to_s))
     Entry.create(title:"We are ready for Magma Rails 3!", 
           feed_id:1, 
           published_date:"Jun 14th, 2012 7:00pm", 
           entry_id:"http://culture.crowdint.com/post/25119994220", 
           img_url:"http://24.media.tumblr.com/tumblr_m5mqk5WMLd1qj2zw8o1_1280.jpg", 
           content_type:"image", 
           avatar:avatar)

     avatar = URI.parse(URI.encode("http://25.media.tumblr.com/tumblr_m5mlk2zbwe1qj2zw8o1_1280.jpg".to_s))
     Entry.create(title:"Friday Lunch Club", 
           feed_id:1, 
           published_date:"Jun 14th, 2012 5:12pm", 
           entry_id:"http://culture.crowdint.com/post/25112864774", 
           img_url:"http://25.media.tumblr.com/tumblr_m5mlk2zbwe1qj2zw8o1_1280.jpg", 
           content_type:"image", 
           avatar:avatar)

     avatar = URI.parse(URI.encode("http://25.media.tumblr.com/tumblr_m5mcq3BKPm1qj2zw8o1_1280.jpg".to_s))
     Entry.create(title:"Last mini meeting at the office before Magma Rails 3", 
           feed_id:1, 
           published_date:"Jun 14th, 2012 2:01pm", 
           entry_id:"http://culture.crowdint.com/post/25101055866", 
           img_url:"http://25.media.tumblr.com/tumblr_m5mcq3BKPm1qj2zw8o1_1280.jpg", 
           content_type:"image", 
           avatar:avatar)

     avatar = URI.parse(URI.encode("http://25.media.tumblr.com/tumblr_m4y0e4F89I1qj2zw8o1_1280.jpg".to_s))
     Entry.create(title:"Emmanuel Delgado talking with Mike Jansen | 8th Light", 
           feed_id:1, published_date:"Jun 1st, 2012 10:32am", 
           entry_id:"http://culture.crowdint.com/post/24195350878", 
           img_url:"http://25.media.tumblr.com/tumblr_m4y0e4F89I1qj2zw8o1_1280.jpg", 
           content_type:"image", 
           avatar:avatar)

     avatar = URI.parse(URI.encode("http://25.media.tumblr.com/tumblr_m4wtjrSTVO1qj2zw8o1_1280.jpg".to_s))
     Entry.create(title:"Having a good time in Boston, Massachusets", 
           feed_id:1, 
           published_date:"May 31st, 2012 7:07pm", 
           entry_id:"http://culture.crowdint.com/post/24156459108", 
           img_url:"http://25.media.tumblr.com/tumblr_m4wtjrSTVO1qj2zw8o1_1280.jpg", 
           content_type:"image", 
           avatar:avatar)

     avatar = URI.parse(URI.encode("http://25.media.tumblr.com/tumblr_m4wtcuR7tr1qj2zw8o1_1280.jpg".to_s))
     Entry.create(title:"Our @chischaschos talking about retrospectus at #backboneconf", 
           feed_id:1, 
           published_date:"May 31st, 2012 7:02pm", 
           entry_id:"http://culture.crowdint.com/post/24156179487", 
           img_url:"http://25.media.tumblr.com/tumblr_m4wtcuR7tr1qj2zw8o1_1280.jpg", 
           content_type:"image", 
           avatar:avatar)

     avatar = URI.parse(URI.encode("http://25.media.tumblr.com/tumblr_m4ws77dIbM1qj2zw8o1_1280.jpg".to_s))
     Entry.create(title:"Some of our engineers attending @backboneconf", 
           feed_id:1, 
           published_date:"May 31st, 2012 6:37pm", 
           entry_id:"http://culture.crowdint.com/post/24154496554", 
           img_url:"http://25.media.tumblr.com/tumblr_m4ws77dIbM1qj2zw8o1_1280.jpg", 
           content_type:"image", 
           avatar:avatar)

     avatar = nil
     Entry.create(title:"Happy #GeekPrideDay let the code be with you forever!", 
           feed_id:1, 
           published_date:"May 25th, 2012 1:33pm", 
           entry_id:"http://culture.crowdint.com/post/23741040997", 
           img_url:"http://cl.ly/2C1a0R1d2P0f2l0f0o29", 
           content_type:"link", 
           avatar:avatar)

     avatar = URI.parse(URI.encode("http://25.media.tumblr.com/tumblr_m4l5809fmJ1qj2zw8o1_1280.png".to_s))
     Entry.create(title:"WE HAVE THE ATTITUDE", 
           feed_id:1, 
           published_date:"May 25th, 2012 11:47am", 
           entry_id:"http://culture.crowdint.com/post/23736565842", 
           img_url:"http://25.media.tumblr.com/tumblr_m4l5809fmJ1qj2zw8o1_1280.png", 
           content_type:"image", 
           avatar:avatar)

     avatar = URI.parse(URI.encode("http://24.media.tumblr.com/tumblr_m4jj2m4JlJ1qj2zw8o1_1280.png".to_s))
     Entry.create(title:"Happy Birthday @fcastellanos best wishes from your peers at Crowd Interactive", 
           feed_id:1, 
           published_date:"May 24th, 2012 2:51pm", 
           entry_id:"http://culture.crowdint.com/post/23682015246", 
           img_url:"http://24.media.tumblr.com/tumblr_m4jj2m4JlJ1qj2zw8o1_1280.png", 
           content_type:"image", 
           avatar:avatar)

     avatar = URI.parse(URI.encode("http://25.media.tumblr.com/tumblr_m4csreVnSO1qj2zw8o1_1280.jpg".to_s))
     Entry.create(title:"Session in progress, #coderetreat gdl 2012.", 
           feed_id:1, 
           published_date:"May 20th, 2012 11:38pm", 
           entry_id:"http://culture.crowdint.com/post/23461922973", 
           img_url:"http://25.media.tumblr.com/tumblr_m4csreVnSO1qj2zw8o1_1280.jpg", 
           content_type:"image", 
           avatar:avatar)

     avatar = URI.parse(URI.encode("http://24.media.tumblr.com/tumblr_m4a4ioAMJT1qj2zw8o1_1280.jpg".to_s))
     Entry.create(title:"#coderetreat guadalajara @Crowdint present at @tkgdl offices!", 
           feed_id:1, 
           published_date:"May 19th, 2012 12:59pm", 
           entry_id:"http://culture.crowdint.com/post/23357247710", 
           img_url:"http://24.media.tumblr.com/tumblr_m4a4ioAMJT1qj2zw8o1_1280.jpg", 
           content_type:"image", 
           avatar:avatar)

     avatar = nil
     Entry.create(title:"Today!! #CuinoOlimpics", 
           feed_id:1, 
           published_date:"May 18th, 2012 3:04pm", 
           entry_id:"http://culture.crowdint.com/post/23301378324", 
           img_url:"http://cl.ly/2Q1E3U0D1l1Q103Z2e1p/o", 
           content_type:"link", 
           avatar:avatar)

     avatar = URI.parse(URI.encode("http://25.media.tumblr.com/tumblr_m43g5aq5u61qj2zw8o1_1280.jpg".to_s))
     Entry.create(title:"Another session at @Crowdint", 
           feed_id:1, 
           published_date:"May 15th, 2012 10:27pm", 
           entry_id:"http://culture.crowdint.com/post/23143905839", 
           img_url:"http://25.media.tumblr.com/tumblr_m43g5aq5u61qj2zw8o1_1280.jpg", 
           content_type:"image", 
           avatar:avatar)

     avatar = URI.parse(URI.encode("http://24.media.tumblr.com/tumblr_m43fx9LqkE1qj2zw8o1_1280.jpg".to_s))
     Entry.create(title:"Having at good time with our friends from Black Locus", 
           feed_id:1, 
           published_date:"May 15th, 2012 10:22pm", 
           entry_id:"http://culture.crowdint.com/post/23143572782", 
           img_url:"http://24.media.tumblr.com/tumblr_m43fx9LqkE1qj2zw8o1_1280.jpg", 
           content_type:"image", 
           avatar:avatar)

     avatar = URI.parse(URI.encode("http://24.media.tumblr.com/tumblr_m43fjkio6B1qj2zw8o1_1280.jpg".to_s))
     Entry.create(title:"As every year, were excited to attend Railsconf 2012", 
           feed_id:1, 
           published_date:"May 15th, 2012 10:14pm", 
           entry_id:"http://culture.crowdint.com/post/23142993684", 
           img_url:"http://24.media.tumblr.com/tumblr_m43fjkio6B1qj2zw8o1_1280.jpg", 
           content_type:"image", 
           avatar:avatar)

     avatar = URI.parse(URI.encode("http://24.media.tumblr.com/tumblr_m43f5pG9b81qj2zw8o1_1280.jpg".to_s))
     Entry.create(title:"Hacknight @Crowdint", 
           feed_id:1, 
           published_date:"May 15th, 2012 10:05pm", 
           entry_id:"http://culture.crowdint.com/post/23142391028", 
           img_url:"http://24.media.tumblr.com/tumblr_m43f5pG9b81qj2zw8o1_1280.jpg", 
           content_type:"image", 
           avatar:avatar)

     avatar = URI.parse(URI.encode("http://25.media.tumblr.com/tumblr_m43dwb58mC1qj2zw8o1_1280.jpg".to_s))
     Entry.create(title:"Another Happy Birthday!", 
           feed_id:1, 
           published_date:"May 15th, 2012 9:38pm", 
           entry_id:"http://culture.crowdint.com/post/23140385063", 
           img_url:"http://25.media.tumblr.com/tumblr_m43dwb58mC1qj2zw8o1_1280.jpg", 
           content_type:"image", 
           avatar:avatar)

     avatar = URI.parse(URI.encode("http://25.media.tumblr.com/tumblr_m43djkCKTD1qj2zw8o1_1280.jpg".to_s))
     Entry.create(title:"Playing Risk at the office", 
           feed_id:1, 
           published_date:"May 15th, 2012 9:30pm", 
           entry_id:"http://culture.crowdint.com/post/23139818825", 
           img_url:"http://25.media.tumblr.com/tumblr_m43djkCKTD1qj2zw8o1_1280.jpg", 
           content_type:"image", 
           avatar:avatar)

     avatar = URI.parse(URI.encode("http://25.media.tumblr.com/tumblr_m2llcvGinx1qj2zw8o1_1280.jpg".to_s))
     Entry.create(title:"Having a good time at Don Comalon with our friend Doug Reed from @billfloat", 
           feed_id:1, 
           published_date:"Apr 16th, 2012 8:29pm", 
           entry_id:"http://culture.crowdint.com/post/21239795420", 
           img_url:"http://25.media.tumblr.com/tumblr_m2llcvGinx1qj2zw8o1_1280.jpg", 
           content_type:"image", 
           avatar:avatar)

     avatar = nil
     Entry.create(title:"This is how Birthdays are celebrated at Crowd Interactive", 
           feed_id:1, 
           published_date:"Apr 10th, 2012 8:02pm", 
           entry_id:"http://culture.crowdint.com/post/20871538233", 
           img_url:"http://vimeo.com/40122406", 
           content_type:"video", 
           avatar:avatar)

     avatar = URI.parse(URI.encode("http://25.media.tumblr.com/tumblr_m1k27pZYYs1qj2zw8o1_1280.png".to_s))
     Entry.create(title:"The Crowd", 
           feed_id:1, 
           published_date:"Mar 27th, 2012 2:04pm", 
           entry_id:"http://culture.crowdint.com/post/20015402295", 
           img_url:"http://25.media.tumblr.com/tumblr_m1k27pZYYs1qj2zw8o1_1280.png", 
           content_type:"image", 
           avatar:avatar,
           box_size:2)

     avatar = URI.parse(URI.encode("http://24.media.tumblr.com/tumblr_lps30viYRA1qj2zw8o1_1280.jpg".to_s))
     Entry.create(title:"Let's get this party started #Crowdint we have @magmarails goodies!", 
           feed_id:1, 
           published_date:"Aug 11th, 2011 3:19pm", 
           entry_id:"http://culture.crowdint.com/post/8787577823", 
           img_url:"http://24.media.tumblr.com/tumblr_lps30viYRA1qj2zw8o1_1280.jpg", 
           content_type:"image", 
           avatar:avatar)

     avatar = URI.parse(URI.encode("http://25.media.tumblr.com/tumblr_llh5o6flVq1qj2zw8o1_1280.jpg".to_s))
     Entry.create(title:"Well represented  @Railsconf 2011", 
           feed_id:1, 
           published_date:"May 19th, 2011 11:28pm", 
           entry_id:"http://culture.crowdint.com/post/5657831901", 
           img_url:"http://25.media.tumblr.com/tumblr_llh5o6flVq1qj2zw8o1_1280.jpg", 
           content_type:"image", 
           avatar:avatar)

     avatar = URI.parse(URI.encode("http://25.media.tumblr.com/tumblr_llekxelyop1qj2zw8o1_1280.jpg".to_s))
     Entry.create(title:"Having a great time with @crowdint and @hybrid_group  @railsconf", 
           feed_id:1, 
           published_date:"May 18th, 2011 2:05pm", 
           entry_id:"http://culture.crowdint.com/post/5611171512", 
           img_url:"http://25.media.tumblr.com/tumblr_llekxelyop1qj2zw8o1_1280.jpg", 
           content_type:"image", 
           avatar:avatar)

     avatar = URI.parse(URI.encode("http://25.media.tumblr.com/tumblr_llejpuJeLc1qj2zw8o1_1280.jpg".to_s))
     Entry.create(title:"Crowd Team", 
           feed_id:1, 
           published_date:"May 18th, 2011 1:39pm", 
           entry_id:"http://culture.crowdint.com/post/5610606755", 
           img_url:"http://25.media.tumblr.com/tumblr_llejpuJeLc1qj2zw8o1_1280.jpg", 
           content_type:"image", 
           avatar:avatar)

     avatar = URI.parse(URI.encode("http://24.media.tumblr.com/tumblr_ljlymy8m3p1qj2zw8o1_r1_1280.jpg".to_s))
     Entry.create(title:"We love programming.", 
           feed_id:1, 
           published_date:"Apr 13th, 2011 4:37pm", 
           entry_id:"http://culture.crowdint.com/post/4587179136", 
           img_url:"http://24.media.tumblr.com/tumblr_ljlymy8m3p1qj2zw8o1_r1_1280.jpg", 
           content_type:"image", 
           avatar:avatar)

  end
end