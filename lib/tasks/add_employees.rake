namespace :employees do
  desc "Add entries to database"
  task :populate => :environment do
    x = File.open("/public/ok/araoz.png")
    Employee.create(entry_id:"Araoz", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/public/ok/beto.png")
    Employee.create(entry_id:"Beto", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/public/ok/chalo.png")
    Employee.create(entry_id:"Chalo", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/public/ok/chavez.png")
    Employee.create(entry_id:"Chavez", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/public/ok/edmundo.png")
    Employee.create(entry_id:"Edmundo", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/public/ok/edwin.png")
    Employee.create(entry_id:"Edwin", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/public/ok/emmanuel.png")
    Employee.create(entry_id:"Emmanuel", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/public/ok/ericka.png")
    Employee.create(entry_id:"Ericka", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/public/ok/fernando.png")
    Employee.create(entry_id:"Fernando", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/public/ok/garay.png")
    Employee.create(entry_id:"Garay", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/public/ok/gustavo.png")
    Employee.create(entry_id:"Gustavo", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/public/ok/heriberto.png")
    Employee.create(entry_id:"Heriberto", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/public/ok/herman.png")
    Employee.create(entry_id:"Herman", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/public/ok/juanpablo.png")
    Employee.create(entry_id:"Juan Pablo", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/public/ok/karla_gonzalez.png")
    Employee.create(entry_id:"Karla Gonzales", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/public/ok/karla.png")
    Employee.create(entry_id:"Karla", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/public/ok/mario.png")
    Employee.create(entry_id:"Mario", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/public/ok/mendo.png")
    Employee.create(entry_id:"Mendo", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/public/ok/nely.png")
    Employee.create(entry_id:"Nely", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/public/ok/nora.png")
    Employee.create(entry_id:"Nora", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/public/ok/oseguera.png")
    Employee.create(entry_id:"Oseguera", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/public/ok/tapia.png")
    Employee.create(entry_id:"Tapia", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/public/ok/ulices.png")
    Employee.create(entry_id:"Ulices", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/public/ok/vega.png")
    Employee.create(entry_id:"Vega", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/public/ok/victor.png")
    Employee.create(entry_id:"Victor", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)
  end
end


