namespace :employees do
  desc "Add entries to database"
  task :populate => :environment do
    x = File.open("/Users/iwano/Downloads/ok/araoz.png")
    Employee.create(entry_id:"Araoz", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/beto.png")
    Employee.create(entry_id:"Beto", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/chalo.png")
    Employee.create(entry_id:"Chalo", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/chavez.png")
    Employee.create(entry_id:"Chavez", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/edmundo.png")
    Employee.create(entry_id:"Edmundo", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/edwin.png")
    Employee.create(entry_id:"Edwin", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/emmanuel.png")
    Employee.create(entry_id:"Emmanuel", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/ericka.png")
    Employee.create(entry_id:"Ericka", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/fernando.png")
    Employee.create(entry_id:"Fernando", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/garay.png")
    Employee.create(entry_id:"Garay", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/gustavo.png")
    Employee.create(entry_id:"Gustavo", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/heriberto.png")
    Employee.create(entry_id:"Heriberto", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/herman.png")
    Employee.create(entry_id:"Herman", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/juanpablo.png")
    Employee.create(entry_id:"Juan Pablo", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/karla_gonzalez.png")
    Employee.create(entry_id:"Karla Gonzales", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/karla.png")
    Employee.create(entry_id:"Karla", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/mario.png")
    Employee.create(entry_id:"Mario", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/mendo.png")
    Employee.create(entry_id:"Mendo", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/nely.png")
    Employee.create(entry_id:"Nely", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/nora.png")
    Employee.create(entry_id:"Nora", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/oseguera.png")
    Employee.create(entry_id:"Oseguera", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/tapia.png")
    Employee.create(entry_id:"Tapia", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/ulices.png")
    Employee.create(entry_id:"Ulices", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/vega.png")
    Employee.create(entry_id:"Vega", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/victor.png")
    Employee.create(entry_id:"Victor", title:"role", content_url:"twitter", type:'Employee', published_date:"2009-01-01", feed_id: 99, avatar:x)
  end
end


