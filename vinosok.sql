-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 21-06-2024 a las 10:08:22
-- Versión del servidor: 8.0.33
-- Versión de PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `vinos`
--
/*CREATE DATABASE IF NOT EXISTS `vinos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `vinos`;
*/
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre`, `descripcion`) VALUES
(1, 'Tinto Malbec', 'Malbec'),
(2, 'Blanco Chardonnay', 'Chardonnay'),
(3, 'Dulce', 'Dulce');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `id_producto` int NOT NULL,
  `nombre` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `descripcion` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `stock` int NOT NULL,
  `id_categoria` int NOT NULL, /* agredado id*/
  `imagen` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `categoria` (`id_categoria`) /* agregado id*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--
/*
INSERT INTO `productos` (`id_producto`, `nombre`, `precio`, `descripcion`, `stock`, `categoria`, `imagen`) VALUES
(1, 'Perro Callejero - Malbec', 6240, 'Información: \r\n\r\nZonas:\r\nPerdriel| 50% Malbec\r\nEl Manzano| 25% Malbec\r\nLos Chacayes | 25% Malbec\r\n\r\nMaduración en barricas usadas de roble francés y americano\r\ndurante 6 meses.', 300, 1, '1.png'),
(2, 'Killka - Malbec', 5220, 'Información:\r\n \r\nColor rojo violáceo, aromas que reflejan la típica fruta de malbec, \r\nciruelas frescas y moras con un final de vainilla. En boca es amable, \r\nredondo y de final largo.', 300, 1, '2.png'),
(3, 'Santa Julia - Malbec', 2850, 'Información: \r\n\r\nExpresan la tipicidad de cada variedad provenientes de las diferentes \r\nzonas vitivinícolas de Mendoza, y es un fiel reflejo de la filosofía \r\nde la bodega en la elaboración de vinos frescos y frutados.\r\nDestaca por su carácter frutado y un excelente equilibrio entre \r\ntaninos, alcohol y acidez.', 300, 1, '3.png'),
(4, 'La Linda - Malbec', 6200, 'Información: \r\n\r\nLa Linda Malbec es un vino de color rojo violáceo vivaz. En nariz \r\nexpresa los aromas típicos de la variedad: frutas rojas, como guinda \r\ny mora, más notas especiadas y florales muy delicadas. Llena el \r\npaladar con intensidad frutal, muy buen cuerpo y textura sedosa. \r\nSus taninos son maduros y su acidez equilibrada. Es un varietal de \r\ngran tipicidad y estilo moderno, elegante, de excelente estructura \r\ny volumen.\r\n\r\nPotencial de guarda: 8 años.\r\nTemperatura recomendada de servicio: Entre 16°C y 18°C.\r\nMaridajes: Acompaña muy bien platos a base de carnes rojas magras, \r\npastas rellenas y quesos duros con carácter.\r\nAnálisis básicos: Alcohol: 13,40° PH: 3,70 Acidez total: 5,25 g/l \r\nAzúcar residual: 2,02 g/l', 300, 1, '4.png'),
(5, 'Escorihuela Gascón - Malbec', 7490, 'Información: \r\n\r\nGUARDA: 60% del corte pasa 8 meses en contacto con roble francés \r\ny americano. \r\nCOLOR: Rojo rubí concentrado y brillante con reflejos violáceos. \r\nNARIZ: Agradable tipicidad que se vale de aromas frutales como moras, \r\narándanos, violetas y ciruelas. Confitura de frutos negros, especias \r\ny dejos tostados aportados por la crianza en barricas. \r\nPALADAR: Malbec de paladar sabroso y buen jugo. Ofrece buena \r\ncomplejidad en boca con sabores frutales en primera línea pero \r\ntambién especiados y balsámicos. Buen equilibrio entre el alcohol \r\ny la frescura con taninos dulces y amables. Final largo con regusto \r\nfrutal. Vino ideal para carnes rojas asadas y pastas con salsas \r\nmediterráneas. \r\nPOTENCIAL DE GUARDA: 8 años. ', 300, 1, '5.png'),
 (6, 'Luigi Bosca - Malbec', 9270, 'Información: \r\n\r\nEs un vino de un color rojo intenso y tintes violáceos. Tiene aromas \r\nexpresivos y agradables a frutos rojos maduros (ciruela) y sutiles \r\nnotas especiadas y de granos de café producto de su crianza en \r\nbarricas. \r\nEn boca es compacto, intenso, de sabores frutales y buen volumen. \r\nTaninos dulces y acidez equilibrada. Un tinto puro, de gran cuerpo, \r\nestructura, carácter y toda la jugosidad típica de la variedad. \r\nPermanencia larga y final de boca elegante.\r\n\r\nVariedad: Malbec 100%.\r\nPotencial de guarda: 10 años.\r\nTemperatura recomendada de servicio: Entre 16°C y 18°C.\r\nMaridajes: Ideal para acompañar carnes rojas grilladas o a la \r\nparrilla, ciervo y quesos duros.\r\nCrianza en barricas: El vino se cría en barricas de roble francés \r\ndurante 12 meses.\r\nAnálisis básicos: Alcohol: 13,80° PH: 3,60 Acidez total: 5,25 g/l \r\nAzúcar residual: 1,90 g/l', 300, 1, '6.png'),
(7, 'Trumpeter - Malbec', 7800, 'Información: \r\n\r\nRojo violáceo brillante, seduce con sus aromas frutales (ciruela) \r\ny especiados (canela, cardamomo, pimienta negra). Posee gran cuerpo \r\ny su vivaz estructura acentúa los taninos intensos que se vuelven \r\naterciopelados en el retrogusto.\r\n\r\nVariedad: 100% Malbec.\r\nViñedo: Valle de Uco.\r\nCrianza: 7 meses el 50% del corte.\r\nTipo roble: 50% americano nuevo, 50% francés nuevo.\r\nEnólogo: Mariano Di Paola.', 300, 1, '7.png'),
(8, 'Salentein - Malbec', 7390, 'Información:\r\n \r\nA la vista presenta color rojo/violeta de alta intensidad.\r\n \r\nEn nariz se percibe fresco, intenso y complejo, se destacan \r\naromas a frutos rojos, bayas negras, delicadas notas florales.\r\n\r\nEn la boca presenta entrada dulce y suave, es fresco, frutado y \r\nde buena intensidad, amplio en la media boca y largo final.', 300, 1, '8.png'),
(9, 'Cafayate - Malbec', 2590, 'Información: \r\n\r\nDe color rojo carmín intenso con destellos violetas oscuros, \r\npresenta aromas a frutos rojos cocidos como fresas, ciruelas y \r\nuvas pasas, fusionados con notas terrosas, cuero y especias como \r\npimienta negra. \r\n\r\nEn boca es amable y sereno, de buen cuerpo, redondo, con taninos \r\nsuaves y dulces, lo que proporciona un largo y agradable final.', 300, 1, '9.png'),
(10, 'Animal - Malbec Organico', 7990, 'Información:\r\n\r\nComposición Varietal: Malbec 100%\r\nCrianza: 10 meses en barricas de roble francés 50% y americano 50%\r\nMaridaje: Por su estructura y complejidad este vino es ideal para \r\nacompañarlo con carnes de tipo vacuno, cerdo y pescados a la \r\nparrilla, realzando el sabor de salsas especiadas, legumbres \r\nestofadas, y quesos curados como el Manchego.\r\nTemperatura de servicio: 16 – 18 °C\r\nPotencial de guarda: 8 Años', 400, 1, '10.png'),
(11, 'Latitud 33 - Malbec', 4240, 'Información:\r\n\r\nColor: Rojo rubí con reflejos azulados.\r\n\r\nAroma: Intenso y fresco. Se destacan aromas a frutos rojos como \r\ncerezas y ciruelas, acompañadas de suaves notas a especias, \r\nvainilla y caramelo.\r\n\r\nSabor: Redondo, vivo, frutado e intenso. De cuerpo medio, suave \r\ny cremoso, con buena presencia aromática.', 250, 1, '11.png'),
(12, 'Chañarmuyo - Malbec', 8900, 'Información:\r\n\r\nComposición Varietal: 100% Malbec\r\n\r\nNotas de Cata: Para nuestra linea Entry Level, preservamos la \r\nfruta y apuntamos a un vino joven, donde buscamos que las notas \r\nde fruta fresca sobresalgan del resto. Este Malbec puro es fiel \r\nexpresión del terroir, de gran intensidad y tipicidad varietal. \r\nLa amplitud térmica propia de la altura confiere gran \r\nconcentración de frutas y taninos con notas de frutos rojos, \r\nchocolate y menta.\r\n\r\nElaboración del vino: Cosecha a mano, e inmediatamente las uvas \r\nson enfriadas para fijar los compuestos aromáticos y los \r\ncompuestos responsables del color. Los racimos pasan por un \r\ndoble proceso de selección cualitativa (racimos y bayas) y \r\nluego maceración previa en frio de dos a tres días. Sin \r\nclarificado ni filtrado.', 340, 1, '12.png'),
(13, 'Alta Vista - Estate Premium Malbec', 9890, 'Información:\r\n\r\nFruto de terroirs de altura, ubicados a más de 1000ms sobre el \r\nnivel del mar. De producción propia, vinificación y crianza en \r\nnuestra bodega. Es un Malbec redondo y de gran concentración, \r\ncon una crianza de 12 meses en barricas de roble francés.\r\n\r\nNOTA DE CATA: Color rojo con reflejos rubí. Es intenso en nariz, \r\ncon aromas a frutas rojas maduras, como ciruela, y especias. En \r\nboca es redondo, sedoso y posee una gran concentración. Se \r\nrecomienda servirlo fresco, entre 15°C y 16°C. Tiene un \r\npotencial de guarda de hasta 7 años. ', 230, 1, '13.png'),
(14, 'Saint Felicien - Malbec', 9390, 'Información:\r\n\r\nSaint Felicien Malbec es un vino elegante y complejo, de color \r\nvioleta oscuro y profundo, típico del Malbec argentino. En nariz \r\nes intenso y concentrado; presenta aromas de moras maduras con \r\nligeras notas de vainilla, tabaco y licor. En boca, de impacto \r\ndulce y gran complejidad, es untuoso, con taninos suaves y \r\nredondos característicos del viñedo “Angélica”, en Lunlunta.\r\n\r\nVarietal: 100% Malbec\r\nAlcohol: 13.8%\r\nMaceración Peculiar: 26 días.\r\nAñejamiento: 12 meses en roble francés y americano.\r\nAcidez Total: 5.5 gramos/litros\r\npH: 3.73', 450, 1, '14.png'),
(15, 'Altos del Plata - Malbec', 4495, 'Información:\r\n\r\nColor: Rojo intenso y vívido, con brillantes tintes violáceos.\r\n\r\nAroma: Predominan el aroma de frutos rojos como la cereza, \r\nguinda y grosella, con notas especiadas como la nuez moscada \r\ny la pimienta negra, y un leve matiz de vanilla.\r\n\r\nBoca: Redondo y suave. Se destaca por la fruta en boca junto con \r\nuna buena acidez que hacen de él un vino muy fresco y amable.', 210, 1, '15.png'),
(16, 'Zuccardi Q - Malbec', 12800, 'Información:\r\n\r\nEl nombre del rango Zuccardi Q tiene su origen en la práctica \r\nde marcar con una “Q” –de Quality- los lotes más antiguos y \r\nuniformes de cada viñedo, los cuales se trabajaban con especial \r\natención para lograr uvas de cualidades excepcionales.  Hoy, las \r\nuvas con que se elabora Zuccardi Q, provienen de reconocidas \r\nmicro-regiones en el Valle de Uco y viñedos antiguos seleccionados.\r\n\r\nColor púrpura profundo con reflejos azulados. Intensos aromas a \r\nfrutas rojas y negras como cassis, pasas, higos secos y mermelada \r\nde arándanos. \r\nLa crianza en roble francés aporta notas de tabaco y chocolate. \r\nEntrada suave y sedosa, gran estructura con taninos dulces y \r\nfirmes. Largo final.', 420, 1, '16.png'),
(17, 'Rutini - Malbec', 19990, 'Información:\r\n\r\nRojo violáceo, muy intenso. Frutos rojos (cereza, grosella) y una \r\nnota de ciruela muestran la vivacidad de la nariz en este tinto \r\nmuy logrado. El roble francés le aporta sutiles dejos tostados, \r\nen tanto, la barrica americana cede sus clásicos vainillados. \r\nEl paladar de este vino es corpóreo y, al mismo tiempo, \r\ndistinguido, gracias a su concentrado carácter frutal, donde \r\nprevalece la sucrosidad tánica característica de la cepa tinta \r\nde Cahors.\r\n\r\nTemperatura de servicio: 14º-17º C\r\nPotencial de guarda: 10 años\r\nMaridaje: Carnes rojas grilladas y horneadas, lomo vacuno con \r\nhortalizas, cordero asado, pastel de carne y papas, conejo \r\npastoril, pastel de pollo, empanadas de carne, asado al horno \r\ncon papas.\r\nCrianza: 12 meses, 40% francés nuevo, 60% francés de 2do uso.', 310, 1, '17.png'),
(18, 'Padrillos - Malbec', 5390, 'Información:\r\n\r\nColor rojizo oscuro, muy atractivo. En nariz, resulta \r\nasombrosamente aromático para el segmento, apoyado en notas \r\nprotagónicas de ciruelas maduras, cerezas y arándanos. En boca, \r\nse muestra equilibrado, suave y elegante. Sus taninos amables \r\ny su estructura de cuerpo medio lo convierten en un vino fácil \r\nde beber y muy adaptable.\r\n\r\nApto para guarda de unos 4 años, se aconseja decantar el vino \r\npor una hora antes ser degustado. La temperatura adecuada para \r\nsu consumo es entre 16º y 18º C. Es un ejemplar excelente para \r\ncompartir junto a platos de carnes rojas, pastas a la bolognesa \r\no al scarparo, pizzas con rúcula o albahaca, empanadas de carne \r\no de pollo y tablas de fiambres y quesos duros.\r\nCRIANZA / BARRICADO: 65% Roble Francés - 35% Roble Americano \r\n(24% Nuevo). Tiempo en barricas: 6 meses.', 400, 1, '18.png'),
(19, 'Luigi Bosca De Sangre Malbec', 14950, 'Información:\r\n\r\nColor rojo granate brillante, con aromas a frutas negras y \r\nnotas especiadas, más ciertos tonos minerales muy atractivos.\r\n\r\nLa entrada en boca es compacta, con nervio y concentración, y \r\nuna definición limpia, con muy buena fluidez en su paso por el \r\npaladar.\r\n\r\nTaninos finos de textura agradable, gran acidez, firmeza y \r\nequilibrio. \r\nFinal largo y complejo.', 300, 1, '19.png'),
(20, 'Emilia Natural Malbec Rosé', 3990, 'Información:\r\n\r\nDe color rosa tenue que recuerda a los pétalos de rosa estilo \r\nProvence.\r\n\r\nEn nariz, posee una intensa frescura brindada por los aromas \r\na frutos rojos y negros.\r\n\r\nSu acidez le confiere juventud y vivacidad en el paladar.', 330, 1, '20.png'),
(21, 'La Linda - Chardonnay', 6200, 'Información:\r\n\r\nDelicado color amarillo brillante con reflejos dorados verdosos. \r\n\r\nAromas frutales intensos que recuerdan a peras, manzana verde y \r\nduraznos blancos que denotan juventud. \r\n\r\nBoca frutal fresca con marcada acidez.', 300, 2, '21.png'),
(22, 'Luigi Bosca - Chardonnay', 9280, 'Información:\r\n\r\nDe color amarillo dorado, con aromas de ananá, mango y melón. \r\nNotas de miel y pan tostado. Sutil aporte de la vainilla \r\nproveniente de su paso por roble francés.\r\n\r\nVino de sensaciones dulces. Opulento y rotundo.', 320, 2, '22.png'),
(23, 'Cafayate - Chardonnay', 2590, 'Información:\r\n\r\nUn blanco fresco y frutal, con notas de ananá, durazno y melón \r\nmuy sueltas y expresivas. En boca es aromático, con agradables \r\nnotas cítricas y florales, cuerpo medio, textura cremosa y \r\nacidez equilibrada. ', 350, 2, '23.png'),
(24, 'Cordero Con Piel De Lobo - Chardonnay', 4360, 'Información:\r\n\r\nComposición Varietal: 100% Chardonnay\r\n\r\nNotas de Cata: Este Chardonnay es intenso y atractivo desde su \r\ncolor dorado, y muy expresivo en aromas, con notas de frutas \r\ntropicales. \r\nEn boca presenta algo de untuosidad equilibrada con una acidez \r\nnatural justa que termina balanceando perfectamente con el \r\ngrado alcohólico. \r\nPara beber sólo o acompañado de quesos. Un vino fresco que \r\nexpresa la tipicidad varietal y elegancia.\r\n\r\nElaboración del vino: Cosecha a mano, e inmediatamente las \r\nuvas son prensadas para mantener la frescura, tipicidad \r\nvarietal y acidez natural, para luego pasar a fermentación \r\nen tanques de acero inoxidables.', 300, 2, '24.png'),
(25, 'Salentein Reserva - Chardonnay', 7390, 'Información:\r\n\r\nSu color es muy intenso y de matiz verdoso dominante.\r\n\r\nComo parte de un pequeño toque de actualización, estamos \r\nincluyendo en la complejidad, un ligero aroma mineral como \r\ncomplemento a la intensa fruta, como ananá.\r\n\r\nEn boca es amplio, de una acidez firme que remarca su frescura, \r\nla cual se encuentra integrada y absorbida por la gran \r\nconcentración lograda, dejando una boca muy amplia y larga. \r\nRedondo, sin aristas, \r\nlo que indica su muy buena concentración ideal para acompañar \r\ncon comidas. ', 400, 2, '25.png'),
(26, 'Killka - Chardonnay', 5220, 'Información:\r\n\r\nDe color amarillo verdoso con reflejos dorados, presenta aromas \r\nque recuerdan a manzanas y peras con un toque de vainilla y \r\nmiel aportado por su paso por roble. En boca se siente suave \r\ny frutado con muy buena acidez, destacándose su carácter \r\ncítrico mineral.', 200, 2, '26.png'),
(27, 'Solo Contigo - Develado - Chardonnay', 8500, 'Información:\r\n\r\nDe color amarillo verdoso con reflejos plateados, aromas a \r\nfrutas tropicales, hierbas y minerales.\r\n\r\nRefrescante acidez. Aterciopelado con largo final en boca.', 400, 2, '27.png'),
(28, 'Perro Callejero - Chardonnay', 6240, 'Información:\r\n\r\n100% Chardonnay\r\nNotas de cata: Es de color amarillo brillante, con aromas a \r\nmanzana verde y anana, en boca es suave y fresco.\r\n\r\nEste vino se obtiene de la combinación de uvas de distintas \r\nzonas: \r\nuna parte proviene de viñedos del Valle de Uco, otra de Agrelo \r\ny de Perdriel. El sistema de conducción de los viñedos es de \r\nespalderos y con edades de más 12 años. Cuentan con suelos \r\npedregosos, otorgando un buen drenaje, permitiendo un buen \r\ndesarrollo radicular y un excelente balance vegetativo/ \r\nproductivo.', 300, 2, '28.png'),
(29, 'La Linda Sweet Viognier', 6200, 'Información:\r\n\r\nLa Linda - Sweet Viognier es un blanco dulce natural de color \r\namarillo brillante. De aromas frescos que recuerdan a frutas \r\ntropicales y flores blancas. Su paladar es vibrante y \r\nrefrescante, con buen cuerpo y equilibrio entre la acidez \r\nnatural y el azÃºcar residual. Es un vino fragante y \r\nagradable, con gracia y un final amable muy expresivo.', 400, 3, '29.png'),
(30, 'Emilia Dulce Natural Moscatel', 3990, 'Información:\r\n\r\nDe un amarillo tenue que vira levemente al color acero. \r\n\r\nEn nariz se perciben notas de fares blancas y frutas cítricas. \r\n\r\nEn boca su delicada acidez le otorga sutileza combinando \r\nsuavemente con el remanente de azucar natural de uva.', 400, 3, '30.png');
*/
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `rol` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `rol`) VALUES
(1, 'administrador'),
(2, 'usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `rol` int NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `rol` (`rol`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `password`, `rol`) VALUES
(1, 'admin', 'Aa12345mM', 1),
(2, 'perezj', 'qwerty', 2),
(3, 'diazm', '12asqw', 2),
(4, 'ramirezd', '123456', 2),
(5, 'lopezl', '87ui87', 2),
(6, 'zarated', '3errfvc', 2);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);
/* agregado id*/
--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`rol`) REFERENCES `roles` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
