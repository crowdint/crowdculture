namespace :employees do
  desc "Add entries to database"
  task :populate => :environment do
    x = File.open("/ok/araoz.png")
    Employee.create(entry_id:"Araoz", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/ok/beto.png")
    Employee.create(entry_id:"Beto", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/ok/chalo.png")
    Employee.create(entry_id:"Chalo", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/ok/chavez.png")
    Employee.create(entry_id:"Chavez", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/ok/edmundo.png")
    Employee.create(entry_id:"Edmundo", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/ok/edwin.png")
    Employee.create(entry_id:"Edwin", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/ok/emmanuel.png")
    Employee.create(entry_id:"Emmanuel", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/ok/ericka.png")
    Employee.create(entry_id:"Ericka", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/ok/fernando.png")
    Employee.create(entry_id:"Fernando", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/ok/garay.png")
    Employee.create(entry_id:"Garay", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/ok/gustavo.png")
    Employee.create(entry_id:"Gustavo", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/ok/heriberto.png")
    Employee.create(entry_id:"Heriberto", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/ok/herman.png")
    Employee.create(entry_id:"Herman", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/ok/juanpablo.png")
    Employee.create(entry_id:"Juan Pablo", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/ok/karla_gonzalez.png")
    Employee.create(entry_id:"Karla Gonzales", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/ok/karla.png")
    Employee.create(entry_id:"Karla", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/ok/mario.png")
    Employee.create(entry_id:"Mario", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/ok/mendo.png")
    Employee.create(entry_id:"Mendo", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/ok/nely.png")
    Employee.create(entry_id:"Nely", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/ok/nora.png")
    Employee.create(entry_id:"Nora", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/ok/oseguera.png")
    Employee.create(entry_id:"Oseguera", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/ok/tapia.png")
    Employee.create(entry_id:"Tapia", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/ok/ulices.png")
    Employee.create(entry_id:"Ulices", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/ok/vega.png")
    Employee.create(entry_id:"Vega", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/ok/victor.png")
    Employee.create(entry_id:"Victor", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)
  end
end


