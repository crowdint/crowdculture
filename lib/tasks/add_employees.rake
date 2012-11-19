namespace :employees do
  desc "Add entries to database"
  task :populate => :environment do
    x = File.open("/Users/iwano/Downloads/ok/araoz.png")
    Employee.create(name:"Araoz", rol:"crowd", twitter:"twitter", avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/beto.png")
    Employee.create(name:"Beto", rol:"crowd", twitter:"twitter",avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/chalo.png")
    Employee.create(name:"Chalo", rol:"crowd", twitter:"twitter",avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/chavez.png")
    Employee.create(name:"Chavez", rol:"crowd", twitter:"twitter", avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/edmundo.png")
    Employee.create(name:"Edmundo", rol:"crowd", twitter:"twitter",avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/edwin.png")
    Employee.create(name:"Edwin", rol:"crowd", twitter:"twitter",avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/emmanuel.png")
    Employee.create(name:"Emmanuel", rol:"crowd", twitter:"twitter",avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/ericka.png")
    Employee.create(name:"Ericka", rol:"crowd", twitter:"twitter",avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/fernando.png")
    Employee.create(name:"Fernando", rol:"crowd", twitter:"twitter",avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/garay.png")
    Employee.create(name:"Garay", rol:"crowd", twitter:"twitter",avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/gustavo.png")
    Employee.create(name:"Gustavo", rol:"crowd", twitter:"twitter",avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/heriberto.png")
    Employee.create(name:"Heriberto", rol:"crowd", twitter:"twitter",avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/herman.png")
    Employee.create(name:"Herman", rol:"crowd", twitter:"twitter",avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/juanpablo.png")
    Employee.create(name:"Juan Pablo", rol:"crowd", twitter:"twitter",avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/karla_gonzalez.png")
    Employee.create(name:"Karla Gonzales", rol:"crowd", twitter:"twitter",avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/karla.png")
    Employee.create(name:"Karla", rol:"crowd", twitter:"twitter",avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/mario.png")
    Employee.create(name:"Mario", rol:"crowd", twitter:"twitter",avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/mendo.png")
    Employee.create(name:"Mendo", rol:"crowd", twitter:"twitter",avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/nely.png")
    Employee.create(name:"Nely", rol:"crowd", twitter:"twitter",avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/nora.png")
    Employee.create(name:"Nora", rol:"crowd", twitter:"twitter",avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/oseguera.png")
    Employee.create(name:"Oseguera", rol:"crowd", twitter:"twitter",avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/tapia.png")
    Employee.create(name:"Tapia", rol:"crowd", twitter:"twitter",avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/ulices.png")
    Employee.create(name:"Ulices", rol:"crowd", twitter:"twitter",avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/vega.png")
    Employee.create(name:"Vega", rol:"crowd", twitter:"twitter",avatar:x)

    x = File.open("/Users/iwano/Downloads/ok/victor.png")
    Employee.create(name:"Victor", rol:"crowd", twitter:"twitter",avatar:x)
  end
end


