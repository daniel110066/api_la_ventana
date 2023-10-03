CREATE DATABASE la_ventana;
USE la_ventana;

CREATE TABLE Admins(
	id_admin INT auto_increment,
    usuario_admin VARCHAR(25) not null unique,
    clave_admin VARCHAR(250) not null,
    super_admin bool not null default 0,
    primary key(id_admin)
);

CREATE TABLE Proyectos(
	id_proyecto INT auto_increment,
    nombre_proyecto VARCHAR(50) unique,
    categoria_proyecto VARCHAR(50) not null,
    descripcion_proyecto TEXT not null,
    url_proyecto TEXT,
    logo_proyecto TEXT,
    imagen_proyecto TEXT,
    tipo_proyecto VARCHAR(50) not null,
    estado VARCHAR(25) not null,
    latitud DOUBLE not null,
    longitud DOUBLE not null,
    PRIMARY KEY(id_proyecto)
);

CREATE TABLE InfoEstados(
	id_estado INT auto_increment,
    nombre_estado VARCHAR(25),
    info_estado TEXT,
    escudo_estado TEXT,
    imagen_estado TEXT,
    PRIMARY KEY(id_estado)
);

set @info_aguascalientes = "Aguascalientes es una ciudad colonial de la zona central de México, conocida por sus edificios históricos, su arte funerario y sus aguas termales. La ciudad fue fundada en 1575 y fue un importante centro minero durante el siglo XIX. El centro histórico de la ciudad está bien conservado y cuenta con numerosos edificios coloniales, como la Catedral de Nuestra Señora de la Asunción, el Palacio de Gobierno y el Teatro Morelos.";
set @info_aguascalientes = "https://laventa-bucket.s3.amazonaws.com/images/escudo_aguascalientes.png";
set @info_aguascalientes = "https://laventa-bucket.s3.amazonaws.com/images/imagen_aguascalientes.png";
set @info_baja_california = "Baja California es un estado del noroeste de México, con Mexicali como su capital. Limita con California, Estados Unidos, y es conocido por su impresionante costa en el Mar de Cortés. La ciudad de Tijuana es un importante centro cultural y económico, con una animada vida nocturna y una variada oferta gastronómica. Además de su atractivo turístico, Baja California es un estado industrial clave. Su ubicación estratégica y diversidad geográfica lo convierten en un lugar único en México.";
set @escudo_baja_california = "https://laventa-bucket.s3.amazonaws.com/images/escudo_baja_california.png";
set @imagen_baja_california = "https://laventa-bucket.s3.amazonaws.com/images/imagen_baja_california.jpg";
set @info_baja_california_sur = "Baja California Sur es un paraíso costero situado en la Península de Baja California. La capital, La Paz, es conocida por su belleza natural y su ambiente relajado. Este estado ofrece playas prístinas, actividades acuáticas emocionantes y una rica biodiversidad marina. Los Cabos, en el extremo sur de la península, es un destino turístico de renombre mundial. La región es un paraíso para los amantes de la pesca deportiva, el buceo y el golf. Baja California Sur es un lugar de ensueño para quienes buscan escapar a un entorno natural espectacular.";
set @escudo_baja_california_sur = "https://laventa-bucket.s3.amazonaws.com/images/escudo_baja_california_sur.png";
set @imagen_baja_california_sur = "https://laventa-bucket.s3.amazonaws.com/images/imagen_baja_california_sur.jpg";
set @info_campeche = "Campeche es un estado en la costa del Golfo de México, con su capital, San Francisco de Campeche, declarada Patrimonio de la Humanidad por su arquitectura colonial y murallas históricas. Este estado es un tesoro de la cultura maya, con antiguos sitios arqueológicos como Calakmul y Edzná. Campeche también es famoso por su gastronomía, que incluye platillos de mariscos y delicias tradicionales como el pan de cazón. Sus hermosas playas, como la de Carmen, complementan la oferta turística de la región, convirtiéndola en un destino único en México.";
set @escudo_campeche = "https://laventa-bucket.s3.amazonaws.com/images/escudo_campeche.png";
set @imagen_campeche = "https://laventa-bucket.s3.amazonaws.com/images/imagen_campeche.png";
set @info_chiapas = "Chiapas, en el sureste de México, es un estado de una belleza natural impresionante. Su capital, Tuxtla Gutiérrez, sirve como puerta de entrada a la región. Chiapas es conocido por sus selvas tropicales, cascadas espectaculares como las de Agua Azul y Misol-Ha, y sitios arqueológicos mayas como Palenque, que es Patrimonio de la Humanidad. San Cristóbal de las Casas, una ciudad colonial encantadora, es otro atractivo destacado. La cultura indígena chiapaneca es rica y diversa, y sus festivales coloridos, como el Zinacantán y el de San Juan Chamula, son imperdibles.";
set @escudo_chiapas = "https://laventa-bucket.s3.amazonaws.com/images/escudo_chiapas.png";
set @imagen_chiapas = "https://laventa-bucket.s3.amazonaws.com/images/imagen_chiapas.jpg";
set @info_chihuahua = "Chihuahua, en el norte de México, es un estado de paisajes impresionantes y vastos desiertos. La capital, Chihuahua, es un centro cultural y económico importante. Sin embargo, el verdadero tesoro de Chihuahua es la Barranca del Cobre, un sistema de cañones más grande que el Gran Cañón. Los visitantes pueden explorar este entorno natural en tren o a pie. Además de su belleza natural, Chihuahua es conocido por su tradición ranchera y su música norteña. Ciudad Juárez, en la frontera con Estados Unidos, es un punto de cruce clave y una ciudad llena de historia y cultura.";
set @escudo_chihuahua = "https://laventa-bucket.s3.amazonaws.com/images/escudo_chihuahua.png";
set @imagen_chihuahua = "https://laventa-bucket.s3.amazonaws.com/images/imagen_chihuahua.jpg";
set @info_coahuila = "Coahuila, en el norte de México, es un estado que combina paisajes diversos, desde desiertos hasta montañas. Su capital es Saltillo, conocida por su rica tradición artesanal y la producción de sarapes. Coahuila también tiene una historia rica en minería y revolución. La ciudad de Torreón es un importante centro industrial. Coahuila es famoso por su carne asada y su deliciosa comida norteña. Además, es un lugar de belleza natural con el desierto de Cuatro Ciénegas, que alberga manantiales únicos y especies endémicas. Los amantes de la naturaleza disfrutarán explorando las montañas de la Sierra de la Madera y la Sierra de la Silla.";
set @escudo_coahuila = "https://laventa-bucket.s3.amazonaws.com/images/escudo_coahuila.png";
set @imagen_coahuila = "https://laventa-bucket.s3.amazonaws.com/images/imagen_coahuila.jpg";
set @info_colima = "Colima, ubicado en la costa del Pacífico, es un estado de playas hermosas y el majestuoso volcán de Colima, también conocido como el Volcán de Fuego. Su capital, Colima, es una ciudad tranquila con un ambiente relajado. El estado es famoso por sus platillos de mariscos frescos y su gastronomía tradicional. En Manzanillo, uno de los principales puertos del país, los visitantes pueden disfrutar de playas doradas y deportes acuáticos. La Reserva de la Biosfera Sierra de Manantlán es un refugio para la vida silvestre y ofrece oportunidades para el senderismo y la observación de aves.";
set @escudo_colima = "https://laventa-bucket.s3.amazonaws.com/images/escudo_colima.png";
set @imagen_colima = "https://laventa-bucket.s3.amazonaws.com/images/imagen_colima.jpg";
set @info_ciudad_de_mexico = "La Ciudad de México, también conocida como CDMX o simplemente México, es la capital del país y una de las ciudades más grandes y pobladas del mundo. Fundada en 1325 por los aztecas como Tenochtitlán, su rica historia abarca desde la civilización prehispánica hasta la época colonial y la actualidad. La ciudad es un crisol de culturas, con una mezcla de arquitectura antigua y moderna. El Centro Histórico es Patrimonio de la Humanidad y alberga sitios emblemáticos como el Zócalo, la Catedral Metropolitana y el Palacio de Bellas Artes. La gastronomía es variada, con platos como los tacos, tamales y el pozole. La CDMX es un centro cultural con museos de renombre, teatros y una escena artística vibrante.";
set @escudo_ciudad_de_mexico = "https://laventa-bucket.s3.amazonaws.com/images/escudo_ciudad_de_mexico.png";
set @imagen_ciudad_de_mexico = "https://laventa-bucket.s3.amazonaws.com/images/imagen_ciudad_de_mexico.jpg";
set @info_durango = "Durango es un estado en el norte de México, conocido por sus tradiciones rancheras y su belleza natural. Su capital, Durango, es una ciudad histórica con una arquitectura colonial encantadora. El estado tiene una rica herencia cultural y es famoso por sus festivales tradicionales y música ranchera. Además de su cultura, Durango ofrece paisajes espectaculares, como el Valle de Guadiana y las montañas de la Sierra Madre Occidental. El Parque Nacional Dinamos del Mezquital es un lugar popular para actividades al aire libre. Durango es un destino para aquellos que buscan aventura y autenticidad.";
set @escudo_durango = "https://laventa-bucket.s3.amazonaws.com/images/escudo_durango.png";
set @imagen_durango = "https://laventa-bucket.s3.amazonaws.com/images/imagen_durango.jpg";
set @info_guanajuato = "Guanajuato, en el centro de México, es un estado famoso por su historia y su arquitectura colonial. Su capital, Guanajuato, es una ciudad que parece detenida en el tiempo, con calles empedradas, callejones estrechos y edificios coloridos. La ciudad es conocida por el Festival Internacional Cervantino, una celebración cultural de renombre mundial. Además, Guanajuato alberga sitios históricos como la Alhóndiga de Granaditas y el Teatro Juárez. El estado es famoso por la minería de plata en la ciudad de San Luis de la Paz y ofrece paisajes montañosos y viñedos en la región de Guanajuato.";
set @escudo_guanajuato = "https://laventa-bucket.s3.amazonaws.com/images/escudo_guanajuato.png";
set @imagen_guanajuato = "https://laventa-bucket.s3.amazonaws.com/images/imagen_guanajuato.jpeg";
set @info_guerrero = "Guerrero, en la costa del Pacífico, es un estado con una rica herencia prehispánica y playas espectaculares. Acapulco, su ciudad más famosa, es un destino turístico internacional conocido por sus playas doradas, su vida nocturna y su historia. El Fuerte de San Diego y el Zócalo son puntos de interés destacados. En Taxco, una ciudad colonial encantadora, se produce la plata de alta calidad. Además de sus tesoros culturales, Guerrero ofrece belleza natural en la zona de la Sierra Madre del Sur, donde se pueden encontrar cascadas y cuevas impresionantes.";
set @escudo_guerrero = "https://laventa-bucket.s3.amazonaws.com/images/escudo_guerrero.png";
set @imagen_guerrero = "https://laventa-bucket.s3.amazonaws.com/images/imagen_guerrero.jpg";
set @info_hidalgo = "Hidalgo, ubicado en el centro de México, es un estado con una rica herencia otomí y sitios arqueológicos. Su capital, Pachuca, es conocida por su arquitectura colonial y su hermoso reloj monumental. El estado cuenta con zonas arqueológicas como Tula, famosa por las colosales estatuas de los Atlantes. Además de su historia, Hidalgo es famoso por su comida tradicional, que incluye platillos como los pastes y el pulque. Los visitantes pueden explorar las montañas de la Sierra de Pachuca y disfrutar de aguas termales en lugares como Tecozautla. Hidalgo es un destino cultural y naturalmente rico.";
set @escudo_hidalgo = "https://laventa-bucket.s3.amazonaws.com/images/escudo_hidalgo.png";
set @imagen_hidalgo = "https://laventa-bucket.s3.amazonaws.com/images/imagen_hidalgo.jpg";
set @info_jalisco = "Jalisco, en el occidente de México, es conocido como la cuna del mariachi y el tequila. Su capital, Guadalajara, es una ciudad vibrante y cultural, con arquitectura histórica y una animada escena de música y danza. El estado es famoso por su producción de tequila, y los visitantes pueden visitar destilerías en la región de Tequila. Además de su música y bebidas icónicas, Jalisco ofrece belleza natural en la Sierra Madre Occidental y la costa del Pacífico, con destinos como Puerto Vallarta. El lago de Chapala es el lago más grande de México y un lugar de relajación.";
set @escudo_jalisco = "https://laventa-bucket.s3.amazonaws.com/images/escudo_jalisco.png";
set @imagen_jalisco = "https://laventa-bucket.s3.amazonaws.com/images/imagen_jalisco.jpeg";
set @info_estado_de_mexico = "El Estado de México, ubicado en el centro de México, rodea a la Ciudad de México y es una entidad política y culturalmente rica. Toluca es su capital y un centro industrial importante. El estado alberga varios sitios arqueológicos, como Teotihuacán, una antigua ciudad con las icónicas pirámides del Sol y la Luna. Además de su historia prehispánica, el Estado de México es conocido por su diversa gastronomía, que incluye platillos como el chorizo verde y el mole. El Nevado de Toluca es un volcán extinto que ofrece oportunidades para el senderismo y la observación de la naturaleza.";
set @escudo_estado_de_mexico = "https://laventa-bucket.s3.amazonaws.com/images/escudo_estado_de_mexico.png";
set @imagen_estado_de_mexico = "https://laventa-bucket.s3.amazonaws.com/images/imagen_estado_de_mexico.jpg";
set @info_michoacan = "Michoacán, en el suroeste de México, es famoso por su celebración del Día de los Muertos y su artesanía tradicional. Su capital, Morelia, es conocida por su impresionante arquitectura colonial, que incluye la majestuosa Catedral de Morelia. Pátzcuaro es un pueblo encantador conocido por su ambiente festivo en el Día de los Muertos. El estado alberga la región de Tierra Caliente, famosa por su música y bailes tradicionales. Michoacán también ofrece belleza natural, como el Parque Nacional Pico de Tancítaro y las playas en la costa del Pacífico.";
set @escudo_michoacan = "https://laventa-bucket.s3.amazonaws.com/images/escudo_michoacan.png";
set @imagen_michoacan = "https://laventa-bucket.s3.amazonaws.com/images/imagen_michoacan.jpg";
set @info_morelos = "Morelos, en el centro de México, es conocido como el Estado de la Eterna Primavera debido a su clima agradable durante todo el año. La capital, Cuernavaca, es famosa por su Jardín Borda, un exuberante jardín histórico. Morelos alberga sitios arqueológicos, como Xochicalco, que revelan su antigua historia. Además de su belleza natural y arquitectura colonial, el estado es un destino para el turismo de bienestar, con spas y balnearios en las aguas termales de Tlazala y otros lugares. El Tepozteco es una montaña sagrada y un lugar popular para el senderismo y la espiritualidad.";
set @escudo_morelos = "https://laventa-bucket.s3.amazonaws.com/images/escudo_morelos.png";
set @imagen_morelos = "https://laventa-bucket.s3.amazonaws.com/images/imagen_morelos.jpeg";
set @info_nayarit = "Nayarit, en la costa del Pacífico, es conocido por sus hermosas playas en la Riviera Nayarit. La capital, Tepic, es un centro cultural y económico. El estado es un paraíso para los amantes de la playa, con destinos como Nuevo Vallarta y Sayulita. La cultura huichol tiene una presencia fuerte en la región, y los visitantes pueden explorar su arte y tradiciones en lugares como San Blas. Además de las playas, Nayarit ofrece belleza natural en las Islas Marías y la Reserva de la Biosfera de la Sierra de Vallejo, ideales para la observación de aves y actividades al aire libre.";
set @escudo_nayarit = "https://laventa-bucket.s3.amazonaws.com/images/escudo_nayarit.png";
set @imagen_nayarit = "https://laventa-bucket.s3.amazonaws.com/images/imagen_nayarit.jpg";
set @info_nuevo_leon = "Nuevo León es un estado industrial y de negocios en el norte de México, con Monterrey como su capital. La ciudad es un centro financiero y cultural con rascacielos modernos y un ambiente cosmopolita. El estado es conocido por su gastronomía norteña, que incluye cortes de carne asada y cabrito. Además de su vida urbana, Nuevo León ofrece belleza natural en la Sierra Madre Oriental y el Parque Nacional Cumbres de Monterrey, donde los visitantes pueden disfrutar del senderismo y la escalada. El Cañón de Santa Rosa es un lugar de interés natural con cascadas impresionantes.";
set @escudo_nuevo_leon = "https://laventa-bucket.s3.amazonaws.com/images/escudo_nuevo_leon.png";
set @imagen_nuevo_leon = "https://laventa-bucket.s3.amazonaws.com/images/imagen_nuevo_leon.jpg";
set @info_oaxaca = "Oaxaca, en el sureste de México, es conocido por su rica cultura indígena y su ciudad histórica de Oaxaca de Juárez. El estado es famoso por su gastronomía, que incluye el mole y los tlayudas. Oaxaca es hogar de varias etnias indígenas, como los zapotecas y los mixtecos, y su artesanía es apreciada en todo el mundo. Monte Albán es un sitio arqueológico zapoteca declarado Patrimonio de la Humanidad. La costa de Oaxaca ofrece playas hermosas, como Puerto Escondido y Huatulco. La Guelaguetza es un festival cultural anual que muestra la diversidad de Oaxaca.";
set @escudo_oaxaca = "https://laventa-bucket.s3.amazonaws.com/images/escudo_oaxaca.png";
set @imagen_oaxaca = "https://laventa-bucket.s3.amazonaws.com/images/imagen_oaxaca.jpeg";
set @info_puebla = "Puebla, en el centro de México, es famoso por su gastronomía y su arquitectura colonial. La capital, Puebla de Zaragoza, es conocida por su impresionante Catedral de Puebla y su centro histórico, también Patrimonio de la Humanidad. El estado es famoso por su comida, que incluye los chiles en nogada y el mole poblano. Puebla es hogar de la Gran Pirámide de Cholula, la más grande del mundo por volumen, y Cholula es una ciudad encantadora con una vibrante vida cultural. Además de su historia, Puebla ofrece belleza natural en la Sierra Norte y los Cuetzalan, ideales para el senderismo.";
set @escudo_puebla = "https://laventa-bucket.s3.amazonaws.com/images/escudo_puebla.png";
set @imagen_puebla = "https://laventa-bucket.s3.amazonaws.com/images/imagen_puebla.png";
set @info_queretaro = "Querétaro es un estado en el centro de México, conocido por su industria vitivinícola y su belleza colonial. La capital, Santiago de Querétaro, es una ciudad histórica con una arquitectura impresionante y un ambiente tranquilo. El estado es famoso por su producción de vino, y los visitantes pueden disfrutar de catas en la región vinícola de Querétaro. Querétaro también es un centro industrial y tecnológico en crecimiento. El Pueblo Mágico de Bernal es un destino popular para los amantes de la escalada y la observación de estrellas, con el tercer monolito más grande del mundo.";
set @escudo_queretaro = "https://laventa-bucket.s3.amazonaws.com/images/escudo_queretaro.png";
set @imagen_queretaro = "https://laventa-bucket.s3.amazonaws.com/images/imagen_queretaro.png";
set @info_quintana_roo = "Quintana Roo, en la península de Yucatán, es hogar de destinos turísticos de renombre mundial como Cancún, Playa del Carmen y Tulum. La capital, Chetumal, se encuentra en la costa del Golfo de México. El estado es famoso por sus playas de arena blanca, aguas cristalinas y arrecifes de coral. Cancún es conocido por su vida nocturna y resorts de lujo, mientras que Tulum ofrece un ambiente más relajado y es famoso por sus ruinas mayas junto al mar. Quintana Roo también alberga parques naturales, como el Parque Nacional Tulum y el Parque Nacional Isla Contoy, donde los visitantes pueden observar la vida marina y las aves en su entorno natural.";
set @escudo_quintana_roo = "https://laventa-bucket.s3.amazonaws.com/images/escudo_quintana_roo.png";
set @imagen_quintana_roo = "https://laventa-bucket.s3.amazonaws.com/images/imagen_quintana_roo.jpg";
set @info_san_luis_potosi = "San Luis Potosí es un estado en el norte de México, conocido por sus ciudades coloniales y la región de la Huasteca Potosina. Su capital, San Luis Potosí, es una ciudad histórica con una impresionante catedral y una arquitectura colonial encantadora. El estado es famoso por su música huasteca y su cultura indígena. La región de la Huasteca Potosina ofrece belleza natural en forma de cascadas, ríos y grutas, ideales para la aventura y el turismo ecológico. La Sierra de San Miguelito es un área de conservación importante para la flora y fauna.";
set @escudo_san_luis_potosi = "https://laventa-bucket.s3.amazonaws.com/images/escudo_san_luis_potosi.png";
set @imagen_san_luis_potosi = "https://laventa-bucket.s3.amazonaws.com/images/imagen_san_luis_potosi.jpg";
set @info_sinaloa = "Sinaloa, en la costa del Pacífico, es conocido por su música banda y su puerto de Mazatlán. Su capital, Culiacán, es un centro económico y cultural. El estado es famoso por su gastronomía, que incluye los mariscos y los antojitos sinaloenses. Mazatlán es un destino turístico popular con playas doradas y una animada vida nocturna en el malecón. Sinaloa también es hogar de la Sierra Madre Occidental y el Parque Nacional Isla Isabel, que alberga aves y vida marina. La región es rica en tradiciones culinarias y culturales únicas.";
set @escudo_sinaloa = "https://laventa-bucket.s3.amazonaws.com/images/escudo_sinaloa.png";
set @imagen_sinaloa = "https://laventa-bucket.s3.amazonaws.com/images/imagen_sinaloa.jpeg";
set @info_sonora = "Sonora, en el noroeste de México, es conocido por su desierto y la cultura de las etnias yaqui y mayo. Su capital, Hermosillo, es un centro económico importante. El estado ofrece paisajes desérticos espectaculares, como el Desierto de Sonora, ideal para la observación de la naturaleza y la aventura. Ciudad Obregón es conocida por su agricultura y es un punto de entrada a la región del Mayo. Sonora es famoso por su carne asada y su cultura ranchera. El Carnaval de Guaymas y las festividades yaquis son parte integral de su patrimonio cultural.";
set @escudo_sonora = "https://laventa-bucket.s3.amazonaws.com/images/escudo_sonora.png";
set @imagen_sonora = "https://laventa-bucket.s3.amazonaws.com/images/imagen_sonora.jpeg";
set @info_tabasco = "Tabasco, en el sureste de México, es conocido por su gastronomía única y su historia. Su capital, Villahermosa, es una ciudad en crecimiento. El estado es famoso por el cacao, que se utiliza en la preparación del chocolate tabasqueño. La región también es conocida por el pejelagarto, un pescado de agua dulce. Tabasco es hogar de la antigua ciudad maya de Comalcalco, conocida por su arquitectura de ladrillo. La naturaleza tiene un papel destacado en el estado, con el Parque Natural de la Venta y la Reserva de la Biosfera Pantanos de Centla, donde se pueden observar cocodrilos y aves.";
set @escudo_tabasco = "https://laventa-bucket.s3.amazonaws.com/images/escudo_tabasco.png";
set @imagen_tabasco = "https://laventa-bucket.s3.amazonaws.com/images/imagen_tabasco.jpeg";
set @info_tamaulipas = "Tamaulipas, en la costa del Golfo de México, es un estado con una diversidad de paisajes, desde playas hasta sierras. Su capital es Ciudad Victoria. El estado es conocido por su historia y cultura, con lugares de interés como el Centro Cultural Tamaulipas y la Catedral de Ciudad Victoria. Tamaulipas ofrece playas en la costa del Golfo, como Tampico y Ciudad Madero. El estado también alberga la Sierra de San Carlos y la Sierra Madre Oriental, ideales para actividades al aire libre y la observación de aves. Tamaulipas es un lugar de belleza natural y tradiciones únicas.";
set @escudo_tamaulipas = "https://laventa-bucket.s3.amazonaws.com/images/escudo_tamaulipas.png";
set @imagen_tamaulipas = "https://laventa-bucket.s3.amazonaws.com/images/imagen_tamaulipas.jpg";
set @info_tlaxcala = "Tlaxcala, el estado más pequeño de México, es conocido por su rica herencia cultural y su capital, Tlaxcala de Xicohténcatl. La ciudad es famosa por su arquitectura colonial, incluida la Basílica de Nuestra Señora de la Caridad. Tlaxcala es un lugar de tradiciones, como la danza de los huehues y la fiesta de la Virgen de la Caridad. El estado es conocido por su artesanía, incluidos los sarapes y las figuras de papel maché. La naturaleza también está presente en Tlaxcala, con el Parque Nacional La Malinche, un volcán extinto y un lugar popular para el senderismo.";
set @escudo_tlaxcala = "https://laventa-bucket.s3.amazonaws.com/images/escudo_tlaxcala.png";
set @imagen_tlaxcala = "https://laventa-bucket.s3.amazonaws.com/images/imagen_tlaxcala.jpg";
set @info_veracruz = "Veracruz, en la costa del Golfo de México, ofrece ciudades costeras hermosas y una rica cultura. Xalapa, la capital, es conocida por su ambiente cultural y el Museo de Antropología. El estado es famoso por su café y su gastronomía, que incluye platillos como el mole de Xico y los mariscos en la costa. Veracruz alberga el famoso Carnaval de Veracruz, uno de los más grandes de México. Además, el estado tiene una belleza natural impresionante, con el Parque Nacional Pico de Orizaba, el volcán más alto de México, y las playas de la Costa Esmeralda en el Golfo de México.";
set @escudo_veracruz = "https://laventa-bucket.s3.amazonaws.com/images/escudo_veracruz.png";
set @imagen_veracruz = "https://laventa-bucket.s3.amazonaws.com/images/imagen_veracruz.jpg";
set @info_yucatan = "Yucatán, en la península de Yucatán, es famoso por su capital, Mérida, y la antigua ciudad maya de Chichén Itzá. Mérida es una ciudad vibrante con una arquitectura colonial encantadora y un ambiente tranquilo. El estado es conocido por su gastronomía yucateca, que incluye la cochinita pibil y los panuchos. Chichén Itzá es uno de los sitios arqueológicos más visitados del mundo, con la pirámide de Kukulcán como punto culminante. Yucatán ofrece cenotes, cuevas y una belleza natural en la reserva de la Biosfera de Ría Celestún. La cultura maya sigue viva en la región.";
set @escudo_yucatan = "https://laventa-bucket.s3.amazonaws.com/images/escudo_yucatan.png";
set @imagen_yucatan = "https://laventa-bucket.s3.amazonaws.com/images/imagen_yucatan.jpg";
set @info_zacatecas = "Zacatecas, en el norte de México, es conocido por su arquitectura colonial y su herencia minera. La capital, Zacatecas, es famosa por su centro histórico, declarado Patrimonio de la Humanidad, con calles empedradas y edificios coloniales majestuosos. El estado tiene una larga historia de minería de plata, y los visitantes pueden explorar antiguas minas como El Edén. Zacatecas es famoso por su música de banda y su comida tradicional, que incluye los tamales de Zacatecas y los asados de carnero. Además de su cultura, el estado ofrece belleza natural en la Sierra de Órganos y la Sierra de Cardos, ideales para la aventura y la observación de la naturaleza.";
set @escudo_zacatecas = "https://laventa-bucket.s3.amazonaws.com/images/escudo_zacatecas.png";
set @imagen_zacatecas = "https://laventa-bucket.s3.amazonaws.com/images/imagen_zacatecas.jpeg";

INSERT INTO InfoEstados VALUES
    (0, "Aguascalientes", @info_aguascalientes, @escudo_aguascalientes, @imagen_aguascalientes),
    (0, "Baja California", @info_baja_california, @escudo_baja_california, @imagen_baja_california),
    (0, "Baja California Sur", @info_baja_california_sur, @escudo_baja_california_sur, @imagen_baja_california_sur),
    (0, "Campeche", @info_campeche, @escudo_campeche, @imagen_campeche),
    (0, "Chiapas", @info_chiapas, @escudo_chiapas, @imagen_chiapas),
    (0, "Chihuahua", @info_chihuahua, @escudo_chihuahua, @imagen_chihuahua),
    (0, "Coahuila", @info_coahuila, @escudo_coahuila, @imagen_coahuila),
    (0, "Colima", @info_colima, @escudo_colima, @imagen_colima),
    (0, "Ciudad de Mexico", @info_ciudad_de_mexico, @escudo_ciudad_de_mexico, @imagen_ciudad_de_mexico),
    (0, "Durango", @info_durango, @escudo_durango, @imagen_durango),
    (0, "Estado de Mexico", @info_estado_de_mexico, @escudo_estado_de_mexico, @imagen_estado_de_mexico),
    (0, "Guanajuato", @info_guanajuato, @escudo_guanajuato, @imagen_guanajuato),
    (0, "Guerrero", @info_guerrero, @escudo_guerrero, @imagen_guerrero),
    (0, "Hidalgo", @info_hidalgo, @escudo_hidalgo, @imagen_hidalgo),
    (0, "Jalisco", @info_jalisco, @escudo_jalisco, @imagen_jalisco),
    (0, "Michoacan", @info_michoacan, @escudo_michoacan, @imagen_michoacan),
    (0, "Morelos", @info_morelos, @escudo_morelos, @imagen_morelos),
    (0, "Nayarit", @info_nayarit, @escudo_nayarit, @imagen_nayarit),
    (0, "Nuevo Leon", @info_nuevo_leon, @escudo_nuevo_leon, @imagen_nuevo_leon),
    (0, "Oaxaca", @info_oaxaca, @escudo_oaxaca, @imagen_oaxaca),
    (0, "Puebla", @info_puebla, @escudo_puebla, @imagen_puebla),
    (0, "Querétaro", @info_queretaro, @escudo_queretaro, @imagen_queretaro),
    (0, "Quintana Roo", @info_quintana_roo, @escudo_quintana_roo, @imagen_quintana_roo),
    (0, "San Luis Potosi", @info_san_luis_potosi, @escudo_san_luis_potosi, @imagen_san_luis_potosi),
    (0, "Sinaloa", @info_sinaloa, @escudo_sinaloa, @imagen_sinaloa),
    (0, "Sonora", @info_sonora, @escudo_sonora, @imagen_sonora),
    (0, "Tabasco", @info_tabasco, @escudo_tabasco, @imagen_tabasco),
    (0, "Tamaulipas", @info_tamaulipas, @escudo_tamaulipas, @imagen_tamaulipas),
    (0, "Tlaxcala", @info_tlaxcala, @escudo_tlaxcala, @imagen_tlaxcala),
    (0, "Veracruz", @info_veracruz, @escudo_veracruz, @imagen_veracruz),
    (0, "Yucatan", @info_yucatan, @escudo_yucatan, @imagen_yucatan),
    (0, "Zacatecas", @info_zacatecas, @escudo_zacatecas, @imagen_zacatecas);


