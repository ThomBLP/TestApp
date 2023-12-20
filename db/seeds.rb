require "open-uri"

$photo_urls = [
  'https://www.ora7.fr//uploads/700372681/324349920/32/AirCar-voiture-volante-innovation.jpg',
  'https://madeinmarseille.net/actualites-marseille/sous-marin-tourisme-marseille-croisiere.jpg',
  'https://cdn.cleanrider.com/uploads/2022/03/z-triton-02.jpg',
  'https://img.nauticexpo.fr/images_ne/photo-g/63307-9095132.jpg',
  'https://images.bfmtv.com/pZcPCKatZvL5dMr1QNw9-9A9W68=/30x0:1470x810/1440x0/images/La-LMV-496-de-Lazareth-une-moto-volante-made-in-France-1545825.jpg',
  'https://i.ytimg.com/vi/HGqvzHYFC-o/sddefault.jpg',
  'https://cdn.motor1.com/images/mgl/gYkeE/s1/4x3/tesla-model-3-con-impianto-fotovoltaico-artigianale.webp',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRLrTi_UZ6vZuPXvI5ojsEDpTMHt0E0gisOQ&usqp=CAU',
  'https://c8.alamy.com/compfr/kwww85/banaue-philippines-october-6-2016-coloriste-les-tricycles-a-moteur-sont-un-moyen-de-transport-public-dans-le-pays-ici-sur-la-liste-des-mayoyao-alfonso-kwww85.jpg',
  'https://cdn.futura-sciences.com/sources/video/videov6/3267.jpg',
  'https://prmeng.rosselcdn.net/sites/default/files/dpistyles_v2/ena_16_9_extra_big/2021/08/08/node_219950/38622078/public/2021/08/08/B9727929826Z.1_20210808174255_000%2BG4MIN63DU.1-0.jpg?itok=RmTetq8X1628437384',
  'https://france3-regions.francetvinfo.fr/image/lDezZVtn2NPvvuGrxyt6v9s9E_c/600x400/regions/2020/06/09/5edebaa7f24a5_catamaran_solaire.png',
  'https://www.futuroprossimo.it/wp-content/uploads/2023/01/haven-1.jpg',
  'https://www.alke.eu/fr/images/stories/articles/0571/1170/voiture-de-golf-electrique-hors-route-du-travail-alke.jpg',
  'https://www.rueducommerce.fr/media/produits/marque-generique/img//124-vehicule-de-course-electrique-double-face-tout-terrain-voiture-de-course-sur-chenilles-noir-8559287-21770367_1200x1200.jpg',
  'https://img.20mn.fr/F2yWh_UwQxm8UqLopbM9Iik/1200x768_photo-aerienne-maglev-nouveau-train-chinois-20-juillet-2021-province-qingdao',
  'https://forum.velotaf.com/index.php?app=core&module=attach&section=attach&attach_rel_module=post&attach_id=80423',
  'https://c8.alamy.com/compfr/2gf2kr1/bus-electrique-avec-station-de-charge-sur-fond-de-panneaux-solaires-et-d-eoliennes-concept-de-mobilite-propre-2gf2kr1.jpg',
  'https://static.fnac-static.com/multimedia/Images/B1/B1/FA/8D/9304753-1505-1505-1/tsp20210224112156/Hoverboard-8-5-pouces-Markboard-Hummer-Tout-Terrain-Auto-equilibrant-LED-Bluetooth-APP-avec-Moteur-Puiant-Camouflage.jpg',
  'https://cache.natureetdecouvertes.com/Medias/Images/Articles/97652900/trottinette-lectrique-enfant-wonder-two-97652900_5.jpg',
  'https://www.ora7.fr//uploads/700372681/324349920/32/AirCar-voiture-volante-innovation.jpg',
  'https://madeinmarseille.net/actualites-marseille/sous-marin-tourisme-marseille-croisiere.jpg',
  'https://cdn.cleanrider.com/uploads/2022/03/z-triton-02.jpg',
  'https://img.nauticexpo.fr/images_ne/photo-g/63307-9095132.jpg',
  'https://images.bfmtv.com/pZcPCKatZvL5dMr1QNw9-9A9W68=/30x0:1470x810/1440x0/images/La-LMV-496-de-Lazareth-une-moto-volante-made-in-France-1545825.jpg',
  'https://i.ytimg.com/vi/HGqvzHYFC-o/sddefault.jpg',
  'https://cdn.motor1.com/images/mgl/gYkeE/s1/4x3/tesla-model-3-con-impianto-fotovoltaico-artigianale.webp',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRLrTi_UZ6vZuPXvI5ojsEDpTMHt0E0gisOQ&usqp=CAU',
  'https://c8.alamy.com/compfr/kwww85/banaue-philippines-october-6-2016-coloriste-les-tricycles-a-moteur-sont-un-moyen-de-transport-public-dans-le-pays-ici-sur-la-liste-des-mayoyao-alfonso-kwww85.jpg',
  'https://cdn.futura-sciences.com/sources/video/videov6/3267.jpg',
  'https://prmeng.rosselcdn.net/sites/default/files/dpistyles_v2/ena_16_9_extra_big/2021/08/08/node_219950/38622078/public/2021/08/08/B9727929826Z.1_20210808174255_000%2BG4MIN63DU.1-0.jpg?itok=RmTetq8X1628437384',
  'https://france3-regions.francetvinfo.fr/image/lDezZVtn2NPvvuGrxyt6v9s9E_c/600x400/regions/2020/06/09/5edebaa7f24a5_catamaran_solaire.png',
  'https://www.futuroprossimo.it/wp-content/uploads/2023/01/haven-1.jpg',
  'https://www.alke.eu/fr/images/stories/articles/0571/1170/voiture-de-golf-electrique-hors-route-du-travail-alke.jpg',
  'https://www.rueducommerce.fr/media/produits/marque-generique/img//124-vehicule-de-course-electrique-double-face-tout-terrain-voiture-de-course-sur-chenilles-noir-8559287-21770367_1200x1200.jpg',
  'https://img.20mn.fr/F2yWh_UwQxm8UqLopbM9Iik/1200x768_photo-aerienne-maglev-nouveau-train-chinois-20-juillet-2021-province-qingdao',
  'https://forum.velotaf.com/index.php?app=core&module=attach&section=attach&attach_rel_module=post&attach_id=80423',
  'https://c8.alamy.com/compfr/2gf2kr1/bus-electrique-avec-station-de-charge-sur-fond-de-panneaux-solaires-et-d-eoliennes-concept-de-mobilite-propre-2gf2kr1.jpg',
  'https://static.fnac-static.com/multimedia/Images/B1/B1/FA/8D/9304753-1505-1505-1/tsp20210224112156/Hoverboard-8-5-pouces-Markboard-Hummer-Tout-Terrain-Auto-equilibrant-LED-Bluetooth-APP-avec-Moteur-Puiant-Camouflage.jpg',
  'https://c8.alamy.com/compfr/2gf2kr1/bus-electrique-avec-station-de-charge-sur-fond-de-panneaux-solaires-et-d-eoliennes-concept-de-mobilite-propre-2gf2kr1.jpg',
  'https://cache.natureetdecouvertes.com/Medias/Images/Articles/97652900/trottinette-lectrique-enfant-wonder-two-97652900_5.jpg',
  'https://cache.natureetdecouvertes.com/Medias/Images/Articles/97652900/trottinette-lectrique-enfant-wonder-two-97652900_5.jpg',
  'https://cache.natureetdecouvertes.com/Medias/Images/Articles/97652900/trottinette-lectrique-enfant-wonder-two-97652900_5.jpg',
]

[Booking, Vehicle, User].each { |model| model.destroy_all }



def create_vehicle(attributes)
  20.times do
    file = URI.open($photo_urls.sample)
    vehicle = Vehicle.new(attributes)
    vehicle.user = User.all.sample
    vehicle.price = rand(50..200)
    vehicle.photo.attach(io: file, filename: "amphibie.jpg", content_type: "image/jpg")
    vehicle.save!
    puts " Vehicle created!"
  end
end


 puts "creating users"
User.create!({email: "toto+5@toto.fr", password: "azerty"})
User.create!({email: "toto+6@toto.fr", password: "azerty"})
User.create!({email: "toto+7@toto.fr", password: "azerty"})
User.create!({email: "toto+8@toto.fr", password: "azerty"})



create_vehicle({name: "Voiture volante", description: "Un véhicule qui peut se transformer en avion, offrant une solution de transport polyvalente pour éviter les embouteillages."})
create_vehicle({name: "Sous-marin de tourisme", description: "Un sous-marin conçu pour des excursions touristiques sous-marines, offrant une vue panoramique sur la vie marine."})
create_vehicle({name: "Vélo amphibie", description: "Un vélo qui peut également naviguer sur l'eau, permettant aux cyclistes d'explorer à la fois les routes et les voies navigables."})
create_vehicle({name: "Hovercraft personnel", description: "Un petit hovercraft personnel pour des déplacements rapides sur l'eau et les surfaces planes sans être limité par les obstacles traditionnels."})
create_vehicle({name: "Moto volante", description: "Une moto équipée de propulseurs ou d'ailes pour permettre le vol, offrant une expérience de conduite unique."})
create_vehicle({name: "Voiture tout-terrain extrême", description: "Un véhicule robuste conçu pour affronter les terrains les plus difficiles, avec des fonctionnalités telles que des pneus gonflables, une suspension avancée et une résistance à l'eau."})
create_vehicle({name: "Véhicule électrique solaire", description: "Une voiture alimentée entièrement par l'énergie solaire, offrant une solution durable et écologique pour les déplacements."})
create_vehicle({name: "Skateboard électrique tout-terrain", description: "Un skateboard équipé de moteurs électriques et de roues adaptées aux terrains difficiles, offrant une nouvelle expérience de glisse."})
create_vehicle({name: "Tricycle motorisé pour le transport urbain", description: "Un tricycle électrique équipé d'un compartiment de transport, idéal pour les déplacements en milieu urbain avec une capacité de stockage."})
create_vehicle({name: "Véhicule de transport personnel à lévitation magnétique", description: "Un véhicule qui utilise la lévitation magnétique pour se déplacer au-dessus du sol, offrant une expérience de conduite futuriste et sans friction."})
create_vehicle({name: "Trottinette électrique à assistance robotique", description: "Une trottinette équipée d'une assistance robotique pour aider le cycliste dans les montées et les longues distances, offrant un moyen plus efficace de se déplacer en ville."})
create_vehicle({name: "Bateau solaire de croisière", description: "Un bateau de croisière propulsé entièrement à l'énergie solaire, offrant des voyages durables le long des voies navigables."})
create_vehicle({name: "Voiture autonome de camping", description: "Un véhicule autonome équipé d'un intérieur aménagé pour le camping, offrant une expérience de voyage sans souci."})
create_vehicle({name: "Véhicule de course tout-terrain électrique", description: "Une voiture de course tout-terrain alimentée par l'électricité, conçue pour les compétitions hors route avec une accélération rapide."})
create_vehicle({name: "Train à grande vitesse maglev", description: "Un train utilisant la lévitation magnétique pour atteindre des vitesses élevées, offrant un moyen rapide et confortable de voyager entre les villes."})
create_vehicle({name: "Vélo-cargo électrique pliable", description: "Un vélo-cargo électrique qui se plie facilement pour un stockage pratique, idéal pour les déplacements urbains avec des charges supplémentaires."})
create_vehicle({name: "Bus à énergie solaire avec jardins verticaux", description: "Un bus à énergie solaire doté de murs végétaux verticaux pour améliorer la qualité de l'air en déplacement."})
create_vehicle({name: "Hoverboard tout-terrain", description: "Un hoverboard équipé de pneus tout-terrain pour une expérience de glisse hors route."})
create_vehicle({name: "Véhicule amphibie transformable", description: "Un véhicule qui peut passer du mode terrestre au mode aquatique, offrant une grande polyvalence pour les aventures variées."})
create_vehicle({name: "Vélo à lévitation magnétique", description: "Un vélo utilisant la technologie de lévitation magnétique pour une conduite sans friction et une expérience de déplacement futuriste."})
create_vehicle({name: "Trottinette électrique à assistance robotique", description: "Une trottinette équipée d'une assistance robotique pour aider le cycliste dans les montées et les longues distances, offrant un moyen plus efficace de se déplacer en ville."})
create_vehicle({name: "Griffon aérien", description: "Un majestueux griffon capable de voler, utilisé comme monture pour les voyages aériens."})
create_vehicle({name: "Tortue éclair", description: "Une tortue géante dotée de capacités électriques, utilisée comme moyen de transport terrestre rapide."})
create_vehicle({name: "Hippogriffe marin", description: "Un hippogriffe adapté pour nager dans les océans, utilisé comme moyen de transport aquatique."})
create_vehicle({name: "Loup des neiges", description: "Un loup blanc robuste, adapté aux climats froids, utilisé pour le transport dans des régions enneigées."})
create_vehicle({name: "Dragon éthéré", description: "Un dragon translucide capable de se déplacer à travers les dimensions, offrant un moyen de transport interdimensionnel."})
create_vehicle({name: "Licorne des cieux", description: "Une licorne ailée qui peut voler à travers les nuages, utilisée pour des voyages aériens élégants."})
create_vehicle({name: "Chameau de sable magique", description: "Un chameau capable de se déplacer rapidement à travers les déserts grâce à des pouvoirs magiques."})
create_vehicle({name: "Panthère de l'ombre", description: "Une grande panthère noire capable de se fondre dans les ombres, utilisée pour des voyages furtifs."})
create_vehicle({name: "Lapin sauteur", description: "Un lapin géant avec des pattes extrêmement puissantes, utilisé comme monture pour des sauts impressionnants."})
create_vehicle({name: "Phénix flamboyant", description: "Un phénix dont les ailes enflammées permettent de voler à travers les cieux, utilisé comme moyen de transport majestueux."})
create_vehicle({name: "Ours de montagne rapide", description: "Un ours robuste capable de grimper aisément sur les montagnes, utilisé comme moyen de transport en terrain escarpé."})
create_vehicle({name: "Serpent des rivières", description: "Un serpent aquatique qui peut naviguer à travers les rivières et les cours d'eau, utilisé comme moyen de transport fluvial."})
create_vehicle({name: "Cheval arc-en-ciel", description: "Un cheval aux crins colorés capable de créer des arcs-en-ciel lorsqu'il court, utilisé pour des voyages joyeux."})
create_vehicle({name: "Araignée sylvestre", description: "Une araignée géante avec des fils tissés magiquement, utilisée comme moyen de transport forestier."})
create_vehicle({name: "Éléphant de cristal", description: "Un éléphant majestueux dont la peau est faite de cristaux étincelants, utilisé pour des voyages solennels."})
