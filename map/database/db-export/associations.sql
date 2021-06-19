-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.3:3306
-- Erstellungszeit: 18. Feb 2021 um 20:06
-- Server-Version: 5.6.19-67.0-log
-- PHP-Version: 7.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `associations`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `activities`
--

DROP DATABASE IF EXISTS associations;
CREATE DATABASE IF NOT EXISTS associations;
use associations;

CREATE TABLE `activities` (
  `value` varchar(36) NOT NULL,
  `label` varchar(512) NOT NULL,
  `category` varchar(36) DEFAULT NULL,
  `orderIndex` int(11) DEFAULT NULL,
  `current` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `activities`
--

INSERT INTO `activities` (`value`, `label`, `category`, `orderIndex`, `current`) VALUES
('052b4738-3d8b-4ed2-9d07-6e0a8b88b565', 'Feste und Feiern', '903a624c-7655-4941-92c2-fcbce45399da', 2, 1),
('06a381ca-109c-49d1-b6fa-5019b13b9ebf', 'Ausstellungen', '903a624c-7655-4941-92c2-fcbce45399da', 2, 1),
('07dbf630-8ebc-4ee4-9587-ebac31c7bd4f', 'Turniere', 'caee8b37-8686-4f95-a270-b52d9b332ded', 5, 1),
('083ba818-b8dc-4a07-9f03-0f24d28a19aa', 'Muttersprachlicher Musikunterricht', 'a2c72a89-6869-4d2d-9f90-be717537a148', 3, 1),
('0edf9918-1e88-43a3-91aa-a1c8056baa21', 'Stammtische', '903a624c-7655-4941-92c2-fcbce45399da', 2, 1),
('14ffd7d7-7641-4634-a7dd-c4ec824b8cf6', 'Musikwerkstatt', 'a2c72a89-6869-4d2d-9f90-be717537a148', 3, 1),
('191f9550-6dc2-42ef-bd2a-2735f4f7b189', 'Afrikanische Musik', 'a2c72a89-6869-4d2d-9f90-be717537a148', 3, 1),
('19a1edf1-62b1-44d7-9c70-83f8d15c4554', 'Podcast', 'f07a5595-f036-42b6-9d41-abd39896681a', 8, 1),
('1d17d1ab-963c-4d02-a43b-77f9706327fe', 'Jazzdance', 'caee8b37-8686-4f95-a270-b52d9b332ded', 5, 1),
('1eacdec4-6689-4bb7-bff9-b2ec5259f6ac', 'Traditioneller Tanz / Volkstanz', 'caee8b37-8686-4f95-a270-b52d9b332ded', 5, 1),
('20201b37-683d-4e16-ae4f-3c89e63fa689', 'Klassische Musik', 'a2c72a89-6869-4d2d-9f90-be717537a148', 3, 1),
('22c22f18-cec2-4676-9586-370bfd06f35b', 'Soziales und Gesundheit', NULL, 4, 1),
('268e4a5c-e849-4f32-bc15-1e524e0cdefe', 'Hilfsfonds', '22c22f18-cec2-4676-9586-370bfd06f35b', 4, 1),
('278e7a85-5d3e-47a1-8dfe-971bb614e541', 'Elternkurse', 'e1e16992-62cc-4544-ada8-e8ffc02254aa', 1, 1),
('27adab7b-bae1-4562-8e1e-898a37ff4e47', 'Konferenzen', 'e1e16992-62cc-4544-ada8-e8ffc02254aa', 1, 1),
('28cb85c2-989b-413c-bbad-819db341305c', 'Notversorgung', '22c22f18-cec2-4676-9586-370bfd06f35b', 4, 1),
('2cd64db3-f049-4b8f-9d57-cbe86f7e8e52', 'Dichter- und Autorlesungen', '903a624c-7655-4941-92c2-fcbce45399da', 2, 1),
('2ce08d25-dda5-44b5-95ad-d3938bf2245f', 'Empowerment-Angebote', 'e1e16992-62cc-4544-ada8-e8ffc02254aa', 1, 1),
('2e37f150-4703-4c6e-83f2-5e258c99fbdf', 'Trommeln', 'a2c72a89-6869-4d2d-9f90-be717537a148', 3, 1),
('2ffe3540-9b42-4c60-a385-1ad316b61e60', 'Workshops', 'e1e16992-62cc-4544-ada8-e8ffc02254aa', 1, 1),
('31b8ae1d-0a6c-4f61-8ff9-3dfdbdd5276f', 'Tanzdarbietungen', '903a624c-7655-4941-92c2-fcbce45399da', 2, 1),
('329b0c66-9aa9-430c-b81d-55afa3f4286c', 'Bildungsprojekte im Ausland', '22c22f18-cec2-4676-9586-370bfd06f35b', 4, 1),
('333fa33d-34ed-4424-8d43-0b04df745bad', 'Instrumentalunterricht', 'a2c72a89-6869-4d2d-9f90-be717537a148', 3, 1),
('3371be08-fc54-4ab5-847e-43a6aedb73da', 'Lebensmittelverteilung', '22c22f18-cec2-4676-9586-370bfd06f35b', 4, 1),
('33b0cc3d-c898-4f71-974b-61c1b8607ac1', 'Partymusik', 'a2c72a89-6869-4d2d-9f90-be717537a148', 3, 1),
('34539fac-77ee-46d0-a259-fad432a87eb1', 'Veranstaltungsplanung', '77c73324-6b81-4490-94c1-c7c699d75c36', 7, 1),
('345e2349-38e4-4f75-b540-ce5271a16be5', 'Vielfalt', '903a624c-7655-4941-92c2-fcbce45399da', 2, 1),
('34c2338a-0e1a-4625-bea6-fdeb94a5d56a', 'Finanzielle Unterstützung / Förderung von Bildungsangeboten', 'e1e16992-62cc-4544-ada8-e8ffc02254aa', 1, 1),
('37366af3-b522-4a84-b6d8-18654a4af79e', 'Basketball', 'caee8b37-8686-4f95-a270-b52d9b332ded', 5, 1),
('383663f1-7d46-4abe-b865-036e0ce7999d', 'Sportveranstaltungen', 'caee8b37-8686-4f95-a270-b52d9b332ded', 5, 1),
('393be716-0bb3-4034-ad75-c4348b741e85', 'Jazz', 'a2c72a89-6869-4d2d-9f90-be717537a148', 3, 1),
('3d5da784-d4e5-4489-94f5-8de4f253a4a4', 'Gesellschaftliches', '903a624c-7655-4941-92c2-fcbce45399da', 2, 1),
('3de679fc-437e-4fdd-8c60-06f47e23b035', 'Schulveranstaltungen', 'e1e16992-62cc-4544-ada8-e8ffc02254aa', 1, 1),
('41677e42-91e2-44bb-9a52-a68c804e42fc', 'Karriereberatung', '77c73324-6b81-4490-94c1-c7c699d75c36', 7, 1),
('41a338ad-09ae-40bf-8bc2-973a65069c6c', 'Bildende Kunst', '903a624c-7655-4941-92c2-fcbce45399da', 2, 1),
('436d00b9-1c26-4806-a8d1-8f6846a28af8', 'Schulpatenschaften', 'e1e16992-62cc-4544-ada8-e8ffc02254aa', 1, 1),
('451b5a6b-f6c0-42b4-8b38-7ac7c40989ee', 'Traditionelles Essen', 'c181ee05-5662-41f8-a241-0c2001e48359', 6, 1),
('474a8ff3-34f9-4912-94b1-4c84d1304a9d', 'Filmvorführungen, Kino- und Filmfeste', '903a624c-7655-4941-92c2-fcbce45399da', 2, 1),
('4880b108-dd18-4666-a5a6-8d8bc511e18a', 'Reparatur von Instrumenten', 'a2c72a89-6869-4d2d-9f90-be717537a148', 3, 1),
('4ca75fe6-6764-4b6f-a525-abaa9bffa2cf', 'Yoga', 'caee8b37-8686-4f95-a270-b52d9b332ded', 5, 1),
('4cb40078-cd07-4ed3-ad0b-b5710418a949', 'Kinder und Jugendliche', 'e1e16992-62cc-4544-ada8-e8ffc02254aa', 1, 1),
('4d28bfd7-fdf0-46b5-88a7-39165e99a55f', 'Führungen', '903a624c-7655-4941-92c2-fcbce45399da', 2, 1),
('4fdedb59-a2ec-4ce3-a864-9f2ee54de161', 'Tanzveranstaltungen', 'caee8b37-8686-4f95-a270-b52d9b332ded', 5, 1),
('513b09ab-eb2f-4407-805b-44dffae4c4b1', 'Orchester und Ensemble', 'a2c72a89-6869-4d2d-9f90-be717537a148', 3, 1),
('5562fe36-bc8f-465b-ac18-4b5b820fc31b', 'Arbeit mit Menschen mit Behinderung', '22c22f18-cec2-4676-9586-370bfd06f35b', 4, 1),
('5cf4a2a2-30ac-491f-b9ec-3ef8920a52a9', 'Kochkurse', 'c181ee05-5662-41f8-a241-0c2001e48359', 6, 1),
('5da2a926-bafc-4cf6-a690-ebe04aae5efb', 'Sprachkurse und Sprachunterricht', 'e1e16992-62cc-4544-ada8-e8ffc02254aa', 1, 1),
('5e63b584-e7a0-468e-95ae-4efa306bf9bc', 'Tanzkurse und Tanzunterricht', 'caee8b37-8686-4f95-a270-b52d9b332ded', 5, 1),
('5e6bb978-f8a3-4945-8e1f-8a9b21866b04', 'Politik', 'e1e16992-62cc-4544-ada8-e8ffc02254aa', 1, 1),
('6232745b-ae38-4386-8ce9-38181ec03167', 'Straßenfeste', '903a624c-7655-4941-92c2-fcbce45399da', 2, 1),
('62a4abe0-70f7-487a-85ea-ccc9c953dc14', 'Jugendberatung', '77c73324-6b81-4490-94c1-c7c699d75c36', 7, 1),
('67460b3f-e0a0-4047-aeba-8d142f52de8b', 'Karneval', '903a624c-7655-4941-92c2-fcbce45399da', 2, 1),
('6c6dab40-3af5-410c-8866-af397260ab2a', 'Hörbücher', 'f07a5595-f036-42b6-9d41-abd39896681a', 8, 1),
('6d5e911b-b877-468d-9fd9-cd0d015d5170', 'Theaterveranstaltungen', '903a624c-7655-4941-92c2-fcbce45399da', 2, 1),
('71a52ead-7207-4be5-af01-43419524746d', 'Interkulturelle Begegnung', '903a624c-7655-4941-92c2-fcbce45399da', 2, 1),
('7228b82c-5b71-4da7-8e8f-0bff0eb9eed1', 'Zusammenarbeit mit Geflüchteten und Asylbewerber*innen', '22c22f18-cec2-4676-9586-370bfd06f35b', 4, 1),
('722b7ee0-b864-4fdf-9ce8-b85bb1f6c27a', 'Fingerfood', 'c181ee05-5662-41f8-a241-0c2001e48359', 6, 1),
('73dff0c6-2787-41b4-9fff-05d46457fa2c', 'Sprachförderung', 'e1e16992-62cc-4544-ada8-e8ffc02254aa', 1, 1),
('74421701-0b80-4180-b59d-59c86bb74e0f', 'Freiwilligendienste im Ausland', '22c22f18-cec2-4676-9586-370bfd06f35b', 4, 1),
('756a75d5-dce7-4e45-ad4a-961301fe3712', 'MINT', 'e1e16992-62cc-4544-ada8-e8ffc02254aa', 1, 1),
('77c73324-6b81-4490-94c1-c7c699d75c36', 'Beratung', NULL, 7, 1),
('7952ed23-dd78-4c8a-8428-b9b3d59435c4', 'Seminare', 'e1e16992-62cc-4544-ada8-e8ffc02254aa', 1, 1),
('7a414d58-c8cd-4dff-8b77-0f299f2920c9', 'Konzertfestivals', 'a2c72a89-6869-4d2d-9f90-be717537a148', 3, 1),
('7bf0e817-8f8a-4190-90d8-a559f380eb90', 'Zeitgenössische Kunst', '903a624c-7655-4941-92c2-fcbce45399da', 2, 1),
('7c5307d3-90d6-4602-b00f-e8808639ebd0', 'Hausaufgabenbetreuung', 'e1e16992-62cc-4544-ada8-e8ffc02254aa', 1, 1),
('7dea6712-360f-4e70-bb90-eeec33e466bd', 'Catering', 'c181ee05-5662-41f8-a241-0c2001e48359', 6, 1),
('7e1a8d59-fe13-4914-849c-7b7ecce7c65d', 'Volleyball', 'caee8b37-8686-4f95-a270-b52d9b332ded', 5, 1),
('7fa1727a-e166-479e-a87e-2cddbcb34945', 'Hilfsprojekte', '22c22f18-cec2-4676-9586-370bfd06f35b', 4, 1),
('80c76142-7a20-46c3-bf48-ecf80bd88036', 'Tanz', 'caee8b37-8686-4f95-a270-b52d9b332ded', 5, 1),
('81f05bc2-046f-470b-bcf8-d58157c7050d', 'Gesundheit', '22c22f18-cec2-4676-9586-370bfd06f35b', 4, 1),
('825cda70-60f5-4517-99e7-6b5415003e01', 'Frauenrechte', 'e1e16992-62cc-4544-ada8-e8ffc02254aa', 1, 1),
('8bdaffb1-6f76-49f3-a999-c0fecfad483b', 'Rassismusaufklärung', 'e1e16992-62cc-4544-ada8-e8ffc02254aa', 1, 1),
('8cecdd4d-57f5-47b2-ad1d-c6a83df8e9a3', 'Flamenco', 'caee8b37-8686-4f95-a270-b52d9b332ded', 5, 1),
('903a624c-7655-4941-92c2-fcbce45399da', 'Kunst und Kultur', NULL, 2, 1),
('9091601f-6df5-4350-904b-965bde1e085f', 'Musikunterricht für Kinder und Jugendliche', 'a2c72a89-6869-4d2d-9f90-be717537a148', 3, 1),
('9220d0a4-6442-4ea3-a0d2-4f0bbe4339f1', 'Vorträge', 'e1e16992-62cc-4544-ada8-e8ffc02254aa', 1, 1),
('9228d2bb-9271-4c0d-9a8e-37af82ea1d34', 'Zeitgenössische Musik', 'a2c72a89-6869-4d2d-9f90-be717537a148', 3, 1),
('96745945-5724-4d0e-b6e1-10013710d046', 'Bastel- und handwerkliche Workshops', 'e1e16992-62cc-4544-ada8-e8ffc02254aa', 1, 1),
('972e06c4-2805-47f2-9be1-c1dc01931e0e', 'Aufbauarbeit', '22c22f18-cec2-4676-9586-370bfd06f35b', 4, 1),
('97c7d12d-5af6-4e6d-b1c5-6349ace6a915', 'YouTube', 'f07a5595-f036-42b6-9d41-abd39896681a', 8, 1),
('9b726c9e-2566-4a38-b835-d1266a049faf', 'DJ', 'a2c72a89-6869-4d2d-9f90-be717537a148', 3, 1),
('9c5a822b-de59-40db-8fae-a40d4e081e33', 'Samba', 'a2c72a89-6869-4d2d-9f90-be717537a148', 3, 1),
('9d716150-f03e-43aa-91fb-13bd53626ecd', 'Podiumsdiskussionen und -gespräche', 'e1e16992-62cc-4544-ada8-e8ffc02254aa', 1, 1),
('9e582442-f85e-42b0-a18b-f0d9709b6a1a', 'Musikalische Früherziehung', 'a2c72a89-6869-4d2d-9f90-be717537a148', 3, 1),
('a04fc7da-497c-4c9f-a67b-f7f96bc987a9', 'Kampfsport', 'caee8b37-8686-4f95-a270-b52d9b332ded', 5, 1),
('a199aa26-d6af-4fba-89f4-a840401a8b7a', 'Gymnastik', 'caee8b37-8686-4f95-a270-b52d9b332ded', 5, 1),
('a1a496d0-a952-4718-9dc5-6299d763d376', 'Interkulturelle Kompetenzvermittlung', 'e1e16992-62cc-4544-ada8-e8ffc02254aa', 1, 1),
('a1db41c6-dd67-49d6-95a1-7076aad5cb06', 'Literaturveranstaltungen, Workshops', '903a624c-7655-4941-92c2-fcbce45399da', 2, 1),
('a2c72a89-6869-4d2d-9f90-be717537a148', 'Musik', NULL, 3, 1),
('a50b8b9f-e427-4057-9769-1e6c99eee205', 'Telefonische Sofortberatung, Hotline', '77c73324-6b81-4490-94c1-c7c699d75c36', 7, 1),
('a62583fa-4dc8-419f-a583-0e55bcc59e03', 'Chor-Gesang', 'a2c72a89-6869-4d2d-9f90-be717537a148', 3, 1),
('ab4dcc22-1389-49a2-8a35-a37d496e90cb', 'Afrobeat, Afropop', 'a2c72a89-6869-4d2d-9f90-be717537a148', 3, 1),
('abc9a1a3-b8ac-4ba3-b64d-b93fe702f129', 'Traditionelle Musik / Folklore', 'a2c72a89-6869-4d2d-9f90-be717537a148', 3, 1),
('ac7dc75e-e63d-4279-8574-2817148145c8', 'Rassismushilfe', '77c73324-6b81-4490-94c1-c7c699d75c36', 7, 1),
('b44949e8-9b04-4fbc-99e7-e278f0be08fc', 'Konzerte und Musikveranstaltungen', 'a2c72a89-6869-4d2d-9f90-be717537a148', 3, 1),
('b49214e4-26dc-4e23-9559-7eeefeb1e50d', 'Interreligiöse Begegnung', '903a624c-7655-4941-92c2-fcbce45399da', 2, 1),
('b8848ea0-78b5-4aa4-97ca-7ad5884937dc', 'Studienfahrten, Ausflüge, Sprach- und Kulturreisen', '903a624c-7655-4941-92c2-fcbce45399da', 2, 1),
('ba68962d-fa8a-4057-837d-3bdf708f2ce0', 'Offene Bühne', '903a624c-7655-4941-92c2-fcbce45399da', 2, 1),
('bbaae84e-1640-45ab-a92b-8d5d9e55146f', 'Häuserbau', '22c22f18-cec2-4676-9586-370bfd06f35b', 4, 1),
('bca4abd3-7782-49aa-8e02-a5bb389d72a1', 'Ausländische Kultur und Traditionen', '903a624c-7655-4941-92c2-fcbce45399da', 2, 1),
('bd8011d6-6811-4374-89c3-bc172ef47324', 'Radio', 'f07a5595-f036-42b6-9d41-abd39896681a', 8, 1),
('be43d95c-3e04-41d3-8c3c-5b57cea61f50', 'Bands', 'a2c72a89-6869-4d2d-9f90-be717537a148', 3, 1),
('c181ee05-5662-41f8-a241-0c2001e48359', 'Gastronomie', NULL, 6, 1),
('c1b1d7ee-4c4f-449e-8013-9611b0f925bc', 'Nachhilfe', 'e1e16992-62cc-4544-ada8-e8ffc02254aa', 1, 1),
('c7b06389-554b-4d82-9a8a-01107f7c348e', 'Fotografie', '903a624c-7655-4941-92c2-fcbce45399da', 2, 1),
('c844cb92-75fd-470f-a97a-9ad1235f9fb9', 'Muttersprachlicher Unterricht', 'e1e16992-62cc-4544-ada8-e8ffc02254aa', 1, 1),
('caee8b37-8686-4f95-a270-b52d9b332ded', 'Sport', NULL, 5, 1),
('cdb5b6d0-f818-41fa-b3b2-056151253f29', 'Fußball', 'caee8b37-8686-4f95-a270-b52d9b332ded', 5, 1),
('cdbee767-bb81-453a-9b6a-1cbf28449e7d', 'Interessenkurse', 'e1e16992-62cc-4544-ada8-e8ffc02254aa', 1, 1),
('cecd9baa-87a1-466b-82ac-a1dca8419f38', 'UNESCO-Projekte', '22c22f18-cec2-4676-9586-370bfd06f35b', 4, 1),
('d0634bc5-2e3e-480b-b612-9cdddb26f208', 'Diskussionsrunden', 'e1e16992-62cc-4544-ada8-e8ffc02254aa', 1, 1),
('d5158be0-2840-474a-a7cb-d5307f1d9b78', 'Reggae', 'a2c72a89-6869-4d2d-9f90-be717537a148', 3, 1),
('d64949fb-be56-48c2-a1cc-cb65acea6b85', 'Fitness', 'caee8b37-8686-4f95-a270-b52d9b332ded', 5, 1),
('dcf3eca4-ef5d-4aeb-9640-1ab8c06cc84e', 'Stipendienvergabe', 'e1e16992-62cc-4544-ada8-e8ffc02254aa', 1, 1),
('dcf810fd-c808-40e8-8a2f-7d1e1507ba59', 'Religiöse Veranstaltungen und Feste', '903a624c-7655-4941-92c2-fcbce45399da', 2, 1),
('e009d28c-5993-48bd-97da-e0f11e9f77de', 'Ebru-Kurs', '903a624c-7655-4941-92c2-fcbce45399da', 2, 1),
('e1e16992-62cc-4544-ada8-e8ffc02254aa', 'Bildung', NULL, 1, 1),
('e2ac863c-4be7-411f-b05e-4291c91cc636', 'Muttersprachliche Gastvorträge', '903a624c-7655-4941-92c2-fcbce45399da', 2, 1),
('e3e505ac-b1c9-4c3b-8197-db4bb0d2fb76', 'Poesie', '903a624c-7655-4941-92c2-fcbce45399da', 2, 1),
('e467ffd3-fb11-4612-8da1-37d1691d55bc', 'Arbeit mit Senior*innen', '22c22f18-cec2-4676-9586-370bfd06f35b', 4, 1),
('e4ceb00b-6a23-4de7-bb73-ed1cf8548c43', 'Übersetzungs- und Dolmetscherdienste', 'e1e16992-62cc-4544-ada8-e8ffc02254aa', 1, 1),
('e5f9e348-c3a8-4491-8f4d-241bc1022e9d', 'Training', 'caee8b37-8686-4f95-a270-b52d9b332ded', 5, 1),
('e8908bfd-1f08-482b-9f43-df8c9e0ce0c7', 'Kunst- und Kulturveranstaltungen, Workshops', '903a624c-7655-4941-92c2-fcbce45399da', 2, 1),
('ebfac38a-7acd-48ae-b79c-49441f98937b', 'Gesangsunterricht', 'a2c72a89-6869-4d2d-9f90-be717537a148', 3, 1),
('ef8228c0-b7d6-44a1-91cc-51d21a96e3cf', 'Kunstprojekte', '903a624c-7655-4941-92c2-fcbce45399da', 2, 1),
('f07a5595-f036-42b6-9d41-abd39896681a', 'Medien', NULL, 8, 1),
('f4a30eea-a163-433b-ba70-24b27546527d', 'Capoeira', 'caee8b37-8686-4f95-a270-b52d9b332ded', 5, 1),
('f618d917-a61d-46a3-808c-5e21a037a37d', 'Musikveranstaltungen mit Kindern und Jugendlichen', 'a2c72a89-6869-4d2d-9f90-be717537a148', 3, 1),
('f6822fff-0b6b-4739-a321-32124e952699', 'Cocktails', 'c181ee05-5662-41f8-a241-0c2001e48359', 6, 1),
('fb18eb8a-2e84-4110-9320-50dee5eac1dd', 'Suppenküchen', '22c22f18-cec2-4676-9586-370bfd06f35b', 4, 1),
('fdbc9436-c6fd-40c4-9154-30fad2acd582', 'Integrationshilfe', '22c22f18-cec2-4676-9586-370bfd06f35b', 4, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `associations`
--

CREATE TABLE `associations` (
  `id` varchar(36) NOT NULL,
  `name` varchar(128) NOT NULL,
  `shortName` varchar(50) DEFAULT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `addressLine1` varchar(128) DEFAULT NULL,
  `addressLine2` varchar(128) DEFAULT NULL,
  `addressLine3` varchar(128) DEFAULT NULL,
  `street` varchar(128) DEFAULT NULL,
  `postcode` varchar(128) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `country` varchar(128) DEFAULT NULL,
  `goals_format` varchar(64) DEFAULT NULL,
  `goals_text` text,
  `activities_format` varchar(64) DEFAULT NULL,
  `activities_text` text,
  `activityList` longtext,
  `districtList` longtext,
  `current` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `associations`
--

INSERT INTO `associations` (`id`, `name`, `shortName`, `lat`, `lng`, `addressLine1`, `addressLine2`, `addressLine3`, `street`, `postcode`, `city`, `country`, `goals_format`, `goals_text`, `activities_format`, `activities_text`, `activityList`, `districtList`, `current`) VALUES
('00de259f-254a-491f-8555-1ed658c6a85b', 'Verein zur Förderung der zeitgemäßen Lebensweise Baden-Württemberg e. V.', 'CYDD BW e. V.', 48.764363250663, 9.1746644584441, '', '', '', 'Filderstraße 19', '70180', 'Stuttgart', '', 'plain', '', 'plain', 'Bildung (Stipendien für Studierende in der Türkei, Vorträge), Musik (musikalische Früherziehung).', '[\"9e582442-f85e-42b0-a18b-f0d9709b6a1a\",\"dcf3eca4-ef5d-4aeb-9640-1ab8c06cc84e\",\"9220d0a4-6442-4ea3-a0d2-4f0bbe4339f1\"]', '[\"d4b4dc39-3aa8-421b-991c-a37e3a05f08f\",\"d3ea05ed-5dcd-4d47-a2aa-18e4eb6294c0\",\"5a291e38-df35-4b79-bcd5-c0fef2eb07bb\",\"cc397b39-43ee-4d15-9310-746144c207ff\",\"a64b2ee7-ca34-427c-9a9c-df8f5f29319e\",\"e0c9c7a7-d317-4662-93e5-28f281df4fd9\",\"6903278b-dd88-4ae3-b08f-1e3c17aef3da\",\"4e5d36ad-8387-47c5-9c48-5a5e933e6812\",\"77861c3b-3c9c-4ba9-ba03-c6f8832394b2\",\"068af935-dc42-40a4-98ef-e59352e9706c\",\"6f9350a6-0d94-44f4-86a0-d7e0c8edf9db\",\"6069e093-59e5-45b5-8854-fc1691222472\",\"45b57423-e7ea-4e3e-ba37-5e0ec506b1f6\",\"cc67be51-58de-4109-ae78-2b0c018e27da\",\"484d4d38-c9e3-4026-833d-69c3190422d9\",\"bbf0d197-fcd6-4548-8548-ef1840057018\",\"f3aa4a7e-5aac-46b9-9bcf-ced8fd0fa7d0\",\"32db5a17-3732-498e-a6c9-1f87f79a7ecb\",\"4c2c4518-f53d-409d-9c3c-35dbd7ec5395\",\"03913c8d-c21d-470a-90fc-b3032fc33f4a\",\"e5c49e46-df39-46aa-af7c-c59c8d9765eb\",\"52fc72f5-5b87-4eea-a662-87dc14180f1f\",\"632866a1-098a-4e0a-8bfe-e786fd6bdb00\",\"ff52e1fb-b421-46d4-828b-9e1298a441cf\",\"cf4658bb-885d-4937-bfd8-c5a7963a22d0\",\"bab504b9-7f1b-42cf-a01e-ce322fe25590\",\"1a68b204-3bc7-4ebd-a5a9-effc1b65dcb1\",\"845c4868-a060-4f68-861a-f880404bbf11\"]', 1),
('0110dd61-0bf5-4e62-abe5-772e1bd92d03', 'Loyenge e. V.', '', 48.772798972964, 9.2432918550495, '', '', '', 'Ulmer Straße 347', '70327', 'Stuttgart-Wangen', NULL, 'plain', 'Besseres Verstehen der Situation der Afrikaner in Europa und Afrika. Globalisierung der Kulturen. Vermittlung und Durchführung von Veranstaltungen mit Musik, Infos, Workshops.', 'plain', 'Bildung (Instrumentalunterricht: Trommelkurse \"Afrikanisches Trommeln\" für alle Altersgruppen), Kultur und Kunst (Theater, Kunst, Vorträge), Gastronomie (Benefizveranstaltungen mit traditionell afrikanischem Essen), Sport (Tanzkurse \"African Dance\"), Musik (Chor-Gesang, Afrikanischer Chor mit Hif Anga Belowi, Auftritte von Bands mit moderner und traditioneller afrikanischer Musik, Band \"Hif & Afro Soleil\" (Afropop, Reggae), Band \"Hif & Zanga\" (traditionelle Musik aus Afrika).', '[\"6d5e911b-b877-468d-9fd9-cd0d015d5170\",\"e8908bfd-1f08-482b-9f43-df8c9e0ce0c7\",\"9220d0a4-6442-4ea3-a0d2-4f0bbe4339f1\",\"451b5a6b-f6c0-42b4-8b38-7ac7c40989ee\",\"a62583fa-4dc8-419f-a583-0e55bcc59e03\",\"191f9550-6dc2-42ef-bd2a-2735f4f7b189\",\"2e37f150-4703-4c6e-83f2-5e258c99fbdf\",\"9228d2bb-9271-4c0d-9a8e-37af82ea1d34\",\"abc9a1a3-b8ac-4ba3-b64d-b93fe702f129\",\"5e63b584-e7a0-468e-95ae-4efa306bf9bc\",\"ab4dcc22-1389-49a2-8a35-a37d496e90cb\",\"d5158be0-2840-474a-a7cb-d5307f1d9b78\"]', '[\"cf4658bb-885d-4937-bfd8-c5a7963a22d0\",\"068af935-dc42-40a4-98ef-e59352e9706c\"]', 1),
('030f5468-5e92-4232-aaa6-6780ed1db82c', 'Club Español Stuttgart e. V.', NULL, 48.780504677692, 9.1826130578386, 'keine öffentliche Anschrift', '', '', '', '', '', NULL, 'plain', 'Förderung, Erhalt und Entwicklung der spanischen Kultur und Sprache, traditionelles Brauchtum und das Miteinander von Spaniern, Deutschen und anderen spanischsprachigen Nationalitäten. Förderung von Sport und Internationaler Gesinnung, der Toleranz auf allen Gebieten der Kultur und des Völkerverständigungsgedankens. Unterstützung von hilfsbedürftigen Personen und Hilfsorganisationen.', 'plain', 'Bildung (Seminare, Vorträge, Workshops), Kultur und Kunst (Spanische Kulturtage, Kunst, Film, Theater), Gastronomie (Kochkurse, Stadtfeste), Sport (Fußsballturniere, Tanzkurse, traditioneller Tanz Flamenco)​, Musik (Konzerte).', '[\"8cecdd4d-57f5-47b2-ad1d-c6a83df8e9a3\",\"1eacdec4-6689-4bb7-bff9-b2ec5259f6ac\",\"80c76142-7a20-46c3-bf48-ecf80bd88036\",\"5e63b584-e7a0-468e-95ae-4efa306bf9bc\",\"4fdedb59-a2ec-4ce3-a864-9f2ee54de161\",\"e8908bfd-1f08-482b-9f43-df8c9e0ce0c7\",\"474a8ff3-34f9-4912-94b1-4c84d1304a9d\",\"6d5e911b-b877-468d-9fd9-cd0d015d5170\",\"6232745b-ae38-4386-8ce9-38181ec03167\",\"5cf4a2a2-30ac-491f-b9ec-3ef8920a52a9\",\"b44949e8-9b04-4fbc-99e7-e278f0be08fc\",\"cdb5b6d0-f818-41fa-b3b2-056151253f29\",\"07dbf630-8ebc-4ee4-9587-ebac31c7bd4f\"]', '[\"def5709b-04dd-409e-a3d9-2831186574d7\"]', 1),
('04659eb2-e809-4543-b987-ad491468593b', 'Deutsch-Rumänisches Forum e. V.', '', 48.776958799926, 9.1635527940832, '', '', '', 'Schloßstraße 76', '70176', 'Stuttgart', NULL, 'plain', 'Orientierung – Akkommodation, zivilgesellschaftliche Inklusion in Stuttgart für rumänische und moldauische Diaspora.', 'plain', 'Bildung (Multiplikator für Stuttgarter Bildung und Workshops), Kultur und Kunst (Kulturveranstaltungen als Treffen der Gemeinde zu diversen Themen und Traditionen Rumäniens), Beratung (Telefon Hotline – kostenlose Sofortberatung).', '[\"a50b8b9f-e427-4057-9769-1e6c99eee205\",\"2ffe3540-9b42-4c60-a385-1ad316b61e60\",\"9220d0a4-6442-4ea3-a0d2-4f0bbe4339f1\",\"d0634bc5-2e3e-480b-b612-9cdddb26f208\",\"bca4abd3-7782-49aa-8e02-a5bb389d72a1\",\"e8908bfd-1f08-482b-9f43-df8c9e0ce0c7\"]', '[\"cf4658bb-885d-4937-bfd8-c5a7963a22d0\"]', 1),
('0991ef8a-2e54-4bb6-a2a9-523f35982a40', 'Asociación Ecuatoriana e. V.', '', 48.77540678015, 9.1552397699851, '', '', '', 'Bebelstraße 22', '70193', 'Stuttgart', NULL, 'plain', 'Das Land Ecuador und seine Kultur der deutschen Bevölkerung näher bringen.', 'plain', 'Entwicklung und Zusammenarbeit (Integrationshilfe, Unterstützung von Ecuadorianer*innen in Deutschland), Gastronomie (traditionelles ecuadorianisches Essen), Sport (Tanz).', '[\"fdbc9436-c6fd-40c4-9154-30fad2acd582\",\"451b5a6b-f6c0-42b4-8b38-7ac7c40989ee\",\"80c76142-7a20-46c3-bf48-ecf80bd88036\"]', '[\"f15af137-6b8b-44f2-927e-5bfc0bb86ca9\"]', 1),
('171d9f6d-dd62-4113-b262-949692e790e8', 'Internationaler Musik- und Kulturverein Klangoase e. V.', 'Klangoase e. V.', 48.839762929317, 9.1930024329074, '', '', '', 'Sauerkirschenweg 32', '70437', 'Stuttgart', NULL, 'plain', 'Unterschiedliche Kinder und Jugendliche mithilfe von Musik zusammenzubringen. Durch gemeinsames Musizieren stärkt der Verein die Persönlichkeit von Kindern, Jugendlichen und Erwachsenen sowie das Verständnis füreinander. Ein besonderer Schwerpunkt des Vereins ist die interkulturelle Arbeit mit dem Ziel, ein multinationales Orchester entstehen zu lassen.', 'plain', 'Bildung (Instrumentalunterricht: Gitarre, Klavier, Geige, Blockflöte, Cello, musikalische Früherziehung (M.F.E.), M.F.E.-unterricht in der Muttersprache Türkisch, Unterricht im Musikstil „Klassik“), Musik (Orchester, Chor-Gesang).', '[\"a62583fa-4dc8-419f-a583-0e55bcc59e03\",\"513b09ab-eb2f-4407-805b-44dffae4c4b1\",\"9e582442-f85e-42b0-a18b-f0d9709b6a1a\",\"333fa33d-34ed-4424-8d43-0b04df745bad\",\"ebfac38a-7acd-48ae-b79c-49441f98937b\",\"20201b37-683d-4e16-ae4f-3c89e63fa689\",\"c844cb92-75fd-470f-a97a-9ad1235f9fb9\"]', '[\"bab504b9-7f1b-42cf-a01e-ce322fe25590\",\"1a68b204-3bc7-4ebd-a5a9-effc1b65dcb1\"]', 1),
('195c1cfc-2e0a-4842-8700-d2f716e43ae0', 'ABADÁ Capoeira e. V.', '', 48.804819846049, 9.2220602878746, 'Keine öffentliche Anschrift', '', '', '', '', '', '', 'plain', '', 'plain', 'Sport (Tanz-Kampfsport, Sport im Park, Functional Fitness).', '[\"80c76142-7a20-46c3-bf48-ecf80bd88036\",\"a04fc7da-497c-4c9f-a67b-f7f96bc987a9\",\"f4a30eea-a163-433b-ba70-24b27546527d\",\"d64949fb-be56-48c2-a1cc-cb65acea6b85\",\"e5f9e348-c3a8-4491-8f4d-241bc1022e9d\"]', '[\"d3ea05ed-5dcd-4d47-a2aa-18e4eb6294c0\"]', 1),
('19837db4-8b34-44ff-95fb-de5d88545f4d', 'Firkat, klassisch-türkischer Musikverein Stuttgart e. V.', 'Firkat e.V.', 48.79683028478, 9.1935285386757, '', '', '', 'Mittnachtstraße 18', '70191', 'Stuttgart', NULL, 'plain', 'Eine Vereinigung und Verbindung zur Förderung der türkischen Kultur.', 'plain', 'Bildung (Noten- und Instrumentenunterricht für Kinder, Jugendliche, Eltern und Erwachsene), Kultur und Kunst (Konzerte), Musik (klassische türkische Musik, Chor-Gesang).', '[\"333fa33d-34ed-4424-8d43-0b04df745bad\",\"ebfac38a-7acd-48ae-b79c-49441f98937b\",\"a62583fa-4dc8-419f-a583-0e55bcc59e03\",\"b44949e8-9b04-4fbc-99e7-e278f0be08fc\",\"abc9a1a3-b8ac-4ba3-b64d-b93fe702f129\"]', '[\"cc67be51-58de-4109-ae78-2b0c018e27da\"]', 1),
('219d2242-1c30-4493-be65-52cb9978f23e', 'Kulturverein Slovenija-Stuttgart e. V.', '', 48.773637010403, 9.1918825176244, '', '', '', 'Stafflenbergstraße 64', '70184', 'Stuttgart', NULL, 'plain', 'Förderung und Pflege des slowenischen kulturellen Lebens in Stuttgart.', 'plain', 'Bildung (Sprachförderung bei Kindern und Jugendlichen), Kultur und Kunst (literarische Abende, Kulturabende), Musik (Veranstaltungen mit verschiedenen Chören und Gesangsgruppen aus Slowenien).', '[\"a1db41c6-dd67-49d6-95a1-7076aad5cb06\",\"e8908bfd-1f08-482b-9f43-df8c9e0ce0c7\",\"73dff0c6-2787-41b4-9fff-05d46457fa2c\",\"a62583fa-4dc8-419f-a583-0e55bcc59e03\",\"513b09ab-eb2f-4407-805b-44dffae4c4b1\",\"b44949e8-9b04-4fbc-99e7-e278f0be08fc\"]', '[\"bbf0d197-fcd6-4548-8548-ef1840057018\"]', 1),
('2417c64b-cb09-4e84-8d15-e972a8c6e313', 'Punto de Encuentro e. V.', '', 48.775163349043, 9.1771635155149, '', '', '', 'Hirschstraße 12', '70173', 'Stuttgart', NULL, 'plain', 'Eine interkulturelle Begegnungsstätte für Menschen, die in der spanischen und deutschen Kultur verwurzelt sind, für Familien mit spanisch sprechenden Mitgliedern, für Eltern, die Interesse an bilingualer Erziehung für ihre Kinder haben.', 'plain', 'Bildung (muttersprachlicher Spanischunterricht, Bastel-Workshops, Handwerken, Experimentieren), Kultur und Kunst (Vermittlung der spanischen Sprache und Kultur, Feste und Feiern zum Gedanken- und Erfahrungsaustausch, Ausflüge und Besuche kultureller und wissenschaftlicher Einrichtungen und Museen), Entwicklung und Zusammenarbeit (Unterstützung von Personen, die aus der spanischen Kultur stammen oder die sich der spanischen Sprache und Kultur verbunden fühlen), Sport (Yoga).', '[\"c844cb92-75fd-470f-a97a-9ad1235f9fb9\",\"96745945-5724-4d0e-b6e1-10013710d046\",\"bca4abd3-7782-49aa-8e02-a5bb389d72a1\",\"3d5da784-d4e5-4489-94f5-8de4f253a4a4\",\"052b4738-3d8b-4ed2-9d07-6e0a8b88b565\",\"e8908bfd-1f08-482b-9f43-df8c9e0ce0c7\",\"fdbc9436-c6fd-40c4-9154-30fad2acd582\",\"4ca75fe6-6764-4b6f-a525-abaa9bffa2cf\"]', '[\"def5709b-04dd-409e-a3d9-2831186574d7\"]', 1),
('2991aab2-8d9d-48c3-8ee1-fda7a4335108', 'Sri Lankisch-Deutscher Verein Stuttgart e. V.', 'Sri Lankisch-Deutscher Verein e. V.', 48.830296813896, 9.2171587941506, '', '', '', 'Hopfenseeweg 3A', '70378', 'Stuttgart', NULL, 'plain', 'Förderung der Gemeinschaft und die soziale Integration der Sri Lankarnen in Stuttgart und Umgebung. Das langfristige und übergreifende Ziel ist es, einen kleinen Beitrag zum gemeinsamen Dialog und zum Verständnis unter den Menschen beizutragen.', 'plain', 'Bildung (Unterstützung von Projekten in Sri Lanka, Informations- und Diskussionsplattform), Kultur und Kunst (Events, künstlerische und kulturelle Projekte), Soziales und Gesundheit (Hilfsprojekte).', '[\"d0634bc5-2e3e-480b-b612-9cdddb26f208\",\"329b0c66-9aa9-430c-b81d-55afa3f4286c\",\"e8908bfd-1f08-482b-9f43-df8c9e0ce0c7\",\"a1db41c6-dd67-49d6-95a1-7076aad5cb06\",\"7fa1727a-e166-479e-a87e-2cddbcb34945\",\"052b4738-3d8b-4ed2-9d07-6e0a8b88b565\",\"268e4a5c-e849-4f32-bc15-1e524e0cdefe\"]', '[\"cc67be51-58de-4109-ae78-2b0c018e27da\",\"cf4658bb-885d-4937-bfd8-c5a7963a22d0\"]', 1),
('2ffbfe6b-9a16-4e0d-9b60-4bd7c747fb34', 'Stuttgarter Dante-Gesellschaft e. V. Società Dante Alighieri Comitato di Stoccarda', 'Stuttgarter Dante-Gesellschaft e. V.', 48.781116760203, 9.1833088515703, 'keine öffentliche Anschrift', '', '', 'Postfach 150 462', '70076', 'Stuttgart', NULL, 'plain', 'Verständigung zweier großer Kulturvölker durch ein vielfältiges Angebot an Vorträgen, Lesungen, Konzerten, Führungen, Diskussionen und Reisen.', 'plain', 'Kultur und Kunst (Vorträge, Lesungen, Literaturveranstaltungen, Konzerte, Kunstführungen, Diskussionen, Sprach- und Kulturreisen, Veranstaltungskalender).', '[\"9220d0a4-6442-4ea3-a0d2-4f0bbe4339f1\",\"2cd64db3-f049-4b8f-9d57-cbe86f7e8e52\",\"a1db41c6-dd67-49d6-95a1-7076aad5cb06\",\"e8908bfd-1f08-482b-9f43-df8c9e0ce0c7\",\"b8848ea0-78b5-4aa4-97ca-7ad5884937dc\",\"d0634bc5-2e3e-480b-b612-9cdddb26f208\"]', '[\"d4b4dc39-3aa8-421b-991c-a37e3a05f08f\",\"d3ea05ed-5dcd-4d47-a2aa-18e4eb6294c0\",\"5a291e38-df35-4b79-bcd5-c0fef2eb07bb\",\"cc397b39-43ee-4d15-9310-746144c207ff\",\"a64b2ee7-ca34-427c-9a9c-df8f5f29319e\",\"e0c9c7a7-d317-4662-93e5-28f281df4fd9\",\"6903278b-dd88-4ae3-b08f-1e3c17aef3da\",\"4e5d36ad-8387-47c5-9c48-5a5e933e6812\",\"77861c3b-3c9c-4ba9-ba03-c6f8832394b2\",\"068af935-dc42-40a4-98ef-e59352e9706c\",\"6f9350a6-0d94-44f4-86a0-d7e0c8edf9db\",\"6069e093-59e5-45b5-8854-fc1691222472\",\"45b57423-e7ea-4e3e-ba37-5e0ec506b1f6\",\"cc67be51-58de-4109-ae78-2b0c018e27da\",\"484d4d38-c9e3-4026-833d-69c3190422d9\",\"bbf0d197-fcd6-4548-8548-ef1840057018\",\"f3aa4a7e-5aac-46b9-9bcf-ced8fd0fa7d0\",\"32db5a17-3732-498e-a6c9-1f87f79a7ecb\",\"4c2c4518-f53d-409d-9c3c-35dbd7ec5395\",\"03913c8d-c21d-470a-90fc-b3032fc33f4a\",\"e5c49e46-df39-46aa-af7c-c59c8d9765eb\",\"52fc72f5-5b87-4eea-a662-87dc14180f1f\",\"632866a1-098a-4e0a-8bfe-e786fd6bdb00\",\"ff52e1fb-b421-46d4-828b-9e1298a441cf\",\"cf4658bb-885d-4937-bfd8-c5a7963a22d0\",\"bab504b9-7f1b-42cf-a01e-ce322fe25590\",\"1a68b204-3bc7-4ebd-a5a9-effc1b65dcb1\"]', 1),
('30d0925a-ca00-4d68-af44-0856092f2928', 'Ndwenga e. V.', NULL, 48.808127243602, 9.2733787388846, 'keine öffentliche Anschrift', '', '', '', '', '', NULL, 'plain', 'Förderung der internationalen Gesinnung, der Toleranz und des Völkerverständigungsgedanken auf allen Gebieten der Kultur im In- und Ausland. Besonderen Fokus legt Ndwenga e. V. auf die Ziele: keine Armut, kein Hunger, hochwertige Bildung, weniger Ungleichheiten und Partnerschaften zur Erreichung der Nachhaltigkeitsziele.', 'plain', 'Bildung (kulinarische und musikalische Kulturvermitlung), Kultur und Kunst, Gastronomie (Catering).', '[\"e8908bfd-1f08-482b-9f43-df8c9e0ce0c7\",\"7dea6712-360f-4e70-bb90-eeec33e466bd\",\"451b5a6b-f6c0-42b4-8b38-7ac7c40989ee\",\"abc9a1a3-b8ac-4ba3-b64d-b93fe702f129\",\"9228d2bb-9271-4c0d-9a8e-37af82ea1d34\"]', '[\"def5709b-04dd-409e-a3d9-2831186574d7\",\"ee4de3c1-f202-4b67-a8ee-ee53c95af538\"]', 1),
('36a84dbb-4776-4f05-8dd7-69101a30755c', 'India Culture Forum e. V.', NULL, 48.773145225426, 9.1647668465818, 'keine öffentliche Anschrift', '', '', '', '', '', NULL, 'plain', '', 'plain', 'Kultur und Kunst (Jährliche Feste: Religiöses Fest in Fellbach, Lichterfest im Bürgerzentrum West), Gastronomie (traditionelles Essen), Sport (Tanz-Workshops, Yoga).', '[\"052b4738-3d8b-4ed2-9d07-6e0a8b88b565\",\"dcf810fd-c808-40e8-8a2f-7d1e1507ba59\",\"6232745b-ae38-4386-8ce9-38181ec03167\",\"451b5a6b-f6c0-42b4-8b38-7ac7c40989ee\",\"5e63b584-e7a0-468e-95ae-4efa306bf9bc\",\"1eacdec4-6689-4bb7-bff9-b2ec5259f6ac\",\"4ca75fe6-6764-4b6f-a525-abaa9bffa2cf\"]', '[\"cf4658bb-885d-4937-bfd8-c5a7963a22d0\",\"ee4de3c1-f202-4b67-a8ee-ee53c95af538\"]', 1),
('38e9abc6-dc51-4270-9568-2185a69ab0eb', 'Capoeira Stuttgart e. V.', '', 48.828114696286, 9.0777939673918, '', '', '', 'Gottfried-Keller-Straße 41', '71254', 'Ditzingen', NULL, 'plain', 'Gemeinnütziger Sportverein, mit dem Ziel den brasilianischen Nationalsport Capoeira in Stuttgart bekannt zu machen und den Stuttgartern die Gelegenheit zu bieten, diesen zu erlernen.', 'plain', 'Kultur und Kunst (vielfältige kulturelle und karitative Veranstaltungen), Entwicklung und Zusammenarbeit (Integrationshilfe), Engagement für Geflüchtete (Zusammenarbeit mit Geflüchteten: Sport und Musik - Capoeira für Kinder und Erwachsene, Training in Flüchtlingsheimen Bürgerhospital und Mercedesstraße), Sport (regelmäßige Trainings).', '[\"31b8ae1d-0a6c-4f61-8ff9-3dfdbdd5276f\",\"bca4abd3-7782-49aa-8e02-a5bb389d72a1\",\"7228b82c-5b71-4da7-8e8f-0bff0eb9eed1\",\"fdbc9436-c6fd-40c4-9154-30fad2acd582\",\"f4a30eea-a163-433b-ba70-24b27546527d\",\"80c76142-7a20-46c3-bf48-ecf80bd88036\",\"a04fc7da-497c-4c9f-a67b-f7f96bc987a9\",\"e5f9e348-c3a8-4491-8f4d-241bc1022e9d\"]', '[\"d3ea05ed-5dcd-4d47-a2aa-18e4eb6294c0\",\"068af935-dc42-40a4-98ef-e59352e9706c\",\"03913c8d-c21d-470a-90fc-b3032fc33f4a\"]', 1),
('3b10b0c7-dc5a-4d96-9ce4-c23200652a86', 'Deutsch-Türkisches Forum Stuttgart e. V.', NULL, 48.773773222107, 9.1755832403735, '', '', '', 'Hirschstraße 36', '70173', 'Stuttgart', NULL, 'plain', 'Förderung der kulturellen Begegnung, Verständigung und Zusammenarbeit. Mit Bildungsinitiativen und Kulturprogrammen leistet das DTF eigenständige Beiträge zur gesellschaftlichen Teilhabe türkeistämmiger Zuwanderer. Es tritt insbesondere für mehr Chancengleichheit in Bildung, Beruf und Gesellschaft ein. Dabei setzt es vor allem auf vielseitiges bürgerschaftliches Engagement. Das DTF ist partei- und konfessionsunabhängig.', 'plain', 'Bildung (Politik, Gesellschaftliches), Kultur und Kunst (zeitgenössische türkische Kunst und Künstler*innen).', '[\"5e6bb978-f8a3-4945-8e1f-8a9b21866b04\",\"3d5da784-d4e5-4489-94f5-8de4f253a4a4\",\"7bf0e817-8f8a-4190-90d8-a559f380eb90\",\"41a338ad-09ae-40bf-8bc2-973a65069c6c\"]', '[\"d4b4dc39-3aa8-421b-991c-a37e3a05f08f\",\"d3ea05ed-5dcd-4d47-a2aa-18e4eb6294c0\",\"5a291e38-df35-4b79-bcd5-c0fef2eb07bb\",\"cc397b39-43ee-4d15-9310-746144c207ff\",\"a64b2ee7-ca34-427c-9a9c-df8f5f29319e\",\"e0c9c7a7-d317-4662-93e5-28f281df4fd9\",\"6903278b-dd88-4ae3-b08f-1e3c17aef3da\",\"4e5d36ad-8387-47c5-9c48-5a5e933e6812\",\"068af935-dc42-40a4-98ef-e59352e9706c\",\"6f9350a6-0d94-44f4-86a0-d7e0c8edf9db\",\"6069e093-59e5-45b5-8854-fc1691222472\",\"45b57423-e7ea-4e3e-ba37-5e0ec506b1f6\",\"cc67be51-58de-4109-ae78-2b0c018e27da\",\"484d4d38-c9e3-4026-833d-69c3190422d9\",\"bbf0d197-fcd6-4548-8548-ef1840057018\",\"f3aa4a7e-5aac-46b9-9bcf-ced8fd0fa7d0\",\"32db5a17-3732-498e-a6c9-1f87f79a7ecb\",\"4c2c4518-f53d-409d-9c3c-35dbd7ec5395\",\"03913c8d-c21d-470a-90fc-b3032fc33f4a\",\"e5c49e46-df39-46aa-af7c-c59c8d9765eb\",\"52fc72f5-5b87-4eea-a662-87dc14180f1f\",\"632866a1-098a-4e0a-8bfe-e786fd6bdb00\",\"ff52e1fb-b421-46d4-828b-9e1298a441cf\",\"cf4658bb-885d-4937-bfd8-c5a7963a22d0\",\"bab504b9-7f1b-42cf-a01e-ce322fe25590\",\"1a68b204-3bc7-4ebd-a5a9-effc1b65dcb1\"]', 1),
('3b72a4a4-024c-4049-ab75-9de2898f3ccd', 'Bolivianisches Kinderhilfswerk e. V.', '', 48.788907094442, 9.2052586182614, '', '', '', 'Hackstraße 76', '70190', 'Stuttgart', NULL, 'plain', 'Förderung von Kindern und Jugendlichen in Bolivien. Finanzielle Unterstützung von Bildungsprojekten in Bolivien. Vermittlung von engagierten Jugendlichen über Freiwilligendienste nach Bolivien bzw. Empfang von bolivianischen Freiwilligen in Deutschland.', 'plain', 'Entwicklung und Zusammenarbeit (Freiwilligendienst mit Einsatzland Bolivien, Spenden für Projektunterstützung in Bolivien, Patenschaften).', '[\"329b0c66-9aa9-430c-b81d-55afa3f4286c\",\"74421701-0b80-4180-b59d-59c86bb74e0f\",\"972e06c4-2805-47f2-9be1-c1dc01931e0e\"]', '[\"845c4868-a060-4f68-861a-f880404bbf11\"]', 1),
('3f123c62-7a3c-4d9f-a09b-674926356b88', 'Stuttgarter Femina e. V. (akademischer Frauenverein)', 'Stuttgarter Femina e. V.', 48.81216429726, 9.2261981282457, '', '', '', 'Oppelnerstraße 1', '70372', 'Stuttgart', NULL, 'plain', 'Die Mitglieder des Vereins setzen ihren Migrationshintergrund als Bereicherung ein und möchten diesen zur Förderung von interkulturellem Dialog und der Gleichberechtigung der Geschlechter in den Mittelpunkt stellen.', 'plain', 'Bildung (Workshops und Infoabende zur beruflichen Perspektive von Frauen, Unterstützung von Kultur- Austauschprogrammen), Kultur und Kunst (interkulturelle After Work Begegnung, interreligiöse Begegnungen, Kunst, Ebru Kurs, Fillografie), Gastronomie (Kochkurs, Catering).', '[\"2ffe3540-9b42-4c60-a385-1ad316b61e60\",\"41677e42-91e2-44bb-9a52-a68c804e42fc\",\"2ce08d25-dda5-44b5-95ad-d3938bf2245f\",\"825cda70-60f5-4517-99e7-6b5415003e01\",\"a1a496d0-a952-4718-9dc5-6299d763d376\",\"71a52ead-7207-4be5-af01-43419524746d\",\"b49214e4-26dc-4e23-9559-7eeefeb1e50d\",\"e009d28c-5993-48bd-97da-e0f11e9f77de\",\"5cf4a2a2-30ac-491f-b9ec-3ef8920a52a9\",\"7dea6712-360f-4e70-bb90-eeec33e466bd\",\"e8908bfd-1f08-482b-9f43-df8c9e0ce0c7\"]', '[\"def5709b-04dd-409e-a3d9-2831186574d7\"]', 1),
('59f81c29-5f86-47ec-8a8a-322d53ae14ff', 'Afrikafestival Stuttgart e. V.', '', 48.762873372291, 9.1600921249747, '', '', '', 'Erwin-Schöttle-Platz', '70199', 'Stuttgart', NULL, 'plain', 'Die Kultur Afrikas den Menschen in Stuttgart und Umgebung näher zu bringen.', 'plain', 'Kultur und Kunst (Kunstmarkt, offene Bühne mit Konzerten und Tanzdarbietungen, Vorträge, Filmvorführungen, Workshops und Theateraufführungen, Deutsch-Afrikanischer Gottesdienst in der Matthäuskirche jährlich am 2. Juliwochenende), Gastronomie (traditionelles Essen), Sport (Tanz).', '[\"e8908bfd-1f08-482b-9f43-df8c9e0ce0c7\",\"ba68962d-fa8a-4057-837d-3bdf708f2ce0\",\"9220d0a4-6442-4ea3-a0d2-4f0bbe4339f1\",\"2ffe3540-9b42-4c60-a385-1ad316b61e60\",\"474a8ff3-34f9-4912-94b1-4c84d1304a9d\",\"6d5e911b-b877-468d-9fd9-cd0d015d5170\",\"dcf810fd-c808-40e8-8a2f-7d1e1507ba59\",\"31b8ae1d-0a6c-4f61-8ff9-3dfdbdd5276f\",\"b44949e8-9b04-4fbc-99e7-e278f0be08fc\",\"80c76142-7a20-46c3-bf48-ecf80bd88036\",\"451b5a6b-f6c0-42b4-8b38-7ac7c40989ee\"]', '[\"03913c8d-c21d-470a-90fc-b3032fc33f4a\"]', 1),
('6de56a3e-f5b0-4f06-a77e-bbbd4858f9e9', 'Vietnam Community Stuttgart VCS', '', 48.710102584566, 9.2028194937758, '', '', '', 'Wollgrasweg 11', '70599', 'Stuttgart', NULL, 'plain', 'Forum für Vietnamesen und Nichtvietnamesen, Kontakte und kultureller Austausch, Vermittler für deutsche und vietnamesische Organisationen.', 'plain', 'Kultur und Kunst (Vorträge, Veranstaltungen in Deutsch und Vietnamesisch zu Themen Gesundheit, Sprachen, vietnamesische Literatur), Soziales und Gesundheit, Entwicklung und Zusammenarbeit (Integrationshilfe), Musik (traditionelle Musik).', '[\"c844cb92-75fd-470f-a97a-9ad1235f9fb9\",\"9220d0a4-6442-4ea3-a0d2-4f0bbe4339f1\",\"a1db41c6-dd67-49d6-95a1-7076aad5cb06\",\"fdbc9436-c6fd-40c4-9154-30fad2acd582\",\"abc9a1a3-b8ac-4ba3-b64d-b93fe702f129\",\"81f05bc2-046f-470b-bcf8-d58157c7050d\",\"71a52ead-7207-4be5-af01-43419524746d\"]', '[\"def5709b-04dd-409e-a3d9-2831186574d7\"]', 1),
('70a5f5f0-8a8f-485c-9f76-f68484aadd75', 'Akademie für internationalen Kulturaustausch e. V.', 'Akademie f. intern. Kulturaustausch e. V.', 48.768417429433, 9.1798930147304, '', '', '', 'Olgastraße 93B', '70180', 'Stuttgart', NULL, 'plain', 'Förderung des internationalen Kulturaustauschs durch Veranstaltungen mit Musik, Poesie und bildender Kunst aus verschiedenen Ländern unter Teilnahme interkultureller Künstler.', 'plain', 'Kultur und Kunst (Poesie, bildende Kunst in einer persönlichen, freundlichen Atmosphäre, wobei viel Gewicht auf Kommunikation zwischen Künstlern und Publikum gelegt wird), Musik (klassische und zeitgenössische Musik).', '[\"e3e505ac-b1c9-4c3b-8197-db4bb0d2fb76\",\"41a338ad-09ae-40bf-8bc2-973a65069c6c\",\"20201b37-683d-4e16-ae4f-3c89e63fa689\",\"9228d2bb-9271-4c0d-9a8e-37af82ea1d34\"]', '[\"068af935-dc42-40a4-98ef-e59352e9706c\"]', 1),
('712a34c7-2f5c-41c2-aeb7-9821a304dd5c', 'Srpski Centar Stuttgart e. V.', '', 48.815218991746, 9.1991044999456, '', '', '', 'Sigmund-Lindauer-Weg 24', '70376', 'Stuttgart', NULL, 'plain', 'Das serbische Zentrum Stuttgart e. V. ist ein deutsch-serbischer Kulturverein. Im Mittelpunkt steht das Tanzen von Volkstänzen, welche bei verschiedenen Meisterschaften oder Stadtfesten aufgeführt werden. Der Verein hat es sich zur Aufgabe gemacht, vor allem junge Menschen durch die Vereinstätigkeiten zu fördern und ihnen bestimmte Werte zu vermitteln.', 'plain', 'Bildung (Bastel-Workshops, Trachten nähen, Hausaufgabenbetreuung, Übernachtungsfest in Schlafsäcken mit Aufgaben und Spielen), Gastronomie (Kochkurse mit Kindern und Jugendlichen), Sport (traditioneller Tanz, Volkstanz, Fußballturniere).', '[\"96745945-5724-4d0e-b6e1-10013710d046\",\"7c5307d3-90d6-4602-b00f-e8808639ebd0\",\"5cf4a2a2-30ac-491f-b9ec-3ef8920a52a9\",\"80c76142-7a20-46c3-bf48-ecf80bd88036\",\"1eacdec4-6689-4bb7-bff9-b2ec5259f6ac\",\"07dbf630-8ebc-4ee4-9587-ebac31c7bd4f\",\"cdb5b6d0-f818-41fa-b3b2-056151253f29\"]', '[\"03913c8d-c21d-470a-90fc-b3032fc33f4a\",\"6903278b-dd88-4ae3-b08f-1e3c17aef3da\",\"cf4658bb-885d-4937-bfd8-c5a7963a22d0\"]', 1),
('767f00c7-3388-4c4a-9d22-fad5c0156e23', 'Deutsch-Albanischer Verein für Kultur, Jugend und Sport „Pavarësia“ e. V.', 'Pavarësia e. V.', 48.777298731323, 9.1825549201621, 'keine öffentliche Anschrift', '', '', '', '', '', NULL, 'plain', 'Förderung der Beziehungen zwischen deutschen und albanischen Bürgern, das Pflegen der albanischen Sprache, Kultur und Tradition, sowie die Förderung der Integration der albanischen Bevölkerung in die deutsche Gesellschaft.', 'plain', 'Bildung (muttersprachlicher Unterricht albanisch), Sport (traditioneller Tanz, albanischer Volkstanz, sportliche Aktivitäten), Kultur und Kunst (Vorträge über deutsche und albanische Literatur und Kunst, Land u. a., Dichterlesungen, Musik- und Tanzabende, Studienfahrten).', '[\"c844cb92-75fd-470f-a97a-9ad1235f9fb9\",\"5da2a926-bafc-4cf6-a690-ebe04aae5efb\",\"bca4abd3-7782-49aa-8e02-a5bb389d72a1\",\"a1db41c6-dd67-49d6-95a1-7076aad5cb06\",\"e8908bfd-1f08-482b-9f43-df8c9e0ce0c7\",\"2cd64db3-f049-4b8f-9d57-cbe86f7e8e52\",\"b44949e8-9b04-4fbc-99e7-e278f0be08fc\",\"4fdedb59-a2ec-4ce3-a864-9f2ee54de161\",\"31b8ae1d-0a6c-4f61-8ff9-3dfdbdd5276f\",\"b8848ea0-78b5-4aa4-97ca-7ad5884937dc\"]', '[\"bbf0d197-fcd6-4548-8548-ef1840057018\",\"03913c8d-c21d-470a-90fc-b3032fc33f4a\",\"d3ea05ed-5dcd-4d47-a2aa-18e4eb6294c0\"]', 1),
('777032fb-0efd-4c57-a2ea-e8772c1dbd5b', 'Jesidische Sonne Stuttgart Ezidische Sonne Stuttgart', 'Jesidische Sonne Stuttgart', 48.804578617884, 9.2220661530693, 'keine öffentliche Anschrift', '', '', '', '', '', NULL, 'plain', '', 'plain', 'Kultur und Kunst, Entwicklung und Zusammenarbeit (Integrationshilfe, Unterstützung der jesidischen Gemeinde in Baden-Württemberg), Engagement für Geflüchtete (Zusammenarbeit mit Geflüchteten), Gastronomie (traditionelles Essen), Sport (Tanz).', '[\"fdbc9436-c6fd-40c4-9154-30fad2acd582\",\"7228b82c-5b71-4da7-8e8f-0bff0eb9eed1\",\"80c76142-7a20-46c3-bf48-ecf80bd88036\",\"451b5a6b-f6c0-42b4-8b38-7ac7c40989ee\"]', '[\"d3ea05ed-5dcd-4d47-a2aa-18e4eb6294c0\"]', 1),
('783ad9fb-1af7-48a2-b9f0-4c52a0167474', 'Baye-Fall e. V. senegalesisch-deutsche Vereinigung', 'Baye-Fall e. V.', 48.802496424769, 9.109545055613, '', '', '', 'Kiebitzweg 7', '70499', 'Stuttgart', NULL, 'plain', 'Förderung von Kunst und Kultur, Förderung der internationalen Gesinnung und des Völkerverständigungsgedankens sowie die Förderung\nder Entwicklungszusammenarbeit.', 'plain', 'Bildung (Übersetzungs- und Dolmetscherdienst, Simultanübersetzungen bei Refugio Stuttgart e. V.), Kultur und Kunst (Kulturveranstaltungen, Teilnahme an Kulturveranstaltungen und Straßenfesten, Reparatur von westafrikanischen Trommeln), Gastronomie (Catering, traditionell senegalesiches Essen), Musik (westafrikanisch, Afrobeat, Reggae, Trommelworkshops).', '[\"e4ceb00b-6a23-4de7-bb73-ed1cf8548c43\",\"e8908bfd-1f08-482b-9f43-df8c9e0ce0c7\",\"6232745b-ae38-4386-8ce9-38181ec03167\",\"4880b108-dd18-4666-a5a6-8d8bc511e18a\",\"7dea6712-360f-4e70-bb90-eeec33e466bd\",\"451b5a6b-f6c0-42b4-8b38-7ac7c40989ee\",\"ab4dcc22-1389-49a2-8a35-a37d496e90cb\",\"d5158be0-2840-474a-a7cb-d5307f1d9b78\",\"2e37f150-4703-4c6e-83f2-5e258c99fbdf\",\"191f9550-6dc2-42ef-bd2a-2735f4f7b189\"]', '[\"ff52e1fb-b421-46d4-828b-9e1298a441cf\",\"068af935-dc42-40a4-98ef-e59352e9706c\",\"bbf0d197-fcd6-4548-8548-ef1840057018\"]', 1),
('7b99b747-5a41-430e-8109-9ed96525cef7', 'ADD Stuttgart – Verein zur Förderung der Ideen Atatürks e. V. Atatürk Düsünce Dernegi Stuttgart', 'ADD Stuttgart e. V.', 48.761853508756, 9.159657839156, '', '', '', 'Möhringerstraße 56', '70199', 'Stuttgart', NULL, 'plain', '', 'plain', 'Bildung (Nachhilfe für Kinder und Jugendliche in Deutsch, Englisch und Mathematik, Seminare und Kurse für Eltern und Erwachsene im Umgang mit Teenagern und möglichen Problemen, für die Gleichberechtigung und Rechte der Frauen), Kultur und Kunst (Konferenzen mit Gastvorträgen in türkischer Sprache, Veranstaltungen bei türkischen Nationalfeiertagen).', '[\"c1b1d7ee-4c4f-449e-8013-9611b0f925bc\",\"278e7a85-5d3e-47a1-8dfe-971bb614e541\",\"825cda70-60f5-4517-99e7-6b5415003e01\",\"c844cb92-75fd-470f-a97a-9ad1235f9fb9\",\"27adab7b-bae1-4562-8e1e-898a37ff4e47\",\"bca4abd3-7782-49aa-8e02-a5bb389d72a1\",\"052b4738-3d8b-4ed2-9d07-6e0a8b88b565\",\"4cb40078-cd07-4ed3-ad0b-b5710418a949\"]', '[\"03913c8d-c21d-470a-90fc-b3032fc33f4a\"]', 1),
('7e655ac7-30c2-4479-b535-c3750ff9f4a3', 'Kalimera e. V. Deutsch-Griechische Kulturinitiative', 'Kalimera e. V.', 48.775309112109, 9.1774700518433, '', '', '', 'Marktplatz 4', '70173', 'Stuttgart', NULL, 'plain', '', 'plain', 'Kultur und Kunst (Infoabende mit Podiums- und Publikumsgesprächen, Themen: Finanzkrise in Griechenland und Europa, Flucht und Asyl in Europa, was machen Kulturschaffende in Griechenland. Deutsch-Griechische Filmvorführungen und -festivals mit und ohne Regisseure mit anschließenden Publikumsgesprächen, Kinofestival, Theaterveranstaltungen, Theaterworkshops mit Kinder u. Jugendlichen, Stammtische im Laboratorium, Kooperationsprojekte mit Stuttgarter Einrichtungen, Kooperationsprojekt mit der Stadt Fellbach „Kultursommer Griechenland u. Italien), Musik (Musikkonzert \"Opera Chaotiq\" mit Jugendlichen, Musikkonzerte mit griechischen und internationalen Künstlern, Homagen an griechische Komponist*innen).', '[\"d0634bc5-2e3e-480b-b612-9cdddb26f208\",\"9d716150-f03e-43aa-91fb-13bd53626ecd\",\"5e6bb978-f8a3-4945-8e1f-8a9b21866b04\",\"3d5da784-d4e5-4489-94f5-8de4f253a4a4\",\"474a8ff3-34f9-4912-94b1-4c84d1304a9d\",\"0edf9918-1e88-43a3-91aa-a1c8056baa21\",\"abc9a1a3-b8ac-4ba3-b64d-b93fe702f129\",\"20201b37-683d-4e16-ae4f-3c89e63fa689\",\"14ffd7d7-7641-4634-a7dd-c4ec824b8cf6\",\"a62583fa-4dc8-419f-a583-0e55bcc59e03\"]', '[\"d4b4dc39-3aa8-421b-991c-a37e3a05f08f\",\"d3ea05ed-5dcd-4d47-a2aa-18e4eb6294c0\",\"5a291e38-df35-4b79-bcd5-c0fef2eb07bb\",\"cc397b39-43ee-4d15-9310-746144c207ff\",\"a64b2ee7-ca34-427c-9a9c-df8f5f29319e\",\"e0c9c7a7-d317-4662-93e5-28f281df4fd9\",\"6903278b-dd88-4ae3-b08f-1e3c17aef3da\",\"4e5d36ad-8387-47c5-9c48-5a5e933e6812\",\"77861c3b-3c9c-4ba9-ba03-c6f8832394b2\",\"068af935-dc42-40a4-98ef-e59352e9706c\",\"6f9350a6-0d94-44f4-86a0-d7e0c8edf9db\",\"6069e093-59e5-45b5-8854-fc1691222472\",\"45b57423-e7ea-4e3e-ba37-5e0ec506b1f6\",\"cc67be51-58de-4109-ae78-2b0c018e27da\",\"484d4d38-c9e3-4026-833d-69c3190422d9\",\"bbf0d197-fcd6-4548-8548-ef1840057018\",\"f3aa4a7e-5aac-46b9-9bcf-ced8fd0fa7d0\",\"32db5a17-3732-498e-a6c9-1f87f79a7ecb\",\"4c2c4518-f53d-409d-9c3c-35dbd7ec5395\",\"03913c8d-c21d-470a-90fc-b3032fc33f4a\",\"e5c49e46-df39-46aa-af7c-c59c8d9765eb\",\"52fc72f5-5b87-4eea-a662-87dc14180f1f\",\"632866a1-098a-4e0a-8bfe-e786fd6bdb00\",\"ff52e1fb-b421-46d4-828b-9e1298a441cf\",\"cf4658bb-885d-4937-bfd8-c5a7963a22d0\",\"bab504b9-7f1b-42cf-a01e-ce322fe25590\",\"1a68b204-3bc7-4ebd-a5a9-effc1b65dcb1\"]', 1),
('85e483d3-c84e-4f8b-99b2-2d1f4fb49e89', 'Serbischer Bildungs- und Kulturverein „Prosvjeta“ Deutschland e. V.', 'Prosvjeta Deutschland e. V.', 48.77016859472201, 9.165382372857497, '', '', '', 'Reinsburgstraße 48', '70178', 'Stuttgart', NULL, 'plain', 'Durch zweisprachige Vorträge, Diskussionen, Literaturabende, integrative Projekte, kulturelle Veranstaltungen, Musikprojekte sowie durch Projekte in der Muttersprache ist der Verein bemüht, die allgemeine Kultur und Bildung der in Baden-Württemberg lebenden serbischen Bevölkerung und aller anderen interessierten Personen innerhalb des Vereins, zu fördern, zu entwickeln und auch zu präsentieren.', 'plain', 'Bildung (muttersprachlicher Unterricht für Erwachsene, Musikschule für Kinder und Erwachsene), Kultur und Kunst (Kunst- und Literaturworkshops für Kinder und Erwachsene).', '[\"4cb40078-cd07-4ed3-ad0b-b5710418a949\",\"c844cb92-75fd-470f-a97a-9ad1235f9fb9\",\"e8908bfd-1f08-482b-9f43-df8c9e0ce0c7\",\"a1db41c6-dd67-49d6-95a1-7076aad5cb06\",\"333fa33d-34ed-4424-8d43-0b04df745bad\",\"9091601f-6df5-4350-904b-965bde1e085f\",\"bca4abd3-7782-49aa-8e02-a5bb389d72a1\"]', '[\"def5709b-04dd-409e-a3d9-2831186574d7\"]', 1),
('884c0f37-fc6e-4f08-8028-8dd3ecb1a9a6', 'Nordkaukasischer Kulturverein Stuttgart (NART) e. V.', 'NART e. V.', 48.71141127201, 9.1543316741244, '', '', '', 'Bonhoefferweg 14', '70565', 'Stuttgart', NULL, 'plain', 'Die kaukasische Kultur und die Sprachen zu erhalten diese Mitgliedern, Kulturinteressierten und vor allem einer breiten Öffentlichkeit zugänglich zu machen.\nFörderung soziokultureller Aufgaben und Anliegen in Stuttgart auf gemeinnütziger Basis. Leitbild: Kultur gehört zum Menschen – unabhängig von seiner persönlichen Situation und sozialen Lage. Der Verein ist bunt an Sprachen, Kulturen und Identitäten – genauso wie der Kaukasus!', 'plain', 'Bildung (muttersprachlicher Unterricht), Sport (Tanz), Musik (Musikwerkstatt, Chor-Gesang).', '[\"c844cb92-75fd-470f-a97a-9ad1235f9fb9\",\"80c76142-7a20-46c3-bf48-ecf80bd88036\",\"14ffd7d7-7641-4634-a7dd-c4ec824b8cf6\",\"a62583fa-4dc8-419f-a583-0e55bcc59e03\"]', '[\"d4b4dc39-3aa8-421b-991c-a37e3a05f08f\",\"d3ea05ed-5dcd-4d47-a2aa-18e4eb6294c0\",\"5a291e38-df35-4b79-bcd5-c0fef2eb07bb\",\"cc397b39-43ee-4d15-9310-746144c207ff\",\"a64b2ee7-ca34-427c-9a9c-df8f5f29319e\",\"e0c9c7a7-d317-4662-93e5-28f281df4fd9\",\"6903278b-dd88-4ae3-b08f-1e3c17aef3da\",\"4e5d36ad-8387-47c5-9c48-5a5e933e6812\",\"77861c3b-3c9c-4ba9-ba03-c6f8832394b2\",\"068af935-dc42-40a4-98ef-e59352e9706c\",\"6f9350a6-0d94-44f4-86a0-d7e0c8edf9db\",\"6069e093-59e5-45b5-8854-fc1691222472\",\"45b57423-e7ea-4e3e-ba37-5e0ec506b1f6\",\"cc67be51-58de-4109-ae78-2b0c018e27da\",\"484d4d38-c9e3-4026-833d-69c3190422d9\",\"bbf0d197-fcd6-4548-8548-ef1840057018\",\"f3aa4a7e-5aac-46b9-9bcf-ced8fd0fa7d0\",\"32db5a17-3732-498e-a6c9-1f87f79a7ecb\",\"4c2c4518-f53d-409d-9c3c-35dbd7ec5395\",\"03913c8d-c21d-470a-90fc-b3032fc33f4a\",\"e5c49e46-df39-46aa-af7c-c59c8d9765eb\",\"52fc72f5-5b87-4eea-a662-87dc14180f1f\",\"632866a1-098a-4e0a-8bfe-e786fd6bdb00\",\"ff52e1fb-b421-46d4-828b-9e1298a441cf\",\"cf4658bb-885d-4937-bfd8-c5a7963a22d0\",\"bab504b9-7f1b-42cf-a01e-ce322fe25590\",\"1a68b204-3bc7-4ebd-a5a9-effc1b65dcb1\"]', 1),
('954bf319-b5bc-4c5f-b4a2-3a6748e0ba7f', 'STELP e. V.', '', 48.777171105976, 9.1614714746149, '', '', '', 'Johannesstraße 35', '70176', 'Stuttgart', NULL, 'plain', 'Hilfe für Menschen in Not', 'plain', 'Bildung (Bildungsprojekte), Soziales und Gesundheit (Notversorgung: Verteilung von Lebensmitteln, Verteilung von Kleidung, Häuserbau, Suppenküchen).', '[\"329b0c66-9aa9-430c-b81d-55afa3f4286c\",\"28cb85c2-989b-413c-bbad-819db341305c\",\"7fa1727a-e166-479e-a87e-2cddbcb34945\",\"fb18eb8a-2e84-4110-9320-50dee5eac1dd\",\"3371be08-fc54-4ab5-847e-43a6aedb73da\",\"bbaae84e-1640-45ab-a92b-8d5d9e55146f\",\"74421701-0b80-4180-b59d-59c86bb74e0f\",\"972e06c4-2805-47f2-9be1-c1dc01931e0e\"]', '[\"cf4658bb-885d-4937-bfd8-c5a7963a22d0\",\"845c4868-a060-4f68-861a-f880404bbf11\"]', 1),
('96c2c20f-1fa6-4b47-9445-9f4eceba7d50', 'Igbo Cultural Foundation Stuttgart e. V.', '', 48.694531299843, 9.3195205561337, '', '', '', 'Karlstraße 15', '73770', 'Denkendorf', NULL, 'plain', 'Kultur der Igbo der deutschen Bevölkerung näher bringen.', 'plain', 'Bildung (muttersprachlicher Unterricht), Kultur und Kunst (öffentliche Literaturveranstaltungen), Soziales und Gesundheit (Arbeit mit Seniorinnen), Entwicklung und Zusammenarbeit (Integrationshilfe), Engagement für Geflüchtete (Zusammenarbeit mit Asylbewerberinnen), Gastronomie (Fingerfood, traditionelles Essen), Sport (Fußball, Basketball, Tanz, öffentliche Sportveranstaltungen), Musik (Trommeln, öffentliche Musikveranstaltungen), Podcast (auf YouTube unter Odenjinji Media Stuttgart).', '[\"c844cb92-75fd-470f-a97a-9ad1235f9fb9\",\"5da2a926-bafc-4cf6-a690-ebe04aae5efb\",\"a1db41c6-dd67-49d6-95a1-7076aad5cb06\",\"e467ffd3-fb11-4612-8da1-37d1691d55bc\",\"fdbc9436-c6fd-40c4-9154-30fad2acd582\",\"7228b82c-5b71-4da7-8e8f-0bff0eb9eed1\",\"722b7ee0-b864-4fdf-9ce8-b85bb1f6c27a\",\"451b5a6b-f6c0-42b4-8b38-7ac7c40989ee\",\"383663f1-7d46-4abe-b865-036e0ce7999d\",\"cdb5b6d0-f818-41fa-b3b2-056151253f29\",\"37366af3-b522-4a84-b6d8-18654a4af79e\",\"80c76142-7a20-46c3-bf48-ecf80bd88036\",\"b44949e8-9b04-4fbc-99e7-e278f0be08fc\",\"2e37f150-4703-4c6e-83f2-5e258c99fbdf\",\"97c7d12d-5af6-4e6d-b1c5-6349ace6a915\",\"19a1edf1-62b1-44d7-9c70-83f8d15c4554\"]', '[\"d4b4dc39-3aa8-421b-991c-a37e3a05f08f\",\"d3ea05ed-5dcd-4d47-a2aa-18e4eb6294c0\",\"5a291e38-df35-4b79-bcd5-c0fef2eb07bb\",\"cc397b39-43ee-4d15-9310-746144c207ff\",\"a64b2ee7-ca34-427c-9a9c-df8f5f29319e\",\"e0c9c7a7-d317-4662-93e5-28f281df4fd9\",\"6903278b-dd88-4ae3-b08f-1e3c17aef3da\",\"4e5d36ad-8387-47c5-9c48-5a5e933e6812\",\"77861c3b-3c9c-4ba9-ba03-c6f8832394b2\",\"068af935-dc42-40a4-98ef-e59352e9706c\",\"6f9350a6-0d94-44f4-86a0-d7e0c8edf9db\",\"6069e093-59e5-45b5-8854-fc1691222472\",\"45b57423-e7ea-4e3e-ba37-5e0ec506b1f6\",\"cc67be51-58de-4109-ae78-2b0c018e27da\",\"484d4d38-c9e3-4026-833d-69c3190422d9\",\"bbf0d197-fcd6-4548-8548-ef1840057018\",\"f3aa4a7e-5aac-46b9-9bcf-ced8fd0fa7d0\",\"32db5a17-3732-498e-a6c9-1f87f79a7ecb\",\"4c2c4518-f53d-409d-9c3c-35dbd7ec5395\",\"03913c8d-c21d-470a-90fc-b3032fc33f4a\",\"e5c49e46-df39-46aa-af7c-c59c8d9765eb\",\"52fc72f5-5b87-4eea-a662-87dc14180f1f\",\"632866a1-098a-4e0a-8bfe-e786fd6bdb00\",\"ff52e1fb-b421-46d4-828b-9e1298a441cf\",\"cf4658bb-885d-4937-bfd8-c5a7963a22d0\",\"bab504b9-7f1b-42cf-a01e-ce322fe25590\",\"1a68b204-3bc7-4ebd-a5a9-effc1b65dcb1\"]', 1),
('97ac48a4-7218-4cff-a08a-810d971272ca', 'Forum Afrikanum Stuttgart e. V.', NULL, 48.762185005681, 9.1600409154624, 'keine öffentliche Anschrift', '', '', '', '', '', NULL, 'plain', 'Begegnungen schaffen, Austausch, Mitgestaltung des Kulturlebens in Stuttgart. Der Verein ist konfessionell und parteipolitisch neutral.', 'plain', 'Bildung (Vorträge, Workshops), Kultur und Kunst (Konzerte, Ausstellungen, Lesungen, Filme, Projekte).', '[\"9220d0a4-6442-4ea3-a0d2-4f0bbe4339f1\",\"2ffe3540-9b42-4c60-a385-1ad316b61e60\",\"06a381ca-109c-49d1-b6fa-5019b13b9ebf\",\"2cd64db3-f049-4b8f-9d57-cbe86f7e8e52\",\"ef8228c0-b7d6-44a1-91cc-51d21a96e3cf\",\"474a8ff3-34f9-4912-94b1-4c84d1304a9d\",\"b44949e8-9b04-4fbc-99e7-e278f0be08fc\"]', '[\"77861c3b-3c9c-4ba9-ba03-c6f8832394b2\",\"cf4658bb-885d-4937-bfd8-c5a7963a22d0\"]', 1),
('9e425f18-8f1e-4c09-a828-df470bb9ad9b', 'Black Community Foundation Stuttgart', NULL, 48.780421943983, 9.1826557898861, 'keine öffentliche Anschrift', '', '', '', '', '', NULL, 'plain', 'Kampf gegen Rassismus gegen Schwarze, Empowerment der Black Community, Rassismus-Sensibilisierung.', 'plain', 'Bildung (Sensibilisierungs-Workshops und Arbeit gegen Rassismus im Fokus auf Anti-Schwarzen-Rassismus, Empowerment-Workshops zu verschiedenen Themen für die Black Community und PoCs); Beratung (Unterstützung von Blackowned Businesses und schwarzen Künstlern, wie Artists); Kultur und Kunst (Teilnahme an Diskussionsrunden, Aufklärung an Schulen, tägliches Aufklären verschiedener Themen auf unserem IG-Account).', '[\"2ce08d25-dda5-44b5-95ad-d3938bf2245f\",\"8bdaffb1-6f76-49f3-a999-c0fecfad483b\",\"3de679fc-437e-4fdd-8c60-06f47e23b035\",\"9220d0a4-6442-4ea3-a0d2-4f0bbe4339f1\",\"d0634bc5-2e3e-480b-b612-9cdddb26f208\"]', '[\"def5709b-04dd-409e-a3d9-2831186574d7\"]', 1),
('9f8cbfc7-3ee5-40bd-bc1f-748046eb4989', 'Afro Deutsches Akademiker Netzwerk ADAN e. V.', 'ADAN e. V.', 48.781338897416, 9.1824413964678, 'Keine öffentliche Anschrift', '', '', '', '', '', '', 'plain', 'Eine Plattform für die Interaktion zwischen Afrodeutschen, AfrikanernInnen und Afrika-Interessierten Personen zu bieten;\nVielfalt sichtbar zu machen und jungen AfrikanerInnen in der Diaspora Vorbilder aus unterschiedlichen Bereichen zu präsentieren;\nAfrika als Chancenkontinent zu präsentieren, um eine nachhaltige Brücke zwischen Afrika und Europa zu kreieren.', 'plain', 'Bildung (Beratung von Jugendlichen und Heranwachsenden bei den Themen Schule, Studium und Zukunftsplanung); Diversity (Vielfalt sichtbar machen und fördern); Netzwerk (welches als Plattform für den gegenseitigen Austausch von Deutsch-Afrikanern und\nAfrikainteressierten dient und nachhaltige Beziehungen in den Bereichen der Wirtschaft, Gesellschaft und Kultur zu entwickeln)', '[\"62a4abe0-70f7-487a-85ea-ccc9c953dc14\",\"41677e42-91e2-44bb-9a52-a68c804e42fc\",\"345e2349-38e4-4f75-b540-ce5271a16be5\",\"3d5da784-d4e5-4489-94f5-8de4f253a4a4\"]', '[\"068af935-dc42-40a4-98ef-e59352e9706c\"]', 1),
('afd58c27-cf61-466d-96e7-c4ea4c54ce03', 'Medienkulturverein Multicolor e. V.', '', 48.789967792734, 9.1995758616665, '', '', '', 'Stöckachstraße 16a', '70190', 'Stuttgart', NULL, 'plain', 'Realisierung von Medienprojekten aller Art, meist unter interkulturellen Aspekten. Menschen mit und ohne Migrationshintergrund sollen mediale Möglichkeiten an die Hand gegeben werden, ihre Welt und ihre Themen in einer verständlichen Art sichtbar, hörbar und erlebbar zu machen.', 'plain', 'Kultur und Kunst (Ausstellung), Podcast (Radio, Podcasts, Audiodateien). Ausgewählte Projekte: \"Mittendrin – Mein Leben ist Stuttgart und davor\" (Eine Radioproduktion aus Texten, Klängen und Geräuschen, die Lebenserfahrungen und Alltag von Migrant*innen in Stuttgart hörbar macht), \"Spurensuche\" (Junge Menschen haben sich auf den Weg gemacht, Höhepunkte oder auch Verborgenes in Stuttgart zu entdecken und medial aufzubereiten), \"Meinst du, die Russen wollen Krieg?\" (Wanderausstellung mit Rollups und gerahmten Fotografien über das heutige Russland).', '[\"19a1edf1-62b1-44d7-9c70-83f8d15c4554\",\"bd8011d6-6811-4374-89c3-bc172ef47324\",\"06a381ca-109c-49d1-b6fa-5019b13b9ebf\",\"3d5da784-d4e5-4489-94f5-8de4f253a4a4\",\"e8908bfd-1f08-482b-9f43-df8c9e0ce0c7\",\"ef8228c0-b7d6-44a1-91cc-51d21a96e3cf\",\"c7b06389-554b-4d82-9a8a-01107f7c348e\"]', '[\"d4b4dc39-3aa8-421b-991c-a37e3a05f08f\",\"d3ea05ed-5dcd-4d47-a2aa-18e4eb6294c0\",\"5a291e38-df35-4b79-bcd5-c0fef2eb07bb\",\"cc397b39-43ee-4d15-9310-746144c207ff\",\"a64b2ee7-ca34-427c-9a9c-df8f5f29319e\",\"e0c9c7a7-d317-4662-93e5-28f281df4fd9\",\"6903278b-dd88-4ae3-b08f-1e3c17aef3da\",\"4e5d36ad-8387-47c5-9c48-5a5e933e6812\",\"77861c3b-3c9c-4ba9-ba03-c6f8832394b2\",\"068af935-dc42-40a4-98ef-e59352e9706c\",\"6f9350a6-0d94-44f4-86a0-d7e0c8edf9db\",\"6069e093-59e5-45b5-8854-fc1691222472\",\"45b57423-e7ea-4e3e-ba37-5e0ec506b1f6\",\"cc67be51-58de-4109-ae78-2b0c018e27da\",\"484d4d38-c9e3-4026-833d-69c3190422d9\",\"bbf0d197-fcd6-4548-8548-ef1840057018\",\"f3aa4a7e-5aac-46b9-9bcf-ced8fd0fa7d0\",\"32db5a17-3732-498e-a6c9-1f87f79a7ecb\",\"4c2c4518-f53d-409d-9c3c-35dbd7ec5395\",\"03913c8d-c21d-470a-90fc-b3032fc33f4a\",\"e5c49e46-df39-46aa-af7c-c59c8d9765eb\",\"52fc72f5-5b87-4eea-a662-87dc14180f1f\",\"632866a1-098a-4e0a-8bfe-e786fd6bdb00\",\"ff52e1fb-b421-46d4-828b-9e1298a441cf\",\"cf4658bb-885d-4937-bfd8-c5a7963a22d0\",\"bab504b9-7f1b-42cf-a01e-ce322fe25590\",\"1a68b204-3bc7-4ebd-a5a9-effc1b65dcb1\"]', 1),
('b19c9166-b97f-45a9-9859-ce72012cb0a9', 'Freunde des Italienischen Kulturinstituts in Stuttgart e. V.', 'Freunde des Ital. Kulturinstituts e. V.', 48.765009477148, 9.1695145164245, '', '', '', 'Kolbstraße 6', '70178', 'Stuttgart', NULL, 'plain', 'Bekanntmachung der italienischen Kultur und Sprache.', 'plain', 'Bildung (Sprachunterricht, Italienischkurse für alle).', '[\"c844cb92-75fd-470f-a97a-9ad1235f9fb9\",\"5da2a926-bafc-4cf6-a690-ebe04aae5efb\",\"bca4abd3-7782-49aa-8e02-a5bb389d72a1\"]', '[\"03913c8d-c21d-470a-90fc-b3032fc33f4a\"]', 1),
('b7909656-0aaf-4e01-929f-a7dd3d9d3193', 'tigre vermelho e. V. Freundeskreis zur Förderung der Kultur Brasiliens', 'tigre vermelho e. V.', 48.799673144463, 9.4874616832492, '', '', '', 'Schorndorfer Straße 47', '73650', 'Winterbach', NULL, 'plain', 'Vermittlung brasilianischer Lebensfreude, Spenden an Projekte in Brasilien und Deutschland zum Wohl von Kindern.', 'plain', 'Kultur und Kunst (Karnevalsparty \"Carnaval dos Tigres\" im Römerkastell/Phönixhalle mit Tanzshows, DJs, \"Waiblinger Altstadtfest\" mit Samba-Shows, Partymusik, Cocktails), Gastronomie (Essen), Musik (brasilianische Band).', '[\"67460b3f-e0a0-4047-aeba-8d142f52de8b\",\"474a8ff3-34f9-4912-94b1-4c84d1304a9d\",\"31b8ae1d-0a6c-4f61-8ff9-3dfdbdd5276f\",\"9b726c9e-2566-4a38-b835-d1266a049faf\",\"33b0cc3d-c898-4f71-974b-61c1b8607ac1\",\"be43d95c-3e04-41d3-8c3c-5b57cea61f50\",\"f6822fff-0b6b-4739-a321-32124e952699\",\"451b5a6b-f6c0-42b4-8b38-7ac7c40989ee\"]', '[\"b34a153d-bd29-4b97-9814-23f10c5048e8\",\"d3ea05ed-5dcd-4d47-a2aa-18e4eb6294c0\"]', 1),
('b90d8590-8068-462b-ae25-e9ec55f5e8c8', 'Internationales Forum für Wissenschaft, Bildung und Kultur e. V.', 'IFWBK e. V.', 48.808946920396, 9.229779374039, '', '', '', '', '', 'Stuttgart Bad-Cannstatt', '', 'plain', 'Popularisierung und Förderung der Wissenschaft, Bildung, Kunst und Kultur für alle Generationen, insbesondere für Kinder und Jugendliche auf regionaler, nationaler und internationaler Ebene. Der Verein bleibt bei der Verfolgung dieser Ziele politisch und konfessionell neutral.', 'plain', 'Bildung (MINT Projekt), Kultur und Kunst (Klassische Konzerte für Kinder und Jugendliche).', '[\"756a75d5-dce7-4e45-ad4a-961301fe3712\",\"b8848ea0-78b5-4aa4-97ca-7ad5884937dc\",\"20201b37-683d-4e16-ae4f-3c89e63fa689\",\"b44949e8-9b04-4fbc-99e7-e278f0be08fc\",\"7a414d58-c8cd-4dff-8b77-0f299f2920c9\",\"2ffe3540-9b42-4c60-a385-1ad316b61e60\",\"9220d0a4-6442-4ea3-a0d2-4f0bbe4339f1\",\"d0634bc5-2e3e-480b-b612-9cdddb26f208\",\"f618d917-a61d-46a3-808c-5e21a037a37d\"]', '[\"068af935-dc42-40a4-98ef-e59352e9706c\"]', 1),
('bb6cbae9-5ad6-4d08-be2a-e2b0bd9791dd', 'COEXIST e. V.', '', 48.812892354564, 9.1587575882592, '', '', '', 'Kärntner Straße 40A', '70469', 'Stuttgart', NULL, 'plain', 'Der Verein Coexist hat den Anspruch bei gesamtgesellschaftlichen Diskursen mitzuwirken und bietet Menschen ein Sprachrohr.', 'plain', 'Bildung (Empowerment-Angebote, Workshops zum Thema \"Frauenrechte\", Aufklärung).', '[\"2ce08d25-dda5-44b5-95ad-d3938bf2245f\",\"825cda70-60f5-4517-99e7-6b5415003e01\"]', '[\"d3ea05ed-5dcd-4d47-a2aa-18e4eb6294c0\"]', 1),
('bb8d0d54-21a3-4ead-be62-75f1f0ce90d6', 'Sri Lanka-Deutschland Freundeskreis e. V.', 'Sri Lanka-Deutschl. Freundeskreis e. V.', 48.808982927454, 9.2341668755655, '', '', '', 'Kneippweg 7', '70374', 'Stuttgart', NULL, 'plain', 'Förderung internationaler Gesinnung, der Toleranz auf allen Gebieten der Kultur und des Völkerverständigungsgedankens und die Förderung mildtätiger Zwecke.', 'plain', 'Bildung (muttersprachlicher Unterricht, Workshops zum Thema Sri Lanka: Land, Leute, Kultur, Gesellschaft, Religion, Politik usw.), Gastronomie (Catering, traditionelles Essen, Kochkurse), Sport (traditioneller Tanz, Indischer Tanz), Musik (traditionelle Musik, Indische Musik, Musikunterricht (Violine).', '[\"c844cb92-75fd-470f-a97a-9ad1235f9fb9\",\"2ffe3540-9b42-4c60-a385-1ad316b61e60\",\"bca4abd3-7782-49aa-8e02-a5bb389d72a1\",\"3d5da784-d4e5-4489-94f5-8de4f253a4a4\",\"5e6bb978-f8a3-4945-8e1f-8a9b21866b04\",\"451b5a6b-f6c0-42b4-8b38-7ac7c40989ee\",\"7dea6712-360f-4e70-bb90-eeec33e466bd\",\"5cf4a2a2-30ac-491f-b9ec-3ef8920a52a9\",\"abc9a1a3-b8ac-4ba3-b64d-b93fe702f129\",\"333fa33d-34ed-4424-8d43-0b04df745bad\",\"1eacdec4-6689-4bb7-bff9-b2ec5259f6ac\"]', '[\"d3ea05ed-5dcd-4d47-a2aa-18e4eb6294c0\",\"def5709b-04dd-409e-a3d9-2831186574d7\"]', 1),
('bf6d4d85-4016-4721-9bca-3404ff7db400', 'Lettischer Kulturverein SAIME e. V.', '', 48.762318382583, 9.1602145529877, 'keine öffentliche Anschrift', '', '', '', '', '', NULL, 'plain', 'Pflege der lettischen Kultur und Geschichte, Bräuche sowie Sprache in Wort und Schrift für und mit den Landsleuten in der neuen Heimat . Es werden Konzerte, Lesungen, Treffen, Feste, Theatervorstellungen, Vorträge, Infoabende, Filmvorführungen etc. zur Vermittlung und Erhaltung kultureller und historischer Traditionen durchgeführt. Beteiligung am gesellschaftlichen und kulturellen Leben sowie die Zusammenarbeit zwischen Letten und Bürgern unterschiedlicher Herkunft und Generationen.', 'plain', 'Bildung (muttersprachlicher Unterricht lettisch, Kinder-Kultur-Schule mit Sprach-, Gesangs- und Tanzunterricht), Kultur und Kunst (Kulturveranstaltungen), Sport (traditioneller Tanz, lettische Volkstanzgruppe \"Trejdeksnitis\").', '[\"c844cb92-75fd-470f-a97a-9ad1235f9fb9\",\"5da2a926-bafc-4cf6-a690-ebe04aae5efb\",\"ebfac38a-7acd-48ae-b79c-49441f98937b\",\"5e63b584-e7a0-468e-95ae-4efa306bf9bc\",\"1eacdec4-6689-4bb7-bff9-b2ec5259f6ac\",\"e8908bfd-1f08-482b-9f43-df8c9e0ce0c7\"]', '[\"03913c8d-c21d-470a-90fc-b3032fc33f4a\",\"38fb84bd-9bc3-416f-ade8-1d4be4fdb22e\",\"f15af137-6b8b-44f2-927e-5bfc0bb86ca9\"]', 1),
('c4a32813-94db-4931-9088-57ac9b1673bb', 'Forum der Kulturen Stuttgart e. V.', '', 48.775300666353, 9.1774637358494, '', '', '', 'Marktplatz 4', '70173', 'Stuttgart', NULL, 'plain', 'Dachverband der Migrantenvereine und interkulturellen Einrichtungen\nStuttgarter Interkulturbüro\nMitglied im Bundesverband Netzwerke von Migrantenorganisationen e. V. (NeMO)', 'plain', '', '[\"e8908bfd-1f08-482b-9f43-df8c9e0ce0c7\",\"bca4abd3-7782-49aa-8e02-a5bb389d72a1\",\"71a52ead-7207-4be5-af01-43419524746d\",\"b49214e4-26dc-4e23-9559-7eeefeb1e50d\",\"3d5da784-d4e5-4489-94f5-8de4f253a4a4\",\"345e2349-38e4-4f75-b540-ce5271a16be5\"]', '[\"def5709b-04dd-409e-a3d9-2831186574d7\",\"f15af137-6b8b-44f2-927e-5bfc0bb86ca9\",\"126c225a-cd98-4560-8fae-94cd0ec0bff4\"]', 1);
INSERT INTO `associations` (`id`, `name`, `shortName`, `lat`, `lng`, `addressLine1`, `addressLine2`, `addressLine3`, `street`, `postcode`, `city`, `country`, `goals_format`, `goals_text`, `activities_format`, `activities_text`, `activityList`, `districtList`, `current`) VALUES
('ccaf6bfa-1c4a-43ef-b8bc-e2da7412996a', 'China Kultur-Kreis e. V.', '', 48.808838013428, 9.2367449806061, '', '', '', 'Prießnitzweg 7', '70374', 'Stuttgart', NULL, 'plain', 'Vermittlung chinesischer Sprachkenntnisse und chinesischer Kultur, Pflege der chinesisch-deutschen Zusammenarbeit und des Dialogs, sowie Förderung interkultureller Kompetenzen. Der Verein gründete 1997 die „Chinesische Sprachschule Stuttgart“, um die chinesische Kultur und Sprache zu unterrichten. Die Schule ist eine Wochenendschule für die in Deutschland lebenden Kinder chinesischer Abstammung und alle Freunde, die sich für die chinesische Kultur und die chinesische Sprache interessieren.', 'plain', 'Bildung (muttersprachlicher Unterricht chinesisch, Kurse in der traditionellen chinesischen Kultur).', '[\"c844cb92-75fd-470f-a97a-9ad1235f9fb9\",\"cdbee767-bb81-453a-9b6a-1cbf28449e7d\",\"5da2a926-bafc-4cf6-a690-ebe04aae5efb\",\"bca4abd3-7782-49aa-8e02-a5bb389d72a1\"]', '[\"e0c9c7a7-d317-4662-93e5-28f281df4fd9\"]', 1),
('cf10f76f-1a0b-4f6d-9dc7-80a68512032a', 'Serbisches Akademikernetzwerk - Nikola Tesla e. V.', 'Nikola Tesla e. V.', 48.78481595, 9.1784653964969, '', '', '', 'Kriegsbergstraße 28', '70174', 'Stuttgart', NULL, 'plain', 'Aktive Teilhabe an der deutschen Gesellschaft durch Projekte aus den Bereichen Bildung und Kultur. Die Vernetzung von deutschen und serbischen Institutionen und der aktive Wissensaustausch sind hierbei von großer Bedeutung, weshalb die Veranstaltungen für eine breite Öffentlichkeit zugänglich sind.', 'plain', 'Bildung (Bildungsprojekte z. B. Mobile Denkfabrik, Power Einwanderer), Kultur und Kunst (Filmfestival www.filmanak.de, Lesungen).', '[\"2ffe3540-9b42-4c60-a385-1ad316b61e60\",\"2ce08d25-dda5-44b5-95ad-d3938bf2245f\",\"cdbee767-bb81-453a-9b6a-1cbf28449e7d\",\"474a8ff3-34f9-4912-94b1-4c84d1304a9d\",\"2cd64db3-f049-4b8f-9d57-cbe86f7e8e52\",\"e8908bfd-1f08-482b-9f43-df8c9e0ce0c7\",\"a1db41c6-dd67-49d6-95a1-7076aad5cb06\"]', '[\"def5709b-04dd-409e-a3d9-2831186574d7\"]', 1),
('d4fe1ebc-641b-416d-a51d-563ba733eb46', 'Mexikanische Tanzgruppe Adelitas Tapatías & Charros', 'Adelitas Tapatías & Charros', 48.778569634971, 9.1798619013575, 'keine öffentliche Anschrift', '', '', '', '', '', NULL, 'plain', 'Verbreitung der mexikanischen Kultur in Deutschland.', 'plain', 'Sport (mexikanischer Tanz)', '[\"1eacdec4-6689-4bb7-bff9-b2ec5259f6ac\",\"bca4abd3-7782-49aa-8e02-a5bb389d72a1\"]', '[\"def5709b-04dd-409e-a3d9-2831186574d7\"]', 1),
('eee41f26-5e5d-4b40-a5f4-f6c3272fd9bc', 'Latin Jazz Initiative', '', 48.774425774302, 9.1671338404569, '', '', '', 'Gutenbergstraße 3B', '70176', 'Stuttgart', NULL, 'plain', 'Die Latin Jazz Initiative entstand aus dem Bedürfnis neue Wege zu suchen, um das Jazz Publikum (nicht nur das Latin Jazz Publikum) auf diese wunderbare Musik aufmerksam zu machen. Durch Jazz entsteht Kommunikation unabhängig von Herkunft, Glauben oder anderen «Hindernissen», die in vielen anderen Bereichen das Zusammensein schwieriger machen.', 'plain', 'Beratung (Veranstaltungsplanung), Kunst und Kultur (Organisation und Durchführung von Festivals, Konzerte, Konzertreihen, Workshops, Jazz Open Stage, UNESCO-International Jazzday, UNESCO-International Danceday, United Jazz Ensemble, Musik im Viertel (Konzerte in kleinen Geschäften in verschiedenen Stadtteilen)), Bildung (Musikunterricht, Jazz-Workshops, Latin Jazz, Jazzdance und Latin Jazzdance, ein lebendiges Hörbuch, in dem der Autor seine eigenen Bücher liest und die Lesung musikalisch mit Stücken umrahmt, die extra hierfür komponiert werden).', '[\"34539fac-77ee-46d0-a259-fad432a87eb1\",\"ba68962d-fa8a-4057-837d-3bdf708f2ce0\",\"052b4738-3d8b-4ed2-9d07-6e0a8b88b565\",\"7a414d58-c8cd-4dff-8b77-0f299f2920c9\",\"b44949e8-9b04-4fbc-99e7-e278f0be08fc\",\"393be716-0bb3-4034-ad75-c4348b741e85\",\"cecd9baa-87a1-466b-82ac-a1dca8419f38\",\"9091601f-6df5-4350-904b-965bde1e085f\",\"333fa33d-34ed-4424-8d43-0b04df745bad\",\"2ffe3540-9b42-4c60-a385-1ad316b61e60\",\"1d17d1ab-963c-4d02-a43b-77f9706327fe\",\"6c6dab40-3af5-410c-8866-af397260ab2a\"]', '[\"068af935-dc42-40a4-98ef-e59352e9706c\",\"cf4658bb-885d-4937-bfd8-c5a7963a22d0\"]', 1),
('fbc648a0-99da-4404-bc9f-3b13ad648277', 'Förderverein Hero\'s Academy AIC Stuttgart e. V.', 'Hero\'s Academy e. V.', 48.777637357309, 9.1513805953056, 'keine öffentliche Anschrift', '', '', '', '', '', NULL, 'plain', 'Verwirklichung von Projekten, um Kindern in Kenia zu helfen und ihnen eine Chance auf Bildung zu geben.', 'plain', 'Bildung (finanzielle Unterstützung des Unterhalts der Academy, Grundschule und Kindergarten), Entwicklung und Zusammenarbeit (Unterstützung bei der Instandsetzung und Einrichtung sowie evtl. Baumaßnahmen von Schule und Kindergarten, Hilfestellung zur Selbsthilfe des Unterhalts, anteilige finanzielle Unterstützung für Lehrmaterial, Vermittlung von Schulpatenschaften).', '[\"436d00b9-1c26-4806-a8d1-8f6846a28af8\",\"34c2338a-0e1a-4625-bea6-fdeb94a5d56a\"]', '[\"cf4658bb-885d-4937-bfd8-c5a7963a22d0\"]', 1),
('fef60c29-29db-4cd3-81d1-289d09400160', 'Africa Workshop Organisation e. V.', '', 48.772159857501, 9.1745903444409, '', '', '', 'Tübinger Straße 15', '70178', 'Stuttgart', NULL, 'plain', 'Bekanntmachung der afrikanischen Kultur, Unterstützung bei der Integration in die Stuttgarter Gesellschaft. Der Verein ist als humanitäre Selbsthilfegruppe und Völkerverständigungsverein seit 1988 in der Region Stuttgart aktiv.', 'plain', 'Bildung (Zielgruppe Kinder, Jugendliche, Eltern und Erwachsene), Soziales und Gesundheit (Arbeit mit Senior*innen, Menschen mit Behinderung), Entwicklung und Zusammenarbeit (Integrationshilfe), Engagement für Geflüchtete (Zusammenarbeit mit Geflüchteten).', '[\"4cb40078-cd07-4ed3-ad0b-b5710418a949\",\"5562fe36-bc8f-465b-ac18-4b5b820fc31b\",\"e467ffd3-fb11-4612-8da1-37d1691d55bc\",\"7228b82c-5b71-4da7-8e8f-0bff0eb9eed1\",\"fdbc9436-c6fd-40c4-9154-30fad2acd582\"]', '[\"d4b4dc39-3aa8-421b-991c-a37e3a05f08f\",\"d3ea05ed-5dcd-4d47-a2aa-18e4eb6294c0\",\"5a291e38-df35-4b79-bcd5-c0fef2eb07bb\",\"cc397b39-43ee-4d15-9310-746144c207ff\",\"a64b2ee7-ca34-427c-9a9c-df8f5f29319e\",\"e0c9c7a7-d317-4662-93e5-28f281df4fd9\",\"6903278b-dd88-4ae3-b08f-1e3c17aef3da\",\"4e5d36ad-8387-47c5-9c48-5a5e933e6812\",\"77861c3b-3c9c-4ba9-ba03-c6f8832394b2\",\"068af935-dc42-40a4-98ef-e59352e9706c\",\"6f9350a6-0d94-44f4-86a0-d7e0c8edf9db\",\"6069e093-59e5-45b5-8854-fc1691222472\",\"45b57423-e7ea-4e3e-ba37-5e0ec506b1f6\",\"cc67be51-58de-4109-ae78-2b0c018e27da\",\"484d4d38-c9e3-4026-833d-69c3190422d9\",\"bbf0d197-fcd6-4548-8548-ef1840057018\",\"f3aa4a7e-5aac-46b9-9bcf-ced8fd0fa7d0\",\"32db5a17-3732-498e-a6c9-1f87f79a7ecb\",\"4c2c4518-f53d-409d-9c3c-35dbd7ec5395\",\"03913c8d-c21d-470a-90fc-b3032fc33f4a\",\"e5c49e46-df39-46aa-af7c-c59c8d9765eb\",\"52fc72f5-5b87-4eea-a662-87dc14180f1f\",\"632866a1-098a-4e0a-8bfe-e786fd6bdb00\",\"ff52e1fb-b421-46d4-828b-9e1298a441cf\",\"cf4658bb-885d-4937-bfd8-c5a7963a22d0\",\"bab504b9-7f1b-42cf-a01e-ce322fe25590\",\"1a68b204-3bc7-4ebd-a5a9-effc1b65dcb1\"]', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `contacts`
--

CREATE TABLE `contacts` (
  `id` varchar(36) NOT NULL,
  `name` varchar(512) DEFAULT NULL,
  `phone` varchar(512) DEFAULT NULL,
  `fax` varchar(512) DEFAULT NULL,
  `mail` varchar(512) DEFAULT NULL,
  `associationId` varchar(36) NOT NULL,
  `orderIndex` int(11) DEFAULT NULL,
  `current` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `phone`, `fax`, `mail`, `associationId`, `orderIndex`, `current`) VALUES
('0a67370b-72c5-41d9-a309-e14d93ec6739', '', '0176 / 82078688', '', 'info@klangoase-derya.de', '171d9f6d-dd62-4113-b262-949692e790e8', 0, 1),
('0a86dd91-4791-4d27-84dd-0aa7988727b4', '', '', '', 'mail@punto-de-encuentro.net', '2417c64b-cb09-4e84-8d15-e972a8c6e313', 0, 1),
('0cf6722d-4b4e-4d69-b52f-35b64096c7eb', '', '0179/5010311', '', 'post@latin-jazz-initiative.de', 'eee41f26-5e5d-4b40-a5f4-f6c3272fd9bc', 0, 1),
('1e97a03d-3dee-40c0-ab81-b566f2742440', '', '0173 / 9718681', '', 'castillajor@aol.com', '030f5468-5e92-4232-aaa6-6780ed1db82c', 0, 1),
('20208bac-48bb-448f-9bcd-33105dce0cd0', '', '0172/8578716', '', 'info@abada-capoeira.eu', '195c1cfc-2e0a-4842-8700-d2f716e43ae0', 0, 1),
('2d36bd45-bca5-4dd5-8bf0-27750129567f', '', '0152 / 08790860', '', 'info@ndwenga-fellbach.de', '30d0925a-ca00-4d68-af44-0856092f2928', 0, 1),
('32f503ad-ab75-4352-9ea1-5400a643884e', '', '0711 / 8946890', '', 'info@bkhw.org', '3b72a4a4-024c-4049-ab75-9de2898f3ccd', 0, 1),
('39137b79-625c-4589-bbc3-d64d1e443a8d', '', '0711 / 248 44 41', '', 'info@dtf-stuttgart.de', '3b10b0c7-dc5a-4d96-9ce4-c23200652a86', 0, 1),
('3d3460fd-f86b-46f3-8dfa-97c585c76548', 'Aylish Kerrigan', '0711/640 74 82', '', 'aylishk@aol.com', '70a5f5f0-8a8f-485c-9f76-f68484aadd75', 0, 1),
('46094121-e04f-4ede-9cbf-a3065f2e2979', '', '0157 / 779577870', '', 'saime@latviesi.com', 'bf6d4d85-4016-4721-9bca-3404ff7db400', 0, 1),
('5027fd57-f728-4812-b0fb-f4928426f073', '', '', '', 'stuttgart@ada-netzwerk.com', '9f8cbfc7-3ee5-40bd-bc1f-748046eb4989', 0, 1),
('55252607-6128-408b-beb7-1ff951a7889a', '', '0178 / 8346746', '', 'info@herosacademy.org', 'fbc648a0-99da-4404-bc9f-3b13ad648277', 0, 1),
('5bc8cd30-dea7-443d-ae14-a36b4c234e36', '', '0163/650 86 04', '', 'G.koeksal@gmx.de', '7b99b747-5a41-430e-8109-9ed96525cef7', 0, 1),
('63349d8c-c3cc-4d70-8e9b-857844aaca2c', '', '', '', 'info@capoeira-stuttgart.org', '38e9abc6-dc51-4270-9568-2185a69ab0eb', 0, 1),
('6911d7fc-6b4d-4dbc-8c52-6ea58479dcb1', '', '0173 / 412 71 83', '', 'Yalova@hotmail.de', '19837db4-8b34-44ff-95fb-de5d88545f4d', 0, 1),
('6d29d7e0-117c-469a-a047-09472b4affd1', '', '0172 / 6334382', '', 'igboculturalfoundation@gmail.com', '96c2c20f-1fa6-4b47-9445-9f4eceba7d50', 0, 1),
('7d3b6176-a87e-45a8-a964-4a33f94a2a2e', '', '0157 / 790 78 470', '', 'info@forum-gerrum-stuttgart.de', '04659eb2-e809-4543-b987-ad491468593b', 0, 1),
('84140cd4-9232-4457-9a4b-8f9ed177ffef', '', '', '', 'info@tigre.de', 'b7909656-0aaf-4e01-929f-a7dd3d9d3193', 0, 1),
('8bd4d88d-fdce-4922-ba01-d9b23637bb5c', '', '0178 / 3888986', '', 'n.jayasuriya@gmx.de', '2991aab2-8d9d-48c3-8ee1-fda7a4335108', 0, 1),
('8cfa7275-960f-40c8-86dc-7e515871deda', '', '', '', 'info@nart-stuttgart.de', '884c0f37-fc6e-4f08-8028-8dd3ecb1a9a6', 0, 1),
('90264513-3f4e-44e0-be69-7c8aabeef735', '', '0711 / 162 81 20', '', 'corsilingua.iicstuttgart@esteri.it', 'b19c9166-b97f-45a9-9859-ce72012cb0a9', 0, 1),
('9217920e-046a-4d7a-ac9c-e11ebeac2eff', '', '0151 / 75859183', '', 'prosvjeta.stuttgart@gmx.de', '85e483d3-c84e-4f8b-99b2-2d1f4fb49e89', 0, 1),
('99336b66-117f-48ec-835b-2ab0a0ae90fa', '', '0170 / 582 6402', '', 'ozaharsha@gmail.com', '36a84dbb-4776-4f05-8dd7-69101a30755c', 0, 1),
('9c71bfae-f58e-4837-82ca-f34862a41390', '', '0711 / 8601188', '', '', '777032fb-0efd-4c57-a2ea-e8772c1dbd5b', 0, 1),
('a7acd88e-084c-4220-9889-b4c539b21b0b', '', '', '', 'bcf.stuttgart@gmail.com', '9e425f18-8f1e-4c09-a828-df470bb9ad9b', 0, 1),
('a9384ea6-41ec-40e7-bf01-a6b627029f46', '', '', '', 'sc-stuttgart@gmx.de', '712a34c7-2f5c-41c2-aeb7-9821a304dd5c', 0, 1),
('af5217c5-9e00-4fb6-b8ca-d85d35d67267', '', '', '', 'vietnamcommunitystuttgart@googlemail.com', '6de56a3e-f5b0-4f06-a77e-bbbd4858f9e9', 0, 1),
('b1283f93-aeb2-419a-899b-77e850ae86d2', '', '0176 / 24909496', '', 'team@stelp.eu', '954bf319-b5bc-4c5f-b4a2-3a6748e0ba7f', 0, 1),
('b34d02a4-c972-4fbf-9f30-776068efa2ad', '', '0711 / 94529847', '', 'info@stufem.de', '3f123c62-7a3c-4d9f-a09b-674926356b88', 0, 1),
('b829a6f2-847f-4df1-855c-e4c49a3c7214', '', '', '', 'coexist@t-online.de', 'bb6cbae9-5ad6-4d08-be2a-e2b0bd9791dd', 0, 1),
('c5488987-2795-46af-8379-c8094b875944', '', '0176 / 81057694', '', 'info@adelitas.de', 'd4fe1ebc-641b-416d-a51d-563ba733eb46', 0, 1),
('cd72cf27-ac00-430f-b9be-b2520cc56b38', '', '0711 / 248 48 08-0', '0711 / 248 48 08-88', 'info@forum-der-kulturen.de', 'c4a32813-94db-4931-9088-57ac9b1673bb', 0, 1),
('e0ff3bfe-957f-4a45-9b29-4ea912b3b92a', '', '0711 / 8601304', '', 'baye_fall_ev@yahoo.com', '783ad9fb-1af7-48a2-b9f0-4c52a0167474', 0, 1),
('e1735047-e11f-46bb-96d7-cd16b09f4822', '', '0157 / 82965484', '', 'info@forum-afrikanum.de', '97ac48a4-7218-4cff-a08a-810d971272ca', 0, 1),
('e21189f5-d009-4a29-a787-acadae3292c6', '', '', '', 'info@kd-slovenija.de', '219d2242-1c30-4493-be65-52cb9978f23e', 0, 1),
('e6303fe7-e13f-469d-9178-b2ed39e60ef1', '', '', '', 'office@sam-nt.de', 'cf10f76f-1a0b-4f6d-9dc7-80a68512032a', 0, 1),
('e8387d0a-eb6d-4fb4-ab23-cbc9156ec3ad', '', '0711 / 55 08 963', '', 'yputra@web.de', 'bb8d0d54-21a3-4ead-be62-75f1f0ce90d6', 0, 1),
('e840cc66-a1c3-4d0d-bb41-10d4a7a3816a', '', '0173/1912555', '', 'info@forum-wbk.de', 'b90d8590-8068-462b-ae25-e9ec55f5e8c8', 0, 1),
('ece3d675-f0c9-41c5-9333-198aa23ffa4b', '', '07192/200 82', '', '2009ggsa@gmail.com', 'fef60c29-29db-4cd3-81d1-289d09400160', 0, 1),
('efe65c64-8610-4b4c-995c-722888affb76', '', '0711 / 964 12 53', '', 'info@multicolor-stuttgart.de', 'afd58c27-cf61-466d-96e7-c4ea4c54ce03', 0, 1),
('f7dd6842-1bae-4d1e-95ac-b2f9e24dbed4', '', '0176 / 456 751 31', '', 'info@vereinpavaresia.de', '767f00c7-3388-4c4a-9d22-fad5c0156e23', 0, 1),
('f80f5226-bb28-4801-82dd-3f2130ded295', '', '0711 / 6143552', '', 'hif@afro-soleil.de', '0110dd61-0bf5-4e62-abe5-772e1bd92d03', 0, 1),
('f84a5276-b4a3-439a-9a8c-ec3fe11ce2cc', '', '0711 / 528 67 36', '', 'info@chinesische-sprachschule-stuttgart.de', 'ccaf6bfa-1c4a-43ef-b8bc-e2da7412996a', 0, 1),
('fb929251-e589-451b-81c2-91c02fa8bd2b', '', '0711 / 60 44 06', '', 'schaal.stuttgart@freenet.de', '0991ef8a-2e54-4bb6-a2a9-523f35982a40', 0, 1),
('fe969449-8f77-4180-a94e-b17ed3702dee', '', '', '', 'info@kalimera-ev.de', '7e655ac7-30c2-4479-b535-c3750ff9f4a3', 0, 1),
('ffccfe7b-de43-4159-ba9e-fe4d3ccfabad', '', '', '', 'info@dante-stuttgart.de', '2ffbfe6b-9a16-4e0d-9b60-4bd7c747fb34', 0, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `districts`
--

CREATE TABLE `districts` (
  `value` varchar(36) NOT NULL,
  `label` varchar(512) NOT NULL,
  `category` varchar(36) DEFAULT NULL,
  `orderIndex` int(11) DEFAULT NULL,
  `current` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `districts`
--

INSERT INTO `districts` (`value`, `label`, `category`, `orderIndex`, `current`) VALUES
('03913c8d-c21d-470a-90fc-b3032fc33f4a', 'Stuttgart-Süd', 'd4b4dc39-3aa8-421b-991c-a37e3a05f08f', 1, 1),
('068af935-dc42-40a4-98ef-e59352e9706c', 'Stuttgart-Mitte', 'd4b4dc39-3aa8-421b-991c-a37e3a05f08f', 1, 1),
('0f91a15c-dd80-47c5-915e-b5b596641929', 'Übergreifend', NULL, 3, 1),
('126c225a-cd98-4560-8fae-94cd0ec0bff4', 'Bundesweit (Deutschland)', '0f91a15c-dd80-47c5-915e-b5b596641929', 3, 1),
('1a04156f-facc-494c-8061-7fc8138adf91', 'Ludwigsburg', '2717c531-6aa6-4d87-80d7-f70141d04c63', 2, 1),
('1a68b204-3bc7-4ebd-a5a9-effc1b65dcb1', 'Stuttgart-Zuffenhausen', 'd4b4dc39-3aa8-421b-991c-a37e3a05f08f', 1, 1),
('2717c531-6aa6-4d87-80d7-f70141d04c63', 'Region Stuttgart', NULL, 2, 1),
('29681fff-3d9a-4d88-b4fa-5984a2f3fbbf', 'Leonberg', '2717c531-6aa6-4d87-80d7-f70141d04c63', 2, 1),
('32db5a17-3732-498e-a6c9-1f87f79a7ecb', 'Stuttgart-Sillenbuch', 'd4b4dc39-3aa8-421b-991c-a37e3a05f08f', 1, 1),
('38fb84bd-9bc3-416f-ade8-1d4be4fdb22e', 'Esslingen am Neckar', '2717c531-6aa6-4d87-80d7-f70141d04c63', 2, 1),
('45b57423-e7ea-4e3e-ba37-5e0ec506b1f6', 'Stuttgart-Münster', 'd4b4dc39-3aa8-421b-991c-a37e3a05f08f', 1, 1),
('484d4d38-c9e3-4026-833d-69c3190422d9', 'Stuttgart-Obertürkheim', 'd4b4dc39-3aa8-421b-991c-a37e3a05f08f', 1, 1),
('4c2c4518-f53d-409d-9c3c-35dbd7ec5395', 'Stuttgart-Stammheim', 'd4b4dc39-3aa8-421b-991c-a37e3a05f08f', 1, 1),
('4e5d36ad-8387-47c5-9c48-5a5e933e6812', 'Stuttgart-Hedelfingen', 'd4b4dc39-3aa8-421b-991c-a37e3a05f08f', 1, 1),
('52fc72f5-5b87-4eea-a662-87dc14180f1f', 'Stuttgart-Vaihingen', 'd4b4dc39-3aa8-421b-991c-a37e3a05f08f', 1, 1),
('5a291e38-df35-4b79-bcd5-c0fef2eb07bb', 'Stuttgart-Birkach', 'd4b4dc39-3aa8-421b-991c-a37e3a05f08f', 1, 1),
('6069e093-59e5-45b5-8854-fc1691222472', 'Stuttgart-Mühlhausen', 'd4b4dc39-3aa8-421b-991c-a37e3a05f08f', 1, 1),
('632866a1-098a-4e0a-8bfe-e786fd6bdb00', 'Stuttgart-Wangen', 'd4b4dc39-3aa8-421b-991c-a37e3a05f08f', 1, 1),
('68c95b21-6d7b-4ef2-8372-a3e53869e52d', 'Böblingen', '2717c531-6aa6-4d87-80d7-f70141d04c63', 2, 1),
('6903278b-dd88-4ae3-b08f-1e3c17aef3da', 'Stuttgart-Hallschlag', 'd4b4dc39-3aa8-421b-991c-a37e3a05f08f', 1, 1),
('6aff7a3e-28be-45dd-90cc-5eaa689f2fd9', 'Ditzingen', '2717c531-6aa6-4d87-80d7-f70141d04c63', 2, 1),
('6f9350a6-0d94-44f4-86a0-d7e0c8edf9db', 'Stuttgart-Möhringen', 'd4b4dc39-3aa8-421b-991c-a37e3a05f08f', 1, 1),
('77861c3b-3c9c-4ba9-ba03-c6f8832394b2', 'Stuttgart-Heslach', 'd4b4dc39-3aa8-421b-991c-a37e3a05f08f', 1, 1),
('80df1e1c-c4c1-4999-b1ee-a089f9991038', 'Sindelfingen', '2717c531-6aa6-4d87-80d7-f70141d04c63', 2, 1),
('845c4868-a060-4f68-861a-f880404bbf11', 'International', '0f91a15c-dd80-47c5-915e-b5b596641929', 3, 1),
('a64b2ee7-ca34-427c-9a9c-df8f5f29319e', 'Stuttgart-Degerloch', 'd4b4dc39-3aa8-421b-991c-a37e3a05f08f', 1, 1),
('b34a153d-bd29-4b97-9814-23f10c5048e8', 'Waiblingen', '2717c531-6aa6-4d87-80d7-f70141d04c63', 2, 1),
('bab504b9-7f1b-42cf-a01e-ce322fe25590', 'Stuttgart-Zazenhausen', 'd4b4dc39-3aa8-421b-991c-a37e3a05f08f', 1, 1),
('bbf0d197-fcd6-4548-8548-ef1840057018', 'Stuttgart-Ost', 'd4b4dc39-3aa8-421b-991c-a37e3a05f08f', 1, 1),
('cc397b39-43ee-4d15-9310-746144c207ff', 'Stuttgart-Botnang', 'd4b4dc39-3aa8-421b-991c-a37e3a05f08f', 1, 1),
('cc67be51-58de-4109-ae78-2b0c018e27da', 'Stuttgart-Nord', 'd4b4dc39-3aa8-421b-991c-a37e3a05f08f', 1, 1),
('cf4658bb-885d-4937-bfd8-c5a7963a22d0', 'Stuttgart-West', 'd4b4dc39-3aa8-421b-991c-a37e3a05f08f', 1, 1),
('d3ea05ed-5dcd-4d47-a2aa-18e4eb6294c0', 'Stuttgart-Bad-Cannstatt', 'd4b4dc39-3aa8-421b-991c-a37e3a05f08f', 1, 1),
('d4b4dc39-3aa8-421b-991c-a37e3a05f08f', 'Stadt Stuttgart', NULL, 1, 1),
('def5709b-04dd-409e-a3d9-2831186574d7', 'Stuttgart und Region', '0f91a15c-dd80-47c5-915e-b5b596641929', 3, 1),
('e0c9c7a7-d317-4662-93e5-28f281df4fd9', 'Stuttgart-Feuerbach', 'd4b4dc39-3aa8-421b-991c-a37e3a05f08f', 1, 1),
('e5c49e46-df39-46aa-af7c-c59c8d9765eb', 'Stuttgart-Untertürkheim', 'd4b4dc39-3aa8-421b-991c-a37e3a05f08f', 1, 1),
('ee4de3c1-f202-4b67-a8ee-ee53c95af538', 'Fellbach', '2717c531-6aa6-4d87-80d7-f70141d04c63', 2, 1),
('f15af137-6b8b-44f2-927e-5bfc0bb86ca9', 'Landesweit (Baden-Württemberg)', '0f91a15c-dd80-47c5-915e-b5b596641929', 3, 1),
('f3aa4a7e-5aac-46b9-9bcf-ced8fd0fa7d0', 'Stuttgart-Plieningen', 'd4b4dc39-3aa8-421b-991c-a37e3a05f08f', 1, 1),
('ff52e1fb-b421-46d4-828b-9e1298a441cf', 'Stuttgart-Weilimdorf', 'd4b4dc39-3aa8-421b-991c-a37e3a05f08f', 1, 1),
('ff6dfb12-0d8d-4f71-94c1-3f92f7314db2', 'Göppingen', '2717c531-6aa6-4d87-80d7-f70141d04c63', 2, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `images`
--

CREATE TABLE `images` (
  `id` varchar(36) NOT NULL,
  `url` varchar(512) NOT NULL,
  `altText` varchar(512) DEFAULT NULL,
  `associationId` varchar(36) NOT NULL,
  `orderIndex` int(11) DEFAULT NULL,
  `current` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `images`
--

INSERT INTO `images` (`id`, `url`, `altText`, `associationId`, `orderIndex`, `current`) VALUES
('01725d93-f3e7-489a-8e0e-dfed79c57852', 'https://house-of-resources-stuttgart.de/wp-content/uploads/2020/11/LogoJAZZ_OK.jpg', 'Latin Jazz Initiative', 'eee41f26-5e5d-4b40-a5f4-f6c3272fd9bc', 0, 1),
('0b676161-a7e5-43e5-8d13-e2f32786a561', 'https://house-of-resources-stuttgart.de/wp-content/uploads/2020/11/Forum_Afrikanum_Logo-scaled.jpg', 'Forum Afrikanum Stuttgart e. V.', '97ac48a4-7218-4cff-a08a-810d971272ca', 0, 1),
('0da83685-aa73-4175-8ccc-bc5c22b95b29', 'https://house-of-resources-stuttgart.de/wp-content/uploads/2020/11/Foerderverein-Heros-Academy-AIC-Stuttgart-e.-V.-scaled.jpg', 'Förderverein Hero\'s Academy AIC Stuttgart e. V.', 'fbc648a0-99da-4404-bc9f-3b13ad648277', 0, 1),
('131967bc-56c8-4219-b2a1-b0f6b595d760', 'https://house-of-resources-stuttgart.de/wp-content/uploads/2020/11/Logo_SCS_2015-.jpg', 'Srpski Centar Stuttgart e. V.', '712a34c7-2f5c-41c2-aeb7-9821a304dd5c', 0, 1),
('2d3621f9-5bff-4bf3-849f-5bf866aff5b3', 'https://house-of-resources-stuttgart.de/wp-content/uploads/2020/11/Adelitas-Tapatias.jpg', 'Mexikanische Tanzgruppe Adelitas Tapatías & Charros', 'd4fe1ebc-641b-416d-a51d-563ba733eb46', 0, 1),
('393f6679-f470-4993-ae3f-e43503df8632', 'https://house-of-resources-stuttgart.de/wp-content/uploads/2020/11/Punto-de-Encuentro-e.-V..png', 'Punto de encuentro', '2417c64b-cb09-4e84-8d15-e972a8c6e313', 0, 1),
('406e9c50-9f3b-4346-adad-32f055c5fb35', 'https://house-of-resources-stuttgart.de/wp-content/uploads/2020/11/Serbischer-Bildungs-und-Kulturverein-%E2%80%9EProsvjeta-Deutschland-e.-V..jpg', 'Serbischer Bildungs- und Kulturverein „Prosvjeta“ Deutschland e. V.', '85e483d3-c84e-4f8b-99b2-2d1f4fb49e89', 0, 1),
('441be4dc-62e2-43ce-aa75-7eb7c8855b67', 'https://house-of-resources-stuttgart.de/wp-content/uploads/2020/11/DTF-Projekte.png', 'Deutsch-Türkisches Forum Stuttgart e. V.', '3b10b0c7-dc5a-4d96-9ce4-c23200652a86', 0, 1),
('444c4a7c-43ce-4d82-8a53-88483d63fe8d', 'https://house-of-resources-stuttgart.de/wp-content/uploads/2020/11/Forum-der-Kulturen-3-scaled.jpg', 'Sri Lanka-Deutschland Freundeskreis e. V.', 'bb8d0d54-21a3-4ead-be62-75f1f0ce90d6', 0, 1),
('53481afe-b730-41e5-b0a1-5a386b12cc81', 'https://house-of-resources-stuttgart.de/wp-content/uploads/2020/11/club-logo.png', 'Srilankisch-Deutscher-Verein Stuttgart e. V.', '2991aab2-8d9d-48c3-8ee1-fda7a4335108', 0, 1),
('5e13a2bb-01e0-4a74-ad23-afcb9fdfadee', 'https://house-of-resources-stuttgart.de/wp-content/uploads/2020/11/China-Kultur-Kreis-e.-V.-scaled.jpg', 'China Kultur-Kreis e. V.', 'ccaf6bfa-1c4a-43ef-b8bc-e2da7412996a', 0, 1),
('678d4660-53ae-4868-9659-7f5ea73362f0', 'https://house-of-resources-stuttgart.de/wp-content/uploads/2020/11/Akademie-fuer-internationalen-Kulturaustausch-e.V.-Aylish-Kerrigan1.jpg', 'Aylish Kerrigan', '70a5f5f0-8a8f-485c-9f76-f68484aadd75', 1, 1),
('6f55f175-c419-45d6-8614-f02db63f42ae', 'https://house-of-resources-stuttgart.de/wp-content/uploads/2020/11/india-culture-forum.jpeg', 'India Culture Forum e. V.', '36a84dbb-4776-4f05-8dd7-69101a30755c', 0, 1),
('70d036e9-30a3-4403-851d-b577fa65faae', 'https://house-of-resources-stuttgart.de/wp-content/uploads/2020/11/logo_1f980094ef8e4dfc2c99eab269df270b_2x.png', '', '3f123c62-7a3c-4d9f-a09b-674926356b88', 0, 1),
('71e5f770-dd74-4594-9b9f-4c5a33cc80b4', 'https://house-of-resources-stuttgart.de/wp-content/uploads/2020/11/Stelp_Supporter_yellow-blue-min.png', 'STELP e. V.', '954bf319-b5bc-4c5f-b4a2-3a6748e0ba7f', 0, 1),
('755a16ea-bfce-48f4-ae09-b82a9be5b3e6', 'https://house-of-resources-stuttgart.de/wp-content/uploads/2020/11/Logo-Verein-Ndwenga-e.-V.jpg', 'Ndwenga e. V.', '30d0925a-ca00-4d68-af44-0856092f2928', 0, 1),
('771cd654-6ec0-4615-8aa7-84d7a434da79', 'https://house-of-resources-stuttgart.de/wp-content/uploads/2020/11/multicolor-nur-logo-neu.gif', 'Medienkulturverein Multicolor e. V.', 'afd58c27-cf61-466d-96e7-c4ea4c54ce03', 0, 1),
('8f8f63f6-5c9b-4e3f-85f6-a6bc2b763862', 'https://house-of-resources-stuttgart.de/wp-content/uploads/2020/11/Kulturverein-Slovenija-Stuttgart-e.-V.-logo.png', 'Kulturverein Slovenija-Stuttgart e. V.', '219d2242-1c30-4493-be65-52cb9978f23e', 0, 1),
('92efe338-86bc-46e4-a05d-60435a1f3795', 'https://house-of-resources-stuttgart.de/wp-content/uploads/2020/11/Deutsch-Rumaenisches-Forum-Stuttgart-e.V..png', 'Deutsch-Rumänisches Forum e. V.', '04659eb2-e809-4543-b987-ad491468593b', 0, 1),
('97037571-c436-4863-aa0e-a411892852b5', 'https://house-of-resources-stuttgart.de/wp-content/uploads/2020/11/FdK_Logo_4c_rot.png', 'Forum der Kulturen Stuttgart e. V.', 'c4a32813-94db-4931-9088-57ac9b1673bb', 0, 1),
('975a58ff-8d4a-4fde-8a5a-d174907da048', 'https://house-of-resources-stuttgart.de/wp-content/uploads/2020/11/kalimera_klein.jpg', 'Kalimera e. V. Deutsch-Griechische Kulturinitiative', '7e655ac7-30c2-4479-b535-c3750ff9f4a3', 0, 1),
('b8f6c4af-a3d0-44f3-b2ec-8121667b3954', 'https://house-of-resources-stuttgart.de/wp-content/uploads/2020/11/Serbisches-Akademikernetzwerk-Nikola-Tesla-e.-V..png', 'Serbisches Akademikernetzwerk - Nikola Tesla e. V.', 'cf10f76f-1a0b-4f6d-9dc7-80a68512032a', 0, 1),
('bd3999f3-8cc2-4b18-bab4-554c8e67b3ca', 'https://house-of-resources-stuttgart.de/wp-content/uploads/2020/11/Nordkaukasischer-Kulturverein-Stuttgart.jpg', 'Nordkaukasischer Kulturverein Stuttgart (NART) e. V.', '884c0f37-fc6e-4f08-8028-8dd3ecb1a9a6', 0, 1),
('bd4d9846-60df-4dcf-8ead-413a6f70ae8e', 'https://house-of-resources-stuttgart.de/wp-content/uploads/2020/11/Logo-Akademie-fuer-internationalen-Kulturaustausch-e.V.-scaled.jpg', 'Akademie für internationalen Kulturaustausch e. V.', '70a5f5f0-8a8f-485c-9f76-f68484aadd75', 0, 1),
('c15841ad-5f9b-4f3b-b77e-72facf12b14e', 'https://house-of-resources-stuttgart.de/wp-content/uploads/2020/11/logo.gif', 'Internationaler Musik- und Kulturverein Klangoase e. V.', '171d9f6d-dd62-4113-b262-949692e790e8', 0, 1),
('d5deb61e-507c-40fb-9439-66aba043a314', 'https://house-of-resources-stuttgart.de/wp-content/uploads/2020/11/IFWBK_logo_flyer.png', 'IFWBK-Logo', 'b90d8590-8068-462b-ae25-e9ec55f5e8c8', 0, 1),
('deed6764-76e4-4272-ac5c-ad4bc0c46292', 'https://house-of-resources-stuttgart.de/wp-content/uploads/2020/11/logo.jpg', 'Afrikafestival Stuttgart', '59f81c29-5f86-47ec-8a8a-322d53ae14ff', 0, 1),
('e1d65af5-5f21-4607-9ee5-8c9b3c437fe5', 'https://house-of-resources-stuttgart.de/wp-content/uploads/2020/11/Logo_Pavaresia.png', 'Deutsch-Albanischer Verein für Kultur, Jugend und Sport „Pavarësia“ e. V.', '767f00c7-3388-4c4a-9d22-fad5c0156e23', 0, 1),
('e80e13c8-dcda-4306-af3d-7cae7dcbdbf6', 'https://house-of-resources-stuttgart.de/wp-content/uploads/2020/11/19388741_1152716738166081_8179760973660957952_o.jpg', 'Srpski Centar Stuttgart e. V.', '712a34c7-2f5c-41c2-aeb7-9821a304dd5c', 1, 1),
('ea0f61b1-cf08-4dfa-9ee8-458f5c10fdfe', 'https://house-of-resources-stuttgart.de/wp-content/uploads/2020/11/Saime_logo.jpg', 'Lettischer Kulturverein SAIME e. V.', 'bf6d4d85-4016-4721-9bca-3404ff7db400', 0, 1),
('f989276b-9e8a-40ba-913b-364e0bc5c301', 'https://house-of-resources-stuttgart.de/wp-content/uploads/2020/11/Club_espanol_StuttgarLOGO.png', 'Club Español Stuttgart e. V.', '030f5468-5e92-4232-aaa6-6780ed1db82c', 0, 1),
('ffddf641-1fbc-4f8d-a701-11a466540178', 'https://house-of-resources-stuttgart.de/wp-content/uploads/2020/11/firkat_logo_rgb.jpg', 'Firkat, klassisch-türkischer Musikverein Stuttgart e. V.', '19837db4-8b34-44ff-95fb-de5d88545f4d', 0, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `links`
--

CREATE TABLE `links` (
  `id` varchar(36) NOT NULL,
  `url` varchar(512) NOT NULL,
  `linkText` varchar(512) DEFAULT NULL,
  `associationId` varchar(36) NOT NULL,
  `orderIndex` int(11) DEFAULT NULL,
  `current` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `links`
--

INSERT INTO `links` (`id`, `url`, `linkText`, `associationId`, `orderIndex`, `current`) VALUES
('00435128-2c66-4883-a52a-4218b3f4f59b', 'https://www.forum-der-kulturen.de/', 'www.forum-der-kulturen.de', 'c4a32813-94db-4931-9088-57ac9b1673bb', 0, 1),
('018ceb70-a7ae-42da-98c3-3d4d4786fc53', 'http://www.africa-workshop.de', 'Africa-workshop.de', 'fef60c29-29db-4cd3-81d1-289d09400160', 1, 1),
('0e6d079e-f585-49fd-b2a3-0746f9fddb81', 'https://www.chinesische-sprachschule-stuttgart.de/', 'www.chinesische-sprachschule-stuttgart.de', 'ccaf6bfa-1c4a-43ef-b8bc-e2da7412996a', 0, 1),
('176b4a55-ba08-4b19-841e-a07453c39815', 'https://www.forum-afrikanum.de/', 'www.forum-afrikanum.de', '97ac48a4-7218-4cff-a08a-810d971272ca', 0, 1),
('1e2afacc-9535-4f1a-8d2e-50e38d65d685', 'https://www.forum-wbk.de', 'Internationales Forum für Wissenschaft, Bildung und Kultur e.V.', 'b90d8590-8068-462b-ae25-e9ec55f5e8c8', 0, 1),
('1e89543d-4d1c-48c0-aa26-015de6608bed', 'https://kd-slovenija.de/', 'kd-slovenija.de', '219d2242-1c30-4493-be65-52cb9978f23e', 0, 1),
('20d53c39-df3f-497b-a222-f6b4749be3a0', 'https://house-of-resources-stuttgart.de/', 'house-of-resources-stuttgart.de', 'c4a32813-94db-4931-9088-57ac9b1673bb', 1, 1),
('20fd455b-21b1-44de-ab55-add33b939978', 'https://www.latin-jazz-initiative.de', 'Latin Jazz Initiative', 'eee41f26-5e5d-4b40-a5f4-f6c3272fd9bc', 0, 1),
('21bac2e2-095d-482b-8d6a-d849240523f4', 'https://www.sprachedermusik.de', 'Die Sprache der Musik', 'b90d8590-8068-462b-ae25-e9ec55f5e8c8', 1, 1),
('2da14e08-ca3f-4cba-a9a5-a1c5d033c492', 'http://www.dtf-stuttgart.de/', 'www.dtf-stuttgart.de', '3b10b0c7-dc5a-4d96-9ce4-c23200652a86', 0, 1),
('2ec00bad-6aa5-422e-80e8-1afdf18c2b56', 'https://www.herosacademy.org/', 'www.herosacademy.org', 'fbc648a0-99da-4404-bc9f-3b13ad648277', 0, 1),
('309959b0-adc3-4c5e-8a88-1ac5f4506e1b', 'https://www.abada-capoeira.eu', 'ABADÁ Capoeira e. V.', '195c1cfc-2e0a-4842-8700-d2f716e43ae0', 0, 1),
('38481feb-3f34-4ebc-b4bd-3a026cfbeaa4', 'http://www.ndwenga-kinshasa.de/', 'www.ndwenga-kinshasa.de', '30d0925a-ca00-4d68-af44-0856092f2928', 1, 1),
('3adb8c2c-606d-47b4-aa30-d146ced5780e', 'https://ada-netzwerk.com/', 'ada-netzwerk.com', '9f8cbfc7-3ee5-40bd-bc1f-748046eb4989', 0, 1),
('4c43a33b-23d7-4017-b99b-f9bdd03bb6d6', 'https://www.adelitas.de/', 'www.adelitas.de', 'd4fe1ebc-641b-416d-a51d-563ba733eb46', 0, 1),
('4fe93128-d645-4ded-919b-b2293cc506f0', 'http://www.memo-bw.de/', 'www.memo-bw.de', 'c4a32813-94db-4931-9088-57ac9b1673bb', 4, 1),
('4ffc82ca-0936-4b43-971d-0b62d599cf19', 'https://www.stufem.de/', 'www.stufem.de', '3f123c62-7a3c-4d9f-a09b-674926356b88', 0, 1),
('51917066-c0a9-4ca9-afcd-94937b38b015', 'https://www.ecuador-freunde-stuttgart.com', 'www.ecuador-freunde-stuttgart.com', '0991ef8a-2e54-4bb6-a2a9-523f35982a40', 0, 1),
('5aaef8af-232f-4457-a725-e3b0fe50fef1', 'https://www.iicstoccarda.esteri.it/', 'www.iicstoccarda.esteri.it', 'b19c9166-b97f-45a9-9859-ce72012cb0a9', 0, 1),
('62cb904f-a99b-4409-ba1d-d2696c7f9716', 'https://verein-saime.de/', 'verein-saime.de', 'bf6d4d85-4016-4721-9bca-3404ff7db400', 0, 1),
('63f2e35e-3f14-497c-a0bb-588fa4b24fb4', 'http://sldv-stuttgart.de/', 'sldv-stuttgart.de', '2991aab2-8d9d-48c3-8ee1-fda7a4335108', 0, 1),
('6c0008cc-7308-4c3f-aa10-87f53e5627b2', 'https://www.tigre.de/', 'www.tigre.de', 'b7909656-0aaf-4e01-929f-a7dd3d9d3193', 0, 1),
('7a6e1376-9747-480f-a512-ce76bd648a98', 'http://www.add-stuttgart.de', 'ADD Stuttgart', '7b99b747-5a41-430e-8109-9ed96525cef7', 0, 1),
('80113d00-8812-4478-8c05-1d7e51cc7bda', 'http://www.klangoase-derya.com/', 'www.klangoase-derya.com', '171d9f6d-dd62-4113-b262-949692e790e8', 0, 1),
('889dad2d-bd99-4f1a-8afa-1cbf9bde30b3', 'https://punto-de-encuentro.net/', 'punto-de-encuentro.net', '2417c64b-cb09-4e84-8d15-e972a8c6e313', 0, 1),
('8bd03d7f-61f8-4ed0-b2c4-6a6134335953', 'http://www.coexistev.de', 'coexistev.de', 'bb6cbae9-5ad6-4d08-be2a-e2b0bd9791dd', 0, 1),
('8d1a75e5-8e4f-4937-8cf4-69fdc963cd92', 'https://sprachedermusik.de/musik-ohne-grenzen', '\"Musik ohne Grenzen\" (Festival)', 'b90d8590-8068-462b-ae25-e9ec55f5e8c8', 2, 1),
('8e1f64a7-1fc3-41f5-be78-c0b0e61dd615', 'http://www.clubespagnolestuttgart.de/', 'www.clubespagnolestuttgart.de', '030f5468-5e92-4232-aaa6-6780ed1db82c', 0, 1),
('9c5b9bb3-8e14-4da6-a409-beb42dc70337', 'http://www.multicolor-stuttgart.de/', 'www.multicolor-stuttgart.de', 'afd58c27-cf61-466d-96e7-c4ea4c54ce03', 0, 1),
('a5fc877d-0476-4f3d-a8d5-1dcfb21fffe5', 'https://sommerfestival-der-kulturen.de/', 'sommerfestival-der-kulturen.de', 'c4a32813-94db-4931-9088-57ac9b1673bb', 2, 1),
('a7f3b8fc-ff12-441b-a872-589f09ad5e8f', 'https://mig.madeingermany-stuttgart.de/', 'mig.madeingermany-stuttgart.de', 'c4a32813-94db-4931-9088-57ac9b1673bb', 3, 1),
('a88f020f-b3b3-4907-a9bd-590077b86860', 'https://www.cydd-bw.de', 'cydd-bw.de', '00de259f-254a-491f-8555-1ed658c6a85b', 0, 1),
('b42b92ff-47be-44c6-8bba-ddb4db3ce1db', 'https://www.forum-gerrum-stuttgart.de/', 'www.forum-gerrum-stuttgart.de', '04659eb2-e809-4543-b987-ad491468593b', 0, 1),
('bf822c16-def9-4153-9748-1098e77f7482', 'https://bayefall-ev.com/', 'bayefall-ev.com', '783ad9fb-1af7-48a2-b9f0-4c52a0167474', 0, 1),
('cbfbc0f6-cd80-4c1a-b2ea-d0c55e12f5ce', 'https://stelp.eu/', 'www.stelp.eu', '954bf319-b5bc-4c5f-b4a2-3a6748e0ba7f', 0, 1),
('d00df8a8-f733-4e86-b962-2b7f65c51612', 'https://www.indiacultureforum.de/', 'www.indiacultureforum.de', '36a84dbb-4776-4f05-8dd7-69101a30755c', 0, 1),
('d4b009dc-27b9-4507-b671-aa1c401a9336', 'http://www.afro-soleil.de/', 'www.afro-soleil.de', '0110dd61-0bf5-4e62-abe5-772e1bd92d03', 0, 1),
('d4ed5b00-e760-4c41-bb88-23480bea54fc', 'https://www.dante-stuttgart.de/', 'www.dante-stuttgart.de', '2ffbfe6b-9a16-4e0d-9b60-4bd7c747fb34', 0, 1),
('d507cd07-9d57-4012-bbd1-c7326b23b579', 'http://www.shoqatapavaresia.de/', 'www.shoqatapavaresia.de', '767f00c7-3388-4c4a-9d22-fad5c0156e23', 0, 1),
('e7341884-30cd-4ce5-be77-f8b7a773bd6d', 'https://www.kalimera-ev.de/', '', '7e655ac7-30c2-4479-b535-c3750ff9f4a3', 0, 1),
('e82a6533-be0c-4d34-94dc-5f94e5ffdf0e', 'http://www.firkat.de/', 'www.firkat.de', '19837db4-8b34-44ff-95fb-de5d88545f4d', 0, 1),
('eb52a930-2383-4b71-be14-2fac7cd210c8', 'http://www.ggsa.de/', 'www.ggsa.de', 'fef60c29-29db-4cd3-81d1-289d09400160', 2, 1),
('ec1b0c49-d1e1-4edf-b4f6-3b53eaeea3f3', 'https://sam-nt.eu/', 'sam-nt.eu', 'cf10f76f-1a0b-4f6d-9dc7-80a68512032a', 0, 1),
('f176697c-2b1e-4b4c-93fa-beee267db49a', 'https://www.ndwenga-fellbach.de/', 'www.ndwenga-fellbach.de', '30d0925a-ca00-4d68-af44-0856092f2928', 0, 1),
('f32fee8c-9b61-4c4f-94d6-5978859283e9', 'https://capoeira-stuttgart.org/', 'www.capoeira-stuttgart.org', '38e9abc6-dc51-4270-9568-2185a69ab0eb', 0, 1),
('f47e3c5d-f8e5-4d13-9e8c-dff978a86cd6', 'https://www.bkhw.org/', 'www.bkhw.org', '3b72a4a4-024c-4049-ab75-9de2898f3ccd', 0, 1),
('fb4236d7-6026-4b82-b4ce-cb7bbb637576', 'http://www.afrikaworkshop.de', 'Afrikaworkshop.de', 'fef60c29-29db-4cd3-81d1-289d09400160', 0, 1),
('fcc2e530-cbf4-4bf1-8011-295f21891636', 'https://www.afrikafestival-stuttgart.de', 'Afrikafestival Stuttgart', '59f81c29-5f86-47ec-8a8a-322d53ae14ff', 0, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `socialmedia`
--

CREATE TABLE `socialmedia` (
  `id` varchar(36) NOT NULL,
  `platform` varchar(128) NOT NULL,
  `url` varchar(512) NOT NULL,
  `linkText` varchar(512) DEFAULT NULL,
  `associationId` varchar(36) NOT NULL,
  `orderIndex` int(11) DEFAULT NULL,
  `current` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `socialmedia`
--

INSERT INTO `socialmedia` (`id`, `platform`, `url`, `linkText`, `associationId`, `orderIndex`, `current`) VALUES
('00e3a4ef-9166-40e9-a825-2ac51074a29c', 'Instagram', 'https://www.instagram.com/antoniocuadrosdebejar/', '', 'eee41f26-5e5d-4b40-a5f4-f6c3272fd9bc', 0, 1),
('03c222e0-093b-45c8-90e8-2de6128048e5', 'Facebook', 'https://www.facebook.com/DeutschTuerkischesForumStuttgart', '', '3b10b0c7-dc5a-4d96-9ce4-c23200652a86', 0, 1),
('15152036-427b-40e1-8385-0711f1892613', 'Facebook', 'https://www.facebook.com/pages/category/Nonprofit-Organization/Punto-de-Encuentro-eV-Stuttgart-110697967281557/', '', '2417c64b-cb09-4e84-8d15-e972a8c6e313', 0, 1),
('26ed1add-5e7d-4031-a580-f1075e582cee', 'Instagram', 'https://www.instagram.com/dtfstuttgart/', '', '3b10b0c7-dc5a-4d96-9ce4-c23200652a86', 1, 1),
('2b2de65f-7b09-4331-9cde-fb666532a261', 'Facebook', 'https://de-de.facebook.com/FDKStuttgart', '', 'c4a32813-94db-4931-9088-57ac9b1673bb', 0, 1),
('2e8b2865-12f1-48f1-ba49-3d0af2cf7505', 'YouTube', 'https://www.youtube.com/channel/UCrXoEYsGsc-TrO1fwSk5XsA/videos', '', '96c2c20f-1fa6-4b47-9445-9f4eceba7d50', 1, 1),
('31bc335f-2c1e-4894-b49a-123f0922d4ef', 'Instagram', 'https://www.instagram.com/asociacionpde/', '', '2417c64b-cb09-4e84-8d15-e972a8c6e313', 1, 1),
('328a508e-cc85-42f6-8935-58fb1e06bd39', 'Instagram', 'https://www.instagram.com/sam_nts/', '', 'cf10f76f-1a0b-4f6d-9dc7-80a68512032a', 1, 1),
('409e4b75-0d60-4a4c-8b4d-976cce23ea3f', 'Facebook', 'https://www.facebook.com/groups/ecuatorianosenstuttgart', '', '0991ef8a-2e54-4bb6-a2a9-523f35982a40', 0, 1),
('446f320c-0ae1-4e00-83d9-7295a13afd78', 'Instagram', 'https://www.instagram.com/srpski_centar_stuttgart/', '', '712a34c7-2f5c-41c2-aeb7-9821a304dd5c', 1, 1),
('47e9b58a-bad1-4872-b249-8a91ddcda706', 'Facebook', 'https://www.facebook.com/Musikunterricht-Derya-Bektas-321766687901410/', '', '171d9f6d-dd62-4113-b262-949692e790e8', 0, 1),
('4ae543f9-301c-47ff-9eee-aaaf815d8fac', 'Facebook', 'https://www.facebook.com/sprachedermusik/', 'Facebook (Die Sprache der Musik)', 'b90d8590-8068-462b-ae25-e9ec55f5e8c8', 1, 1),
('51546d2a-15b2-4832-8e04-e0b42401825a', 'Facebook', 'https://www.facebook.com/latinjazzfestival', '', 'eee41f26-5e5d-4b40-a5f4-f6c3272fd9bc', 1, 1),
('52eca14c-beca-4f27-a030-74f515d49793', 'Instagram', 'https://www.instagram.com/forumderkulturen/', '', 'c4a32813-94db-4931-9088-57ac9b1673bb', 1, 1),
('54b563d4-8a25-43d2-8cb2-364c61ef16ba', 'Facebook', 'https://de-de.facebook.com/618210711616689/', '', '712a34c7-2f5c-41c2-aeb7-9821a304dd5c', 0, 1),
('5534c995-9922-4219-b56a-72e70c3bb8ae', 'Instagram', 'https://www.instagram.com/sprachedermusik/', 'Instagram (Die Sprache der Musik)', 'b90d8590-8068-462b-ae25-e9ec55f5e8c8', 2, 1),
('5580f167-630e-48d5-b2cd-54e3c2821bc3', 'Facebook', 'https://www.facebook.com/alicetakin', '', '59f81c29-5f86-47ec-8a8a-322d53ae14ff', 0, 1),
('5f006721-3b94-4123-9d47-3b164d44ff18', 'Facebook', 'https://www.facebook.com/tigrevermelhoev', '', 'b7909656-0aaf-4e01-929f-a7dd3d9d3193', 0, 1),
('61a49cd6-b8f2-45c4-82a7-83d3f93a316a', 'Facebook', 'https://de-de.facebook.com/NOVO-Capoeira-Stuttgart-1559519010778402', '', '38e9abc6-dc51-4270-9568-2185a69ab0eb', 0, 1),
('63124cd7-c621-4ccd-b366-6a5a3f80c6f1', 'Facebook', 'https://de-de.facebook.com/754953194581359', '', '6de56a3e-f5b0-4f06-a77e-bbbd4858f9e9', 0, 1),
('70a60b49-d592-4cff-b058-08ddbc439d28', 'Facebook', 'https://www.facebook.com/icfsev', '', '96c2c20f-1fa6-4b47-9445-9f4eceba7d50', 0, 1),
('7660e744-781d-485a-85f1-ecd305c3b6ae', 'Facebook', 'https://www.facebook.com/alla.wbk.9', '', 'b90d8590-8068-462b-ae25-e9ec55f5e8c8', 0, 1),
('876408e5-b68c-4c2b-8e48-d7226b68d701', 'Instagram', 'https://www.instagram.com/prosvjetanemacka/', '', '85e483d3-c84e-4f8b-99b2-2d1f4fb49e89', 0, 1),
('9ae45f52-91fe-4541-a7cc-5feb323652ca', 'Instagram', 'https://www.instagram.com/cyddbw/', '', '00de259f-254a-491f-8555-1ed658c6a85b', 1, 1),
('9d6e99ce-61ff-4279-b893-543fbec6cb4f', 'Facebook', 'https://www.facebook.com/bayefallev', '', '783ad9fb-1af7-48a2-b9f0-4c52a0167474', 0, 1),
('9ee07612-9cf5-4495-9de9-b86c186e458a', 'Facebook', 'https://www.facebook.com/cyddbw/', '', '00de259f-254a-491f-8555-1ed658c6a85b', 0, 1),
('a1875725-0125-438b-8f54-155e30b0a192', 'Facebook', 'https://www.facebook.com/Srpska.akademska.mreza.Nikola.Tesla', '', 'cf10f76f-1a0b-4f6d-9dc7-80a68512032a', 0, 1),
('a8bc6fca-d845-48e1-a43e-157ea1e950f4', 'Facebook', 'https://www.facebook.com/groups/439745146116192/', '', '97ac48a4-7218-4cff-a08a-810d971272ca', 0, 1),
('ae7281b3-944a-4a1c-bd29-73a843831bbd', 'Facebook', 'https://www.facebook.com/BolivianischesKinderhilfswerk', '', '3b72a4a4-024c-4049-ab75-9de2898f3ccd', 0, 1),
('b0744d35-8ed1-4212-8bb7-20057488b330', 'Facebook', 'https://www.facebook.com/icfev/', '', '36a84dbb-4776-4f05-8dd7-69101a30755c', 0, 1),
('b34c9f5f-65a2-4a92-872c-11f86b62e47e', 'Instagram', 'https://www.instagram.com/bcf.stuttgart/?hl=de', '', '9e425f18-8f1e-4c09-a828-df470bb9ad9b', 0, 1),
('bb45b6ba-9eb4-420b-884f-31f8547fcf3b', 'Facebook', 'https://www.facebook.com/Coexist-eV-410786919397394', '', 'bb6cbae9-5ad6-4d08-be2a-e2b0bd9791dd', 0, 1),
('be673039-5a9f-4996-8a2e-e1271824614d', 'Facebook', 'https://www.facebook.com/STELP.SupporterOnSite/', '', '954bf319-b5bc-4c5f-b4a2-3a6748e0ba7f', 0, 1),
('c3a8d7b8-9f5a-45c1-a498-2ba85fe53a03', 'Facebook', 'https://www.facebook.com/Jesidische-Sonne-Stuttgart-443134686435784', '', '777032fb-0efd-4c57-a2ea-e8772c1dbd5b', 0, 1),
('c8320533-56b7-4248-a202-3cc5df31709c', 'Instagram', 'https://www.instagram.com/bkhw_org', '', '3b72a4a4-024c-4049-ab75-9de2898f3ccd', 1, 1),
('c9304690-a66b-47dc-a1bf-303456394945', 'Instagram', 'https://www.instagram.com/adanetzwerk/', '', '9f8cbfc7-3ee5-40bd-bc1f-748046eb4989', 1, 1),
('dce39316-5c9a-49fb-8133-9298fb26a30f', 'Facebook', 'https://www.facebook.com/ShoqataPavaresiaStuttgart/', '', '767f00c7-3388-4c4a-9d22-fad5c0156e23', 0, 1),
('de464839-c9ef-47b8-a849-cad4fecdbe5f', 'Facebook', 'https://www.facebook.com/NartStuttgart', '', '884c0f37-fc6e-4f08-8028-8dd3ecb1a9a6', 0, 1),
('de5c79d9-7f4c-4fa7-96af-50535d839a38', 'Instagram', 'https://www.instagram.com/stelp_supporter_on_site/', '', '954bf319-b5bc-4c5f-b4a2-3a6748e0ba7f', 1, 1),
('e0be4792-5750-482e-b9c0-9cc11864619f', 'Facebook', 'https://www.facebook.com/adelitas.de', '', 'd4fe1ebc-641b-416d-a51d-563ba733eb46', 0, 1),
('e9200267-6605-41b0-9a5f-762414bb152d', 'Instagram', 'https://www.instagram.com/shoqatapavaresia/', '', '767f00c7-3388-4c4a-9d22-fad5c0156e23', 1, 1),
('edb8f55c-a2f6-4475-84c9-d5f154efeb4c', 'Instagram', 'https://www.instagram.com/coexist_e.v', '', 'bb6cbae9-5ad6-4d08-be2a-e2b0bd9791dd', 1, 1),
('eec0c70d-6ec3-4ad2-b55a-62137dbebe50', 'Instagram', 'https://www.instagram.com/nartstuttgart', '', '884c0f37-fc6e-4f08-8028-8dd3ecb1a9a6', 1, 1),
('f01525b5-2c80-44ea-9975-ec05acf4d6e2', 'Facebook', 'https://www.facebook.com/pages/category/Social-Club/Club-Espa%C3%B1ol-Stuttgart-Oficial-111439010486163/', '', '030f5468-5e92-4232-aaa6-6780ed1db82c', 0, 1),
('f469f82d-6616-49aa-8bba-f8f207d187c8', 'Facebook', 'https://www.facebook.com/adanetzwerk', '', '9f8cbfc7-3ee5-40bd-bc1f-748046eb4989', 0, 1);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `activities`
--
ALTER TABLE `activities`
  ADD UNIQUE KEY `id` (`value`),
  ADD KEY `category` (`category`);

--
-- Indizes für die Tabelle `associations`
--
ALTER TABLE `associations`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_ibfk_1` (`associationId`);

--
-- Indizes für die Tabelle `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`value`),
  ADD KEY `category` (`category`);

--
-- Indizes für die Tabelle `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `societyId` (`associationId`);

--
-- Indizes für die Tabelle `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `societyId` (`associationId`);

--
-- Indizes für die Tabelle `socialmedia`
--
ALTER TABLE `socialmedia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `societyId` (`associationId`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `activities_ibfk_1` FOREIGN KEY (`category`) REFERENCES `activities` (`value`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints der Tabelle `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`associationId`) REFERENCES `associations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `districts`
--
ALTER TABLE `districts`
  ADD CONSTRAINT `districts_ibfk_1` FOREIGN KEY (`category`) REFERENCES `districts` (`value`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints der Tabelle `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`associationId`) REFERENCES `associations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `links`
--
ALTER TABLE `links`
  ADD CONSTRAINT `links_ibfk_1` FOREIGN KEY (`associationId`) REFERENCES `associations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `socialmedia`
--
ALTER TABLE `socialmedia`
  ADD CONSTRAINT `socialmedia_ibfk_1` FOREIGN KEY (`associationId`) REFERENCES `associations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
