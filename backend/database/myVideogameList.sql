-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: database
-- Tiempo de generación: 16-06-2024 a las 13:19:20
-- Versión del servidor: 8.4.0
-- Versión de PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `myVideogameList`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20240612111252', '2024-06-12 11:13:02', 530);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `game`
--

CREATE TABLE `game` (
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:uuid)',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `developer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `global_rating` double DEFAULT NULL,
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `synopsis` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `game`
--

INSERT INTO `game` (`uuid`, `name`, `developer`, `global_rating`, `cover`, `synopsis`) VALUES
('015ee8ef-521f-44cd-b9ad-b1f17f3509a8', 'Assassin\'s Creed Mirage', 'Ubisoft Bordeaux', NULL, 'https://howlongtobeat.com/games/112983_Assassins_Creed_Mirage.jpg?width=250', 'Experimenta la historia de Basim, un ingenioso ladrón callejero en busca de respuestas y justicia, mientras se abre camino por las concurridas calles de Bagdad del siglo IX.'),
('01b4a51f-188b-4ad4-ab2a-856a9b8267c4', 'Mirror\'s Edge', 'EA Digital Illusions CE', NULL, 'https://howlongtobeat.com/games/6085_Mirrors_Edge.jpg?width=250', 'En una ciudad donde la información está controlada estrictamente, ágiles mensajeros llamados Runners transportan datos confidenciales lejos de ojos indiscretos. En este lugar que, a primera vista, parece un paraíso utópico, se ha cometido un delito. Tu hermana ha sido falsamente incriminada y a ti te están dando la caza. Eres un Runner llamado Faith y tu historia será esta innovadora aventura en primera persona.'),
('077d2f82-3ee3-4db3-b6e2-c1de4cc3a89c', 'Star Wars Jedi: Fallen Order', 'Respawn Entertainment', 6.21, 'https://howlongtobeat.com/games/60145_Star_Wars_Jedi_Fallen_Order.jpg?width=250', 'Ambientada poco después de La Venganza de los Sith, sigue a Cal Kestis, un Jedi padawan que está siendo perseguido por la Orden 66 del Imperio.'),
('0d7af4d5-1a57-41f4-ace1-e7055c5c5591', 'Yakuza 0', 'Ryu Ga Gotoku Studio', NULL, 'https://howlongtobeat.com/games/43056_Yakuza_0.jpg?width=250', 'Diciembre de 1988. Kazuma Kiryu es involucrado en un asesinato ocurrido en una parcela vacía de Kamurochō, la última que necesita el clan Tojo para reconstruir el área, y cuyo cometido en obtenerlo era el jefe de Kiryu, Sohei Dojima. Para protejer a su mentor Kazama de Dojima, Kiryu abandona la familia Dojima, a su vez que su amigo Nishiki rompe relaciones con él para protegerlo. Mientras, en Sotenbori, Osaka, el ex-yakuza Goro Majima es obligado a trabajar en un club de cabaret por Tsukasa Sagawa, un miembro de la Alianza Omi, rival del Clan Tojo. Además de éso, y por la mediación de un traidor del clan Tojo, Sagawa ofrece a Majima la posibilidad de retornar a la familia Shimano bajo la condición de que acabe con la vida de una masajista ciega. Precuela de la saga \"Yakuza\".'),
('13941bc3-d457-4d45-b9b1-4558918ec99a', 'BioShock', 'Irrational Games', NULL, 'https://howlongtobeat.com/games/Bioshockcoverfinalcropped.jpg?width=250', 'En 1960, un superviviente de un accidente de avión llamado Jack descubre una utopía submarina abandonada, solo para descubrir que el misterio detrás de su creación es mucho más siniestro de lo que creía.'),
('1620c0b8-5e18-4d4d-8b06-7b0ff3874426', 'Assassin\'s Creed', 'Ubisoft Montreal', NULL, 'https://howlongtobeat.com/games/Assassins_Creed.jpg?width=250', 'Gracias a una revolucionaria tecnología que desbloquea los recuerdos genéticos, Callum descubre que es el descendiente de los Assassins y que posee increíbles habilidades que le permitirán enfrentarse a la poderosa organización de los Templarios.'),
('16adcbe1-13fd-43a8-9c54-1aade3354adf', 'Rocket League', 'Psyonix', NULL, 'https://howlongtobeat.com/games/Rocket_League_header.jpg?width=250', 'Rocket League está basado en el ancestral deporte, pero los equipos están conformados por autos que deben maniobrar y golpear un balón a fin de que ingrese en el arco del oponente. El concepto es sumamente sencillo y cualquier jugador instintivamente sabe qué debe hacer. Los autos cuentan con movimientos básicos, como acelerar y saltar; los enfrentamientos duran 5 minutos y ocurren en arenas selladas, por lo que no es posible golpear el balón fuera del área. Los bordes de la cancha continúan de manera vertical y es posible escalar las paredes para patear un balón que llegue muy alto.'),
('1bd59b93-15b3-4a85-ae71-1173b3982abb', 'Borderlands 2', 'Gearbox Software', 5.42, 'https://howlongtobeat.com/games/Borderlands2boxart3.jpg?width=250', 'Un nuevo grupo de aventureros llega al planeta fronterizo Pandora. Son asesinados por Jack el Guapo, el mercenario más poderoso del planeta. Uno de ellos sobrevive y, con la ayuda de un robot parlante trastornado, busca botín y venganza.'),
('1c82f6bb-8a95-4f36-a9af-4490fe82767e', 'Dark Souls III', 'Developer: From Software', NULL, 'https://howlongtobeat.com/games/Dark_souls_3_cover_art.jpg?width=250', 'Dark Souls 3 es el final de la saga y presenta un mundo, el Reino de Lothric, al borde del Apocalipsis por culpa de \"la maldición de los no muertos\", y la razón por la que el mundo aún no se ha sumido en la oscuridad totalmente es el sacrificio que muchos héroes e incluso dioses hicieron al reavivar la llama original, la cual se encarga de mantener la \"Era del fuego\", dejando que esta consumiera sus respectivas almas y cuerpos.'),
('20aa7a1e-ad62-4d98-bf98-94177290b996', 'Spyro Reignited Trilogy', 'Toys for BobPublisher', NULL, 'https://howlongtobeat.com/games/55358_Spyro_Reignited_Trilogy.jpg?width=250', '¡El maestro de los asados está de vuelta! Las mismas llamas y la misma actitud abrasadora, pero mejorado y en alta definición. Spyro viene a toda mecha como nunca antes en la colección Spyro™ Reignited Trilogy. Reaviva la llama con los tres juegos originales: Spyro™ the Dragon, Spyro™ 2 Ripto\'s Rage! y Spyro™ Year of the Dragon. Explora los amplios reinos, vuelve a encontrarte con sus arrolladores personajes y revive la aventura con todo el esplendor de una remasterización. Porque, cuando hay un reino que necesita ayuda, solo hay un dragón al que se puede recurrir.'),
('20eb21de-ee88-4e0b-a026-3c01e941e445', 'Tunic', 'Andrew Shouldice', NULL, 'https://howlongtobeat.com/games/52546_Tunic.jpg?width=250', 'Explora una tierra plagada de leyendas olvidadas, poderes ancestrales y feroces monstruos en TUNIC, un juego de acción isométrico sobre un pequeño zorro que emprende una gran aventura.'),
('2178130f-38a9-4698-bcd5-c622f51b834c', 'Assassin\'s Creed: Rogue', 'Ubisoft Sofia', NULL, 'https://howlongtobeat.com/games/Assassins_Creed_Rogue.jpg?width=250', 'Tendiendo un puente entre Assassin\'s Creed IV y III, la tragedia y el fracaso obligan a Shay Cormac a cuestionar su propio Credo. El Asesino se convierte en Templario y se embarca en una búsqueda de venganza y revelación personal, durante la Guerra de los Siete Años.'),
('26e60926-b527-4abb-9689-da622d10d781', 'Assassin\'s Creed: Syndicate', 'Ubisoft Quebec', NULL, 'https://howlongtobeat.com/games/AassCreedSyndicate.jpg?width=250', 'La trama principal transcurre con el usuario anónimo que ya conocimos en Assassin’s Creed Unity que ahora se ha convertido en un Asesino iniciado, es contactado por Bishop y esta vez le encarga la tarea de revivir los recuerdos de los Asesinos Gemelos Jacob y Evie Frye para encontrar un fragmento del Edén escondido en Londres.'),
('279c8894-0a83-4492-9c72-f3b8a17a4162', 'Assassin\'s Creed Valhalla', 'Ubisoft Montreal', NULL, 'https://howlongtobeat.com/games/77729_Assassins_Creed_Valhalla.jpg?width=250', 'Inglaterra en la época de los vikingos es una nación fracturada de pequeños señores y reinos en guerra. Bajo el caos yace una tierra rica e indómita a la espera de un nuevo conquistador. ¿Serás tú?'),
('29ed79c8-f677-47a7-a8a9-1566ecea58e9', 'Super Mario 3D World + Bowser\'s Fury', 'Nintendo', 7.14, 'https://howlongtobeat.com/games/82771_Super_Mario_3D_World__Bowsers_Fury.jpg?width=250', 'Los jugadores controlan Mario y sus amigos que intentan rescatar criaturas parecidas a hadas llamadas Sprixies de Bowser, que invade el reino conocido como el Reino de Sprixie. El juego es similar a los juegos anteriores de Mario, con jugadores progresando a través de niveles para llegar a Bowser. Cuenta con un selector de personajes, así como la introducción de un power-up llamado Super Bell, que convierte al jugador en un gato, lo que le permite escalar paredes y usar un ataque de arañazos.'),
('2c1052c2-1c2e-4edd-87be-b82f64558fca', 'Grand Theft Auto V', 'Rockstar North', NULL, 'https://howlongtobeat.com/games/4064_Grand_Theft_Auto_V.jpg?width=250', 'Cuando un joven estafador callejero, un ladrón de bancos retirado y un psicópata aterrador se ven involucrados con lo peor y más desquiciado del mundo criminal, del gobierno de los EE. UU. y de la industria del espectáculo, tendrán que llevar a cabo una serie de peligrosos golpes para sobrevivir en una ciudad implacable en la que no pueden confiar en nadie. Y mucho menos los unos en los otros.'),
('2c792aa8-e024-43d3-8ebd-c253924bfc11', 'Ghost of Tsushima', 'Sucker Punch Productions', 7.21, 'https://howlongtobeat.com/games/51225_Ghost_of_Tsushima.jpg?width=250', 'Ambientada en 1274 en la isla epónima de Tsushima, el juego gira en torno al samurái Jin Sakai, uno de los pocos supervivientes de la primera invasión mongola a Japón. Jin tendrá que dominar un nuevo estilo de lucha, el camino del Fantasma, para derrotar a las fuerzas mongolas y luchar por la libertad de su pueblo y de la isla.'),
('2dcfb7fd-6198-4ec5-b436-ca11473c0cd4', 'Planet Coaster', 'Frontier Developments', NULL, 'https://howlongtobeat.com/games/40413_Planet_Coaster.jpg?width=250', 'Planet Coaster une a los fanáticos de las montañas rusas y a los creadores de todo el mundo gracias al centro de la comunidad en Steam Workshop. Intercambia paisajes, montañas rusas y hasta parques completos con otros jugadores, y añade las creaciones más disparatadas del mundo a tu parque.'),
('33581c0d-0806-4991-a657-1441c336f39e', 'Doom Eternal', 'id Software', NULL, 'https://howlongtobeat.com/games/57506_Doom_Eternal.jpg?width=250', 'Ambientada algún tiempo después de los eventos del juego de 2016, la historia sigue al Doom Slayer una vez más, en una misión para poner fin al consumo de la Tierra, por parte del infierno y frustrar los planes alienígenas de Maykrs para exterminar a la humanidad.'),
('3ce8a1b8-4395-4d24-979d-c59343729403', 'It Takes Two', 'Hazelight', NULL, 'https://howlongtobeat.com/games/80199_It_Takes_Two.jpg?width=250', 'Sigue a Cody y May, una conflictiva pareja de humanos convertidos en muñecos por un hechizo. Juntos, atrapados en un mundo fantástico donde lo impredecible aguarda a cada paso, deberán intentar a regañadientes salvar su relación rota.'),
('47e65877-36fa-4aad-95ec-d4ee1921d64a', 'Half-Life 2', 'Valve Corporation', NULL, 'https://howlongtobeat.com/games/256px-421px-HL2box.jpg?width=250', 'Sigue al científico Gordon Freeman, quien se encuentra en una Tierra infestada por alienígenas, desposeída de todos sus recursos y en la que cada vez queda menos población. Freeman se ve envuelto en el papel nada envidiable de rescatar el mundo del mal que desencadenó en Black Mesa. Y mucha gente a la que aprecia cuenta con él.'),
('5273605e-d3bb-4e9f-8fa0-4e665eb89344', 'Baldur\'s Gate 3', 'Larian Studios', NULL, 'https://howlongtobeat.com/games/68033_Baldurs_Gate_3.jpg?width=250', 'Reúne a tu grupo y regresa a los Reinos Olvidados en una historia de compañerismo, traición, sacrificio, supervivencia y la atracción de un poder absoluto. Unas misteriosas aptitudes empiezan a surgir en tu interior por obra de un parásito de los azotamentes que te han implantado en el cerebro.'),
('55a377ea-0f31-4390-a1e7-39066e69516b', 'Assassin\'s Creed III', 'Ubisoft', 8.17, 'https://howlongtobeat.com/games/Assassins_Creed_III_Game_Cover.jpg?width=250', 'Las colonias americanas, 1775. Es una época de disturbios civiles y agitación política en América. Mientras un nativo americano lucha por proteger su tierra y a su pueblo, encenderá las llamas de la revolución de una joven nación.'),
('585c8160-3c44-4b9f-b980-b09118989d72', 'Hades', 'Supergiant Games', NULL, 'https://howlongtobeat.com/games/62941_Hades.jpg?width=250', 'Zagreo, príncipe del Inframundo, desea huir de su hogar y ver qué hay en el exterior. Su padre, el dios regente del reino de los muertos, se opone a este propósito, y hará que la escalada de su hijo hacia el exterior sea, literalmente, un infierno.'),
('5b68df3d-5aab-4b2b-8033-6d7739c0827a', 'Counter-Strike 2', 'Valve Corporation', 6.25, 'https://howlongtobeat.com/games/1957_Counter-Strike_2.jpg?width=250', 'El juego enfrenta a dos equipos, los antiterroristas y los terroristas, en varios modos de juego basados en objetivos.'),
('5c674ba5-f17b-4bd8-a2c1-43f7a1b2f677', 'Marvel\'s Midnight Suns', 'FiraxisPublisher', NULL, 'https://howlongtobeat.com/games/97298_Marvels_Midnight_Suns.jpg?width=250', 'Los Midnight Suns son un inesperado equipo formado por Superhéroes experimentados y peligrosos guerreros supernaturales del Universo Marvel, obligados a entenderse para enfrentarse a Lilith, Madre de los Demonios.'),
('5fd75094-be53-46bc-aa26-d3f47505dc60', 'Horizon Forbidden West', 'Guerrilla', NULL, 'https://howlongtobeat.com/games/79775_Horizon_Forbidden_West.jpg?width=250', 'El videojuego se desarrolla seis meses después de Zero Dawn y continua la historia de Aloy, una joven cazadora y guerrera de la tribu Nora que viaja al Oeste Prohibido para investigar una misteriosa y mortífera plaga que amenaza la vida en la Tierra. En su viaje a través de estas tierras desconocidas, Aloy se encuentra con nuevas regiones devastadas por tormentas masivas, enfrentándose a máquinas más letales y entrando en conflicto con Regalla y sus rebeldes'),
('68c72f02-48da-4e87-809d-a2cd58d2c14b', 'Celeste', 'Extremely OK Games', NULL, 'https://howlongtobeat.com/games/42818_Celeste.jpg?width=250', 'Celeste sigue a una joven llamada Madeline mientras intenta escalar la Montaña Celeste, una montaña ficticia en el oeste de Canadá que aparentemente posee el poder de manifestar la confusión interna y el verdadero yo en la realidad.'),
('6a8315fb-d0ae-4668-a62d-ac3d61953867', 'Ori and the Blind Forest: Definitive Edition', 'Moon Studios', NULL, 'https://howlongtobeat.com/games/36755_Ori_and_the_Blind_Forest_Definitive_Edition.jpg?width=250', 'La voz del Árbol del Espíritu comienza la historia narrando desde el momento en el que Ori cae del árbol al bosque de Nibel durante una tormenta. Ori es encontrado y adoptado por una criatura llamada Naru, quien cría a Ori como su propio hijo. Tiempo después, un cataclismo cae sobre el bosque y los suministros de alimentos se secaron. Naru muere. Debilitado por el cataclismo y huérfano, Ori sale a explorar el bosque solo.​ Después de derrumbarse cerca del Árbol del Espíritu, Ori recobró el ánimo y se unió a Sein, que es la luz y los ojos de Árbol de Espíritu. Sein guio a Ori en su aventura para restaurar el bosque de Nibel. Para hacerlo, Ellos tendrían que recuperar los Elementos de Luz que hubieron sostenido el Árbol de Espíritu: Elemento de agua, Elemento de viento, y Elemento de calor.'),
('6ab5b979-03aa-47df-941c-a192533bcf89', 'The Elder Scrolls V: Skyrim - Special Edition', 'Bethesda Game Studios', NULL, 'https://howlongtobeat.com/games/TheElderScrollsVSkyrimLegendaryEdition.jpg?width=250', 'La historia se centra en los esfuerzos del personaje, Dovahkiin (Sangre de dragón), para derrotar a Alduin, un dragón o «dovah» que, según la profecía, destruirá el mundo. La trama está fechada doscientos años después de los sucesos de Oblivion y tiene lugar en la provincia ficticia de Skyrim. En el transcurso de la partida, el jugador completa misiones y hace evolucionar a su personaje gracias a la mejora de sus habilidades'),
('6cb1b70f-3bc8-4b20-9f50-a1620f0f6aee', 'Fallout 4', 'Bethesda Game Studios', 8.58, 'https://howlongtobeat.com/games/Fallout_4.jpg?width=250', 'Eres el único superviviente del Refugio 111 en un mundo destruido por la guerra nuclear. Cada segundo es una lucha por la supervivencia, y en tus manos estarán todas las decisiones. Solo tú puedes reconstruir el yermo y decidir su futuro.'),
('771baa47-52d9-478e-930e-d68ee5357971', 'Metro: Last Light Redux', '4A Games', NULL, 'https://howlongtobeat.com/games/MetroLastLightRedux_292x136.jpg?width=250', 'Ha pasado un año después de que Artyom enviara varios misiles a destruir la colmena de la raza conocida como «Los Oscuros», acabando así con la raza más misteriosa del post apocalíptico entorno en que ha quedado convertida la antigua Moscú. Parecía que la historia terminó ahí, hasta que una noticia cambia la situación.'),
('77c802f5-19ca-4bb9-a577-ae19d850a878', 'Stellar Blade', 'ShiftUp', NULL, 'https://howlongtobeat.com/games/Stellar_Blade_box.png?width=250', 'Stellar Blade nos lleva hasta un futuro en el que la humanidad ha estado a punto de extinguirse, ya que unas extrañas criaturas han invadido y arrasado la Tierra, obligando a los pocos supervivientes a huir al espacio, alojándose en una colonia.'),
('77ff632e-4205-405b-812e-605f5aa74e4c', 'Left 4 Dead 2', 'Valve Corporation', NULL, 'https://howlongtobeat.com/games/250px-Left4Dead2.jpg?width=250', 'Ambientado durante los inicios de un brote de zombis en la Costa Este de los Estados Unidos, el juego enfrenta a sus cuatro protagonistas — conocidos como los \"sobrevivientes\" — contra las hordas de infectados, intentando encontrar una manera de escapar de esta pandemia apocalíptica.'),
('7acf4e12-47fc-4b52-8cc9-0d004423888c', 'Diablo IV', 'Blizzard Entertainment', NULL, 'https://howlongtobeat.com/games/71960_Diablo_IV.jpg?width=250', 'La lucha eterna entre los Altos Cielos y los Infiernos Abrasadores se desata mientras el caos amenaza con consumir Santuario. Con incesantes demonios a los que matar, ingentes facultades que dominar, mazmorras de pesadilla y un botín legendario, este extenso mundo abierto promete aventura y devastación.'),
('7f1f5054-edd8-4ffe-9f6f-fca1ce1e1bb6', 'Assassin\'s Creed II', 'Ubisoft Montreal', NULL, 'https://howlongtobeat.com/games/Assassins_Creed_2_Box_Art.JPG?width=250', 'El juego es una secuela directa de Assassin\'s Creed, que se enfoca en la historia de Desmond Miles después de escapar de los laboratorios de Abstergo con la ayuda de Lucy Stillman, Asesina infiltrada en Abstergo. Intentando destruir a Abstergo y a los Templarios actuales, Desmond es conectado a un Animus creado por los Asesinos de forma independiente a los de Abstergo, para así, revivir las memorias de otro de sus ancestros, Ezio Auditore da Firenze, que vivió en Italia durante el Renacimiento.'),
('85b4a028-4d39-4950-9f8f-2f0b0e399fa9', 'Sea of Stars', 'Sabotage Studio', NULL, 'https://howlongtobeat.com/games/76454_Sea_of_Stars.jpg?width=250', 'Cuenta la historia de dos Niños del solsticio que combinarán los poderes del sol y la luna para usar la Magia del eclipse, la única fuerza capaz de ayudarlos a defenderse de las monstruosas creaciones del malvado alquimista conocido como The Fleshmancer.'),
('88f72392-c52b-41ac-a6b6-11adee22ca04', 'Cities: Skylines', 'Colossal Order', 5.58, 'https://howlongtobeat.com/games/Cities_Skylines_cover_art.jpg?width=250', 'El juego es una simulación de construcción de ciudades abierta para un solo jugador. Los jugadores participan en la planificación urbana controlando la zonificación, la ubicación de las carreteras, los impuestos, los servicios públicos y el transporte público de un área.'),
('8b31211a-9282-462f-b9c6-253b54c090ef', 'Ghostwire: Tokyo', 'Tango Gameworks', 8.13, 'https://howlongtobeat.com/games/68156_Ghostwire_Tokyo.jpg?width=250', 'Ghostwire: Tokyo, desarrollado por Tango Gameworks y editado por Bethesda para PC, PlayStation 5 y Xbox Series, es una aventura de acción y terror en la que las fuerzas sobrenaturales mortales, provocadas por un peligroso ocultista, invaden Tokio y hacen que su población desaparezca en un instante.'),
('9225ec46-28d5-11ef-9ef3-0242ac130002', 'Los sims 4', 'EA Maxis', 6.3, 'https://howlongtobeat.com/games/The_Sims_4_Box_Art.jpg?width=250', 'Videojuego de simulación social y de vida, el cuarto de la serie de juegos de Los Sims, desarrollado por Maxis y publicado por Electronic Arts'),
('934c8da5-2dc7-4ee2-b807-63795a9846ec', 'Batman: Arkham Knight', 'Rocksteady Studios', NULL, 'https://howlongtobeat.com/games/Batman_Arkham_Knight_Cover_Art.jpg?width=250', 'La trama principal del juego se desarrolla un año después de la de Batman: Arkham City y sigue a Batman, en la cumbre de su habilidad, ya que se enfrenta al supervillano El Espantapájaros, que ha vuelto a Gotham City para unirse a los enemigos de Batman en un plan para matar por fin al Caballero Oscuro.'),
('959336e6-96eb-4cc8-b8ba-ab6bd269ba13', 'Hellblade: Senua\'s Sacrifice', 'Ninja Theory', NULL, 'https://howlongtobeat.com/games/41638_Hellblade_Senuas_Sacrifice.jpg?width=250', 'Senua, una guerrera picta que debe llegar a Helheim derrotando a entidades de otro mundo y enfrentando sus desafíos, para rescatar el alma de su amante muerto de la diosa Hela. Paralelamente, el juego actúa como una metáfora de la lucha del personaje con la psicosis, ya que Senua, quien padece la afección pero cree que es una maldición, es perseguida por una entidad conocida como \"La Oscuridad\", voces en su cabeza conocidas como \"Furias\" y recuerdos de su pasado.'),
('98641e7d-e085-496c-ada4-bac7943a6e60', 'Assassin\'s Creed Odyssey', 'Ubisoft Quebec', NULL, 'https://howlongtobeat.com/games/57503_Assassins_Creed_Odyssey.jpg?width=250', 'Ambientado en el año 431 a.C. durante la Guerra del Pelopeneso, sigue a un mercenario mientras te embarcas en tu propia odisea épica para convertirte en un legendario héroe espartano en un mundo en el que cada elección importa.'),
('9aba3556-0af7-48fc-9ed7-8d2738b22fe2', 'Persona 5 Royal', 'P-Studio', 7.65, 'https://howlongtobeat.com/games/66630_Persona_5_Royal.jpg?width=250', 'Prepárate para una nueva experiencia JRPG con Persona 5 Royal, basada en la premiada saga Persona. Ponte la máscara de Joker y únete a los Phantom Thieves of Hearts. Rompe las cadenas de la sociedad moderna e infíltrate en las mentes de los corruptos para hacerles cambiar de vida. Persona 5 Royal viene con nuevos personajes, confidentes, historia nueva, lugares nuevos que explorar. Con un nuevo semestre en la academia Shujin prepárate para fortalecer tus habilidades en el metaverso y en tu día adía. Explora Tokio, desbloquea nuevos Persona, descubre un nuevo arco de la historia nunca visto, escenas, finales alternativos y mucho más. Porta la máscara. Revela tu verdad.'),
('9c0d417b-8f50-4a87-a4f8-25c48d374512', 'Assassin\'s Creed: Brotherhood', 'Ubisoft Annecy', NULL, 'https://howlongtobeat.com/games/Assassins_Creed_brotherhood_cover.jpg?width=250', 'Cuenta nuevamente con Ezio Auditore da Firenze como protagonista, quien ahora es un legendario Maestro Asesino, que lidera a su recién fundada hermandad en la cacería de los Templarios en Roma. La historia de Assassin\'s Creed: Brotherhood tiene lugar inmediatamente después de la trama de Assassin\'s Creed II, con el asesino del siglo xvi en Italia, Ezio Auditore y su búsqueda para restaurar la orden de los asesinos y destruir a sus enemigos: la familia Borgia. Cruzándose con estos hechos históricos, suceden las actividades de hoy en día del protagonista de la serie Desmond Miles, que revive los recuerdos de su antepasado Ezio para encontrar una manera de luchar contra los enemigos de los Asesinos, los templarios, y para evitar el apocalipsis de 2012.'),
('9eea4cbf-44bc-47b7-9486-b8d789d3fe01', 'Don\'t Starve Together', 'Klei Entertainment', NULL, 'https://howlongtobeat.com/games/23828_Dont_Starve_Together.jpg?width=250', 'Don\'t Starve Together es la expansión independiente para jugadores múltiples del juego intransigente de supervivencia en la jungla: Don\'t Starve. Ingresa a un mundo extraño jamás explorado, lleno de criaturas extrañas, peligros y sorpresas.'),
('9f7e697a-8c38-4029-876a-902675072c63', 'Hollow Knight', 'Team Cherry', NULL, 'https://howlongtobeat.com/games/Hollow_Knight_collection_branding.jpg?width=250', 'Cuenta la historia del Caballero, en su búsqueda para descubrir los secretos del largamente abandonado reino de Hallownest, cuyas profundidades atraen a los aventureros y valientes con la promesa de tesoros o la respuesta a misterios antiguos.'),
('a25f8b99-f4a6-4054-96e7-f8b6ce8ae8cb', 'Burnout Paradise Remastered', 'Criterion Games', NULL, 'https://howlongtobeat.com/games/BurnoutParadiseTheUltimateBox.jpg?width=250', 'Siembra el caos en el mundo de conducción definitivo, desde las avenidas del centro de la ciudad hasta las carreteras más peligrosas de las montañas. Haz acrobacias de infarto y arrasa con todo en un mejor juego de conducción árcade de los tiempos.'),
('a2bfa927-9648-4ad8-bfa8-45e8220ae1dc', 'Fallout: New Vegas', 'Obsidian Entertainment', NULL, 'https://howlongtobeat.com/games/3351_Fallout_New_Vegas.jpg?width=250', 'El juego mete al jugador en la piel de un mensajero,9​ perteneciente a la empresa Mojave Express. Su misión: transportar un paquete al enigmático Sr. House, líder de New Vegas. Durante su viaje, es asaltado por un grupo de mercenarios liderados por un misterioso personaje, el cual, le roba el contenido del paquete: un chip de platino con forma de ficha de póker. Tiroteado mortalmente y enterrado el mensajero es rescatado milagrosamente por un robot llamado Víctor, que lo traslada hasta la casa del Dr. Mitchell, en Goodsprings, donde este logra curarle sus graves heridas. Una vez recuperado, el mismo doctor le entrega su viejo Pip-Boy 3000 y un antiguo mono de trabajo del refugio 21 para que pueda iniciar la persecución de los que casi acabaron con su vida.'),
('a35afd29-932e-469d-931d-d88cf9f39e46', 'Bayonetta', 'PlatinumGames', NULL, 'https://howlongtobeat.com/games/Bayonetta_Box_Art.jpg?width=250', 'Bayonetta tiene lugar en Vigrid, una ciudad ficticia en Europa. El personaje principal es una bruja que cambia de forma y usa varias armas de fuego, junto con ataques mágicos que realiza con su propio cabello al convocar demonios para despachar a sus enemigos.'),
('a5d74ad3-e5b7-4b82-989f-e094f75589f1', 'Senua\'s Saga: Hellblade II', 'Ninja Theory', NULL, 'https://howlongtobeat.com/games/72854_Senuas_Saga_Hellblade_II.jpg?width=250', 'Senua regresa en este viaje de supervivencia por el mito y el tormento de la Islandia vikinga en la secuela del galardonado Hellblade: Senua\'s Sacrifice. Senua se enfrentará a una lucha para vencer a la oscuridad dentro y fuera de ella y está decidida a salvar a las víctimas de los horrores de la tiranía.'),
('a79712d8-f2a9-408a-9678-c8bf2763327c', 'EA Sports FC 2024', 'Electronic Arts', 7.63, 'https://howlongtobeat.com/games/131658_EA_Sports_FC_24.jpg?width=250', 'EA SPORTS FC 24 es un videojuego de deportes y fútbol a cargo de EA Canada, EA Romania y Electronic Arts con más de 19.000 futbolistas con licencia, 700 equipos y 30 ligas en la experiencia futbolística más auténtica hasta la fecha.'),
('a7d9978a-ac54-4d78-a5db-d50de4ae7412', 'Rise of the Tomb Raider', 'Crystal Dynamics', 6, 'https://howlongtobeat.com/games/250px-Rise_of_the_Tomb_Raider.jpg?width=250', 'Lara Croft busca la Fuente Divina, un antiguo artefacto que otorga el don de la vida eterna. Su búsqueda obsesionó a su padre hasta tal punto que acabó con su reputación... y con su vida.'),
('ad72c840-c6a2-439f-91fa-364deb81b55c', 'Final Fantasy VII Rebirth', 'Square Enix', NULL, 'https://howlongtobeat.com/games/109434_Final_Fantasy_VII_Rebirth.jpg?width=250', 'Tras escapar de la distópica ciudad de Midgar, Cloud y sus amigos emprenden un viaje a través del planeta. En este mundo vasto y vibrante los esperan nuevas aventuras: corre por las llanuras verdes a lomos de un chocobo y explora entornos de gran tamaño.'),
('ae7f738d-0995-4212-8c2e-f8d41fec84b8', 'Outlast', 'Red Barrels', NULL, 'https://howlongtobeat.com/games/Outlast_cover.jpg?width=250', 'El juego gira en torno a un periodista de investigación independiente, Miles Upshur, que decide investigar un remoto hospital psiquiátrico llamado Mount Massive Asylum, ubicado en lo profundo de las montañas del condado de Lake, Colorado.'),
('b39f56f7-faef-434c-84e4-17c55cd3d314', 'Brothers: A Tale of Two Sons', 'Starbreeze Studios', NULL, 'https://howlongtobeat.com/games/Brothers_A_Tale_of_Two_Sons_cover_art.jpg?width=250', 'Un hombre se aferra a la vida. A sus hijos, desesperados por curar a su padre enfermo, solo les queda una opción: deberán ponerse en camino para encontrar \"\"El agua de la vida” y llevársela a su padre en un viaje en el que tendrán que unir fuerzas para poder sobrevivir. Uno será fuerte; el otro, débil.'),
('b469970f-4fe7-4540-80d0-a20fa3493c8b', 'Disco Elysium', 'ZA/UM', NULL, 'https://howlongtobeat.com/games/57335_Disco_Elysium.jpg?width=250', 'Disco Elysium es un videojuego de rol de mundo abierto y con una mecánica de juego centrada en los diálogos.​ El juego se presenta en una perspectiva isométrica en la que se controla el personaje del jugador. El jugador toma el papel de un detective en un caso de asesinato que sufre de amnesia inducida por el alcohol y las drogas.2'),
('b64d8ea1-bc1e-407e-90a7-0c0918471ddc', 'Assassin\'s Creed: Unity', 'Ubisoft Montreal', NULL, 'https://howlongtobeat.com/games/Assassinscreedunity.jpg?width=250', 'París, 1789. Juegas como Arno Victor-Dorian, un asesino durante la Revolución Francesa. Mientras la nación se desgarra, Arno desenmascarará a los verdaderos poderes de la Revolución.'),
('b8a0aad2-a59b-453b-9e43-6605363ae347', 'Fire Emblem: Three Houses', 'Intelligent Systems', NULL, 'https://howlongtobeat.com/games/46453_Fire_Emblem_Three_Houses.jpg?width=250', 'El continente de Fódlan está dividido en tres naciones soberanas, y en su centro se halla el Monasterio de Garreg Mach, que alberga la Academia de Oficiales; es allí donde se entrenan los futuros líderes de Fódlan. Tu personaje es un mercenario convertido en profesor que deberá elegir una de las tres casas de la Academia y guiar a sus pupilos tanto en el ámbito académico como en el campo de batalla.\nEl futuro de Fódlan dependerá de tu elección...'),
('b9fb924e-c72c-48ae-b43a-cbe01eb4dd7a', 'Star Wars Jedi: Survivor', 'Respawn Entertainment', NULL, 'https://howlongtobeat.com/games/108358_Star_Wars_Jedi_Survivor.jpg?width=250', 'Sigue la lucha cada vez más desesperada de Cal mientras la galaxia se hunde en la oscuridad. Empujado al exilio por culpa del Imperio, deberá guardarse de nuevas y viejas amenazas. Como uno de los últimos Caballeros Jedi, debe hacer frente a los tiempos más oscuros de la galaxia, pero ¿hasta dónde está dispuesto a llegar para protegerse a sí mismo, a su tripulación y al legado de la Orden Jedi?'),
('b9fdcf84-0ef9-4455-ad9b-81658eebef16', 'Fire Emblem Engage', 'Intelligent Systems', 8, 'https://howlongtobeat.com/games/113547_fire_emblem_engage.jpg?width=250', 'En una guerra en contra del Dragón Caído, cuatro reinos trabajaron junto a héroes de otros mundos para atrapar a esta malvada amenaza.'),
('bbde166f-951c-4d53-be0d-87a9b27ed9fd', 'Sid Meier\'s Civilization VII', 'Firaxis Games', NULL, 'https://howlongtobeat.com/games/151866_Sid_Meiers_Civilization_VII.jpg?width=250', 'Civilization VII es un juego de estrategia 4X desarrollado por el legendario equipo de Firaxis Games, creadores de las franquicias Civilization y XCOM, donde, como es habitual, se desafía a los jugadores a construir el mayor imperio que el mundo haya conocido jamás.'),
('c40a3094-1157-42a3-8bbf-7ad94d080e9e', 'Hogwarts Legacy', 'Avalanche Software', NULL, 'https://howlongtobeat.com/games/83145_Hogwarts_Legacy.jpg?width=250', 'Finales del siglo XIX, un nuevo estudiante en Hogwarts descubre que posee la capacidad inusual para percibir y dominar la magia antigua, convirtiéndose en la clave para un viejo secreto que amenaza con desgarrar el mundo mágico.'),
('c50d8788-0873-4594-9996-d44e052965ed', 'Fate/Extella Link', 'Marvelous Inc', 1, 'https://howlongtobeat.com/games/65589_FateExtella_Link.jpg?width=250', 'Amenazada por un nuevo enemigo, Nerón Claudio y su Maestro, además de este nuevo y apuesto aliado, tendrán que trabajar juntos para proteger todo lo que han construido. ¡Los próximos siete días cambiarán el destino de todos los que habitan en este mundo virtual! ¡Enlaza con el mundo de Fate como nunca antes!'),
('c9b512be-9751-4655-9135-5f6748663c2a', 'Animal Well', 'Shared Memory', NULL, 'https://howlongtobeat.com/games/109108_Animal_Well.jpg?width=250', 'Explora un laberinto complejo e interconectado y descubre todos sus secretos. Durante tu aventura, encontrarás objetos con los que manipular el entorno de maneras significativas y sorprendentes, y también conocerás criaturas hermosas pero perturbadoras. Sobrevive a lo que acecha en la oscuridad.'),
('ca1dcc33-757e-4be8-89be-c1d26026e473', 'Dishonored', 'Arkane Studios', NULL, 'https://howlongtobeat.com/games/220px-Dishonored_box_art_Bethesda.jpg?width=250', 'Ambientado en la ciudad industrial de Dunwall, Dishonored cuenta la historia de Corvo Attano, guardaespaldas de la Emperatriz de las Islas. Acusado injustamente de su asesinato, Corvo se verá obligado a convertirse en un asesino para vengarse de aquellos que conspiraron contra él.'),
('cd4bfb6d-ccfb-4bf2-8ac5-11343f1ab2aa', 'Final Fantasy VII Remake', 'Square Enix', 7.92, 'https://howlongtobeat.com/games/57686_Final_Fantasy_VII_Remake.jpg?width=250', 'El argumento de Final Fantasy VII se centra en el protagonista Cloud Strife, un mercenario que inicialmente se une al grupo ecoterrorista AVALANCHA para detener el control mundial de la corporación Shinra que está drenando la vida del planeta para usarla como fuente de energía.'),
('d13cf381-4294-4bbe-85a5-ed289adeda38', 'Resident Evil 2 (2019)', 'Developer: Capcom R&D Division 1', NULL, 'https://howlongtobeat.com/games/57479_Resident_Evil_2.jpg?width=250', 'Sigue al policía novato Leon S. Kennedy y a la estudiante universitaria Claire Redfield, que se ven atrapados en una apocalíptica epidemia en Racoon City que ha transformado a su población en zombis mortíferos. Remake del clásico \"Resident Evil 2\" de 1998.'),
('d2ff6052-59ad-4ad5-953b-16e19f79544b', 'Prince of Persia: The Lost Crown', 'Ubisoft Montpellier', NULL, 'https://howlongtobeat.com/games/129785_Prince_of_Persia_The_Lost_Crown.jpg?width=250', 'Reboot de la franquicia Prince of Persia. \"The Lost Crown\" presenta a un nuevo héroe llamado Sargon, que debe viajar a la ciudad maldita del Monte Qaf para rescatar al príncipe Ghassan secuestrado.'),
('d9770785-77cb-41e2-b45a-4f24992d9eaf', 'Persona 3 Reload', 'P-Studio', NULL, 'https://howlongtobeat.com/games/129805_Persona_3_Reload.jpg?width=250', 'Ponte en la piel de un estudiante recién llegado que se ve arrojado a un destino inesperado cuando entra en la hora \"escondida\" entre un día y el siguiente. Despierta un poder increíble y persigue los misterios de la Hora Oscura, lucha por tu grupo de amigos y deja huella en su memoria para siempre.'),
('d98cf431-ff6f-4999-8489-8cacd7a2f1e1', 'Tales of Arise', 'Bandai Namco Studios', 8.14, 'https://howlongtobeat.com/games/68118_Tales_of_Arise.jpg?width=250', 'Vive la historia de dos pueblos enfrentados. Alphen y Shionne son los dos jóvenes que determinarán el destino de dos mundos muy distintos, Dahna y Rena. Junto a un excepcional plantel de personajes, harán frente a la adversidad en su lucha por la liberación.'),
('d9a52f1a-9aae-4e40-bbd1-a16491fe23ac', 'Phantom Line', 'Antistatic Studios', NULL, 'https://howlongtobeat.com/games/152068_Phantom_Line.jpg?width=250', 'Phantom Line es un shooter cooperativo (1-4) ambientado en un continente europeo postnuclear. La misión es buscar y contener anomalías, actividad paranormal oculta al ojo público, en un mapa mundial abierto lleno de eventos dinámicos.'),
('dccbe43c-356b-4139-b5b4-150ac340fccf', 'Assassin\'s Creed IV: Black Flag', 'Ubisoft Montreal', NULL, 'https://howlongtobeat.com/games/Assassins_Creed_IV_-_Black_Flag_cover.jpg?width=250', 'Es el año 1715. Los piratas controlan el Caribe y han establecido una República sin ley gobernada por la corrupción, la avaricia y la crueldad. Entre ellos convive un joven capitán llamado Edward Kenway. Su lucha por la gloria le ha hecho ganarse el respeto de leyendas como Barbanegra, pero también le ha arrastrado a la milenaria lucha entre Assassins y Templarios, una guerra que puede destruir todo lo que los piratas han construido. Bienvenidos a la Edad de Oro de los Piratas.'),
('dd6fb33b-9f0f-4530-a01a-cb300974f157', 'NieR: Automata', 'PlatinumGames', NULL, 'https://howlongtobeat.com/games/38029_Nier_Automata.jpg?width=250', 'La Tierra ha sido invadida de repente por seres de otro planeta y formas de vida mecánicas con poderes abrumadores fueron utilizadas como armas de guerra que obligaron a la humanidad a huir a la Luna.'),
('e083be4e-0c8a-44e5-83c6-e72492bcbe53', 'Dave the Diver', 'MINTROCKET', NULL, 'https://howlongtobeat.com/games/115577_Dave_the_Diver.jpg?width=250', 'DAVE THE DIVER es un juego casual de rol y aventuras para un solo jugador que incluye elementos de pesca y exploración del fondo marino durante el día y de gestión de un restaurante de sushi durante la noche. Ayuda a Dave y a sus extraños amigos a destapar los secretos de la misteriosa Fosa Azul.'),
('e1f7376c-22ea-42f2-accb-3655eae1725b', 'Stray', 'BlueTwelve Studio', NULL, 'https://howlongtobeat.com/games/79790_Stray_(2021).jpg?width=250', 'La historia se centra en un gato callejero que cae en una ciudad amurallada, poblada por robots, máquinas y organismos mutantes, y su viaje para volver a la superficie en compañía de un dron, B-12.'),
('e3d139a2-388c-4b95-a1ca-95f5206c6d51', 'Tomb Raider (2013)', 'Crystal Dynamics', NULL, 'https://howlongtobeat.com/games/256px-Tr2011cover.jpg?width=250', 'l juego transcurre en Yamatai, una isla del Triángulo del Dragón, en la costa de Japón. La isla y el reino que una vez existieron es un misterio, debido a las tormentas y corrientes marítimas que la rodean. Yamatai fue gobernada por la Reina del Sol, llamada Himiko, quien, acorde a la leyenda, tenía poderes místicos que la permitían controlar el tiempo atmosférico. Se sabe poco acerca de la historia de Yamatai desde que Himiko murió. Explorando la isla, el jugador descubre muchas otras culturas que llegaron a la isla, como comerciantes portugueses del siglo XVI, miembros del Cuerpo de Marines de los Estados Unidos y un proyecto militar de los japoneses durante la Segunda Guerra Mundial.'),
('e4f7958d-531d-4105-a0af-bce6ed8165af', 'Sekiro: Shadows Die Twice', 'FromSoftware', 6.43, 'https://howlongtobeat.com/games/57415_Sekiro_Shadows_Die_Twice.jpg?width=250', 'Sekiro: Shadows Die Twice está ambientado en un Japón del periodo Sengoku a finales del siglo XVI, un período de conflicto constante entre la vida y la muerte. Su protagonista es un shinobi que fue dado por muerto después de que su señor fuera secuestrado y su brazo cercenado por un líder samurái del Clan Ashina.'),
('e6461d6f-ffca-4639-bc6e-e1dc0a8edcb1', 'Batman: Arkham Asylum GOTY', 'Rocksteady Studios', NULL, 'https://howlongtobeat.com/games/Batman_Arkham_Asylum_GOTY.jpg?width=250', 'Batman lucha contra su archienemigo, el Joker, quien instiga un elaborado complot para tomar el control de Arkham Asylum, atrapar a Batman dentro con muchos de sus enemigos encarcelados y amenazar a Gotham City con bombas ocultas.'),
('e918f0c6-c482-4ad3-a6f6-e407db3c48f6', 'Control: Ultimate Edition', 'Remedy Entertainment', NULL, 'https://howlongtobeat.com/games/82054_Control_Ultimate_Edition.jpg?width=250', 'Jesse Faden, una mujer de pasado misterioso, es promovida como la nueva directora de la agencia luego de la muerte del antiguo director y de que la agencia fuera invadida por una amenaza de otro mundo llamada el Hiss. Su nueva posición trae consigo nuevas habilidades como la telepatía, que la ayudarán a defenderse contra el Hiss.​ Jesse se encuentra sola en el campo de batalla, pero recibe ayuda desde el exterior mediante otro personaje con el que se comunica'),
('eac5806a-da1c-41a2-a15c-e675623fec54', 'Paper Mario: The Thousand-Year Door', 'Intelligent Systems', NULL, 'https://howlongtobeat.com/games/6911_Paper_Mario_The_Thousand-Year_Door.png?width=250', '¡Los nefastos Mega X quieren el tesoro que se encuentra tras la Puerta Milenaria! Con un mapa de la princesa Peach y la ayuda de algunos habitantes, Mario iniciará una aventura a través de un colorido mundo de papel para encontrar el tesoro primero.'),
('ec1c2414-4f14-44f4-916d-cf2ad263d1bb', 'Red Dead Redemption II', 'Rockstar Studios', NULL, 'https://howlongtobeat.com/games/27100_Red_Dead_Redemption_2.jpg?width=250', 'Un robo se tuerce en el pueblo de Backwater, y Arthur Morgan y la banda de Van der Linde se ven forzados a escapar. Con los agentes federales y los mejores cazarrecompensas de la nación pisándoles los talones, la banda debe atracar, robar y luchar por todo el corazón escarpado de América para sobrevivir.'),
('ecf6af94-f1b4-4ba5-aa5c-ee903c55c2a6', 'The Witcher 3: Wild Hunt', 'CD Projekt RED', NULL, 'https://howlongtobeat.com/games/10270_The_Witcher_3_Wild_Hunt.jpg?width=250', 'Eres Geralt de Rivia, cazador de monstruos. En un continente devastado por la guerra e infestado de criaturas, tu misión es encontrar a Ciri, la niña de la profecía, un arma viviente que puede alterar el mundo tal y como lo conocemos.'),
('eeea77cc-2f49-4a1d-b847-686af6939702', 'Elden Ring', 'FromSoftware', 6.67, 'https://howlongtobeat.com/games/68151_Elden_Ring.jpg?width=250', 'Explora el mundo de las Tierras Intermedias. ELDEN RING ofrece vastos parajes de fantasía y sombrías e intricadas mazmorras que están conectadas de forma fluida y sin interrupciones. Recorre este impresionante mundo a pie o a caballo, en solitario u online con otros jugadores.'),
('ef34f744-b28a-45d6-bcfc-4e6bdbf3d7b5', 'Assassin\'s Creed Origins', 'Ubisoft Montreal', NULL, 'https://howlongtobeat.com/games/46402_Assassins_Creed_Origins.jpg?width=250', 'Precuela de la saga Assassin\'s Creed ambientada en el Egipto del 48 a.C., donde Bayek, un Medjay, inicia la fundación de la Hermandad de Asesinos.'),
('f0553348-0619-434d-b917-fc84bd4f123a', 'God of War: Ragnarök', 'SIE Santa Monica Studio', NULL, 'https://howlongtobeat.com/games/83146_God_of_War_Ragnark.jpg?width=250', 'God of War: Ragnarök gira en torno a la figura de Loki, un personaje que encarna el engaño y la mentira en la mitología nórdica, y que Santa Monica ha sabido maridar con los secretos que acompañan a una etapa como la adolescencia.'),
('f1691d7b-0a83-4930-b538-b98c7655c4fc', 'Hi-Fi Rush', 'Tango Gameworks', NULL, 'https://howlongtobeat.com/games/122891_Hi-Fi_Rush.jpg?width=250', 'Chai es un aspirante a estrella del rock cuyo corazón queda fusionado con un reproductor de música tras un experimento fallido. La siniestra empresa responsable lo califica de «anomalía» y tendrá que huir luchando en combates musicales a todo trapo.'),
('f1a42b16-1b23-43f0-984a-2b16b373bb67', 'Fate/Samurai Remnant', 'Koei Tecmo Games', NULL, 'https://howlongtobeat.com/games/120441_FateSamurai_Remnant.jpg?width=250', 'Vive la bulliciosa atmósfera de un Edo lleno de casas tradicionales, residencias de samurái y burdeles. Avanza en la historia del Waxing Moon Ritual, conoce a diversos personajes, explora los diferentes pueblos y emprende toda clase de misiones.'),
('f77921b4-9731-41c9-a8ec-addbbf90dced', 'Cyberpunk 2077', 'CD Projekt RED', 5.21, 'https://howlongtobeat.com/games/Cyberpunk-2077-2.jpg?width=250', 'La historia nos lleva a la vida de un chico que malvive en las calles de una ciudad futurista obsesionada con la tecnología y la modificación corporal. Con todo en su contra, logra sobrevivir convirtiéndose en un \'edgerunner\', un mercenario proscrito también conocido como \'cyberpunk\'.'),
('fb41536b-0fdd-4b83-9239-e075314d3a75', 'Little Nightmares', 'Tarsier Studios', NULL, 'https://howlongtobeat.com/games/39417_Little_Nightmares.jpg?width=250', 'Sumérgete en Little Nightmares, una oscura y extravagante historia que te enfrentará a los miedos de tu infancia mientras ayudas a Six a escapar de Las Fauces ¡un vasto y misterioso navío habitado por almas corruptas que ansían encontrar su próxima comida!');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `game_genre`
--

CREATE TABLE `game_genre` (
  `game_uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:uuid)',
  `genre_uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:uuid)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `game_genre`
--

INSERT INTO `game_genre` (`game_uuid`, `genre_uuid`) VALUES
('015ee8ef-521f-44cd-b9ad-b1f17f3509a8', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('015ee8ef-521f-44cd-b9ad-b1f17f3509a8', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('015ee8ef-521f-44cd-b9ad-b1f17f3509a8', 'b5103f61-3fe5-46fd-b6ad-abc8ca19f2ab'),
('01b4a51f-188b-4ad4-ab2a-856a9b8267c4', '7522e1af-9f3a-466f-b07f-b2d95c5148c1'),
('01b4a51f-188b-4ad4-ab2a-856a9b8267c4', '97583047-4aff-4c5f-8649-6ebb00f5b03e'),
('077d2f82-3ee3-4db3-b6e2-c1de4cc3a89c', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('077d2f82-3ee3-4db3-b6e2-c1de4cc3a89c', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('077d2f82-3ee3-4db3-b6e2-c1de4cc3a89c', '97583047-4aff-4c5f-8649-6ebb00f5b03e'),
('077d2f82-3ee3-4db3-b6e2-c1de4cc3a89c', 'abfcd767-7739-43cc-baa7-8e7e852c5db6'),
('0d7af4d5-1a57-41f4-ace1-e7055c5c5591', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('0d7af4d5-1a57-41f4-ace1-e7055c5c5591', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('13941bc3-d457-4d45-b9b1-4558918ec99a', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('13941bc3-d457-4d45-b9b1-4558918ec99a', '7522e1af-9f3a-466f-b07f-b2d95c5148c1'),
('13941bc3-d457-4d45-b9b1-4558918ec99a', 'a7dc4a13-7647-4d88-b049-508acd319e9c'),
('1620c0b8-5e18-4d4d-8b06-7b0ff3874426', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('1620c0b8-5e18-4d4d-8b06-7b0ff3874426', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('1620c0b8-5e18-4d4d-8b06-7b0ff3874426', 'abfcd767-7739-43cc-baa7-8e7e852c5db6'),
('16adcbe1-13fd-43a8-9c54-1aade3354adf', '1284f66f-0bf4-4c27-8471-17c951b1fa8c'),
('1bd59b93-15b3-4a85-ae71-1173b3982abb', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('1bd59b93-15b3-4a85-ae71-1173b3982abb', '6aba7419-16f3-4e9a-b0a6-fc56bee26d56'),
('1bd59b93-15b3-4a85-ae71-1173b3982abb', '7522e1af-9f3a-466f-b07f-b2d95c5148c1'),
('1bd59b93-15b3-4a85-ae71-1173b3982abb', '76a90fc0-c345-4fec-ab3e-12c065a3dd44'),
('1c82f6bb-8a95-4f36-a9af-4490fe82767e', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('1c82f6bb-8a95-4f36-a9af-4490fe82767e', '76a90fc0-c345-4fec-ab3e-12c065a3dd44'),
('20aa7a1e-ad62-4d98-bf98-94177290b996', '97583047-4aff-4c5f-8649-6ebb00f5b03e'),
('20aa7a1e-ad62-4d98-bf98-94177290b996', 'abfcd767-7739-43cc-baa7-8e7e852c5db6'),
('20eb21de-ee88-4e0b-a026-3c01e941e445', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('20eb21de-ee88-4e0b-a026-3c01e941e445', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('2178130f-38a9-4698-bcd5-c622f51b834c', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('2178130f-38a9-4698-bcd5-c622f51b834c', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('26e60926-b527-4abb-9689-da622d10d781', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('26e60926-b527-4abb-9689-da622d10d781', 'abfcd767-7739-43cc-baa7-8e7e852c5db6'),
('26e60926-b527-4abb-9689-da622d10d781', 'b5103f61-3fe5-46fd-b6ad-abc8ca19f2ab'),
('279c8894-0a83-4492-9c72-f3b8a17a4162', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('279c8894-0a83-4492-9c72-f3b8a17a4162', '76a90fc0-c345-4fec-ab3e-12c065a3dd44'),
('279c8894-0a83-4492-9c72-f3b8a17a4162', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('279c8894-0a83-4492-9c72-f3b8a17a4162', 'abfcd767-7739-43cc-baa7-8e7e852c5db6'),
('279c8894-0a83-4492-9c72-f3b8a17a4162', 'b5103f61-3fe5-46fd-b6ad-abc8ca19f2ab'),
('29ed79c8-f677-47a7-a8a9-1566ecea58e9', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('29ed79c8-f677-47a7-a8a9-1566ecea58e9', '97583047-4aff-4c5f-8649-6ebb00f5b03e'),
('2c1052c2-1c2e-4edd-87be-b82f64558fca', '6aba7419-16f3-4e9a-b0a6-fc56bee26d56'),
('2c1052c2-1c2e-4edd-87be-b82f64558fca', '6ade09bc-328a-42a6-b1b3-66474b08c41b'),
('2c1052c2-1c2e-4edd-87be-b82f64558fca', '7522e1af-9f3a-466f-b07f-b2d95c5148c1'),
('2c1052c2-1c2e-4edd-87be-b82f64558fca', 'b5103f61-3fe5-46fd-b6ad-abc8ca19f2ab'),
('2c792aa8-e024-43d3-8ebd-c253924bfc11', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('2c792aa8-e024-43d3-8ebd-c253924bfc11', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('2c792aa8-e024-43d3-8ebd-c253924bfc11', 'b5103f61-3fe5-46fd-b6ad-abc8ca19f2ab'),
('2dcfb7fd-6198-4ec5-b436-ca11473c0cd4', '693f19db-1e7d-4239-bc8f-413a43434b0f'),
('33581c0d-0806-4991-a657-1441c336f39e', '6aba7419-16f3-4e9a-b0a6-fc56bee26d56'),
('33581c0d-0806-4991-a657-1441c336f39e', '7522e1af-9f3a-466f-b07f-b2d95c5148c1'),
('3ce8a1b8-4395-4d24-979d-c59343729403', '1dc3ffea-2011-4b93-8930-9205ad4f3eb3'),
('3ce8a1b8-4395-4d24-979d-c59343729403', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('3ce8a1b8-4395-4d24-979d-c59343729403', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('3ce8a1b8-4395-4d24-979d-c59343729403', '97583047-4aff-4c5f-8649-6ebb00f5b03e'),
('3ce8a1b8-4395-4d24-979d-c59343729403', 'abfcd767-7739-43cc-baa7-8e7e852c5db6'),
('47e65877-36fa-4aad-95ec-d4ee1921d64a', '6aba7419-16f3-4e9a-b0a6-fc56bee26d56'),
('47e65877-36fa-4aad-95ec-d4ee1921d64a', '7522e1af-9f3a-466f-b07f-b2d95c5148c1'),
('5273605e-d3bb-4e9f-8fa0-4e665eb89344', '76a90fc0-c345-4fec-ab3e-12c065a3dd44'),
('5273605e-d3bb-4e9f-8fa0-4e665eb89344', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('55a377ea-0f31-4390-a1e7-39066e69516b', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('55a377ea-0f31-4390-a1e7-39066e69516b', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('585c8160-3c44-4b9f-b980-b09118989d72', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('585c8160-3c44-4b9f-b980-b09118989d72', '76a90fc0-c345-4fec-ab3e-12c065a3dd44'),
('5b68df3d-5aab-4b2b-8033-6d7739c0827a', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('5b68df3d-5aab-4b2b-8033-6d7739c0827a', '6aba7419-16f3-4e9a-b0a6-fc56bee26d56'),
('5b68df3d-5aab-4b2b-8033-6d7739c0827a', '7522e1af-9f3a-466f-b07f-b2d95c5148c1'),
('5c674ba5-f17b-4bd8-a2c1-43f7a1b2f677', '76a90fc0-c345-4fec-ab3e-12c065a3dd44'),
('5c674ba5-f17b-4bd8-a2c1-43f7a1b2f677', '79323cf2-f732-401a-912c-4f643e747ef8'),
('5fd75094-be53-46bc-aa26-d3f47505dc60', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('5fd75094-be53-46bc-aa26-d3f47505dc60', '76a90fc0-c345-4fec-ab3e-12c065a3dd44'),
('5fd75094-be53-46bc-aa26-d3f47505dc60', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('5fd75094-be53-46bc-aa26-d3f47505dc60', 'abfcd767-7739-43cc-baa7-8e7e852c5db6'),
('5fd75094-be53-46bc-aa26-d3f47505dc60', 'b5103f61-3fe5-46fd-b6ad-abc8ca19f2ab'),
('68c72f02-48da-4e87-809d-a2cd58d2c14b', '97583047-4aff-4c5f-8649-6ebb00f5b03e'),
('6a8315fb-d0ae-4668-a62d-ac3d61953867', '97583047-4aff-4c5f-8649-6ebb00f5b03e'),
('6ab5b979-03aa-47df-941c-a192533bcf89', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('6ab5b979-03aa-47df-941c-a192533bcf89', '7522e1af-9f3a-466f-b07f-b2d95c5148c1'),
('6ab5b979-03aa-47df-941c-a192533bcf89', '76a90fc0-c345-4fec-ab3e-12c065a3dd44'),
('6ab5b979-03aa-47df-941c-a192533bcf89', 'b5103f61-3fe5-46fd-b6ad-abc8ca19f2ab'),
('6cb1b70f-3bc8-4b20-9f50-a1620f0f6aee', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('6cb1b70f-3bc8-4b20-9f50-a1620f0f6aee', '6aba7419-16f3-4e9a-b0a6-fc56bee26d56'),
('6cb1b70f-3bc8-4b20-9f50-a1620f0f6aee', '7522e1af-9f3a-466f-b07f-b2d95c5148c1'),
('6cb1b70f-3bc8-4b20-9f50-a1620f0f6aee', '76a90fc0-c345-4fec-ab3e-12c065a3dd44'),
('6cb1b70f-3bc8-4b20-9f50-a1620f0f6aee', 'b5103f61-3fe5-46fd-b6ad-abc8ca19f2ab'),
('771baa47-52d9-478e-930e-d68ee5357971', '6aba7419-16f3-4e9a-b0a6-fc56bee26d56'),
('771baa47-52d9-478e-930e-d68ee5357971', '7522e1af-9f3a-466f-b07f-b2d95c5148c1'),
('77c802f5-19ca-4bb9-a577-ae19d850a878', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('77c802f5-19ca-4bb9-a577-ae19d850a878', '52955f5e-245f-44ac-aeb1-d7fe33f9f675'),
('77ff632e-4205-405b-812e-605f5aa74e4c', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('77ff632e-4205-405b-812e-605f5aa74e4c', '6aba7419-16f3-4e9a-b0a6-fc56bee26d56'),
('77ff632e-4205-405b-812e-605f5aa74e4c', '7522e1af-9f3a-466f-b07f-b2d95c5148c1'),
('77ff632e-4205-405b-812e-605f5aa74e4c', 'a7dc4a13-7647-4d88-b049-508acd319e9c'),
('7acf4e12-47fc-4b52-8cc9-0d004423888c', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('7acf4e12-47fc-4b52-8cc9-0d004423888c', '76a90fc0-c345-4fec-ab3e-12c065a3dd44'),
('7f1f5054-edd8-4ffe-9f6f-fca1ce1e1bb6', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('7f1f5054-edd8-4ffe-9f6f-fca1ce1e1bb6', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('7f1f5054-edd8-4ffe-9f6f-fca1ce1e1bb6', 'abfcd767-7739-43cc-baa7-8e7e852c5db6'),
('7f1f5054-edd8-4ffe-9f6f-fca1ce1e1bb6', 'b5103f61-3fe5-46fd-b6ad-abc8ca19f2ab'),
('85b4a028-4d39-4950-9f8f-2f0b0e399fa9', '76a90fc0-c345-4fec-ab3e-12c065a3dd44'),
('85b4a028-4d39-4950-9f8f-2f0b0e399fa9', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('88f72392-c52b-41ac-a6b6-11adee22ca04', '693f19db-1e7d-4239-bc8f-413a43434b0f'),
('88f72392-c52b-41ac-a6b6-11adee22ca04', '79323cf2-f732-401a-912c-4f643e747ef8'),
('8b31211a-9282-462f-b9c6-253b54c090ef', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('8b31211a-9282-462f-b9c6-253b54c090ef', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('8b31211a-9282-462f-b9c6-253b54c090ef', 'a7dc4a13-7647-4d88-b049-508acd319e9c'),
('9225ec46-28d5-11ef-9ef3-0242ac130002', '693f19db-1e7d-4239-bc8f-413a43434b0f'),
('934c8da5-2dc7-4ee2-b807-63795a9846ec', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('934c8da5-2dc7-4ee2-b807-63795a9846ec', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('934c8da5-2dc7-4ee2-b807-63795a9846ec', 'abfcd767-7739-43cc-baa7-8e7e852c5db6'),
('959336e6-96eb-4cc8-b8ba-ab6bd269ba13', '52955f5e-245f-44ac-aeb1-d7fe33f9f675'),
('98641e7d-e085-496c-ada4-bac7943a6e60', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('98641e7d-e085-496c-ada4-bac7943a6e60', '76a90fc0-c345-4fec-ab3e-12c065a3dd44'),
('98641e7d-e085-496c-ada4-bac7943a6e60', 'abfcd767-7739-43cc-baa7-8e7e852c5db6'),
('98641e7d-e085-496c-ada4-bac7943a6e60', 'b5103f61-3fe5-46fd-b6ad-abc8ca19f2ab'),
('9aba3556-0af7-48fc-9ed7-8d2738b22fe2', '79323cf2-f732-401a-912c-4f643e747ef8'),
('9aba3556-0af7-48fc-9ed7-8d2738b22fe2', 'e6a50b04-2fc7-4403-96a0-0099f65cc06d'),
('9c0d417b-8f50-4a87-a4f8-25c48d374512', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('9c0d417b-8f50-4a87-a4f8-25c48d374512', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('9c0d417b-8f50-4a87-a4f8-25c48d374512', '97583047-4aff-4c5f-8649-6ebb00f5b03e'),
('9c0d417b-8f50-4a87-a4f8-25c48d374512', 'abfcd767-7739-43cc-baa7-8e7e852c5db6'),
('9eea4cbf-44bc-47b7-9486-b8d789d3fe01', '55e1bb87-4c65-4739-a9da-4bcd78a982ad'),
('9eea4cbf-44bc-47b7-9486-b8d789d3fe01', 'abfcd767-7739-43cc-baa7-8e7e852c5db6'),
('9f7e697a-8c38-4029-876a-902675072c63', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('9f7e697a-8c38-4029-876a-902675072c63', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('a25f8b99-f4a6-4054-96e7-f8b6ce8ae8cb', '6ade09bc-328a-42a6-b1b3-66474b08c41b'),
('a25f8b99-f4a6-4054-96e7-f8b6ce8ae8cb', 'b5103f61-3fe5-46fd-b6ad-abc8ca19f2ab'),
('a2bfa927-9648-4ad8-bfa8-45e8220ae1dc', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('a2bfa927-9648-4ad8-bfa8-45e8220ae1dc', '7522e1af-9f3a-466f-b07f-b2d95c5148c1'),
('a2bfa927-9648-4ad8-bfa8-45e8220ae1dc', '76a90fc0-c345-4fec-ab3e-12c065a3dd44'),
('a2bfa927-9648-4ad8-bfa8-45e8220ae1dc', 'b5103f61-3fe5-46fd-b6ad-abc8ca19f2ab'),
('a35afd29-932e-469d-931d-d88cf9f39e46', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('a35afd29-932e-469d-931d-d88cf9f39e46', '52955f5e-245f-44ac-aeb1-d7fe33f9f675'),
('a5d74ad3-e5b7-4b82-989f-e094f75589f1', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('a5d74ad3-e5b7-4b82-989f-e094f75589f1', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('a79712d8-f2a9-408a-9678-c8bf2763327c', '1284f66f-0bf4-4c27-8471-17c951b1fa8c'),
('a7d9978a-ac54-4d78-a5db-d50de4ae7412', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('a7d9978a-ac54-4d78-a5db-d50de4ae7412', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('a7d9978a-ac54-4d78-a5db-d50de4ae7412', 'abfcd767-7739-43cc-baa7-8e7e852c5db6'),
('ad72c840-c6a2-439f-91fa-364deb81b55c', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('ad72c840-c6a2-439f-91fa-364deb81b55c', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('ad72c840-c6a2-439f-91fa-364deb81b55c', 'e6a50b04-2fc7-4403-96a0-0099f65cc06d'),
('ae7f738d-0995-4212-8c2e-f8d41fec84b8', '55e1bb87-4c65-4739-a9da-4bcd78a982ad'),
('ae7f738d-0995-4212-8c2e-f8d41fec84b8', 'a7dc4a13-7647-4d88-b049-508acd319e9c'),
('ae7f738d-0995-4212-8c2e-f8d41fec84b8', 'abfcd767-7739-43cc-baa7-8e7e852c5db6'),
('b39f56f7-faef-434c-84e4-17c55cd3d314', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('b39f56f7-faef-434c-84e4-17c55cd3d314', 'abfcd767-7739-43cc-baa7-8e7e852c5db6'),
('b469970f-4fe7-4540-80d0-a20fa3493c8b', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('b469970f-4fe7-4540-80d0-a20fa3493c8b', '76a90fc0-c345-4fec-ab3e-12c065a3dd44'),
('b64d8ea1-bc1e-407e-90a7-0c0918471ddc', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('b64d8ea1-bc1e-407e-90a7-0c0918471ddc', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('b64d8ea1-bc1e-407e-90a7-0c0918471ddc', 'abfcd767-7739-43cc-baa7-8e7e852c5db6'),
('b8a0aad2-a59b-453b-9e43-6605363ae347', '79323cf2-f732-401a-912c-4f643e747ef8'),
('b8a0aad2-a59b-453b-9e43-6605363ae347', 'e6a50b04-2fc7-4403-96a0-0099f65cc06d'),
('b9fb924e-c72c-48ae-b43a-cbe01eb4dd7a', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('b9fb924e-c72c-48ae-b43a-cbe01eb4dd7a', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('b9fb924e-c72c-48ae-b43a-cbe01eb4dd7a', 'b5103f61-3fe5-46fd-b6ad-abc8ca19f2ab'),
('b9fdcf84-0ef9-4455-ad9b-81658eebef16', '79323cf2-f732-401a-912c-4f643e747ef8'),
('b9fdcf84-0ef9-4455-ad9b-81658eebef16', 'e6a50b04-2fc7-4403-96a0-0099f65cc06d'),
('bbde166f-951c-4d53-be0d-87a9b27ed9fd', '693f19db-1e7d-4239-bc8f-413a43434b0f'),
('bbde166f-951c-4d53-be0d-87a9b27ed9fd', '79323cf2-f732-401a-912c-4f643e747ef8'),
('c40a3094-1157-42a3-8bbf-7ad94d080e9e', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('c40a3094-1157-42a3-8bbf-7ad94d080e9e', '76a90fc0-c345-4fec-ab3e-12c065a3dd44'),
('c40a3094-1157-42a3-8bbf-7ad94d080e9e', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('c40a3094-1157-42a3-8bbf-7ad94d080e9e', 'abfcd767-7739-43cc-baa7-8e7e852c5db6'),
('c40a3094-1157-42a3-8bbf-7ad94d080e9e', 'b5103f61-3fe5-46fd-b6ad-abc8ca19f2ab'),
('c50d8788-0873-4594-9996-d44e052965ed', '52955f5e-245f-44ac-aeb1-d7fe33f9f675'),
('c50d8788-0873-4594-9996-d44e052965ed', '6a1442f0-c41e-4925-8d19-5ff0a77aa591'),
('c9b512be-9751-4655-9135-5f6748663c2a', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('c9b512be-9751-4655-9135-5f6748663c2a', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('ca1dcc33-757e-4be8-89be-c1d26026e473', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('ca1dcc33-757e-4be8-89be-c1d26026e473', '7522e1af-9f3a-466f-b07f-b2d95c5148c1'),
('cd4bfb6d-ccfb-4bf2-8ac5-11343f1ab2aa', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('cd4bfb6d-ccfb-4bf2-8ac5-11343f1ab2aa', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('cd4bfb6d-ccfb-4bf2-8ac5-11343f1ab2aa', 'e6a50b04-2fc7-4403-96a0-0099f65cc06d'),
('d13cf381-4294-4bbe-85a5-ed289adeda38', '55e1bb87-4c65-4739-a9da-4bcd78a982ad'),
('d13cf381-4294-4bbe-85a5-ed289adeda38', '693f19db-1e7d-4239-bc8f-413a43434b0f'),
('d13cf381-4294-4bbe-85a5-ed289adeda38', 'a7dc4a13-7647-4d88-b049-508acd319e9c'),
('d13cf381-4294-4bbe-85a5-ed289adeda38', 'abfcd767-7739-43cc-baa7-8e7e852c5db6'),
('d2ff6052-59ad-4ad5-953b-16e19f79544b', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('d2ff6052-59ad-4ad5-953b-16e19f79544b', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('d2ff6052-59ad-4ad5-953b-16e19f79544b', '97583047-4aff-4c5f-8649-6ebb00f5b03e'),
('d9770785-77cb-41e2-b45a-4f24992d9eaf', '79323cf2-f732-401a-912c-4f643e747ef8'),
('d9770785-77cb-41e2-b45a-4f24992d9eaf', 'e6a50b04-2fc7-4403-96a0-0099f65cc06d'),
('d98cf431-ff6f-4999-8489-8cacd7a2f1e1', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('d98cf431-ff6f-4999-8489-8cacd7a2f1e1', 'e6a50b04-2fc7-4403-96a0-0099f65cc06d'),
('d9a52f1a-9aae-4e40-bbd1-a16491fe23ac', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('d9a52f1a-9aae-4e40-bbd1-a16491fe23ac', '6aba7419-16f3-4e9a-b0a6-fc56bee26d56'),
('dccbe43c-356b-4139-b5b4-150ac340fccf', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('dccbe43c-356b-4139-b5b4-150ac340fccf', 'abfcd767-7739-43cc-baa7-8e7e852c5db6'),
('dccbe43c-356b-4139-b5b4-150ac340fccf', 'b5103f61-3fe5-46fd-b6ad-abc8ca19f2ab'),
('dd6fb33b-9f0f-4530-a01a-cb300974f157', '52955f5e-245f-44ac-aeb1-d7fe33f9f675'),
('dd6fb33b-9f0f-4530-a01a-cb300974f157', '76a90fc0-c345-4fec-ab3e-12c065a3dd44'),
('dd6fb33b-9f0f-4530-a01a-cb300974f157', 'abfcd767-7739-43cc-baa7-8e7e852c5db6'),
('e083be4e-0c8a-44e5-83c6-e72492bcbe53', '693f19db-1e7d-4239-bc8f-413a43434b0f'),
('e083be4e-0c8a-44e5-83c6-e72492bcbe53', '79323cf2-f732-401a-912c-4f643e747ef8'),
('e1f7376c-22ea-42f2-accb-3655eae1725b', '1dc3ffea-2011-4b93-8930-9205ad4f3eb3'),
('e1f7376c-22ea-42f2-accb-3655eae1725b', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('e1f7376c-22ea-42f2-accb-3655eae1725b', 'abfcd767-7739-43cc-baa7-8e7e852c5db6'),
('e3d139a2-388c-4b95-a1ca-95f5206c6d51', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('e3d139a2-388c-4b95-a1ca-95f5206c6d51', '6aba7419-16f3-4e9a-b0a6-fc56bee26d56'),
('e3d139a2-388c-4b95-a1ca-95f5206c6d51', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('e3d139a2-388c-4b95-a1ca-95f5206c6d51', 'abfcd767-7739-43cc-baa7-8e7e852c5db6'),
('e4f7958d-531d-4105-a0af-bce6ed8165af', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('e4f7958d-531d-4105-a0af-bce6ed8165af', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('e6461d6f-ffca-4639-bc6e-e1dc0a8edcb1', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('e6461d6f-ffca-4639-bc6e-e1dc0a8edcb1', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('e6461d6f-ffca-4639-bc6e-e1dc0a8edcb1', 'abfcd767-7739-43cc-baa7-8e7e852c5db6'),
('e918f0c6-c482-4ad3-a6f6-e407db3c48f6', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('e918f0c6-c482-4ad3-a6f6-e407db3c48f6', '6aba7419-16f3-4e9a-b0a6-fc56bee26d56'),
('e918f0c6-c482-4ad3-a6f6-e407db3c48f6', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('e918f0c6-c482-4ad3-a6f6-e407db3c48f6', 'abfcd767-7739-43cc-baa7-8e7e852c5db6'),
('eac5806a-da1c-41a2-a15c-e675623fec54', '76a90fc0-c345-4fec-ab3e-12c065a3dd44'),
('eac5806a-da1c-41a2-a15c-e675623fec54', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('ec1c2414-4f14-44f4-916d-cf2ad263d1bb', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('ec1c2414-4f14-44f4-916d-cf2ad263d1bb', '6aba7419-16f3-4e9a-b0a6-fc56bee26d56'),
('ec1c2414-4f14-44f4-916d-cf2ad263d1bb', 'abfcd767-7739-43cc-baa7-8e7e852c5db6'),
('ec1c2414-4f14-44f4-916d-cf2ad263d1bb', 'b5103f61-3fe5-46fd-b6ad-abc8ca19f2ab'),
('ecf6af94-f1b4-4ba5-aa5c-ee903c55c2a6', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('ecf6af94-f1b4-4ba5-aa5c-ee903c55c2a6', '76a90fc0-c345-4fec-ab3e-12c065a3dd44'),
('ecf6af94-f1b4-4ba5-aa5c-ee903c55c2a6', 'abfcd767-7739-43cc-baa7-8e7e852c5db6'),
('ecf6af94-f1b4-4ba5-aa5c-ee903c55c2a6', 'b5103f61-3fe5-46fd-b6ad-abc8ca19f2ab'),
('eeea77cc-2f49-4a1d-b847-686af6939702', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('eeea77cc-2f49-4a1d-b847-686af6939702', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('ef34f744-b28a-45d6-bcfc-4e6bdbf3d7b5', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('ef34f744-b28a-45d6-bcfc-4e6bdbf3d7b5', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('ef34f744-b28a-45d6-bcfc-4e6bdbf3d7b5', 'abfcd767-7739-43cc-baa7-8e7e852c5db6'),
('f0553348-0619-434d-b917-fc84bd4f123a', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('f0553348-0619-434d-b917-fc84bd4f123a', '52955f5e-245f-44ac-aeb1-d7fe33f9f675'),
('f0553348-0619-434d-b917-fc84bd4f123a', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('f0553348-0619-434d-b917-fc84bd4f123a', 'abfcd767-7739-43cc-baa7-8e7e852c5db6'),
('f1691d7b-0a83-4930-b538-b98c7655c4fc', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('f1691d7b-0a83-4930-b538-b98c7655c4fc', 'a3c0afd7-ace4-4325-992f-4b6b9d3326ea'),
('f1691d7b-0a83-4930-b538-b98c7655c4fc', 'abfcd767-7739-43cc-baa7-8e7e852c5db6'),
('f1a42b16-1b23-43f0-984a-2b16b373bb67', 'abfcd767-7739-43cc-baa7-8e7e852c5db6'),
('f1a42b16-1b23-43f0-984a-2b16b373bb67', 'e6a50b04-2fc7-4403-96a0-0099f65cc06d'),
('f77921b4-9731-41c9-a8ec-addbbf90dced', '37b7a986-f312-4df8-92c4-37edfd7d6def'),
('f77921b4-9731-41c9-a8ec-addbbf90dced', '6aba7419-16f3-4e9a-b0a6-fc56bee26d56'),
('f77921b4-9731-41c9-a8ec-addbbf90dced', '76a90fc0-c345-4fec-ab3e-12c065a3dd44'),
('fb41536b-0fdd-4b83-9239-e075314d3a75', '1dc3ffea-2011-4b93-8930-9205ad4f3eb3'),
('fb41536b-0fdd-4b83-9239-e075314d3a75', '7e039483-f2af-47e8-b96e-cdf58d8352b6'),
('fb41536b-0fdd-4b83-9239-e075314d3a75', '97583047-4aff-4c5f-8649-6ebb00f5b03e');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `game_platform`
--

CREATE TABLE `game_platform` (
  `game_uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:uuid)',
  `platform_uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:uuid)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `game_platform`
--

INSERT INTO `game_platform` (`game_uuid`, `platform_uuid`) VALUES
('015ee8ef-521f-44cd-b9ad-b1f17f3509a8', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('015ee8ef-521f-44cd-b9ad-b1f17f3509a8', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('015ee8ef-521f-44cd-b9ad-b1f17f3509a8', '958bc361-aa9b-4af4-a06a-7b0aedfc3a17'),
('015ee8ef-521f-44cd-b9ad-b1f17f3509a8', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('015ee8ef-521f-44cd-b9ad-b1f17f3509a8', 'b316445f-a6a4-40e3-9a65-d81b81f7f1d8'),
('015ee8ef-521f-44cd-b9ad-b1f17f3509a8', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('01b4a51f-188b-4ad4-ab2a-856a9b8267c4', '1108498e-135a-473d-be69-65f3ff5b73b1'),
('01b4a51f-188b-4ad4-ab2a-856a9b8267c4', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('01b4a51f-188b-4ad4-ab2a-856a9b8267c4', 'a42e8a4c-f1c0-4070-95c4-283870e50408'),
('077d2f82-3ee3-4db3-b6e2-c1de4cc3a89c', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('077d2f82-3ee3-4db3-b6e2-c1de4cc3a89c', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('077d2f82-3ee3-4db3-b6e2-c1de4cc3a89c', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('077d2f82-3ee3-4db3-b6e2-c1de4cc3a89c', 'b316445f-a6a4-40e3-9a65-d81b81f7f1d8'),
('077d2f82-3ee3-4db3-b6e2-c1de4cc3a89c', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('0d7af4d5-1a57-41f4-ace1-e7055c5c5591', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('0d7af4d5-1a57-41f4-ace1-e7055c5c5591', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('0d7af4d5-1a57-41f4-ace1-e7055c5c5591', 'a42e8a4c-f1c0-4070-95c4-283870e50408'),
('0d7af4d5-1a57-41f4-ace1-e7055c5c5591', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('13941bc3-d457-4d45-b9b1-4558918ec99a', '1108498e-135a-473d-be69-65f3ff5b73b1'),
('13941bc3-d457-4d45-b9b1-4558918ec99a', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('13941bc3-d457-4d45-b9b1-4558918ec99a', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('13941bc3-d457-4d45-b9b1-4558918ec99a', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('13941bc3-d457-4d45-b9b1-4558918ec99a', '958bc361-aa9b-4af4-a06a-7b0aedfc3a17'),
('13941bc3-d457-4d45-b9b1-4558918ec99a', 'a42e8a4c-f1c0-4070-95c4-283870e50408'),
('13941bc3-d457-4d45-b9b1-4558918ec99a', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('1620c0b8-5e18-4d4d-8b06-7b0ff3874426', '1108498e-135a-473d-be69-65f3ff5b73b1'),
('1620c0b8-5e18-4d4d-8b06-7b0ff3874426', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('1620c0b8-5e18-4d4d-8b06-7b0ff3874426', 'a42e8a4c-f1c0-4070-95c4-283870e50408'),
('16adcbe1-13fd-43a8-9c54-1aade3354adf', '1108498e-135a-473d-be69-65f3ff5b73b1'),
('16adcbe1-13fd-43a8-9c54-1aade3354adf', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('16adcbe1-13fd-43a8-9c54-1aade3354adf', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('16adcbe1-13fd-43a8-9c54-1aade3354adf', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('1bd59b93-15b3-4a85-ae71-1173b3982abb', '1108498e-135a-473d-be69-65f3ff5b73b1'),
('1bd59b93-15b3-4a85-ae71-1173b3982abb', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('1bd59b93-15b3-4a85-ae71-1173b3982abb', '958bc361-aa9b-4af4-a06a-7b0aedfc3a17'),
('1bd59b93-15b3-4a85-ae71-1173b3982abb', 'a42e8a4c-f1c0-4070-95c4-283870e50408'),
('1c82f6bb-8a95-4f36-a9af-4490fe82767e', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('1c82f6bb-8a95-4f36-a9af-4490fe82767e', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('1c82f6bb-8a95-4f36-a9af-4490fe82767e', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('20aa7a1e-ad62-4d98-bf98-94177290b996', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('20aa7a1e-ad62-4d98-bf98-94177290b996', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('20aa7a1e-ad62-4d98-bf98-94177290b996', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('20aa7a1e-ad62-4d98-bf98-94177290b996', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('20eb21de-ee88-4e0b-a026-3c01e941e445', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('20eb21de-ee88-4e0b-a026-3c01e941e445', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('20eb21de-ee88-4e0b-a026-3c01e941e445', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('20eb21de-ee88-4e0b-a026-3c01e941e445', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('20eb21de-ee88-4e0b-a026-3c01e941e445', 'b316445f-a6a4-40e3-9a65-d81b81f7f1d8'),
('20eb21de-ee88-4e0b-a026-3c01e941e445', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('2178130f-38a9-4698-bcd5-c622f51b834c', '1108498e-135a-473d-be69-65f3ff5b73b1'),
('2178130f-38a9-4698-bcd5-c622f51b834c', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('2178130f-38a9-4698-bcd5-c622f51b834c', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('2178130f-38a9-4698-bcd5-c622f51b834c', 'a42e8a4c-f1c0-4070-95c4-283870e50408'),
('2178130f-38a9-4698-bcd5-c622f51b834c', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('26e60926-b527-4abb-9689-da622d10d781', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('26e60926-b527-4abb-9689-da622d10d781', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('26e60926-b527-4abb-9689-da622d10d781', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('279c8894-0a83-4492-9c72-f3b8a17a4162', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('279c8894-0a83-4492-9c72-f3b8a17a4162', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('279c8894-0a83-4492-9c72-f3b8a17a4162', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('279c8894-0a83-4492-9c72-f3b8a17a4162', 'b316445f-a6a4-40e3-9a65-d81b81f7f1d8'),
('279c8894-0a83-4492-9c72-f3b8a17a4162', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('29ed79c8-f677-47a7-a8a9-1566ecea58e9', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('2c1052c2-1c2e-4edd-87be-b82f64558fca', '1108498e-135a-473d-be69-65f3ff5b73b1'),
('2c1052c2-1c2e-4edd-87be-b82f64558fca', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('2c1052c2-1c2e-4edd-87be-b82f64558fca', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('2c1052c2-1c2e-4edd-87be-b82f64558fca', 'a42e8a4c-f1c0-4070-95c4-283870e50408'),
('2c1052c2-1c2e-4edd-87be-b82f64558fca', 'b316445f-a6a4-40e3-9a65-d81b81f7f1d8'),
('2c1052c2-1c2e-4edd-87be-b82f64558fca', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('2c792aa8-e024-43d3-8ebd-c253924bfc11', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('2c792aa8-e024-43d3-8ebd-c253924bfc11', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('2c792aa8-e024-43d3-8ebd-c253924bfc11', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('2dcfb7fd-6198-4ec5-b436-ca11473c0cd4', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('2dcfb7fd-6198-4ec5-b436-ca11473c0cd4', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('2dcfb7fd-6198-4ec5-b436-ca11473c0cd4', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('2dcfb7fd-6198-4ec5-b436-ca11473c0cd4', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('33581c0d-0806-4991-a657-1441c336f39e', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('33581c0d-0806-4991-a657-1441c336f39e', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('33581c0d-0806-4991-a657-1441c336f39e', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('33581c0d-0806-4991-a657-1441c336f39e', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('33581c0d-0806-4991-a657-1441c336f39e', 'b316445f-a6a4-40e3-9a65-d81b81f7f1d8'),
('33581c0d-0806-4991-a657-1441c336f39e', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('3ce8a1b8-4395-4d24-979d-c59343729403', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('3ce8a1b8-4395-4d24-979d-c59343729403', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('3ce8a1b8-4395-4d24-979d-c59343729403', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('3ce8a1b8-4395-4d24-979d-c59343729403', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('3ce8a1b8-4395-4d24-979d-c59343729403', 'b316445f-a6a4-40e3-9a65-d81b81f7f1d8'),
('3ce8a1b8-4395-4d24-979d-c59343729403', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('47e65877-36fa-4aad-95ec-d4ee1921d64a', '1108498e-135a-473d-be69-65f3ff5b73b1'),
('47e65877-36fa-4aad-95ec-d4ee1921d64a', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('47e65877-36fa-4aad-95ec-d4ee1921d64a', '958bc361-aa9b-4af4-a06a-7b0aedfc3a17'),
('47e65877-36fa-4aad-95ec-d4ee1921d64a', 'a42e8a4c-f1c0-4070-95c4-283870e50408'),
('5273605e-d3bb-4e9f-8fa0-4e665eb89344', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('5273605e-d3bb-4e9f-8fa0-4e665eb89344', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('5273605e-d3bb-4e9f-8fa0-4e665eb89344', 'b316445f-a6a4-40e3-9a65-d81b81f7f1d8'),
('55a377ea-0f31-4390-a1e7-39066e69516b', '1108498e-135a-473d-be69-65f3ff5b73b1'),
('55a377ea-0f31-4390-a1e7-39066e69516b', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('55a377ea-0f31-4390-a1e7-39066e69516b', 'a42e8a4c-f1c0-4070-95c4-283870e50408'),
('585c8160-3c44-4b9f-b980-b09118989d72', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('585c8160-3c44-4b9f-b980-b09118989d72', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('585c8160-3c44-4b9f-b980-b09118989d72', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('585c8160-3c44-4b9f-b980-b09118989d72', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('585c8160-3c44-4b9f-b980-b09118989d72', 'b316445f-a6a4-40e3-9a65-d81b81f7f1d8'),
('585c8160-3c44-4b9f-b980-b09118989d72', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('5b68df3d-5aab-4b2b-8033-6d7739c0827a', '1108498e-135a-473d-be69-65f3ff5b73b1'),
('5b68df3d-5aab-4b2b-8033-6d7739c0827a', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('5b68df3d-5aab-4b2b-8033-6d7739c0827a', 'a42e8a4c-f1c0-4070-95c4-283870e50408'),
('5c674ba5-f17b-4bd8-a2c1-43f7a1b2f677', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('5c674ba5-f17b-4bd8-a2c1-43f7a1b2f677', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('5c674ba5-f17b-4bd8-a2c1-43f7a1b2f677', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('5c674ba5-f17b-4bd8-a2c1-43f7a1b2f677', 'b316445f-a6a4-40e3-9a65-d81b81f7f1d8'),
('5c674ba5-f17b-4bd8-a2c1-43f7a1b2f677', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('5fd75094-be53-46bc-aa26-d3f47505dc60', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('5fd75094-be53-46bc-aa26-d3f47505dc60', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('5fd75094-be53-46bc-aa26-d3f47505dc60', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('68c72f02-48da-4e87-809d-a2cd58d2c14b', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('68c72f02-48da-4e87-809d-a2cd58d2c14b', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('68c72f02-48da-4e87-809d-a2cd58d2c14b', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('68c72f02-48da-4e87-809d-a2cd58d2c14b', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('6a8315fb-d0ae-4668-a62d-ac3d61953867', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('6a8315fb-d0ae-4668-a62d-ac3d61953867', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('6a8315fb-d0ae-4668-a62d-ac3d61953867', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('6ab5b979-03aa-47df-941c-a192533bcf89', '1108498e-135a-473d-be69-65f3ff5b73b1'),
('6ab5b979-03aa-47df-941c-a192533bcf89', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('6ab5b979-03aa-47df-941c-a192533bcf89', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('6ab5b979-03aa-47df-941c-a192533bcf89', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('6ab5b979-03aa-47df-941c-a192533bcf89', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('6ab5b979-03aa-47df-941c-a192533bcf89', 'a42e8a4c-f1c0-4070-95c4-283870e50408'),
('6ab5b979-03aa-47df-941c-a192533bcf89', 'b316445f-a6a4-40e3-9a65-d81b81f7f1d8'),
('6ab5b979-03aa-47df-941c-a192533bcf89', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('6cb1b70f-3bc8-4b20-9f50-a1620f0f6aee', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('6cb1b70f-3bc8-4b20-9f50-a1620f0f6aee', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('6cb1b70f-3bc8-4b20-9f50-a1620f0f6aee', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('6cb1b70f-3bc8-4b20-9f50-a1620f0f6aee', 'b316445f-a6a4-40e3-9a65-d81b81f7f1d8'),
('6cb1b70f-3bc8-4b20-9f50-a1620f0f6aee', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('771baa47-52d9-478e-930e-d68ee5357971', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('771baa47-52d9-478e-930e-d68ee5357971', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('771baa47-52d9-478e-930e-d68ee5357971', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('771baa47-52d9-478e-930e-d68ee5357971', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('77c802f5-19ca-4bb9-a577-ae19d850a878', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('77ff632e-4205-405b-812e-605f5aa74e4c', '1108498e-135a-473d-be69-65f3ff5b73b1'),
('77ff632e-4205-405b-812e-605f5aa74e4c', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('77ff632e-4205-405b-812e-605f5aa74e4c', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('7acf4e12-47fc-4b52-8cc9-0d004423888c', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('7acf4e12-47fc-4b52-8cc9-0d004423888c', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('7acf4e12-47fc-4b52-8cc9-0d004423888c', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('7acf4e12-47fc-4b52-8cc9-0d004423888c', 'b316445f-a6a4-40e3-9a65-d81b81f7f1d8'),
('7acf4e12-47fc-4b52-8cc9-0d004423888c', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('7f1f5054-edd8-4ffe-9f6f-fca1ce1e1bb6', '1108498e-135a-473d-be69-65f3ff5b73b1'),
('7f1f5054-edd8-4ffe-9f6f-fca1ce1e1bb6', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('7f1f5054-edd8-4ffe-9f6f-fca1ce1e1bb6', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('7f1f5054-edd8-4ffe-9f6f-fca1ce1e1bb6', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('7f1f5054-edd8-4ffe-9f6f-fca1ce1e1bb6', 'a42e8a4c-f1c0-4070-95c4-283870e50408'),
('7f1f5054-edd8-4ffe-9f6f-fca1ce1e1bb6', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('85b4a028-4d39-4950-9f8f-2f0b0e399fa9', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('85b4a028-4d39-4950-9f8f-2f0b0e399fa9', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('85b4a028-4d39-4950-9f8f-2f0b0e399fa9', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('85b4a028-4d39-4950-9f8f-2f0b0e399fa9', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('85b4a028-4d39-4950-9f8f-2f0b0e399fa9', 'b316445f-a6a4-40e3-9a65-d81b81f7f1d8'),
('85b4a028-4d39-4950-9f8f-2f0b0e399fa9', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('88f72392-c52b-41ac-a6b6-11adee22ca04', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('88f72392-c52b-41ac-a6b6-11adee22ca04', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('88f72392-c52b-41ac-a6b6-11adee22ca04', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('88f72392-c52b-41ac-a6b6-11adee22ca04', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('88f72392-c52b-41ac-a6b6-11adee22ca04', 'b316445f-a6a4-40e3-9a65-d81b81f7f1d8'),
('88f72392-c52b-41ac-a6b6-11adee22ca04', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('8b31211a-9282-462f-b9c6-253b54c090ef', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('8b31211a-9282-462f-b9c6-253b54c090ef', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('8b31211a-9282-462f-b9c6-253b54c090ef', 'b316445f-a6a4-40e3-9a65-d81b81f7f1d8'),
('9225ec46-28d5-11ef-9ef3-0242ac130002', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('934c8da5-2dc7-4ee2-b807-63795a9846ec', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('934c8da5-2dc7-4ee2-b807-63795a9846ec', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('934c8da5-2dc7-4ee2-b807-63795a9846ec', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('959336e6-96eb-4cc8-b8ba-ab6bd269ba13', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('959336e6-96eb-4cc8-b8ba-ab6bd269ba13', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('959336e6-96eb-4cc8-b8ba-ab6bd269ba13', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('959336e6-96eb-4cc8-b8ba-ab6bd269ba13', 'b316445f-a6a4-40e3-9a65-d81b81f7f1d8'),
('959336e6-96eb-4cc8-b8ba-ab6bd269ba13', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('98641e7d-e085-496c-ada4-bac7943a6e60', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('98641e7d-e085-496c-ada4-bac7943a6e60', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('98641e7d-e085-496c-ada4-bac7943a6e60', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('98641e7d-e085-496c-ada4-bac7943a6e60', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('9aba3556-0af7-48fc-9ed7-8d2738b22fe2', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('9aba3556-0af7-48fc-9ed7-8d2738b22fe2', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('9aba3556-0af7-48fc-9ed7-8d2738b22fe2', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('9aba3556-0af7-48fc-9ed7-8d2738b22fe2', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('9aba3556-0af7-48fc-9ed7-8d2738b22fe2', 'b316445f-a6a4-40e3-9a65-d81b81f7f1d8'),
('9aba3556-0af7-48fc-9ed7-8d2738b22fe2', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('9c0d417b-8f50-4a87-a4f8-25c48d374512', '1108498e-135a-473d-be69-65f3ff5b73b1'),
('9c0d417b-8f50-4a87-a4f8-25c48d374512', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('9c0d417b-8f50-4a87-a4f8-25c48d374512', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('9c0d417b-8f50-4a87-a4f8-25c48d374512', 'a42e8a4c-f1c0-4070-95c4-283870e50408'),
('9c0d417b-8f50-4a87-a4f8-25c48d374512', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('9eea4cbf-44bc-47b7-9486-b8d789d3fe01', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('9eea4cbf-44bc-47b7-9486-b8d789d3fe01', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('9eea4cbf-44bc-47b7-9486-b8d789d3fe01', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('9eea4cbf-44bc-47b7-9486-b8d789d3fe01', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('9f7e697a-8c38-4029-876a-902675072c63', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('9f7e697a-8c38-4029-876a-902675072c63', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('9f7e697a-8c38-4029-876a-902675072c63', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('9f7e697a-8c38-4029-876a-902675072c63', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('a25f8b99-f4a6-4054-96e7-f8b6ce8ae8cb', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('a25f8b99-f4a6-4054-96e7-f8b6ce8ae8cb', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('a25f8b99-f4a6-4054-96e7-f8b6ce8ae8cb', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('a25f8b99-f4a6-4054-96e7-f8b6ce8ae8cb', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('a2bfa927-9648-4ad8-bfa8-45e8220ae1dc', '1108498e-135a-473d-be69-65f3ff5b73b1'),
('a2bfa927-9648-4ad8-bfa8-45e8220ae1dc', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('a2bfa927-9648-4ad8-bfa8-45e8220ae1dc', 'a42e8a4c-f1c0-4070-95c4-283870e50408'),
('a35afd29-932e-469d-931d-d88cf9f39e46', '1108498e-135a-473d-be69-65f3ff5b73b1'),
('a35afd29-932e-469d-931d-d88cf9f39e46', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('a35afd29-932e-469d-931d-d88cf9f39e46', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('a35afd29-932e-469d-931d-d88cf9f39e46', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('a35afd29-932e-469d-931d-d88cf9f39e46', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('a5d74ad3-e5b7-4b82-989f-e094f75589f1', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('a5d74ad3-e5b7-4b82-989f-e094f75589f1', 'b316445f-a6a4-40e3-9a65-d81b81f7f1d8'),
('a79712d8-f2a9-408a-9678-c8bf2763327c', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('a79712d8-f2a9-408a-9678-c8bf2763327c', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('a79712d8-f2a9-408a-9678-c8bf2763327c', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('a79712d8-f2a9-408a-9678-c8bf2763327c', 'b316445f-a6a4-40e3-9a65-d81b81f7f1d8'),
('a79712d8-f2a9-408a-9678-c8bf2763327c', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('a7d9978a-ac54-4d78-a5db-d50de4ae7412', '1108498e-135a-473d-be69-65f3ff5b73b1'),
('a7d9978a-ac54-4d78-a5db-d50de4ae7412', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('a7d9978a-ac54-4d78-a5db-d50de4ae7412', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('a7d9978a-ac54-4d78-a5db-d50de4ae7412', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('ad72c840-c6a2-439f-91fa-364deb81b55c', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('ae7f738d-0995-4212-8c2e-f8d41fec84b8', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('ae7f738d-0995-4212-8c2e-f8d41fec84b8', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('ae7f738d-0995-4212-8c2e-f8d41fec84b8', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('ae7f738d-0995-4212-8c2e-f8d41fec84b8', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('b39f56f7-faef-434c-84e4-17c55cd3d314', '1108498e-135a-473d-be69-65f3ff5b73b1'),
('b39f56f7-faef-434c-84e4-17c55cd3d314', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('b39f56f7-faef-434c-84e4-17c55cd3d314', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('b39f56f7-faef-434c-84e4-17c55cd3d314', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('b39f56f7-faef-434c-84e4-17c55cd3d314', '958bc361-aa9b-4af4-a06a-7b0aedfc3a17'),
('b39f56f7-faef-434c-84e4-17c55cd3d314', 'a42e8a4c-f1c0-4070-95c4-283870e50408'),
('b39f56f7-faef-434c-84e4-17c55cd3d314', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('b469970f-4fe7-4540-80d0-a20fa3493c8b', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('b469970f-4fe7-4540-80d0-a20fa3493c8b', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('b469970f-4fe7-4540-80d0-a20fa3493c8b', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('b469970f-4fe7-4540-80d0-a20fa3493c8b', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('b469970f-4fe7-4540-80d0-a20fa3493c8b', 'b316445f-a6a4-40e3-9a65-d81b81f7f1d8'),
('b469970f-4fe7-4540-80d0-a20fa3493c8b', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('b64d8ea1-bc1e-407e-90a7-0c0918471ddc', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('b64d8ea1-bc1e-407e-90a7-0c0918471ddc', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('b64d8ea1-bc1e-407e-90a7-0c0918471ddc', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('b8a0aad2-a59b-453b-9e43-6605363ae347', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('b9fb924e-c72c-48ae-b43a-cbe01eb4dd7a', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('b9fb924e-c72c-48ae-b43a-cbe01eb4dd7a', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('b9fb924e-c72c-48ae-b43a-cbe01eb4dd7a', 'b316445f-a6a4-40e3-9a65-d81b81f7f1d8'),
('b9fdcf84-0ef9-4455-ad9b-81658eebef16', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('bbde166f-951c-4d53-be0d-87a9b27ed9fd', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('bbde166f-951c-4d53-be0d-87a9b27ed9fd', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('bbde166f-951c-4d53-be0d-87a9b27ed9fd', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('bbde166f-951c-4d53-be0d-87a9b27ed9fd', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('bbde166f-951c-4d53-be0d-87a9b27ed9fd', 'b316445f-a6a4-40e3-9a65-d81b81f7f1d8'),
('bbde166f-951c-4d53-be0d-87a9b27ed9fd', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('c40a3094-1157-42a3-8bbf-7ad94d080e9e', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('c40a3094-1157-42a3-8bbf-7ad94d080e9e', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('c40a3094-1157-42a3-8bbf-7ad94d080e9e', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('c40a3094-1157-42a3-8bbf-7ad94d080e9e', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('c40a3094-1157-42a3-8bbf-7ad94d080e9e', 'b316445f-a6a4-40e3-9a65-d81b81f7f1d8'),
('c40a3094-1157-42a3-8bbf-7ad94d080e9e', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('c50d8788-0873-4594-9996-d44e052965ed', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('c50d8788-0873-4594-9996-d44e052965ed', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('c50d8788-0873-4594-9996-d44e052965ed', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('c9b512be-9751-4655-9135-5f6748663c2a', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('c9b512be-9751-4655-9135-5f6748663c2a', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('c9b512be-9751-4655-9135-5f6748663c2a', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('ca1dcc33-757e-4be8-89be-c1d26026e473', '1108498e-135a-473d-be69-65f3ff5b73b1'),
('ca1dcc33-757e-4be8-89be-c1d26026e473', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('ca1dcc33-757e-4be8-89be-c1d26026e473', 'a42e8a4c-f1c0-4070-95c4-283870e50408'),
('cd4bfb6d-ccfb-4bf2-8ac5-11343f1ab2aa', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('cd4bfb6d-ccfb-4bf2-8ac5-11343f1ab2aa', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('cd4bfb6d-ccfb-4bf2-8ac5-11343f1ab2aa', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('d13cf381-4294-4bbe-85a5-ed289adeda38', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('d13cf381-4294-4bbe-85a5-ed289adeda38', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('d13cf381-4294-4bbe-85a5-ed289adeda38', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('d13cf381-4294-4bbe-85a5-ed289adeda38', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('d13cf381-4294-4bbe-85a5-ed289adeda38', 'b316445f-a6a4-40e3-9a65-d81b81f7f1d8'),
('d13cf381-4294-4bbe-85a5-ed289adeda38', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('d2ff6052-59ad-4ad5-953b-16e19f79544b', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('d2ff6052-59ad-4ad5-953b-16e19f79544b', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('d2ff6052-59ad-4ad5-953b-16e19f79544b', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('d2ff6052-59ad-4ad5-953b-16e19f79544b', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('d2ff6052-59ad-4ad5-953b-16e19f79544b', 'b316445f-a6a4-40e3-9a65-d81b81f7f1d8'),
('d2ff6052-59ad-4ad5-953b-16e19f79544b', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('d9770785-77cb-41e2-b45a-4f24992d9eaf', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('d9770785-77cb-41e2-b45a-4f24992d9eaf', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('d9770785-77cb-41e2-b45a-4f24992d9eaf', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('d9770785-77cb-41e2-b45a-4f24992d9eaf', 'b316445f-a6a4-40e3-9a65-d81b81f7f1d8'),
('d9770785-77cb-41e2-b45a-4f24992d9eaf', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('d98cf431-ff6f-4999-8489-8cacd7a2f1e1', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('d98cf431-ff6f-4999-8489-8cacd7a2f1e1', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('d98cf431-ff6f-4999-8489-8cacd7a2f1e1', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('d98cf431-ff6f-4999-8489-8cacd7a2f1e1', 'b316445f-a6a4-40e3-9a65-d81b81f7f1d8'),
('d98cf431-ff6f-4999-8489-8cacd7a2f1e1', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('d9a52f1a-9aae-4e40-bbd1-a16491fe23ac', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('dccbe43c-356b-4139-b5b4-150ac340fccf', '1108498e-135a-473d-be69-65f3ff5b73b1'),
('dccbe43c-356b-4139-b5b4-150ac340fccf', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('dccbe43c-356b-4139-b5b4-150ac340fccf', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('dccbe43c-356b-4139-b5b4-150ac340fccf', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('dccbe43c-356b-4139-b5b4-150ac340fccf', 'a42e8a4c-f1c0-4070-95c4-283870e50408'),
('dccbe43c-356b-4139-b5b4-150ac340fccf', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('dd6fb33b-9f0f-4530-a01a-cb300974f157', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('dd6fb33b-9f0f-4530-a01a-cb300974f157', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('dd6fb33b-9f0f-4530-a01a-cb300974f157', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('dd6fb33b-9f0f-4530-a01a-cb300974f157', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('e083be4e-0c8a-44e5-83c6-e72492bcbe53', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('e083be4e-0c8a-44e5-83c6-e72492bcbe53', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('e083be4e-0c8a-44e5-83c6-e72492bcbe53', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('e083be4e-0c8a-44e5-83c6-e72492bcbe53', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('e1f7376c-22ea-42f2-accb-3655eae1725b', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('e1f7376c-22ea-42f2-accb-3655eae1725b', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('e1f7376c-22ea-42f2-accb-3655eae1725b', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('e1f7376c-22ea-42f2-accb-3655eae1725b', 'b316445f-a6a4-40e3-9a65-d81b81f7f1d8'),
('e1f7376c-22ea-42f2-accb-3655eae1725b', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('e3d139a2-388c-4b95-a1ca-95f5206c6d51', '1108498e-135a-473d-be69-65f3ff5b73b1'),
('e3d139a2-388c-4b95-a1ca-95f5206c6d51', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('e3d139a2-388c-4b95-a1ca-95f5206c6d51', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('e3d139a2-388c-4b95-a1ca-95f5206c6d51', 'a42e8a4c-f1c0-4070-95c4-283870e50408'),
('e3d139a2-388c-4b95-a1ca-95f5206c6d51', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('e4f7958d-531d-4105-a0af-bce6ed8165af', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('e4f7958d-531d-4105-a0af-bce6ed8165af', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('e4f7958d-531d-4105-a0af-bce6ed8165af', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('e6461d6f-ffca-4639-bc6e-e1dc0a8edcb1', '1108498e-135a-473d-be69-65f3ff5b73b1'),
('e6461d6f-ffca-4639-bc6e-e1dc0a8edcb1', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('e6461d6f-ffca-4639-bc6e-e1dc0a8edcb1', 'a42e8a4c-f1c0-4070-95c4-283870e50408'),
('e918f0c6-c482-4ad3-a6f6-e407db3c48f6', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('e918f0c6-c482-4ad3-a6f6-e407db3c48f6', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('e918f0c6-c482-4ad3-a6f6-e407db3c48f6', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('e918f0c6-c482-4ad3-a6f6-e407db3c48f6', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('e918f0c6-c482-4ad3-a6f6-e407db3c48f6', 'b316445f-a6a4-40e3-9a65-d81b81f7f1d8'),
('e918f0c6-c482-4ad3-a6f6-e407db3c48f6', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('eac5806a-da1c-41a2-a15c-e675623fec54', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('ec1c2414-4f14-44f4-916d-cf2ad263d1bb', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('ec1c2414-4f14-44f4-916d-cf2ad263d1bb', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('ec1c2414-4f14-44f4-916d-cf2ad263d1bb', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('ecf6af94-f1b4-4ba5-aa5c-ee903c55c2a6', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('ecf6af94-f1b4-4ba5-aa5c-ee903c55c2a6', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('ecf6af94-f1b4-4ba5-aa5c-ee903c55c2a6', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('ecf6af94-f1b4-4ba5-aa5c-ee903c55c2a6', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('ecf6af94-f1b4-4ba5-aa5c-ee903c55c2a6', 'b316445f-a6a4-40e3-9a65-d81b81f7f1d8'),
('ecf6af94-f1b4-4ba5-aa5c-ee903c55c2a6', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('eeea77cc-2f49-4a1d-b847-686af6939702', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('eeea77cc-2f49-4a1d-b847-686af6939702', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('eeea77cc-2f49-4a1d-b847-686af6939702', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('eeea77cc-2f49-4a1d-b847-686af6939702', 'b316445f-a6a4-40e3-9a65-d81b81f7f1d8'),
('eeea77cc-2f49-4a1d-b847-686af6939702', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('ef34f744-b28a-45d6-bcfc-4e6bdbf3d7b5', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('ef34f744-b28a-45d6-bcfc-4e6bdbf3d7b5', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('ef34f744-b28a-45d6-bcfc-4e6bdbf3d7b5', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('f0553348-0619-434d-b917-fc84bd4f123a', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('f0553348-0619-434d-b917-fc84bd4f123a', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('f0553348-0619-434d-b917-fc84bd4f123a', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('f1691d7b-0a83-4930-b538-b98c7655c4fc', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('f1691d7b-0a83-4930-b538-b98c7655c4fc', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('f1691d7b-0a83-4930-b538-b98c7655c4fc', 'b316445f-a6a4-40e3-9a65-d81b81f7f1d8'),
('f1a42b16-1b23-43f0-984a-2b16b373bb67', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('f1a42b16-1b23-43f0-984a-2b16b373bb67', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('f1a42b16-1b23-43f0-984a-2b16b373bb67', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('f1a42b16-1b23-43f0-984a-2b16b373bb67', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('f77921b4-9731-41c9-a8ec-addbbf90dced', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('f77921b4-9731-41c9-a8ec-addbbf90dced', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('f77921b4-9731-41c9-a8ec-addbbf90dced', '95fa6337-190d-477d-a2b7-e26c245459f9'),
('f77921b4-9731-41c9-a8ec-addbbf90dced', 'b316445f-a6a4-40e3-9a65-d81b81f7f1d8'),
('f77921b4-9731-41c9-a8ec-addbbf90dced', 'fea05831-27d0-4eff-8181-9aecddb28300'),
('fb41536b-0fdd-4b83-9239-e075314d3a75', '3d799b11-07b0-4244-97e2-eba3d7c03061'),
('fb41536b-0fdd-4b83-9239-e075314d3a75', '412b141b-6e1b-4423-a99e-2c57837a7f26'),
('fb41536b-0fdd-4b83-9239-e075314d3a75', '68cd8256-a79a-48b8-a59b-0f37994f261d'),
('fb41536b-0fdd-4b83-9239-e075314d3a75', 'fea05831-27d0-4eff-8181-9aecddb28300');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `game_user`
--

CREATE TABLE `game_user` (
  `user_uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:uuid)',
  `game_uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:uuid)',
  `user_rating` double DEFAULT NULL,
  `time_played` int DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `game_user`
--

INSERT INTO `game_user` (`user_uuid`, `game_uuid`, `user_rating`, `time_played`, `state`) VALUES
('01a3b419-b492-4909-8bed-1ec0c95390d0', '6cb1b70f-3bc8-4b20-9f50-a1620f0f6aee', 9, 26, 'finalizado'),
('01a3b419-b492-4909-8bed-1ec0c95390d0', '8b31211a-9282-462f-b9c6-253b54c090ef', 9.5, 21, 'finalizado'),
('01a3b419-b492-4909-8bed-1ec0c95390d0', '9225ec46-28d5-11ef-9ef3-0242ac130002', 5.5, 16, 'jugando'),
('01a3b419-b492-4909-8bed-1ec0c95390d0', '9aba3556-0af7-48fc-9ed7-8d2738b22fe2', 8.5, 28, 'finalizado'),
('01a3b419-b492-4909-8bed-1ec0c95390d0', 'a79712d8-f2a9-408a-9678-c8bf2763327c', 8, 25, 'jugando'),
('01a3b419-b492-4909-8bed-1ec0c95390d0', 'a7d9978a-ac54-4d78-a5db-d50de4ae7412', 6.5, 40, 'finalizado'),
('01a3b419-b492-4909-8bed-1ec0c95390d0', 'b9fdcf84-0ef9-4455-ad9b-81658eebef16', 8, 40, 'finalizado'),
('07193843-bf00-4791-bc64-5ff2305666ae', '077d2f82-3ee3-4db3-b6e2-c1de4cc3a89c', 5, 16, 'jugando'),
('07193843-bf00-4791-bc64-5ff2305666ae', '29ed79c8-f677-47a7-a8a9-1566ecea58e9', 9, 18, 'finalizado'),
('07193843-bf00-4791-bc64-5ff2305666ae', '2c792aa8-e024-43d3-8ebd-c253924bfc11', 4.5, 29, 'finalizado'),
('07193843-bf00-4791-bc64-5ff2305666ae', '9aba3556-0af7-48fc-9ed7-8d2738b22fe2', 6.5, 9, 'jugando'),
('07193843-bf00-4791-bc64-5ff2305666ae', 'd98cf431-ff6f-4999-8489-8cacd7a2f1e1', 7, 35, 'finalizado'),
('07193843-bf00-4791-bc64-5ff2305666ae', 'f77921b4-9731-41c9-a8ec-addbbf90dced', 7.5, 15, 'jugando'),
('0b38ed42-afe5-4309-9b42-bc42c986c634', 'cd4bfb6d-ccfb-4bf2-8ac5-11343f1ab2aa', 9.5, 52, 'finalizado'),
('0b38ed42-afe5-4309-9b42-bc42c986c634', 'e4f7958d-531d-4105-a0af-bce6ed8165af', 6, 32, 'finalizado'),
('0b38ed42-afe5-4309-9b42-bc42c986c634', 'eeea77cc-2f49-4a1d-b847-686af6939702', 7, 39, 'jugando'),
('0b38ed42-afe5-4309-9b42-bc42c986c634', 'f77921b4-9731-41c9-a8ec-addbbf90dced', 8, 51, 'finalizado'),
('145fd745-9947-481c-bf95-08ea61469940', '5b68df3d-5aab-4b2b-8033-6d7739c0827a', 8.5, 44, 'finalizado'),
('145fd745-9947-481c-bf95-08ea61469940', '6cb1b70f-3bc8-4b20-9f50-a1620f0f6aee', 7, 38, 'finalizado'),
('145fd745-9947-481c-bf95-08ea61469940', '88f72392-c52b-41ac-a6b6-11adee22ca04', 2.5, 19, 'jugando'),
('145fd745-9947-481c-bf95-08ea61469940', '8b31211a-9282-462f-b9c6-253b54c090ef', 9.5, 26, 'finalizado'),
('145fd745-9947-481c-bf95-08ea61469940', '9225ec46-28d5-11ef-9ef3-0242ac130002', 4, 23, 'jugando'),
('145fd745-9947-481c-bf95-08ea61469940', '9aba3556-0af7-48fc-9ed7-8d2738b22fe2', 9, 44, 'finalizado'),
('145fd745-9947-481c-bf95-08ea61469940', 'b9fdcf84-0ef9-4455-ad9b-81658eebef16', 9.5, 36, 'finalizado'),
('146a26a1-fbcb-4ace-ac16-8f042c81b107', 'e4f7958d-531d-4105-a0af-bce6ed8165af', 9, 0, 'deseado'),
('18780c78-caa0-4d22-8493-7ec1ea34d2ae', '8b31211a-9282-462f-b9c6-253b54c090ef', 10, 39, 'finalizado'),
('18780c78-caa0-4d22-8493-7ec1ea34d2ae', '9225ec46-28d5-11ef-9ef3-0242ac130002', 5, 57, 'jugando'),
('18780c78-caa0-4d22-8493-7ec1ea34d2ae', '9aba3556-0af7-48fc-9ed7-8d2738b22fe2', 9, 15, 'pendiente'),
('18780c78-caa0-4d22-8493-7ec1ea34d2ae', 'a79712d8-f2a9-408a-9678-c8bf2763327c', 9.5, 77, 'jugando'),
('18780c78-caa0-4d22-8493-7ec1ea34d2ae', 'a7d9978a-ac54-4d78-a5db-d50de4ae7412', 6, 22, 'finalizado'),
('18780c78-caa0-4d22-8493-7ec1ea34d2ae', 'b9fdcf84-0ef9-4455-ad9b-81658eebef16', 3.5, 40, 'jugando'),
('18bc8cfc-cc80-4d8f-b866-6dcce1ac06ac', '9225ec46-28d5-11ef-9ef3-0242ac130002', 10, 1000000, 'jugando'),
('18bc8cfc-cc80-4d8f-b866-6dcce1ac06ac', '9aba3556-0af7-48fc-9ed7-8d2738b22fe2', 1, 1, 'finalizado'),
('1b49e9de-0f04-4be9-850c-962a968267c3', '9225ec46-28d5-11ef-9ef3-0242ac130002', 10, 200, 'jugando'),
('29cf76c7-fc6c-4b04-bb25-b84233b02d29', '077d2f82-3ee3-4db3-b6e2-c1de4cc3a89c', 7.5, 17, 'jugando'),
('29cf76c7-fc6c-4b04-bb25-b84233b02d29', '1bd59b93-15b3-4a85-ae71-1173b3982abb', 7, 30, 'finalizado'),
('29cf76c7-fc6c-4b04-bb25-b84233b02d29', '29ed79c8-f677-47a7-a8a9-1566ecea58e9', 8, 24, 'jugando'),
('29cf76c7-fc6c-4b04-bb25-b84233b02d29', '2c792aa8-e024-43d3-8ebd-c253924bfc11', 6, 44, 'finalizado'),
('29cf76c7-fc6c-4b04-bb25-b84233b02d29', '55a377ea-0f31-4390-a1e7-39066e69516b', 8, 12, 'jugando'),
('29cf76c7-fc6c-4b04-bb25-b84233b02d29', 'b9fdcf84-0ef9-4455-ad9b-81658eebef16', 6, 30, 'jugando'),
('2adb046e-d26a-47a0-8a39-edb030b5340e', '6cb1b70f-3bc8-4b20-9f50-a1620f0f6aee', 10, 53, 'finalizado'),
('2adb046e-d26a-47a0-8a39-edb030b5340e', '8b31211a-9282-462f-b9c6-253b54c090ef', 8.5, 47, 'jugando'),
('2adb046e-d26a-47a0-8a39-edb030b5340e', '9225ec46-28d5-11ef-9ef3-0242ac130002', 5.5, 77, 'jugando'),
('2adb046e-d26a-47a0-8a39-edb030b5340e', '9aba3556-0af7-48fc-9ed7-8d2738b22fe2', 9, 35, 'finalizado'),
('2adb046e-d26a-47a0-8a39-edb030b5340e', 'a79712d8-f2a9-408a-9678-c8bf2763327c', 6, 37, 'jugando'),
('2adb046e-d26a-47a0-8a39-edb030b5340e', 'a7d9978a-ac54-4d78-a5db-d50de4ae7412', 8, 22, 'finalizado'),
('2adb046e-d26a-47a0-8a39-edb030b5340e', 'b9fdcf84-0ef9-4455-ad9b-81658eebef16', 9.5, 51, 'finalizado'),
('2adb046e-d26a-47a0-8a39-edb030b5340e', 'd98cf431-ff6f-4999-8489-8cacd7a2f1e1', 9, 54, 'finalizado'),
('2d736ba5-5787-47af-9e4b-8ec35b2e7735', '077d2f82-3ee3-4db3-b6e2-c1de4cc3a89c', 4.5, 35, 'finalizado'),
('2d736ba5-5787-47af-9e4b-8ec35b2e7735', '1bd59b93-15b3-4a85-ae71-1173b3982abb', 4.5, 18, 'jugando'),
('2d736ba5-5787-47af-9e4b-8ec35b2e7735', '29ed79c8-f677-47a7-a8a9-1566ecea58e9', 7, 44, 'finalizado'),
('2d736ba5-5787-47af-9e4b-8ec35b2e7735', '2c792aa8-e024-43d3-8ebd-c253924bfc11', 7.5, 16, 'jugando'),
('2d736ba5-5787-47af-9e4b-8ec35b2e7735', '55a377ea-0f31-4390-a1e7-39066e69516b', 9, 38, 'finalizado'),
('2d736ba5-5787-47af-9e4b-8ec35b2e7735', '5b68df3d-5aab-4b2b-8033-6d7739c0827a', 6, 58, 'jugando'),
('2d736ba5-5787-47af-9e4b-8ec35b2e7735', '88f72392-c52b-41ac-a6b6-11adee22ca04', 5.5, 76, 'jugando'),
('37b3ac59-9b2d-4528-9121-407d12d90db1', '8b31211a-9282-462f-b9c6-253b54c090ef', 9, 37, 'finalizado'),
('37b3ac59-9b2d-4528-9121-407d12d90db1', '9225ec46-28d5-11ef-9ef3-0242ac130002', 4.5, 19, 'jugando'),
('37b3ac59-9b2d-4528-9121-407d12d90db1', '9aba3556-0af7-48fc-9ed7-8d2738b22fe2', 9.5, 13, 'jugando'),
('37b3ac59-9b2d-4528-9121-407d12d90db1', 'b9fdcf84-0ef9-4455-ad9b-81658eebef16', 9.5, 33, 'finalizado'),
('48d62b9b-a876-4ef7-8829-97f753d0ea89', '077d2f82-3ee3-4db3-b6e2-c1de4cc3a89c', 6.5, 25, 'finalizado'),
('48d62b9b-a876-4ef7-8829-97f753d0ea89', '1bd59b93-15b3-4a85-ae71-1173b3982abb', 4.5, 22, 'jugando'),
('48d62b9b-a876-4ef7-8829-97f753d0ea89', '29ed79c8-f677-47a7-a8a9-1566ecea58e9', 6, 12, 'jugando'),
('48d62b9b-a876-4ef7-8829-97f753d0ea89', '2c792aa8-e024-43d3-8ebd-c253924bfc11', 8, 21, 'finalizado'),
('48d62b9b-a876-4ef7-8829-97f753d0ea89', '55a377ea-0f31-4390-a1e7-39066e69516b', 9, 30, 'finalizado'),
('48d62b9b-a876-4ef7-8829-97f753d0ea89', '5b68df3d-5aab-4b2b-8033-6d7739c0827a', 7, 6, 'jugando'),
('48d62b9b-a876-4ef7-8829-97f753d0ea89', '88f72392-c52b-41ac-a6b6-11adee22ca04', 6.5, 11, 'jugando'),
('530f658a-cb39-4335-93a6-08dfb422dde9', '015ee8ef-521f-44cd-b9ad-b1f17f3509a8', -1, 0, 'pendiente'),
('530f658a-cb39-4335-93a6-08dfb422dde9', '9225ec46-28d5-11ef-9ef3-0242ac130002', 5, 30, 'jugando'),
('530f658a-cb39-4335-93a6-08dfb422dde9', '9aba3556-0af7-48fc-9ed7-8d2738b22fe2', 9.5, 100, 'finalizado'),
('530f658a-cb39-4335-93a6-08dfb422dde9', 'b8a0aad2-a59b-453b-9e43-6605363ae347', -1, 0, 'deseado'),
('59915e37-7049-43d0-b1f7-3dbfad192b78', '077d2f82-3ee3-4db3-b6e2-c1de4cc3a89c', 8, 35, 'finalizado'),
('59915e37-7049-43d0-b1f7-3dbfad192b78', '1bd59b93-15b3-4a85-ae71-1173b3982abb', 6, 14, 'jugando'),
('59915e37-7049-43d0-b1f7-3dbfad192b78', '29ed79c8-f677-47a7-a8a9-1566ecea58e9', 6.5, 33, 'jugando'),
('59915e37-7049-43d0-b1f7-3dbfad192b78', '2c792aa8-e024-43d3-8ebd-c253924bfc11', 8, 32, 'finalizado'),
('59915e37-7049-43d0-b1f7-3dbfad192b78', '55a377ea-0f31-4390-a1e7-39066e69516b', 8.5, 33, 'finalizado'),
('59915e37-7049-43d0-b1f7-3dbfad192b78', '5b68df3d-5aab-4b2b-8033-6d7739c0827a', 7.5, 22, 'jugando'),
('59915e37-7049-43d0-b1f7-3dbfad192b78', '6cb1b70f-3bc8-4b20-9f50-a1620f0f6aee', 8.5, 29, 'finalizado'),
('59915e37-7049-43d0-b1f7-3dbfad192b78', '88f72392-c52b-41ac-a6b6-11adee22ca04', 8, 17, 'jugando'),
('6e785ef7-fc51-4f34-b5d0-5201f059506b', '5b68df3d-5aab-4b2b-8033-6d7739c0827a', 4, 45, 'jugando'),
('6e785ef7-fc51-4f34-b5d0-5201f059506b', '6cb1b70f-3bc8-4b20-9f50-a1620f0f6aee', 9.5, 37, 'finalizado'),
('6e785ef7-fc51-4f34-b5d0-5201f059506b', '88f72392-c52b-41ac-a6b6-11adee22ca04', 7.5, 10, 'jugando'),
('6e785ef7-fc51-4f34-b5d0-5201f059506b', '8b31211a-9282-462f-b9c6-253b54c090ef', 7, 28, 'finalizado'),
('6e785ef7-fc51-4f34-b5d0-5201f059506b', '9225ec46-28d5-11ef-9ef3-0242ac130002', 5, 39, 'jugando'),
('6e785ef7-fc51-4f34-b5d0-5201f059506b', '9aba3556-0af7-48fc-9ed7-8d2738b22fe2', 8.5, 28, 'finalizado'),
('6e785ef7-fc51-4f34-b5d0-5201f059506b', 'a79712d8-f2a9-408a-9678-c8bf2763327c', 8, 21, 'jugando'),
('6e785ef7-fc51-4f34-b5d0-5201f059506b', 'a7d9978a-ac54-4d78-a5db-d50de4ae7412', 5.5, 17, 'finalizado'),
('6e785ef7-fc51-4f34-b5d0-5201f059506b', 'b9fdcf84-0ef9-4455-ad9b-81658eebef16', 8.5, 31, 'finalizado'),
('73866ea2-e3c7-4a2e-b42e-73a21455236d', 'a79712d8-f2a9-408a-9678-c8bf2763327c', 8.5, 19, 'jugando'),
('73866ea2-e3c7-4a2e-b42e-73a21455236d', 'a7d9978a-ac54-4d78-a5db-d50de4ae7412', 8.5, 31, 'finalizado'),
('73866ea2-e3c7-4a2e-b42e-73a21455236d', 'cd4bfb6d-ccfb-4bf2-8ac5-11343f1ab2aa', 7, 29, 'finalizado'),
('73866ea2-e3c7-4a2e-b42e-73a21455236d', 'd98cf431-ff6f-4999-8489-8cacd7a2f1e1', 8.5, 47, 'finalizado'),
('73866ea2-e3c7-4a2e-b42e-73a21455236d', 'e4f7958d-531d-4105-a0af-bce6ed8165af', 3.5, 16, 'jugando'),
('73866ea2-e3c7-4a2e-b42e-73a21455236d', 'eeea77cc-2f49-4a1d-b847-686af6939702', 6, 22, 'finalizado'),
('73866ea2-e3c7-4a2e-b42e-73a21455236d', 'f77921b4-9731-41c9-a8ec-addbbf90dced', 2.5, 31, 'finalizado'),
('81877c9d-e2bd-42e8-a8fa-f2f5d82c901b', 'cd4bfb6d-ccfb-4bf2-8ac5-11343f1ab2aa', 8.5, 28, 'finalizado'),
('81877c9d-e2bd-42e8-a8fa-f2f5d82c901b', 'd98cf431-ff6f-4999-8489-8cacd7a2f1e1', 10, 23, 'jugando'),
('81877c9d-e2bd-42e8-a8fa-f2f5d82c901b', 'e4f7958d-531d-4105-a0af-bce6ed8165af', 7, 26, 'finalizado'),
('81877c9d-e2bd-42e8-a8fa-f2f5d82c901b', 'eeea77cc-2f49-4a1d-b847-686af6939702', 7.5, 46, 'finalizado'),
('81877c9d-e2bd-42e8-a8fa-f2f5d82c901b', 'f77921b4-9731-41c9-a8ec-addbbf90dced', 4.5, 14, 'jugando'),
('8749dd16-56df-46ad-87d6-75de87858261', 'cd4bfb6d-ccfb-4bf2-8ac5-11343f1ab2aa', 7, 24, 'finalizado'),
('8749dd16-56df-46ad-87d6-75de87858261', 'd98cf431-ff6f-4999-8489-8cacd7a2f1e1', 8, 19, 'finalizado'),
('8749dd16-56df-46ad-87d6-75de87858261', 'e4f7958d-531d-4105-a0af-bce6ed8165af', 8.5, 19, 'finalizado'),
('8749dd16-56df-46ad-87d6-75de87858261', 'eeea77cc-2f49-4a1d-b847-686af6939702', 6, 29, 'jugando'),
('8749dd16-56df-46ad-87d6-75de87858261', 'f77921b4-9731-41c9-a8ec-addbbf90dced', 4.5, 20, 'finalizado'),
('93dad882-c651-4f69-a593-d73493c86593', '6cb1b70f-3bc8-4b20-9f50-a1620f0f6aee', 7.5, 36, 'finalizado'),
('93dad882-c651-4f69-a593-d73493c86593', '88f72392-c52b-41ac-a6b6-11adee22ca04', 3.5, 14, 'jugando'),
('93dad882-c651-4f69-a593-d73493c86593', '8b31211a-9282-462f-b9c6-253b54c090ef', 6, 16, 'jugando'),
('93dad882-c651-4f69-a593-d73493c86593', '9225ec46-28d5-11ef-9ef3-0242ac130002', 8.5, 37, 'jugando'),
('93dad882-c651-4f69-a593-d73493c86593', '9aba3556-0af7-48fc-9ed7-8d2738b22fe2', 6, 26, 'finalizado'),
('93dad882-c651-4f69-a593-d73493c86593', 'a7d9978a-ac54-4d78-a5db-d50de4ae7412', 3, 33, 'finalizado'),
('93dad882-c651-4f69-a593-d73493c86593', 'b9fdcf84-0ef9-4455-ad9b-81658eebef16', 9.5, 65, 'finalizado'),
('99f39be1-c48f-4c47-bb7b-5883496cfb89', '8b31211a-9282-462f-b9c6-253b54c090ef', 5.5, 4, 'finalizado'),
('99f39be1-c48f-4c47-bb7b-5883496cfb89', 'a79712d8-f2a9-408a-9678-c8bf2763327c', 8, 50, 'jugando'),
('b1719458-470d-447c-bb30-e86f5c4c33ec', 'a79712d8-f2a9-408a-9678-c8bf2763327c', 6.5, 21, 'jugando'),
('b1719458-470d-447c-bb30-e86f5c4c33ec', 'cd4bfb6d-ccfb-4bf2-8ac5-11343f1ab2aa', 6, 24, 'jugando'),
('b1719458-470d-447c-bb30-e86f5c4c33ec', 'd98cf431-ff6f-4999-8489-8cacd7a2f1e1', 8.5, 45, 'finalizado'),
('b1719458-470d-447c-bb30-e86f5c4c33ec', 'e4f7958d-531d-4105-a0af-bce6ed8165af', 5.5, 28, 'finalizado'),
('b1719458-470d-447c-bb30-e86f5c4c33ec', 'eeea77cc-2f49-4a1d-b847-686af6939702', 5.5, 76, 'finalizado'),
('b1719458-470d-447c-bb30-e86f5c4c33ec', 'f77921b4-9731-41c9-a8ec-addbbf90dced', 5.5, 48, 'finalizado'),
('d24054e0-5e83-4226-bbbc-b5d1d348a250', 'a79712d8-f2a9-408a-9678-c8bf2763327c', 6.5, 35, 'jugando'),
('d24054e0-5e83-4226-bbbc-b5d1d348a250', 'a7d9978a-ac54-4d78-a5db-d50de4ae7412', 4.5, 21, 'finalizado'),
('d24054e0-5e83-4226-bbbc-b5d1d348a250', 'cd4bfb6d-ccfb-4bf2-8ac5-11343f1ab2aa', 9.5, 34, 'finalizado'),
('d24054e0-5e83-4226-bbbc-b5d1d348a250', 'd98cf431-ff6f-4999-8489-8cacd7a2f1e1', 6, 54, 'finalizado'),
('d24054e0-5e83-4226-bbbc-b5d1d348a250', 'e4f7958d-531d-4105-a0af-bce6ed8165af', 5.5, 30, 'finalizado'),
('d24054e0-5e83-4226-bbbc-b5d1d348a250', 'eeea77cc-2f49-4a1d-b847-686af6939702', 8, 57, 'finalizado'),
('d24054e0-5e83-4226-bbbc-b5d1d348a250', 'f77921b4-9731-41c9-a8ec-addbbf90dced', 4, 43, 'finalizado'),
('d5fe33c0-f267-41ea-96e7-9bf07afd51ea', '077d2f82-3ee3-4db3-b6e2-c1de4cc3a89c', 4.5, 28, 'jugando'),
('d5fe33c0-f267-41ea-96e7-9bf07afd51ea', '1bd59b93-15b3-4a85-ae71-1173b3982abb', 4, 9, 'jugando'),
('d5fe33c0-f267-41ea-96e7-9bf07afd51ea', '29ed79c8-f677-47a7-a8a9-1566ecea58e9', 9, 21, 'finalizado'),
('d5fe33c0-f267-41ea-96e7-9bf07afd51ea', '2c792aa8-e024-43d3-8ebd-c253924bfc11', 8, 17, 'finalizado'),
('d5fe33c0-f267-41ea-96e7-9bf07afd51ea', '55a377ea-0f31-4390-a1e7-39066e69516b', 9, 38, 'finalizado'),
('eeaf48be-7f9a-4636-9ffb-358ce162aaef', '077d2f82-3ee3-4db3-b6e2-c1de4cc3a89c', 7.5, 21, 'finalizado'),
('eeaf48be-7f9a-4636-9ffb-358ce162aaef', '1bd59b93-15b3-4a85-ae71-1173b3982abb', 6.5, 39, 'finalizado'),
('eeaf48be-7f9a-4636-9ffb-358ce162aaef', '29ed79c8-f677-47a7-a8a9-1566ecea58e9', 4.5, 29, 'jugando'),
('eeaf48be-7f9a-4636-9ffb-358ce162aaef', '2c792aa8-e024-43d3-8ebd-c253924bfc11', 8.5, 20, 'jugando'),
('eeaf48be-7f9a-4636-9ffb-358ce162aaef', '55a377ea-0f31-4390-a1e7-39066e69516b', 5.5, 43, 'finalizado'),
('eeaf48be-7f9a-4636-9ffb-358ce162aaef', '5b68df3d-5aab-4b2b-8033-6d7739c0827a', 4.5, 18, 'jugando');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genre`
--

CREATE TABLE `genre` (
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:uuid)',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `genre`
--

INSERT INTO `genre` (`uuid`, `name`) VALUES
('1284f66f-0bf4-4c27-8471-17c951b1fa8c', 'Deporte'),
('1dc3ffea-2011-4b93-8930-9205ad4f3eb3', 'Puzzle'),
('26a5a65e-0a96-4015-ad6d-03594c1c4a3d', 'Lucha'),
('37b7a986-f312-4df8-92c4-37edfd7d6def', 'Acción'),
('52955f5e-245f-44ac-aeb1-d7fe33f9f675', 'Hack and Slash'),
('55e1bb87-4c65-4739-a9da-4bcd78a982ad', 'Supervivencia'),
('693f19db-1e7d-4239-bc8f-413a43434b0f', 'Simulación'),
('6a1442f0-c41e-4925-8d19-5ff0a77aa591', 'Musou'),
('6aba7419-16f3-4e9a-b0a6-fc56bee26d56', 'Shooter'),
('6ade09bc-328a-42a6-b1b3-66474b08c41b', 'Carreras'),
('7522e1af-9f3a-466f-b07f-b2d95c5148c1', 'Primera persona'),
('76a90fc0-c345-4fec-ab3e-12c065a3dd44', 'RPG'),
('79323cf2-f732-401a-912c-4f643e747ef8', 'Estrategia'),
('7e039483-f2af-47e8-b96e-cdf58d8352b6', 'Aventura'),
('97583047-4aff-4c5f-8649-6ebb00f5b03e', 'Plataformas'),
('a3c0afd7-ace4-4325-992f-4b6b9d3326ea', 'Musical'),
('a7dc4a13-7647-4d88-b049-508acd319e9c', 'Terror'),
('aba77def-c8d1-4ecb-8744-20a925ba85ec', 'Novela visual'),
('abfcd767-7739-43cc-baa7-8e7e852c5db6', 'Tercera persona'),
('b5103f61-3fe5-46fd-b6ad-abc8ca19f2ab', 'Mundo Abierto'),
('e6a50b04-2fc7-4403-96a0-0099f65cc06d', 'JRPG');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platform`
--

CREATE TABLE `platform` (
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:uuid)',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `platform`
--

INSERT INTO `platform` (`uuid`, `name`) VALUES
('1108498e-135a-473d-be69-65f3ff5b73b1', 'Xbox 360'),
('3d799b11-07b0-4244-97e2-eba3d7c03061', 'Nintendo Switch'),
('412b141b-6e1b-4423-a99e-2c57837a7f26', 'PlayStation 4'),
('68cd8256-a79a-48b8-a59b-0f37994f261d', 'PC'),
('958bc361-aa9b-4af4-a06a-7b0aedfc3a17', 'Móvil'),
('95fa6337-190d-477d-a2b7-e26c245459f9', 'PlayStation 5'),
('a42e8a4c-f1c0-4070-95c4-283870e50408', 'PlayStation 3'),
('b316445f-a6a4-40e3-9a65-d81b81f7f1d8', 'Xbox Series X/S'),
('fea05831-27d0-4eff-8181-9aecddb28300', 'Xbox One');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:uuid)',
  `roles` json NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`uuid`, `roles`, `email`, `password`, `username`) VALUES
('01a3b419-b492-4909-8bed-1ec0c95390d0', '[\"ROLE_USER\"]', 'pedro@pedro.com', '$2y$13$uDW2WcfTfJ33iYUxwn6rNePQerHSOtRFmDITD17v/JMtVSjPWBWUu', 'pedro'),
('07193843-bf00-4791-bc64-5ff2305666ae', '[\"ROLE_USER\"]', 'cris@cris.com', '$2y$13$RDgdenN9GlSukZAvxE57SOC6BtqsmrZ/EhcG3Ql66NjvYzZQwRdZi', 'cris'),
('0b38ed42-afe5-4309-9b42-bc42c986c634', '[\"ROLE_USER\"]', 'raul@raul.com', '$2y$13$SVez0xUSrvZlNyLjelCNUestRDmNoxoygnKkaqmHffT7dGtrR5tb.', 'raul'),
('145fd745-9947-481c-bf95-08ea61469940', '[\"ROLE_USER\"]', 'lucas@lucas.com', '$2y$13$tDQXo.8zKcuvxlBRvE7TKOGmSX8Wvpuk9HLkdKg5i7sWAxuf1x1O.', 'lucas'),
('146a26a1-fbcb-4ace-ac16-8f042c81b107', '[\"ROLE_USER\"]', 'depredador@gmail.com', '$2y$13$DAfa8X/mT9ahRLIz88CDD./ghsdD8dHpDzXsId8P.rhWpM7Jw/mjy', 'eldepredador'),
('18780c78-caa0-4d22-8493-7ec1ea34d2ae', '[\"ROLE_USER\"]', 'sergio@sergio.com', '$2y$13$o5MN112rzZUZUUCfqRWR8eOHmpUhwqbiTkp29RxkgWUYHK0K87g3y', 'sergio'),
('18bc8cfc-cc80-4d8f-b866-6dcce1ac06ac', '[\"ROLE_USER\"]', 'ruben@ket.com', '$2y$13$A0ivL7q1YjkhfcoQOTlaUum4PGQDND0wUHX8/YUUaAcdEZAh53FC2', 'rubenket'),
('1b49e9de-0f04-4be9-850c-962a968267c3', '[\"ROLE_USER\"]', 'carmenvazquespinosa@gmail.com', '$2y$13$Co.fOfLFHOdvYeRVgC2SC.twys9BIlANPC8TBgaUoajvkF6abFHXu', 'LaGordi'),
('29cf76c7-fc6c-4b04-bb25-b84233b02d29', '[\"ROLE_USER\"]', 'marta@marta.com', '$2y$13$ataaaYG6Pi7dhcr6Xusj3.jNRMDDXCiyqzFr9M.B7z2JxHF66a6cK', 'marta'),
('2adb046e-d26a-47a0-8a39-edb030b5340e', '[\"ROLE_USER\"]', 'angel@angel.com', '$2y$13$d73Tb1.bMFXZ/mTIJlSdjuZtBfmGaVwCd/DLWZ0XU878yAnqXQm7u', 'angel'),
('2d736ba5-5787-47af-9e4b-8ec35b2e7735', '[\"ROLE_USER\"]', 'carmen@carmen.com', '$2y$13$D.MUiXoIJNQa.UE54zt1uelew6Rt.PZF2jtzejVvC2GUxHp629NO2', 'carmen'),
('37b3ac59-9b2d-4528-9121-407d12d90db1', '[\"ROLE_USER\"]', 'lara@lara.com', '$2y$13$4FnFH4pDgwyarh6JEdJ.t.9zQKMXOELPJbLi.S06AXTYuzeHwQcqC', 'lara'),
('48b8c7fa-e62d-4177-ad7b-adcdfdc8c255', '[\"ROLE_USER\"]', 'test@test.com', '$2y$13$.FV7cLRpRSmxhGoD7nfysOAWq/.Sjg9LRG2KwosJKjPVvB.w/nMnm', 'test'),
('48d62b9b-a876-4ef7-8829-97f753d0ea89', '[\"ROLE_USER\"]', 'tere@tere.com', '$2y$13$2Par.jEyGMCldIQi/2i2J.qNEgj9aSyIlKtTR3Q01KsS64LtVkChe', 'tere'),
('530f658a-cb39-4335-93a6-08dfb422dde9', '[\"ROLE_USER\"]', 'juan@juan.com', '$2y$13$jdJTHsEg7qH1nQ0s9vq0uuG8P1c07LfBg5MwvRXkBxy/GrYzvKFd.', 'juan'),
('59915e37-7049-43d0-b1f7-3dbfad192b78', '[\"ROLE_USER\"]', 'laura@laura.com', '$2y$13$ZbBvtXyvVZpzbVdC5WW6qOqqI1Gj77EQtpFmdg8sB8Y8QYHga0TkS', 'laura'),
('6e785ef7-fc51-4f34-b5d0-5201f059506b', '[\"ROLE_USER\"]', 'mateo@mateo.com', '$2y$13$mS7bashUG8lWTmq18Ls/MuxWTHbEw.gLIClCtmMS39x6COBNnLpKq', 'mateo'),
('73866ea2-e3c7-4a2e-b42e-73a21455236d', '[\"ROLE_USER\"]', 'jorge@jorge.com', '$2y$13$hC1tUNq4qMqW4B/SAbBoiOMQFV761INAokEA40hcqfS2bSrGqJYWu', 'jorge'),
('81877c9d-e2bd-42e8-a8fa-f2f5d82c901b', '[\"ROLE_USER\"]', 'ana@ana.com', '$2y$13$DnIfYPoxa7gF1UjqOm4d9uFYqGWk9M0lgH8G/FAkzLbbhwdiehA3m', 'ana'),
('8749dd16-56df-46ad-87d6-75de87858261', '[\"ROLE_USER\"]', 'alba@alba.com', '$2y$13$3VfC4OHKgDrOsuI.9sVM4eqxmdJjSwJYLXnv.nqn5DOmXVJQfF3Ii', 'alba'),
('93dad882-c651-4f69-a593-d73493c86593', '[\"ROLE_USER\"]', 'juanmi@juanmi.com', '$2y$13$enSXzJnFdtlH1zFQ5t561eI3k6di89L1H1SFm1p7uIJxnk2EHYkJu', 'juanmi'),
('99f39be1-c48f-4c47-bb7b-5883496cfb89', '[\"ROLE_USER\"]', 'sergiogarciagonzalez94@gmail.com', '$2y$13$lPMKHJgUbvaVmAIvZHfAn.Pq1PeUw8IpOjLGOV027P.MDADBPfAx2', 'Mendigo'),
('b1719458-470d-447c-bb30-e86f5c4c33ec', '[\"ROLE_USER\"]', 'kike@kike.com', '$2y$13$jzNtdeHxrcG.AsiP.02KVuw7.wV89j5slgku2wIm5tuhAHZzGRtre', 'kike'),
('d24054e0-5e83-4226-bbbc-b5d1d348a250', '[\"ROLE_USER\"]', 'pepe@pepe.com', '$2y$13$/drZQVMpdGsy1hSebPUk9ux2bj.6rqGsKchKr/mmjB7ja0I4qlcmO', 'pepe'),
('d5fe33c0-f267-41ea-96e7-9bf07afd51ea', '[\"ROLE_USER\"]', 'kalvyn@kalvyn.com', '$2y$13$r1eWqYoo7YOs6CCXQOzs3.8qbDi9HxeIAxB9H6gqAr7xlvIaG1AF.', 'kalvyn'),
('eeaf48be-7f9a-4636-9ffb-358ce162aaef', '[\"ROLE_USER\"]', 'maria@maria.com', '$2y$13$w0b2SBqKE6oKqyK2vONRV.aQaSHb3FE9nVhlD688r4hIgQ85Op6P.', 'maria');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indices de la tabla `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`uuid`);

--
-- Indices de la tabla `game_genre`
--
ALTER TABLE `game_genre`
  ADD PRIMARY KEY (`game_uuid`,`genre_uuid`),
  ADD KEY `IDX_B1634A773A6A3C8A` (`game_uuid`),
  ADD KEY `IDX_B1634A776A928956` (`genre_uuid`);

--
-- Indices de la tabla `game_platform`
--
ALTER TABLE `game_platform`
  ADD PRIMARY KEY (`game_uuid`,`platform_uuid`),
  ADD KEY `IDX_92162FED3A6A3C8A` (`game_uuid`),
  ADD KEY `IDX_92162FED5577378A` (`platform_uuid`);

--
-- Indices de la tabla `game_user`
--
ALTER TABLE `game_user`
  ADD PRIMARY KEY (`user_uuid`,`game_uuid`),
  ADD KEY `IDX_6686BA65ABFE1C6F` (`user_uuid`),
  ADD KEY `IDX_6686BA653A6A3C8A` (`game_uuid`);

--
-- Indices de la tabla `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`uuid`);

--
-- Indices de la tabla `platform`
--
ALTER TABLE `platform`
  ADD PRIMARY KEY (`uuid`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uuid`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`),
  ADD UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `game_genre`
--
ALTER TABLE `game_genre`
  ADD CONSTRAINT `FK_B1634A773A6A3C8A` FOREIGN KEY (`game_uuid`) REFERENCES `game` (`uuid`),
  ADD CONSTRAINT `FK_B1634A776A928956` FOREIGN KEY (`genre_uuid`) REFERENCES `genre` (`uuid`);

--
-- Filtros para la tabla `game_platform`
--
ALTER TABLE `game_platform`
  ADD CONSTRAINT `FK_92162FED3A6A3C8A` FOREIGN KEY (`game_uuid`) REFERENCES `game` (`uuid`),
  ADD CONSTRAINT `FK_92162FED5577378A` FOREIGN KEY (`platform_uuid`) REFERENCES `platform` (`uuid`);

--
-- Filtros para la tabla `game_user`
--
ALTER TABLE `game_user`
  ADD CONSTRAINT `FK_6686BA653A6A3C8A` FOREIGN KEY (`game_uuid`) REFERENCES `game` (`uuid`),
  ADD CONSTRAINT `FK_6686BA65ABFE1C6F` FOREIGN KEY (`user_uuid`) REFERENCES `user` (`uuid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
