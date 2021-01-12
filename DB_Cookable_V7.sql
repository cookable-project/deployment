-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Erstellungszeit: 11. Jan 2021 um 22:12
-- Server-Version: 10.5.8-MariaDB-1:10.5.8+maria~focal
-- PHP-Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `Cookable`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Allergen`
--

CREATE TABLE `Allergen` (
  `PK_Allergen_ID` int(11) NOT NULL,
  `Bezeichnung` varchar(50) NOT NULL,
  `Kürzel` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Allergen`
--

INSERT INTO `Allergen` (`PK_Allergen_ID`, `Bezeichnung`, `Kürzel`) VALUES
(1, 'Gluten', 'A'),
(2, 'Krebstiere', 'B'),
(3, 'Eier von Geflügel', 'C'),
(4, 'Fisch', 'D'),
(5, 'Erdnüsse', 'E'),
(6, 'Sojabohnen', 'F'),
(7, 'Milch von Säugetieren', 'G'),
(8, 'Schalenrüchte', 'H'),
(9, 'Sellerie', 'L'),
(10, 'Senf', 'M'),
(11, 'Sesamsamen', 'N'),
(12, 'Schwefeloxid und Sulf', ''),
(13, 'Lupinen', 'P'),
(14, 'Weichtiere', 'R');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Benutzer`
--

CREATE TABLE `Benutzer` (
  `PK_Benutzer_ID` int(11) NOT NULL,
  `Benutzername` varchar(12) NOT NULL,
  `Vorname` varchar(25) NOT NULL,
  `Nachname` varchar(25) NOT NULL,
  `E_Mail` varchar(150) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `verified` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Benutzer`
--

INSERT INTO `Benutzer` (`PK_Benutzer_ID`, `Benutzername`, `Vorname`, `Nachname`, `E_Mail`, `Password`, `verified`) VALUES
(1, 'Admin', 'Cookable', 'Cookable', 'cookable2020@gmail.com', 'a2b82185add1341cfb0c650b31beefa9', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Gericht`
--

CREATE TABLE `Gericht` (
  `PK_Gericht_ID` int(11) NOT NULL,
  `FK_Kategorie_ID` int(11) NOT NULL,
  `Bezeichnung` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Gericht`
--

INSERT INTO `Gericht` (`PK_Gericht_ID`, `FK_Kategorie_ID`, `Bezeichnung`) VALUES
(1, 2, 'Burger'),
(2, 2, 'Spaghetti'),
(3, 2, 'Schnitzel'),
(4, 2, 'Gulasch'),
(5, 2, 'Ckicken Wings'),
(6, 4, 'Schoko-Bananen-Brotaufstrich'),
(7, 4, 'Pizzaschnecken'),
(8, 4, 'Süsskartoffel-Pommes'),
(9, 4, 'Blaubeer-Muffins'),
(10, 4, 'Getrocknete Äpfel'),
(11, 3, 'Eis Palatschinken');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Kategorie`
--

CREATE TABLE `Kategorie` (
  `PK_Kategorie_ID` int(11) NOT NULL,
  `Bezeichnung` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Kategorie`
--

INSERT INTO `Kategorie` (`PK_Kategorie_ID`, `Bezeichnung`) VALUES
(1, 'Vorspeise'),
(2, 'Hauptspeise'),
(3, 'Nachspeise'),
(4, 'Snacks');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Rezept`
--

CREATE TABLE `Rezept` (
  `PK_Rezept_ID` int(11) NOT NULL,
  `FK_Gericht_ID` int(11) NOT NULL,
  `Bezeichnung` varchar(80) NOT NULL,
  `Zutaten` text NOT NULL,
  `Zubereitung` text NOT NULL,
  `Kochzeit` varchar(20) NOT NULL,
  `Schwierigkeit` varchar(25) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `FK_Benutzer_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Rezept`
--

INSERT INTO `Rezept` (`PK_Rezept_ID`, `FK_Gericht_ID`, `Bezeichnung`, `Zutaten`, `Zubereitung`, `Kochzeit`, `Schwierigkeit`, `verified`, `FK_Benutzer_ID`) VALUES
(1, 2, 'Spaghetti Bolognese mit Rinderhackfleisch', 'Zutaten: 250g Rinderhackfleisch, 3 Tomaten, 1 Zwiebel, 1/2 Knoblauch, 1/2 Tube Tomatenmark, 25 ml Olivenöl,  1 TL Oregano, Prise Salz und Pfeffer, 250 g Spaghetti,  Parmesan', 'Zubereitung:\r\nDie Zwiebel in Scheiben schneiden, in eine Pfanne geben, salzen und in Öl anbraten.Danach Die Tomaten in Scheiben schneiden und in die Pfanne hinzufügen. Einmal durchrühren und dann einen Teller drüberlegen, sodass der gesamte Inhalt der Pfanne unter dem Teller verborgen ist, und ca. 15 Minuten bei geringer Hitze schmoren lassen.\r\nDas Rinderhack in eine zweite Pfanne geben und braten. Dabei mit einem Kochlöffel auseinander drücken, bis sich das gesamte Hack in kleine braune Klümpchen verwandelt hat. \r\nWenn die Zwiebeln und Tomaten zu einer weichen Masse geschmort sind, das Rinderhack dazugeben sowie 4 - 5 ungeschälte Knoblauchzehen. \r\nJetzt die Spaghetti in Wasser mit Salz und einem guten Schuss Olivenöl aufsetzen.\r\nDann den Inhalt der Tube Tomatenmark in die Pfanne geben sowie nach Bedarf ca. 0.2 L Wasser.\r\nDas Wasser runterkochen lassen und hin und wieder umrühren. Mit einer guten Portion Olivenöl auffüllen. Abermals aufkochen lassen und etwas Wasser dazu, damit die Soße nicht zu fest wird.\r\nDann reichlich Oregano dazu, gut salzen und etwas Pfeffer. Zum Schluss bei Bedarf noch etwas kleingeschnittenen Knoblauch.\r\nDie Spaghetti probieren und das Wasser abgießen, wenn sie bissfest sind. \r\nSpaghetti und die Pfanne mit der Soße auf den Tisch stellen und mit geriebenem Parmesankäse servieren.', '30 Minuten', 'Leicht', 1, 1),
(2, 1, 'Burger ', 'Zutaten: 300 g Rinderhackfleisch, Prise Salz und Pfeffer, 2 EL Olivenöl, 1 Tomate, 1 Zwiebel, Salat, Ketchup, Burger Brötchen', 'Zubereitung:\r\nDas Rindfleisch mit kaltem Wasser abspülen und trocken tupfen. Durch den Fleischwolf (mittlere Lochscheibe) drehen. Mit Salz und Pfeffer würzen.\r\nAus der Masse mit feuchten Händen 2 Laibchen formen und auf beiden Seiten mit Öl bepinseln.\r\nAuf dem heißen Grill ca. 8 Minuten knusprig braun grillen, währenddessen einige Male wenden.\r\nDie Tomate und die geschälte Zwiebel in Scheiben schneiden. Salatblätter waschen und trocken tupfen.\r\nDie Hamburger-Brötchen quer durchschneiden und kurz auf dem Grillrost wärmen.\r\nDie Fleischlaibchen auf die Brötchen legen.\r\nDen Hamburger mit Tomatenscheiben, Zwiebelringen und Salatblatt belegen und mit etwas Ketchup abschließen.\r\nDen Brötchen-Deckel darauflegen.', '30 Minuten', 'Leicht', 1, 1),
(3, 3, 'Rindschnitzel', 'Zutaten für 2 Portionen: 4 Stk. Rindschnitzel, Salz und Pfeffer, 70 g Butter, etwas Mehl, 250 ml Rindsuppe', 'Zubereitung:\r\nRinderbrühe für Schnitzel vorbereiten und kochen. Butter in der Pfanne schmelzen. \r\nDas Rindfleisch waschen, trocknen, und schneiden. Mit Salz und Pfeffer würzen, dann beidseitig das Fleisch mit Butter anbraten. \r\nMit Rinderbrühe glasieren und 10 bis 20 Minuten weiter dämpfen. Nehmen Sie das Fleisch heraus und halten Sie es warm. \r\nDie restliche Butter und das Mehl einrühren, zur Sauce geben, schmelzen und unter Rühren kochen. Gießen Sie das Rinderkotelett und die Soße darüber.', '40 min', 'Leicht', 1, 1),
(4, 4, 'Rindergulasch', 'Zutaten für 1 Portionen:1/4 Scheibe Brot, 1/4 Prise Chilischote (gemahlen), 1 EL Öl, 1/4 Rindfleisch, 1/4 Blatt Lorbeer, 1/4 EL Majoran, 1/2 EL Paprikapulver, Prise Salz und Pfeffer, 1/2 Zwiebel', 'Zubereitung:\r\nDas Fleisch in große Stücke schneiden \r\nDie Zwiebel in Würfeln schneiden, dann im Öl gut anrösten. Er darf gerne mittelbraun werden das ist gut für den Geschmack. Den Topf von der Platte schieben, den Paprika dazugeben und umrühren. Jetzt das Fleisch dazugeben und mit umrühren.\r\nDen Topf mit Wasser auffüllen für den Schnellkochtopf: bis das Fleisch-Zwiebelgemisch gerade mal bedeckt ist. Wenn man einen normalen Topf verwendet: 7 cm über dem Fleisch-Zwiebelgemisch auffüllen.\r\nNun Majoran, Lorbeerblatt, Brotrinde oder Brotscherz, Salz, Pfeffer und wenn gewünscht auch Chili dazugeben. Deckel drauf und kochen lassen. \r\nSchnellkochtopf: 30-40 Minuten, Kochtopf: bis das Fleisch weich ist (ca. 2 Std.) Wenn nötig Wasser nachgießen, damit es nicht anbrennt. \r\nWenn das Fleisch weich ist, aus der Soße nehmen und zur Seite stellen. Lorbeerblatt auch aus dem Saft geben und entsorgen.\r\nDen Saft mit einem Stab-Mixer bearbeiten oder in einen Standmixer füllen. Wieder in den Topf geben. Nochmals gut erwärmen und heiß servieren.', '135 Minuten', 'Mittel', 1, 1),
(5, 5, 'Ckicken Wings', 'Zutaten für 1 Portion:5 Stk Hühnerflügel, 1 2/3 Stk Knoblauchzehen, 2/3 EL Honig, 2/3 EL Senf, 2/3 EL Sojasauce, 2/3 EL Zitronensaft, 1 1/3 EL Öl, 2/3 EL Salz, 1/3 EL Pfeffer', 'Zubereitung: \r\nFür die Marinade den Knoblauch schälen und fein hacken. Gut mit Sojasauce, Olivenöl, Zitronensaft, Honig und Senf mischen, dann nach Belieben Salz und Pfeffer hinzufügen. \r\nLegen Sie die Hühnerflügel hinein, mischen Sie sie gut und lassen Sie sie mindestens eine Stunde oder über Nacht durchziehen. \r\nDen Backofen auf 180 ° C vorheizen, die marinierten Hähnchenflügel mit der Vorderseite nach oben auf ein Backblech mit Backpapier legen und ca. 35 Minuten goldbraun braten.', '110 Minuten', 'Mittel', 1, 1),
(6, 6, 'Schoko-Bananen-Brotaufstrich', 'Zutaten für 4 Portionen: 50 g Zartbitterschokolade, 250 g Topfen (20 % Fett), 2 EL Haferdrink (Hafermilch), 1 Banane, 4 Scheiben Haferbrot', 'Zubereitung:\r\nZartbitterschokolade fein raspeln. Etwa 1 EL der Raspel beiseitestellen.\r\nQuark mit Haferdrink glatt rühren. Schokoraspel unterheben.\r\nBanane schälen und schräg in Scheiben schneiden.\r\nBrot mit dem Schoko-Quark bestreichen, Bananenscheiben darauf anrichten und mit restlichen Schokoraspeln bestreuen.', '15 Minuten', 'Leicht', 1, 1),
(7, 7, 'Pizzaschnecken', 'Zutaten für 1 Portion:  1 Pck. Blätterteig\r\nFüllung: 100 g Salami, 2 Frühlingszwiebeln, 2 Tomaten, 2 EL Creme fraiche, 100 g Käse gerieben, Prise Salz, Pfeffer und Oregano,\r\nBestreichen: 1 Eigelb, etwas Milch', 'Zubereitung: \r\nEin Backblech mit Backpapier auslegen und Backofen auf 200°C Ober-/Unterhitze vorheizen. Für die Füllung alle Zutaten in kleine Würfeln schneiden und in einer Schüssel miteinander vermengen und abschmecken. In einer Tasse Eigelb und Milch verquirlen. \r\nDie Blätterteigrolle auspacken und mit der Füllung bestreichen, dabei einen Rand freilassen. Von der langen Seite her aufrollen. Die Rolle in 2 - 3 cm dicke Scheiben schneiden. \r\nDiese auf das vorbereitete Blech legen und mit dem verquirlten Ei bestreichen. Ca. 20 - 25 Minuten auf der mittleren Schiene backen.', '35 Minuten', 'Leicht', 1, 1),
(8, 8, 'Süsskartoffel-Pommes', 'Zutaten für 1 Portion: 1/4 kg Süßkartoffeln, 2 EL Olivenöl, 1/4 EL Meersalz', 'Zubereitung:\r\n1.	Heizen Sie den Ofen zu Beginn auf 180 Grad vor und legen Sie das Backblech mit Backpapier raus. Dann die Süßkartoffeln schälen und in ca. 1 cm dicke und ca. 7 cm lange Streifen schneiden. \r\n2.	Kartoffeln, Meersalz und Olivenöl in einer großen Schüssel mischen und auf einem Backblech verteilen. \r\n3.	Im Ofen 10 Minuten backen, bis es goldbraun wird, dann vorsichtig umdrehen. Die andere Seite sollte 10 Minuten lang gelb werden und dann servieren', '30 Minuten', 'Leicht', 1, 1),
(9, 9, 'Blaubeer-Muffins', 'Zutaten für 3 Portionen: 50 g Butter, 60 g Staubzucker, 1/2 Pck. Vanillezucker, 1 Ei, 100 g Mehl, 1/2 TL Backpulver, 100 g Blaubeeren (Heidelbeeren), 1/2 Prise Zitronenschale abgerieben, 1 1/2 EL Milch', 'Zubereitung:\r\nDie Butter mit Vanillezucker und Zucker schaumig schlagen. Dann das Ei hinzufügen. Mischen Sie das Mehl mit dem Backpulver und rühren Sie es abwechselnd mit der Milch unter dem Teig um. \r\nDann legen Sie die Blaubeeren vorsichtig unter den Teig. Die fertige Teigmischung gleichmäßig auf einem mit einem Karton ausgekleideten Muffinblech verteilen und ca. 30 Minuten bei 175 ° C in einen Ofen stellen.\r\nGekühlte Cupcakes können mit Schlagsahne und frischen Blaubeeren dekoriert werden.', '30 Minuten', 'Leicht', 1, 1),
(10, 10, 'Getrocknete Äpfel', 'Zutaten für 4 Portionen: 8 Stk. Äpfel (süß)', 'Zubereitung:\r\nDas Gehäuse von den Äpfeln entfernen und danach in Scheiben schneiden. (nach Wunsch können die Äpfel auch geschält werden). Auf einer Schnur die Apfelstücke zum Trocknen auffädeln und in einem sehr trockenen Raum aufhängen. Direkte Sonneneinstrahlung vermeiden. (Dauer: mehrere Tage, bis 1 Woche).\r\nMan kann auch die Apfelstücke im Backofen trocknen lassen, geht schneller: Das Dörrgut auf ein mit Backpapier ausgelegtes Blech legen und im wamen Ofen bei ca. 30 Min bei 50-60°C (Heißluft) und leicht geöffneter Backofentür, damit die Feuchtigkeit abziehen kann.\r\nDiese Dörrmethode kann bei vielen Früchten angewendet werden: Ananas, Kiwi, Mango, Zwetschken, Kiwi, Bananen etc.\r\nDie Früchte sind gedörrt, wenn sie beim Brechen kein saftiges Fleisch mehr zeigen.', '50 Minuten', 'Leicht', 1, 1),
(11, 11, 'Eis Palatschinken', 'Zutaten für 4 Portionen: 200 ml Milch, 180 g Mehl, 60 g Butter (geschmolzen), 3 Stk. Eier, 1 Prise Salz, 1 Msp Backpulver,\r\nZutaten für die Fülle: 8 Kugeln Eis (Sorte nach Belieben)', 'Zubereitung:\r\nFür die Eis Palatschinken zuerst Mehl und Backpulver, mit allen Zutaten zu einem Palatschinkenteig gut verrühren und ca 20 Min. rasten lassen.\r\nButterschmalz in einer beschichteten Pfanne erhitzen und mit einem Schöpfer die Masse einfüllen und goldbraun herausbacken - warm stellen.\r\nDie Palatschinke mit Schokosauce füllen, zusammenklappen und mit einer Eiskugel verzieren. Nochmal Schokosauce draufgeben und servieren.', '35 Minuten', 'Leicht', 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Zutat`
--

CREATE TABLE `Zutat` (
  `PK_Zutat_ID` int(11) NOT NULL,
  `Bezeichnung` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Zutat`
--

INSERT INTO `Zutat` (`PK_Zutat_ID`, `Bezeichnung`) VALUES
(1, 'Ahornsirup'),
(2, 'Ajvar'),
(3, 'Algen'),
(4, 'Ananas'),
(5, 'Anis'),
(6, 'Apfel'),
(7, 'Apfelessig'),
(8, 'Apfelsaft'),
(9, 'Aprikosen'),
(10, 'Aprikosenmarmelade'),
(11, 'Artischocken'),
(12, 'Aubergine'),
(13, 'Austernpilze'),
(14, 'Avocado'),
(15, 'Avocadoöl'),
(16, 'Babypute'),
(17, 'Backpulver'),
(18, 'Bacon'),
(19, 'Balsamico'),
(20, 'Banane'),
(21, 'Basilikum'),
(22, 'Bauernbrot'),
(23, 'Bavette'),
(24, 'Bergamotte'),
(25, 'Berglinsen'),
(26, 'Birnen'),
(27, 'Bitterorangen'),
(28, 'Blaubeeren'),
(29, 'Blumenkohl'),
(30, 'Blutorangen'),
(31, 'Blutwurst'),
(32, 'Blätterteig'),
(33, 'Bohnen'),
(34, 'Bonitoflocken'),
(35, 'Bratwurst'),
(36, 'Brokkoli'),
(37, 'Brot'),
(38, 'Brunnenkresse'),
(39, 'Brötchen'),
(40, 'Buchweizen'),
(41, 'Buchweizenmehl'),
(42, 'Bulgur'),
(43, 'Burgerbrötchen'),
(44, 'Buschbohnen'),
(45, 'Butter'),
(46, 'Buttermilch'),
(47, 'Butternut-Kürbis'),
(48, 'Butterschmalz'),
(49, 'Bärlauch'),
(50, 'Büffelmozzarella'),
(51, 'Cashew-Nüsse'),
(52, 'Cayennepfeffer'),
(53, 'Champignons'),
(54, 'Cheddar'),
(55, 'Chili'),
(56, 'Chili-Bohnenpaste'),
(57, 'Chiliflocken'),
(58, 'Chiliöl'),
(59, 'Chilischote'),
(60, 'Chinakohl'),
(61, 'Cocktailtomaten'),
(62, 'Cornflakes (ungesüßt)'),
(63, 'Cornichons'),
(64, 'Creme Double'),
(65, 'Creme Fraiche'),
(66, 'Croutons'),
(67, 'Cumin'),
(68, 'Curry'),
(69, 'Currypulver'),
(70, 'Datteln'),
(71, 'Dicke Bohnen'),
(72, 'Dill'),
(73, 'Dillblüten'),
(74, 'Dinkelmehl'),
(75, 'Dosentomaten'),
(76, 'Dressings'),
(77, 'Eier'),
(78, 'Eigelb'),
(79, 'Eiscreme'),
(80, 'Eiweiß'),
(81, 'Ente'),
(82, 'Entenbrust'),
(83, 'Erbsen'),
(84, 'Erdbeeren'),
(85, 'Erdnussbutter'),
(86, 'Erdnussöl'),
(87, 'Erdnüsse'),
(88, 'Essig'),
(89, 'Estragon'),
(90, 'Estragon-Essig'),
(91, 'Estragon-Senf'),
(92, 'Feigen'),
(93, 'Feinkostsalat'),
(94, 'Feldsalat'),
(95, 'Fenchel'),
(96, 'Fenchelgrün'),
(97, 'Fenchelsamen'),
(98, 'Feta'),
(99, 'Fischsauce'),
(100, 'Forelle'),
(101, 'Frischkäse'),
(102, 'Frühlingszwiebel'),
(103, 'Frühlingszwiebeln'),
(104, 'Garnelen'),
(105, 'Gartenkresse'),
(106, 'Geflügelleber'),
(107, 'Gelbe Bete'),
(108, 'Gelierzucker'),
(109, 'Gemelli'),
(110, 'Gemüse'),
(111, 'Gemüsezwiebel'),
(112, 'Getrocknete Kirschen'),
(113, 'Getrocknete Tomaten'),
(114, 'Gewürzgurke'),
(115, 'Gewürznelken'),
(116, 'Gorgonzola'),
(117, 'Gouda'),
(118, 'Granatapfel'),
(119, 'Granatapfelsaft'),
(120, 'Grapefruit'),
(121, 'Grenadilla'),
(122, 'Gries'),
(123, 'Gruyere'),
(124, 'Grüne Bohnen'),
(125, 'Grüne Oliven'),
(126, 'Grüner Reis '),
(127, 'Grüner Spargel'),
(128, 'Grünkern'),
(129, 'Grünkohl'),
(130, 'Gurke'),
(131, 'Gurken'),
(132, 'Hackfleisch'),
(133, 'Haferbrot'),
(134, 'Haferflocken'),
(135, 'Hafermilch'),
(136, 'Hagebuttenmark'),
(137, 'Halloumi'),
(138, 'Harissa'),
(139, 'Hartweizengries'),
(140, 'Haselnuss-Zitronen-Pesto'),
(141, 'Haselnussöl'),
(142, 'Haselnüsse'),
(143, 'Hefe'),
(144, 'Heidelbeeren'),
(145, 'Hering'),
(146, 'Himbeeren'),
(147, 'Hirse'),
(148, 'Honig'),
(149, 'Huhn'),
(150, 'Hühnerbrust'),
(151, 'Hühnerflügel'),
(152, 'Hühnerkeule'),
(153, 'Hühnerkeulen'),
(154, 'Hühnerschenkel'),
(155, 'Hühnerschnitzel'),
(156, 'Hühnersteaks'),
(157, 'Ingwer'),
(158, 'Jakobsmuscheln'),
(159, 'Jaroma-Kohl'),
(160, 'Joghurt'),
(161, 'Johannisbeeren'),
(162, 'Johannisbeergelee'),
(163, 'Kabeljau'),
(164, 'Kakao'),
(165, 'Kalbfleisch'),
(166, 'Kalbsfilet'),
(167, 'Kalbshack'),
(168, 'Kalbskotelette'),
(169, 'Kalbsleber'),
(170, 'Kalbsrücken'),
(171, 'Kalbsschnitzel'),
(172, 'Kapern'),
(173, 'Kardamom'),
(174, 'Karotten'),
(175, 'Kartoffeln'),
(176, 'Kartoffelpüree'),
(177, 'Kartoffelstärke'),
(178, 'Kastanien'),
(179, 'Keniabohnen'),
(180, 'Ketchup'),
(181, 'Kichererbsen'),
(182, 'Kidney-Bohnen'),
(183, 'Kirschen'),
(184, 'Kirschtomaten'),
(185, 'Klebreis'),
(186, 'Knoblauch'),
(187, 'Knoblauchzehe'),
(188, 'Knoblauchzehen'),
(189, 'Kochbirne'),
(190, 'Kochschinken'),
(191, 'Kohl'),
(192, 'Kohlrabi'),
(193, 'Kokoscreme'),
(194, 'Kokosmilch'),
(195, 'Kokosstreifen'),
(196, 'Kokosöl'),
(197, 'Koriander'),
(198, 'Koriandergrün'),
(199, 'Koriandersamen'),
(200, 'Kotelett'),
(201, 'Krabben'),
(202, 'Kresse'),
(203, 'Kreuzkümmel'),
(204, 'Kräuter'),
(205, 'Kurkuma'),
(206, 'Käse'),
(207, 'Kürbis'),
(208, 'Kürbiskerne'),
(209, 'Kürbiskernöl'),
(210, 'Lachs'),
(211, 'Lachsforelle'),
(212, 'Lammfleisch'),
(213, 'Lammhaxe'),
(214, 'Lammkarree'),
(215, 'Lammkeule'),
(216, 'Lammrücken'),
(217, 'Lammschulter'),
(218, 'Lasagne'),
(219, 'Lauch'),
(220, 'Lauchzwiebeln'),
(221, 'Lavendel'),
(222, 'Leber'),
(223, 'Liebstöckel'),
(224, 'Limetten'),
(225, 'Limettensaft'),
(226, 'Limonensaft'),
(227, 'Linsen'),
(228, 'Lorbeer'),
(229, 'Lorbeerblätter'),
(230, 'Macadamia-Nüsse'),
(231, 'Mais'),
(232, 'Maisgries'),
(233, 'Majoran'),
(234, 'Makrele'),
(235, 'Mandarinensaft'),
(236, 'Mandarinenöl'),
(237, 'Mandeln'),
(238, 'Mango'),
(239, 'Mangold'),
(240, 'Maracuja'),
(241, 'Maronen'),
(242, 'Mascarpone'),
(243, 'Mayonaise'),
(244, 'Meerrettich'),
(245, 'Meersalz'),
(246, 'Mehl'),
(247, 'Melone'),
(248, 'Mettwürstchen'),
(249, 'Miesmuscheln'),
(250, 'Milch'),
(251, 'Milchreis'),
(252, 'Mineralwasser'),
(253, 'Minze'),
(254, 'Mirin'),
(255, 'Miso'),
(256, 'Miso-Suppe'),
(257, 'Mohn'),
(258, 'Mozzarella'),
(259, 'Muscheln'),
(260, 'Muskatnuss'),
(261, 'Mürbeteig'),
(262, 'Nektarinen'),
(263, 'Nelken'),
(264, 'Nordseekrabben'),
(265, 'Nudeln'),
(266, 'Nussöl'),
(267, 'Oliven'),
(268, 'Olivenöl'),
(269, 'Orangen'),
(270, 'Orangenblütenwasser'),
(271, 'Orangenlikör'),
(272, 'Orangensaft'),
(273, 'Orangenschale'),
(274, 'Oregano'),
(275, 'Paella-Reis'),
(276, 'Pak Choi'),
(277, 'Palmkohl'),
(278, 'Palmzucker'),
(279, 'Pancetta'),
(280, 'Paniermehl'),
(281, 'Panko'),
(282, 'Paprika'),
(283, 'Paprikapulver'),
(284, 'Parmaschinken'),
(285, 'Parmesan'),
(286, 'Passionsfrüchte'),
(287, 'Pasta'),
(288, 'Pastinaken'),
(289, 'Pellkartoffeln'),
(290, 'Peperoni'),
(291, 'Pesto'),
(292, 'Petersilie'),
(293, 'Petersilie Butter'),
(294, 'Petersilienwurzel'),
(295, 'Pfahlmuscheln'),
(296, 'Pfannkuchen'),
(297, 'Pfeffer'),
(298, 'Pfefferkörner'),
(299, 'Pfefferminze'),
(300, 'Pfifferlinge'),
(301, 'Pflaumen'),
(302, 'Pilze'),
(303, 'Pilze (getrocknet)'),
(304, 'Pinienkerne'),
(305, 'Pistazien'),
(306, 'Polenta'),
(307, 'Pommes'),
(308, 'Portwein'),
(309, 'Preiselbeermarmelade'),
(310, 'Prinzessbohnen'),
(311, 'Puddingpulver'),
(312, 'Puderzucker'),
(313, 'Quinoa'),
(314, 'Radieschen'),
(315, 'Rapsöl'),
(316, 'Reis'),
(317, 'Reisessig'),
(318, 'Reismehl'),
(319, 'Reisnudeln'),
(320, 'Reispapier'),
(321, 'Remoulade'),
(322, 'Rettich'),
(323, 'Rhabarber'),
(324, 'Ricotta'),
(325, 'Riesengarnelen'),
(326, 'Rinderbrust'),
(327, 'Rinderbrühe'),
(328, 'Rinderfilet'),
(329, 'Rinderhackfleisch'),
(330, 'Rinderherz'),
(331, 'Rinderrouladen'),
(332, 'Rindfleisch'),
(333, 'Rindfleischbrühe'),
(334, 'Rindschnitzel'),
(335, 'Rindsfilet'),
(336, 'Rindsuppe'),
(337, 'Risotto-Reis'),
(338, 'Roastbeef'),
(339, 'Roggenmehl'),
(340, 'Roher Schinken'),
(341, 'Rosenkohl'),
(342, 'Rosinen'),
(343, 'Rosmarin'),
(344, 'Rote Bete'),
(345, 'Rote Curry Paste'),
(346, 'Rote Linsen'),
(347, 'Roter Jasmin-Reis'),
(348, 'Roter Reis'),
(349, 'Rote Zwiebeln'),
(350, 'Rotkohl'),
(351, 'Rotwein'),
(352, 'Rotweinessig'),
(353, 'Rouille'),
(354, 'Rucola'),
(355, 'Räucher-Salz'),
(356, 'Räucherfisch'),
(357, 'Räucherforelle'),
(358, 'Räucherlachs'),
(359, 'Rübe'),
(360, 'Safran'),
(361, 'Sahne'),
(362, 'Sake'),
(363, 'Salami'),
(364, 'Salatgurke'),
(365, 'Salatmischung'),
(366, 'Salz'),
(367, 'Sandwichtoast'),
(368, 'Sardellen'),
(369, 'Saubohnen'),
(370, 'Sauerampfer'),
(371, 'Sauerrahm'),
(372, 'Saure Sahne'),
(373, 'Schalotten'),
(374, 'Schellfisch'),
(375, 'Schinken'),
(376, 'Schinkenspeck'),
(377, 'Schnittbohnen'),
(378, 'Schnittlauch'),
(379, 'Schokolade'),
(380, 'Schwarze Bohnen'),
(381, 'Schwarzer Knoblauch'),
(382, 'Schwarzer Reis'),
(383, 'Schwarzer Sesam'),
(384, 'Schwarzkümmel'),
(385, 'Schwedenmilch'),
(386, 'Schweinebäckchen'),
(387, 'Schweinefilet'),
(388, 'Schweinefleisch'),
(389, 'Schweinehack'),
(390, 'Schweinemedaillons'),
(391, 'Schweineschmalz'),
(392, 'Schweineschnitzel'),
(393, 'Seeteufel'),
(394, 'Seidentofu'),
(395, 'Selchkarree'),
(396, 'Sellerie'),
(397, 'Semmeln'),
(398, 'Semmelbrösel'),
(399, 'Senf'),
(400, 'Senfkörner'),
(401, 'Senfpulver'),
(402, 'Serrano'),
(403, 'Sesam'),
(404, 'Sesampaste'),
(405, 'Sesamöl'),
(406, 'Shiitake'),
(407, 'Shoyu'),
(408, 'Soba-Nudeln'),
(409, 'Sojabohnen'),
(410, 'Sojasauce'),
(411, 'Sojasprossen'),
(412, 'Sommerkürbis'),
(413, 'Soyasauce'),
(414, 'Spaghetti'),
(415, 'Spargel'),
(416, 'Speck'),
(417, 'Speisestärke'),
(418, 'Spinat'),
(419, 'Spitzkohl'),
(420, 'Spitzpaprika'),
(421, 'Sprossen'),
(422, 'Spätzle'),
(423, 'Staubzucker'),
(424, 'Steak'),
(425, 'Steckrübe'),
(426, 'Steinpilze'),
(427, 'Sternanis'),
(428, 'Stärke'),
(429, 'Suppenfleisch'),
(430, 'Szechuanpfeffer'),
(431, 'Süßkartoffeln'),
(432, 'Tabasco'),
(433, 'Tafelspitz'),
(434, 'Tagliatelle'),
(435, 'Tahini'),
(436, 'Tee'),
(437, 'Tellerlinsen'),
(438, 'Teriyaki-Sauce'),
(439, 'Thunfisch'),
(440, 'Thymian'),
(441, 'Toastbrot'),
(442, 'Tofu'),
(443, 'Tomaten'),
(444, 'Tomatenmark'),
(445, 'Topfen'),
(446, 'Udon-Nudeln'),
(447, 'Vegeta'),
(448, 'Vanille'),
(449, 'Vanillearoma'),
(450, 'Vanillepudding'),
(451, 'Vanillesalz'),
(452, 'Vanilleschote'),
(453, 'Vanillezucker'),
(454, 'Venusmuscheln'),
(455, 'Walnussöl'),
(456, 'Walnüsse'),
(457, 'Wasabi'),
(458, 'Wasser'),
(459, 'Wassermelone'),
(460, 'Wasserspinat'),
(461, 'Wein'),
(462, 'Weinblätter'),
(463, 'Weizenmehl'),
(464, 'Weißbrot'),
(465, 'Weiße Bohnen'),
(466, 'Weißein'),
(467, 'Weißer Kürbis'),
(468, 'weißer Spargel'),
(469, 'Weißkohl'),
(470, 'Weißwein'),
(471, 'Weißweinessig'),
(472, 'Wildfond'),
(473, 'Wildgulasch'),
(474, 'Wildschweinkeule'),
(475, 'Worchestershire Sauce'),
(476, 'Zartbitterschokolade'),
(477, 'Ziegenfrischkäse'),
(478, 'Ziegenkäse'),
(479, 'Zimt'),
(480, 'Zitronen'),
(481, 'Zitronengras'),
(482, 'Zitronenmelisse'),
(483, 'Zitronensaft'),
(484, 'Zitronenschale'),
(485, 'Zucchini'),
(486, 'Zucker'),
(487, 'Zwetschgen'),
(488, 'Zwiebel'),
(489, 'Zwiebeln'),
(490, 'Äpfel'),
(491, 'Öl');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Zwischentabelle_ZA`
--

CREATE TABLE `Zwischentabelle_ZA` (
  `PK_Zwischentabelle_ZA_ID` int(11) NOT NULL,
  `FK_Rezept_ID` int(11) NOT NULL,
  `FK_Allergen_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Zwischentabelle_ZA`
--

INSERT INTO `Zwischentabelle_ZA` (`PK_Zwischentabelle_ZA_ID`, `FK_Rezept_ID`, `FK_Allergen_ID`) VALUES
(1, 1, 1),
(2, 1, 3),
(3, 1, 9),
(4, 2, 1),
(5, 2, 3),
(6, 2, 7),
(7, 3, 1),
(8, 3, 9),
(9, 4, 1),
(10, 4, 3),
(11, 5, 10),
(12, 5, 6),
(13, 6, 1),
(14, 6, 7),
(15, 7, 1),
(16, 7, 3),
(17, 7, 7),
(18, 7, 13),
(19, 9, 1),
(20, 9, 3),
(21, 9, 7),
(22, 9, 6),
(23, 9, 11),
(24, 10, 12),
(25, 11, 1),
(26, 11, 3),
(27, 11, 7);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Zwischentabelle_ZR`
--

CREATE TABLE `Zwischentabelle_ZR` (
  `PK_Zwischentabelle_ZR_ID` int(11) NOT NULL,
  `FK_Zutat_ID` int(11) NOT NULL,
  `FK_Rezept_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Zwischentabelle_ZR`
--

INSERT INTO `Zwischentabelle_ZR` (`PK_Zwischentabelle_ZR_ID`, `FK_Zutat_ID`, `FK_Rezept_ID`) VALUES
(1, 329, 1),
(2, 443, 1),
(3, 488, 1),
(4, 186, 1),
(5, 444, 1),
(6, 268, 1),
(7, 274, 1),
(8, 366, 1),
(9, 297, 1),
(10, 414, 1),
(11, 285, 1),
(12, 329, 2),
(13, 366, 2),
(14, 297, 2),
(15, 268, 2),
(16, 443, 2),
(17, 488, 2),
(18, 43, 2),
(19, 108, 2),
(20, 334, 3),
(21, 366, 3),
(22, 297, 3),
(23, 45, 3),
(24, 443, 3),
(25, 37, 4),
(26, 59, 4),
(27, 491, 4),
(28, 332, 4),
(29, 228, 4),
(30, 233, 4),
(31, 283, 4),
(32, 366, 4),
(33, 297, 4),
(34, 488, 4),
(35, 151, 5),
(36, 187, 5),
(37, 148, 5),
(38, 399, 5),
(39, 410, 5),
(40, 483, 5),
(41, 491, 5),
(42, 297, 5),
(43, 366, 5),
(44, 476, 6),
(45, 445, 6),
(46, 135, 6),
(47, 20, 6),
(48, 133, 6),
(49, 32, 7),
(50, 363, 7),
(51, 102, 7),
(52, 443, 7),
(53, 65, 7),
(54, 206, 7),
(55, 366, 7),
(56, 274, 7),
(57, 78, 7),
(58, 297, 7),
(59, 250, 7),
(60, 431, 8),
(61, 268, 8),
(62, 245, 8),
(63, 423, 9),
(64, 453, 9),
(65, 77, 9),
(66, 246, 9),
(67, 17, 9),
(68, 28, 9),
(69, 484, 9),
(70, 250, 9),
(71, 490, 10),
(72, 250, 11),
(73, 246, 11),
(74, 32, 11),
(75, 366, 11),
(76, 77, 11),
(77, 17, 11),
(78, 79, 11);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `Allergen`
--
ALTER TABLE `Allergen`
  ADD PRIMARY KEY (`PK_Allergen_ID`);

--
-- Indizes für die Tabelle `Benutzer`
--
ALTER TABLE `Benutzer`
  ADD PRIMARY KEY (`PK_Benutzer_ID`);

--
-- Indizes für die Tabelle `Gericht`
--
ALTER TABLE `Gericht`
  ADD PRIMARY KEY (`PK_Gericht_ID`),
  ADD KEY `FK_Kategorie_ID` (`FK_Kategorie_ID`);

--
-- Indizes für die Tabelle `Kategorie`
--
ALTER TABLE `Kategorie`
  ADD PRIMARY KEY (`PK_Kategorie_ID`);

--
-- Indizes für die Tabelle `Rezept`
--
ALTER TABLE `Rezept`
  ADD PRIMARY KEY (`PK_Rezept_ID`),
  ADD KEY `FK_Gericht_ID` (`FK_Gericht_ID`),
  ADD KEY `FK_Benutzer_ID` (`FK_Benutzer_ID`);

--
-- Indizes für die Tabelle `Zutat`
--
ALTER TABLE `Zutat`
  ADD PRIMARY KEY (`PK_Zutat_ID`);

--
-- Indizes für die Tabelle `Zwischentabelle_ZA`
--
ALTER TABLE `Zwischentabelle_ZA`
  ADD PRIMARY KEY (`PK_Zwischentabelle_ZA_ID`),
  ADD KEY `FK_Rezept_ID` (`FK_Rezept_ID`),
  ADD KEY `FK_Allergen_ID` (`FK_Allergen_ID`);

--
-- Indizes für die Tabelle `Zwischentabelle_ZR`
--
ALTER TABLE `Zwischentabelle_ZR`
  ADD PRIMARY KEY (`PK_Zwischentabelle_ZR_ID`),
  ADD KEY `FK_Zutat_ID` (`FK_Zutat_ID`),
  ADD KEY `FK_Rezept_ID` (`FK_Rezept_ID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `Allergen`
--
ALTER TABLE `Allergen`
  MODIFY `PK_Allergen_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT für Tabelle `Benutzer`
--
ALTER TABLE `Benutzer`
  MODIFY `PK_Benutzer_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `Gericht`
--
ALTER TABLE `Gericht`
  MODIFY `PK_Gericht_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `Kategorie`
--
ALTER TABLE `Kategorie`
  MODIFY `PK_Kategorie_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `Rezept`
--
ALTER TABLE `Rezept`
  MODIFY `PK_Rezept_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `Zutat`
--
ALTER TABLE `Zutat`
  MODIFY `PK_Zutat_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=492;

--
-- AUTO_INCREMENT für Tabelle `Zwischentabelle_ZA`
--
ALTER TABLE `Zwischentabelle_ZA`
  MODIFY `PK_Zwischentabelle_ZA_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT für Tabelle `Zwischentabelle_ZR`
--
ALTER TABLE `Zwischentabelle_ZR`
  MODIFY `PK_Zwischentabelle_ZR_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `Gericht`
--
ALTER TABLE `Gericht`
  ADD CONSTRAINT `Gericht_ibfk_1` FOREIGN KEY (`FK_Kategorie_ID`) REFERENCES `Kategorie` (`PK_Kategorie_ID`);

--
-- Constraints der Tabelle `Rezept`
--
ALTER TABLE `Rezept`
  ADD CONSTRAINT `Rezept_ibfk_1` FOREIGN KEY (`FK_Gericht_ID`) REFERENCES `Gericht` (`PK_Gericht_ID`),
  ADD CONSTRAINT `Rezept_ibfk_2` FOREIGN KEY (`FK_Benutzer_ID`) REFERENCES `Benutzer` (`PK_Benutzer_ID`);

--
-- Constraints der Tabelle `Zwischentabelle_ZA`
--
ALTER TABLE `Zwischentabelle_ZA`
  ADD CONSTRAINT `Zwischentabelle_ZA_ibfk_1` FOREIGN KEY (`FK_Rezept_ID`) REFERENCES `Rezept` (`PK_Rezept_ID`),
  ADD CONSTRAINT `Zwischentabelle_ZA_ibfk_2` FOREIGN KEY (`FK_Allergen_ID`) REFERENCES `Allergen` (`PK_Allergen_ID`);

--
-- Constraints der Tabelle `Zwischentabelle_ZR`
--
ALTER TABLE `Zwischentabelle_ZR`
  ADD CONSTRAINT `Zwischentabelle_ZR_ibfk_1` FOREIGN KEY (`FK_Zutat_ID`) REFERENCES `Zutat` (`PK_Zutat_ID`),
  ADD CONSTRAINT `Zwischentabelle_ZR_ibfk_2` FOREIGN KEY (`FK_Rezept_ID`) REFERENCES `Rezept` (`PK_Rezept_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
