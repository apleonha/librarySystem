-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Dec 19, 2024 at 12:23 AM
-- Server version: 5.7.39
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `al_library_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE `artist` (
  `artistID` int(11) NOT NULL,
  `artistName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`artistID`, `artistName`) VALUES
(1, 'Michael Jackson'),
(2, 'Queen'),
(3, 'The Beatles'),
(4, 'Taylor Swift'),
(5, 'Kendrick Lamar'),
(6, 'Britney Spears'),
(7, 'Nirvana'),
(8, 'Elton John'),
(9, 'Johnny Cash'),
(10, 'Pearl Jam');

-- --------------------------------------------------------

--
-- Table structure for table `audioGenre`
--

CREATE TABLE `audioGenre` (
  `audioGenreID` int(4) NOT NULL,
  `audioGenre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `audioGenre`
--

INSERT INTO `audioGenre` (`audioGenreID`, `audioGenre`) VALUES
(1, 'pop'),
(2, 'rock'),
(3, 'country'),
(4, 'hip hop/rap');

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `authorID` int(6) NOT NULL,
  `authorFName` varchar(30) NOT NULL,
  `authorLName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`authorID`, `authorFName`, `authorLName`) VALUES
(2, 'Lucy Maud', 'Montgomery'),
(3, 'Joanna', 'Spyri'),
(4, 'Vladimir', 'Nabokov'),
(5, 'Gabriel Garcia', 'Marquez'),
(6, 'Lew', 'Wallace'),
(7, 'Robert James', 'Waller'),
(8, 'JD', 'Salinger'),
(9, 'JK', 'Rowling'),
(10, 'Paulo', 'Coelho'),
(11, 'Dan', 'Brown'),
(12, 'H. Rider', 'Haggard'),
(13, 'C.S.', 'Lewis'),
(14, 'J.R.R.', 'Tolkien'),
(15, 'Agatha', 'Christie'),
(16, 'Antoine', 'de Saint-Exupery'),
(17, 'Charles', 'Dickens'),
(18, 'Miguel', 'De Cervantes Saavedra');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `ISBN` char(13) NOT NULL,
  `title` varchar(50) NOT NULL,
  `authorID` int(6) NOT NULL,
  `genreID` int(4) NOT NULL,
  `publishedYear` year(4) NOT NULL,
  `summary` text NOT NULL,
  `copies` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`ISBN`, `title`, `authorID`, `genreID`, `publishedYear`, `summary`, `copies`) VALUES
('0000060883286', 'One Hundred Years of Solitude', 5, 4, 2006, 'One of the most influential literary works of our time, One Hundred Years of Solitude remains a dazzling and original achievement by the masterful Gabriel García Márquez, winner of the Nobel Prize in Literature.\r\n\r\nOne Hundred Years of Solitude tells the story of the rise and fall, birth and death of the mythical town of Macondo through the history of the Buendiá family. Inventive, amusing, magnetic, sad and alive with unforgettable men and women—brimming with truth, compassion, and a lyrical magic that strikes the soul—this novel is a masterpiece in the art of fiction.', 3),
('9780062073488', 'And Then There Were None', 15, 12, 2011, 'Ten people, each with something to hide and something to fear, are invited to an isolated mansion on Indian Island by a host who, surprisingly, fails to appear. On the island they are cut off from everything but each other and the inescapable shadows of their own past lives. One by one, the guests share the darkest secrets of their wicked pasts. And one by one, they die…\r\n\r\nWhich among them is the killer and will any of them survive?', 2),
('9780062315007', 'The Alchemist: A Fable About Following Your Dream', 10, 9, 2014, 'ombining magic, mysticism, wisdom and wonder into an inspiring tale of self-discovery, The Alchemist has become a modern classic, selling millions of copies around the world and transforming the lives of countless readers across generations.\r\n\r\nPaulo Coelho\'s masterpiece tells the mystical story of Santiago, an Andalusian shepherd boy who yearns to travel in search of a worldly treasure. His quest will lead him to riches far different—and far more satisfying—than he ever imagined. Santiago\'s journey teaches us about the essential wisdom of listening to our hearts, of recognizing opportunity and learning to read the omens strewn along life\'s path, and, most importantly, to follow our dreams.', 1),
('9780064471046', 'The Lion, the Witch, and the Wardrobe', 13, 8, 2002, 'Four adventurous siblings—Peter, Susan, Edmund, and Lucy Pevensie—step through a wardrobe door and into the land of Narnia, a land frozen in eternal winter and enslaved by the power of the White Witch. But when almost all hope is lost, the return of the Great Lion, Aslan, signals a great change . . . and a great sacrifice.\r\n\r\nThe Lion, the Witch and the Wardrobe is the second book in C. S. Lewis\'s classic fantasy series, which has been drawing readers of all ages into a magical land with unforgettable characters for over sixty years. This is a stand-alone read, but if you would like to explore more of the Narnian realm, pick up The Horse and His Boy, the third book in The Chronicles of Narnia.', 2),
('9780142437230', 'Don Quixote', 18, 4, 2003, 'Don Quixote has become so entranced reading tales of chivalry that he decides to turn knight errant himself. In the company of his faithful squire, Sancho Panza, these exploits blossom in all sorts of wonderful ways. While Quixote\'s fancy often leads him astray—he tilts at windmills, imagining them to be giants—Sancho acquires cunning and a certain sagacity. Sane madman and wise fool, they roam the world together-and together they have haunted readers\' imaginations for nearly four hundred years.\r\n\r\nWith its experimental form and literary playfulness, Don Quixote has been generally recognized as the first modern novel. This Penguin Classics edition, with its beautiful new cover design, includes John Rutherford\'s masterly translation, which does full justice to the energy and wit of Cervantes\'s prose, as well as a brilliant critical introduction by Roberto Gonzalez Echevarriá.', 1),
('9780147514028', 'Heidi', 3, 3, 2014, 'At the age of five, little orphan Heidi is sent to live with her grandfather in the Alps. Everyone in the village is afraid of him, but Heidi is fascinated by his long beard and bushy grey eyebrows. She loves her life in the mountains, playing in the sunshine and growing up amongst the goats and birds. But one terrible day, Heidi is collected by her aunt and is made to live with a new family in town. Heidi can\'t bear to be away from her grandfather; can she find a way back up the mountain, where she belongs?', 1),
('9780156012195', 'The Little Prince', 16, 3, 2000, 'A pilot crashes in the Sahara Desert and encounters a strange young boy who calls himself the Little Prince. The Little Prince has traveled there from his home on a lonely, distant asteroid with a single rose. The story that follows is a beautiful and at times heartbreaking meditation on human nature.\r\n\r\nThe Little Prince is one of the best-selling and most translated books of all time, universally cherished by children and adults alike, and Richard Howard\'s translation of the beloved classic beautifully reflects Saint-Exupéry\'s unique and gifted style, bringing the English text as close as possible to the French in language, style, and spirit. In this special edition, the artwork has been restored to match in detail and in color Saint-Exupéry\'s original artwork.', 1),
('9780307474278', 'The Da Vinci Code', 11, 10, 2009, 'As Langdon and gifted French cryptologist Sophie Neveu sort through the bizarre riddles, they are stunned to discover a trail of clues hidden in the works of Leonardo da Vinci—clues visible for all to see and yet ingeniously disguised by the painter.\r\n\r\nEven more startling, the late curator was involved in the Priory of Sion—a secret society whose members included Sir Isaac Newton, Victor Hugo, and Da Vinci—and he guarded a breathtaking historical secret. Unless Langdon and Neveu can decipher the labyrinthine puzzle—while avoiding the faceless adversary who shadows their every move—the explosive, ancient truth will be lost forever.', 1),
('9780316769174', 'The Catcher in the Rye', 8, 7, 2001, 'The hero-narrator of The Catcher in the Rye is an ancient child of sixteen, a native New Yorker named Holden Caulfield. \r\n\r\nThrough circumstances that tend to preclude adult, secondhand description, he leaves his prep school in Pennsylvania and goes underground in New York City for three days. The boy himself is at once too simple and too complex for us to make any final comment about him or his story. Perhaps the safest thing we can say about Holden is that he was born in the world not just strongly attracted to beauty but, almost, hopelessly impaled on it.\r\nThere are many voices in this novel: children\'s voices, adult voices, underground voices-but Holden\'s voice is the most eloquent of all. Transcending his own vernacular, yet remaining marvelously faithful to it, he issues a perfectly articulated cry of mixed pain and pleasure. However, like most lovers and clowns and poets of the higher orders, he keeps most of the pain to, and for, himself. The pleasure he gives away, or sets aside, with all his heart. It is there for the reader who can handle it to keep.', 3),
('9780375759055', 'She: A History of Adventure', 12, 4, 2002, 'The story is a first-person narrative which follows the journey of Horace Holly and his ward Leo Vincey to a lost kingdom in the African interior. They encounter a native people and a mysterious white queen named Ayesha who reigns as the all-powerful \"She\" or \"She-who-must-be-obeyed\".', 1),
('9780439064866', 'Harry Potter and the Chamber of Secrets', 9, 8, 1999, 'The summer after his first year at Hogwarts is worse than ever for Harry Potter. The Dursleys of Privet Drive are more horrible to him than ever before. And just when he thinks the endless summer vacation is over, a creature named Dobby the house-elf shows up issuing a grave warning to Harry not to go back to school or disaster will happen! Of course, Harry has to go back- and he does so in grand style, in a flying-car magicked by his friends Ron and Percy Weasley. But getting back to Hogwarts isn\'t the cure Harry expects it to be. Almost immediately a student is found turned to stone, and then another. And somehow Harry stands accused. Could Harry Potter be the long-feared heir of Slytherin?Harry and friends Hermione and Fred are stretched to their limits in a desperate fight against Draco Malfoy and his gang, the hideously stuck-up new professor Gilderoy Lockheart, the malevolent owner of the diary of Tom Riddle, giant spiders, and perhaps even...Hagrid!This is the book that proves J.K. Rowling is a talent that\'s here to stay!', 2),
('9780439136358', 'Harry Potter and the Prisoner of Azkaban', 9, 8, 1999, 'For twelve long years, the dread fortress of Azkaban held an infamous prisoner named Sirius Black. Convicted of killing thirteen people with a single curse, he was said to be the heir apparent to the Dark Lord, Voldemort.Now he has escaped, leaving only two clues as to where he might be headed: Harry Potter\'s defeat of You-Know-Who was Black\'s downfall as well. And the Azkaban guards heard Black muttering in his sleep, \"He\'s at Hogwarts . . . he\'s at Hogwarts.\"Harry Potter isn\'t safe, not even within the walls of his magical school, surrounded by his friends. Because on top of it all, there may well be a traitor in their midst.', 2),
('9780439139595', 'Harry Potter and the Goblet of Fire', 9, 8, 2000, 'Grade 4 Up-Harry is now 14 years old and in his fourth year at the Hogwarts School of Witchcraft and Wizardry, where big changes are afoot. This year, instead of the usual Inter-House Quidditch Cup, a Triwizard Tournament will be held, during which three champions, one from each of three schools of wizardry (Hogwarts, Durmstrang, and Beaux-batons), must complete three challenging magical tasks. The competitors must be at least 17 years old, but the Goblet of Fire that determines the champions mysteriously produces Harry\'s name, so he becomes an unwilling fourth contestant. Meanwhile, it is obvious to the boy\'s allies that the evil Voldemort will use the Tournament to get at Harry. This hefty volume is brimming with all of the imagination, humor, and suspense that characterized the first books. So many characters, both new and familiar, are so busily scheming, spying, studying, worrying, fulminating, and suffering from unrequited first love that it is a wonder that Rowling can keep track, much less control, of all the plot lines. She does, though, balancing humor, malevolence, school-day tedium, and shocking revelations with the aplomb of a circus performer. The Triwizard Tournament itself is a bit of a letdown, since Harry is able, with a little help from his friends and even enemies, to perform the tasks easily. This fourth installment, with its deaths, a sinister ending, and an older and more shaken protagonist, surely marks the beginning of a very exciting and serious battle between the forces of light and dark, and Harry\'s fans will be right there with him.', 2),
('9780439358064', 'Harry Potter and the Order of the Phoenix', 9, 8, 2003, 'Harry Potter\'s latest adventure reveals an admirable hero somewhat the worse for wear: his grief at the death of Cedric, his fear of (and connection to) the evil Lord Voldemort, and his emotional distance from Professor Dumbledore combine to make Harry a bit short-tempered, a bit short-sighted, and a bit more recognizably human. Rowling eases readers back into Harry\'s world-and-Harry\'s precarious existence-with nary a ripple: the suburban peace of the Dursleys\' manicured lives is shattered by the intrusion of dementors, sent by a rogue in the Ministry of Magic and seeking to do Harry serious injury. A wizard rescue party retrieves Harry from the world of Muggles and sets him down amidst the Order of the Phoenix, a secret society that plots Voldemort\'s final downfall. With an escalating love life, academic complications at school, and a Ministry of Magic determined to ignore the obvious, Harry is in an adolescent uproar. Revelations about Sirius Black, Professor Snape, and Harry\'s late father cause the boy to question all he holds true, and his confusion clouds his judgment. A roaring set of practical jokes by Fred and George Weasley against a politically appointed, obnoxious new professor at Hogwarts lightens the tone just in time for the Order\'s tragic confrontation with Voldemort and his malevolent minions. Rowling cheerfully turns her own conventions on th@ir cars, and the result is a surprising and enjoyable ride. While Harry\'s much-touted love interest fizzles before it fires, familiar characters achieve a bit more depth. Ginny Weasley starts to come into her own, Hermione employs a dryly wicked wit, and Dumbledore reveals, if not feet, at least a little toe of clay. It\'s no longer quite clear that all will work out in the end; the lines are being drawn, but, as exemplified by Percy Weasley, not everyone is on the right side. Rowling has managed to make Harry and his fate a bit less predictable, which, in the fifth of a seven-volume series, is a very good thing. ', 2),
('9780439784542', 'Harry Potter and the Half Blood Prince', 9, 8, 2005, 'With the Harry Potter Express chugging closer to its final destination, the sixth book in the series gets down to business. No more diversions about the welfare of house elves or the intricacies of Quidditch. This penultimate offering is more about tying up loose ends and fleshing out the backstory. Harry and the gang are back at Hogwarts, but the mood is grim. The wizard community is now fully aware that evil has returned, and the citizenry is afraid. Harry has been left bereft by the death of Sirius Black, and there are more killings to come. In a powerful early scene, readers learn that a pivotal figure is seemingly not to be trusted, yet throughout there are hints that he or she is a double agent. Later Harry becomes entangled with a former student known as the Half-Blood Prince, having accidentally acquired the prince\'s Potions textbook, but this turns out to be a mixed blessing. Rowling also devotes time to a carefully crafted telling of the story of Lord Voldemort\'s early life, which Harry and Dumbledore piece together by plucking other people\'s memories. Rowling is at the top of her game here. For those able to reach just beyond the engrossing tale, there is commentary relevant to today: how governments offer false security about perilous situations and how being in a constant state of war affects people\'s behavior. Harry is almost 17 now, and this is a book for older readers, who will best understand the moral implications of his choices. ', 2),
('9780545010221', 'Harry Potter and the Deathly Hallows', 9, 8, 2007, 'The cloak of inevitability hangs on the final installment of the Harry Potter series. One must die, one will live. Friends will be distinguished from foes. All will be revealed. To Rowling\'s great credit, she manages this finale with the flair and respect for her audience that have permeated the previous six novels, though the mood here is quite different. The story has a certain flatness that extends through much of the book. Rowling can no longer rely on diversions like Quidditch matches and trips to Hogsmead for relief; Harry has made the decision not to return to Hogwarts. Aided by Hermione and Ron, he will instead search for the remaining Horcruxes that hide pieces of Voldemorte\'s soul. Danger and death are in the air, but Rowling skillfully deals both out in tightly controlled bursts that are juxtaposed against periods of indecision, false leads, and even boredom as the trio try to divine their next moves. Most startling are the new elements, including the not-altogether-successful introduction of the Deathly Hallows. These magical artifacts unnecessarily up the total of things that Harry is looking for by three, and the ownership of one of the Hallows, a wand, may lead to confusion for readers at a climactic moment. More successful additions, adding depth and weight, are the multilayered revelation of Dumbledore\'s family history and the brilliantly handled answer to the question of Severus Snape\'s allegiance. Throughout, Rowling returns to and embellishes the hallmark themes of the series: the importance of parental influences, the redemptive power of sacrifice, and the strength found in love. These truths are the underpinnings of a finale that is worthy of fans\' hopes and expectations.', 2),
('9780547928227', 'The Hobbit', 14, 11, 2012, 'Bilbo Baggins is a hobbit who enjoys a comfortable, unambitious life, rarely traveling any farther than his pantry or cellar. But his contentment is disturbed when the wizard Gandalf and a company of dwarves arrive on his doorstep one day to whisk him away on an adventure. They have launched a plot to raid the treasure hoard guarded by Smaug the Magnificent, a large and very dangerous dragon. Bilbo reluctantly joins their quest, unaware that on his journey to the Lonely Mountain he will encounter both a magic ring and a frightening creature known as Gollum.', 1),
('9780590353427', 'Harry Potter and the Sorcerer\'s Stone', 9, 8, 1998, 'Harry Potter has no idea how famous he is. That\'s because he\'s being raised by his miserable aunt and uncle who are terrified Harry will learn that he\'s really a wizard, just as his parents were. But everything changes when Harry is summoned to attend an infamous school for wizards, and he begins to discover some clues about his illustrious birthright. From the surprising way he is greeted by a lovable giant, to the unique curriculum and colorful faculty at his unusual school, Harry finds himself drawn deep inside a mystical world he never knew existed and closer to his own noble destiny.', 2),
('9780679410430', 'Lolita', 4, 4, 1993, 'When it was published in 1955, Lolita immediately became a cause célèbre because of the freedom and sophistication with which it handled the unusual erotic predilections of its protagonist. Awe and exhilaration–along with heartbreak and mordant wit–abound in this account of the aging Humbert Humbert\'s obsessive, devouring, and doomed passion for the nymphet Dolores Haze. \r\nLolita is also the story of a hypercivilized European colliding with the cheerful barbarism of postwar America, but most of all, it is a meditation on love–love as outrage and hallucination, madness and transformation.', 1),
('9781455554287', 'Bridges of Madison County', 7, 6, 2014, 'If you\'ve ever experienced the one true love of your life, a love that for some reason could never be, you will understand why readers all over the world are so moved by this small, unknown first novel that they became a publishing phenomenon and #1 bestseller. The story of Robert Kincaid, the photographer and free spirit searching for the covered bridges of Madison County, and Francesca Johnson, the farm wife waiting for the fulfillment of a girlhood dream, The Bridges of Madison County gives voice to the longings of men and women everywhere -- and shows us what it is to love and be loved so intensely that life is never the same again.', 2),
('9781617203404', 'Ben-Hur: A Tale of the Christ, unabridged', 6, 5, 2022, 'Ben-Hur is one of the best selling books of all times. This poignant novel intertwines the life stories of a Jewish charioteer named Judah Ben-Hur and Jesus Christ. It explores the themes of betrayal and redemption. Ben-Hur\'s family is wrongly accused and convicted of treason during the time of Christ. Ben-Hur fights to clear his family\'s name and is ultimately inspired by the rise of Jesus Christ and his message. A powerful, compelling novel. ', 1),
('9781679260797', 'A Tale of Two Cities', 17, 4, 2019, 'A new edition of A Tale of Two Cities, Charles Dickens\'s classic 1859 historical novel, set in London and Paris during the French Revolution and Reign of Terror. Dickens\'s A Tale of Two Cities is centered on Dr. Manette, as he is released from eighteen years of imprisonment as a political prisoner in the Bastille and his reunion with his daughter, Lucie Manette, who has found sanctuary in England. Their lives become intertwined with two men they meet in England, the exiled French aristocrat, Charles Darnay, and a disreputable by brilliant English lawyer, Sydney Carton, both of whom fall in love with Lucie. From their relative safety in London, they soon find themselves drawn back to Paris, which is at the height of the Reign of Terror and poses more danger to them than ever.\r\n\r\nDickens\' best-known work of historical fiction, A Tale of Two Cities is one of the best-selling novels of all time, and regularly is ranked among the greatest novels ever written -- a \"must-read\" for all lovers of classic literature. The novel has been adapted for film, television, radio, and the stage, and continues to have an enormous influence on popular culture.', 1),
('9781840227840', 'Anne of Green Gables', 2, 2, 2018, 'Anne of Green Gables by LM Montgomery Anne Shirley is an eleven-year-old orphan who has hung on determinedly to an optimistic spirit and a wildly creative imagination through her early deprivations. She erupts into the lives of aging brother and sister Matthew and Marilla Cuthbert, a girl instead of the boy they had sent for. Thus begins a story of transformation for all three; indeed the whole rural community of Avonlea comes under Anne\'s influence in some way. We see her grow from a girl to a young woman of sixteen, making her mistakes, and not always learning from them. Intelligent, hot-headed as her own red hair, unwilling to take a moral truth as read until she works it out for herself, she must also face grief and loss and learn the true meaning of love. Part Tom Sawyer, part Jane Eyre, by the end of Anne of Green Gables, Anne has become the heroine of her own story.', 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `bookinfo`
-- (See below for the actual view)
--
CREATE TABLE `bookinfo` (
`inventoryID` int(6)
,`ISBN` char(13)
,`title` varchar(50)
,`author` varchar(62)
,`status` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `bookInventory`
--

CREATE TABLE `bookInventory` (
  `inventoryID` int(6) NOT NULL,
  `ISBN` char(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bookInventory`
--

INSERT INTO `bookInventory` (`inventoryID`, `ISBN`) VALUES
(6, '0000060883286'),
(7, '0000060883286'),
(8, '0000060883286'),
(33, '9780062073488'),
(34, '9780062073488'),
(25, '9780062315007'),
(30, '9780064471046'),
(31, '9780064471046'),
(41, '9780142437230'),
(4, '9780147514028'),
(37, '9780156012195'),
(28, '9780307474278'),
(12, '9780316769174'),
(13, '9780316769174'),
(14, '9780316769174'),
(29, '9780375759055'),
(26, '9780439064866'),
(27, '9780439064866'),
(23, '9780439136358'),
(24, '9780439136358'),
(21, '9780439139595'),
(22, '9780439139595'),
(19, '9780439358064'),
(20, '9780439358064'),
(17, '9780439784542'),
(18, '9780439784542'),
(15, '9780545010221'),
(16, '9780545010221'),
(32, '9780547928227'),
(35, '9780590353427'),
(36, '9780590353427'),
(5, '9780679410430'),
(10, '9781455554287'),
(11, '9781455554287'),
(9, '9781617203404'),
(40, '9781679260797'),
(2, '9781840227840'),
(3, '9781840227840');

-- --------------------------------------------------------

--
-- Table structure for table `cd`
--

CREATE TABLE `cd` (
  `cdID` int(6) NOT NULL,
  `cdTitle` varchar(50) NOT NULL,
  `artistID` int(4) NOT NULL,
  `releasedYear` year(4) NOT NULL,
  `audioGenreID` int(4) NOT NULL,
  `copies` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cd`
--

INSERT INTO `cd` (`cdID`, `cdTitle`, `artistID`, `releasedYear`, `audioGenreID`, `copies`) VALUES
(1, '...Baby One More Time', 6, 1999, 1, 1),
(2, 'Goodbye Yellow Brick Road', 8, 1973, 1, 1),
(3, 'With His Hot and Blue Guitar', 9, 1957, 3, 1),
(4, 'To Pimp A Butterfly', 5, 2015, 4, 1),
(5, 'Thriller', 1, 1982, 1, 1),
(6, 'Off the Wall', 1, 1979, 1, 1),
(7, 'Nevermind', 7, 1991, 2, 1),
(8, 'Ten', 10, 1991, 2, 1),
(9, 'A Night at the Opera', 2, 1980, 2, 1),
(10, 'Jazz', 2, 1978, 1, 1),
(11, 'The Beatles', 3, 1968, 1, 1),
(12, 'Abbey Road', 3, 1969, 1, 1),
(13, 'Help!', 3, 1965, 1, 1),
(14, 'Red (Taylor\'s Version)', 4, 2021, 3, 1),
(15, '1989', 4, 2014, 1, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `cdinfo`
-- (See below for the actual view)
--
CREATE TABLE `cdinfo` (
`inventoryID` int(6)
,`cdID` int(6)
,`cdTitle` varchar(50)
,`artistName` varchar(50)
,`status` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `cdInventory`
--

CREATE TABLE `cdInventory` (
  `inventoryID` int(6) NOT NULL,
  `cdID` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cdInventory`
--

INSERT INTO `cdInventory` (`inventoryID`, `cdID`) VALUES
(54, 1),
(55, 2),
(56, 3),
(57, 4),
(58, 5),
(59, 6),
(68, 7),
(67, 8),
(62, 9),
(63, 10),
(64, 11),
(66, 12),
(65, 13),
(60, 14),
(61, 15);

-- --------------------------------------------------------

--
-- Table structure for table `checkOutHistory`
--

CREATE TABLE `checkOutHistory` (
  `inventoryID` int(6) NOT NULL,
  `cardNo` int(6) NOT NULL,
  `checkOutDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `returnDate` datetime DEFAULT NULL,
  `dateDue` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `checkOutHistory`
--

INSERT INTO `checkOutHistory` (`inventoryID`, `cardNo`, `checkOutDate`, `returnDate`, `dateDue`) VALUES
(2, 2, '2024-11-04 21:34:23', '2024-11-18 16:29:14', '2024-11-18'),
(2, 2, '2024-11-18 16:29:10', '2024-11-18 16:29:14', '2024-12-02'),
(2, 3, '2024-11-04 21:32:42', '2024-11-04 21:33:51', '2024-11-18'),
(2, 5, '2024-12-09 15:49:07', '2024-12-09 15:56:23', '2024-12-23'),
(5, 4, '2024-11-04 20:47:54', '2024-11-04 21:31:36', '2024-11-18'),
(5, 4, '2024-11-04 21:29:36', '2024-11-04 21:31:36', '2024-11-18'),
(5, 5, '2024-11-04 20:56:01', '2024-11-04 20:59:29', '2024-11-18'),
(5, 6, '2024-11-04 21:00:02', '2024-11-04 21:09:54', '2024-11-18'),
(7, 6, '2024-11-08 17:34:46', '2024-11-08 17:46:21', '2024-11-22'),
(12, 7, '2024-12-18 17:49:45', NULL, '2025-01-01'),
(64, 1, '2024-11-08 19:01:20', '2024-11-08 19:02:32', '2024-11-22'),
(64, 2, '2024-11-08 18:38:02', '2024-11-08 19:21:01', '2024-11-22'),
(64, 2, '2024-11-08 19:20:53', '2024-11-08 19:21:01', '2024-11-22'),
(64, 3, '2024-11-08 18:31:54', '2024-11-08 18:32:13', '2024-11-22'),
(65, 4, '2024-11-08 17:51:02', NULL, '2024-11-22');

--
-- Triggers `checkOutHistory`
--
DELIMITER $$
CREATE TRIGGER `setDateDue` BEFORE INSERT ON `checkOutHistory` FOR EACH ROW SET
NEW.dateDue = DATE_ADD(NEW.checkOutDate, INTERVAL 14 DAY)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateAvailability` BEFORE INSERT ON `checkOutHistory` FOR EACH ROW UPDATE inventory
SET waitlist = waitlist + 1
WHERE inventory.inventoryID = NEW.inventoryID
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateWaitlistOnUpdate` BEFORE UPDATE ON `checkOutHistory` FOR EACH ROW BEGIN
IF OLD.returnDate IS NULL AND NEW.returnDate IS NOT NULL
THEN
	UPDATE inventory SET waitlist = waitlist - 1
    WHERE inventoryID = NEW.inventoryID;
END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `director`
--

CREATE TABLE `director` (
  `directorID` int(4) NOT NULL,
  `director` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `director`
--

INSERT INTO `director` (`directorID`, `director`) VALUES
(1, 'Andrew Stanton'),
(2, 'Lee Unkrich'),
(3, 'John Lasseter'),
(4, 'Joe Ranft'),
(5, 'Sam Raimi'),
(6, 'Christopher Nolan'),
(7, 'James Cameron'),
(8, 'Andrew Adamson'),
(9, 'Kelly Asbury'),
(10, 'Conrad Vernon'),
(11, 'Michael Bay'),
(12, 'Gore Verbinski'),
(13, 'Brad Bird'),
(14, 'George Lucas');

-- --------------------------------------------------------

--
-- Table structure for table `dvd`
--

CREATE TABLE `dvd` (
  `dvdID` int(6) NOT NULL,
  `dvdTitle` varchar(50) NOT NULL,
  `studioID` int(4) DEFAULT NULL,
  `releasedYear` year(4) NOT NULL,
  `genreID` int(4) NOT NULL,
  `copies` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dvd`
--

INSERT INTO `dvd` (`dvdID`, `dvdTitle`, `studioID`, `releasedYear`, `genreID`, `copies`) VALUES
(1, 'Finding Nemo', 1, 2003, 13, 1),
(2, 'Cars', 1, 2006, 13, 1),
(3, 'Spiderman', 2, 2002, 14, 1),
(4, 'The Dark Knight', 3, 2008, 14, 1),
(5, 'Avatar', 4, 2009, 14, 1),
(6, 'Shrek 2', 5, 2004, 13, 1),
(7, 'Transformers', 6, 2007, 14, 1),
(8, 'Pirates of the Caribbean: Curse of the Black Pearl', 7, 2003, 15, 1),
(9, 'Pirates of the Caribbean: Dead Man\'s Chest', 7, 2006, 15, 1),
(10, 'The Incredibles', 1, 2004, 13, 1),
(11, 'Pirates of the Caribbean: At World\'s End', 7, 2007, 15, 1),
(12, 'Star Wars: Episode III - Revenge of the Sith', 8, 2005, 16, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dvdDirector`
--

CREATE TABLE `dvdDirector` (
  `dvdID` int(6) NOT NULL,
  `directorID` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dvdDirector`
--

INSERT INTO `dvdDirector` (`dvdID`, `directorID`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(4, 6),
(5, 7),
(6, 8),
(6, 9),
(6, 10),
(7, 11),
(8, 12),
(9, 12),
(11, 12),
(10, 13),
(12, 14);

-- --------------------------------------------------------

--
-- Stand-in structure for view `dvdinfo`
-- (See below for the actual view)
--
CREATE TABLE `dvdinfo` (
`inventoryID` int(6)
,`dvdID` int(6)
,`dvdTitle` varchar(50)
,`genre` varchar(20)
,`status` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `dvdInventory`
--

CREATE TABLE `dvdInventory` (
  `inventoryID` int(6) NOT NULL,
  `dvdID` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dvdInventory`
--

INSERT INTO `dvdInventory` (`inventoryID`, `dvdID`) VALUES
(42, 1),
(43, 2),
(44, 3),
(45, 4),
(46, 5),
(47, 6),
(48, 7),
(49, 8),
(50, 9),
(51, 10),
(52, 11),
(53, 12);

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `genreID` int(4) NOT NULL,
  `genre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`genreID`, `genre`) VALUES
(2, 'middle grade fiction'),
(3, 'children\'s classic'),
(4, 'adult classic'),
(5, 'adult fiction'),
(6, 'contemporary romance'),
(7, 'YA classic'),
(8, 'children\'s fiction'),
(9, 'literary fiction'),
(10, 'YA fiction'),
(11, 'children\'s fantasy'),
(12, 'adult mystery'),
(13, 'children\'s animated'),
(14, 'action'),
(15, 'children\'s action'),
(16, 'science fiction');

-- --------------------------------------------------------

--
-- Table structure for table `holds`
--

CREATE TABLE `holds` (
  `inventoryID` int(11) NOT NULL,
  `cardNo` int(11) NOT NULL,
  `position` int(11) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `holds`
--

INSERT INTO `holds` (`inventoryID`, `cardNo`, `position`) VALUES
(65, 3, 2),
(65, 5, 1);

--
-- Triggers `holds`
--
DELIMITER $$
CREATE TRIGGER `UpdateOnDelete` AFTER DELETE ON `holds` FOR EACH ROW BEGIN
UPDATE inventory SET waitlist = waitlist - 1 WHERE inventory.inventoryID = OLD.inventoryID;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `addToWaitlist` BEFORE INSERT ON `holds` FOR EACH ROW BEGIN 
    UPDATE inventory SET inventory.waitlist = inventory.waitlist + 1 WHERE inventory.inventoryID = NEW.inventoryID; 
    END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `setPositionAdd` BEFORE INSERT ON `holds` FOR EACH ROW BEGIN
IF( SELECT MAX(position)
    FROM holds
    WHERE inventoryID = NEW.inventoryID
) IS NOT NULL 
THEN
SET NEW.position = (
    SELECT MAX(position)
    FROM holds
    WHERE inventoryID = NEW.inventoryID
) + 1;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `inventoryID` int(6) NOT NULL,
  `typeNo` int(2) NOT NULL,
  `statusID` int(2) NOT NULL,
  `location` varchar(4) NOT NULL,
  `waitlist` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`inventoryID`, `typeNo`, `statusID`, `location`, `waitlist`) VALUES
(2, 1, 1, 'KF23', 0),
(3, 1, 1, 'KF23', 0),
(4, 1, 1, 'KP12', 0),
(5, 1, 1, 'AF44', 0),
(6, 1, 1, 'AF45', 0),
(7, 1, 1, 'AF45', 0),
(8, 1, 1, 'AF45', 0),
(9, 1, 1, 'AF12', 0),
(10, 1, 1, 'AR51', 0),
(11, 1, 1, 'AR51', 0),
(12, 1, 2, 'YAC2', 1),
(13, 1, 1, 'YAC2', 0),
(14, 1, 1, 'YAC2', 0),
(15, 1, 1, 'CF30', 0),
(16, 1, 1, 'CF30', 0),
(17, 1, 1, 'CF30', 0),
(18, 1, 1, 'CF30', 0),
(19, 1, 1, 'CF30', 0),
(20, 1, 1, 'CF30', 0),
(21, 1, 1, 'CF30', 0),
(22, 1, 1, 'CF30', 0),
(23, 1, 1, 'CF30', 0),
(24, 1, 1, 'CF30', 0),
(25, 1, 1, 'GF19', 0),
(26, 1, 1, 'CF30', 0),
(27, 1, 1, 'CF30', 0),
(28, 1, 1, 'YAF5', 0),
(29, 1, 1, 'AC25', 0),
(30, 1, 1, 'CF36', 0),
(31, 1, 1, 'CF36', 0),
(32, 1, 1, 'KF21', 0),
(33, 1, 1, 'MT07', 0),
(34, 1, 1, 'MT07', 0),
(35, 1, 1, 'CF30', 0),
(36, 1, 1, 'CF30', 0),
(37, 1, 1, 'KF29', 0),
(40, 1, 1, 'AF22', 0),
(41, 1, 1, 'AF09', 0),
(42, 2, 1, 'CD04', 0),
(43, 2, 1, 'CD06', 0),
(44, 2, 1, 'AD66', 0),
(45, 2, 1, 'AD70', 0),
(46, 2, 1, 'AD71', 0),
(47, 2, 1, 'CD09', 0),
(48, 2, 1, 'AD68', 0),
(49, 2, 1, 'CD12', 0),
(50, 2, 1, 'CD12', 0),
(51, 2, 1, 'CD08', 0),
(52, 2, 1, 'CD12', 0),
(53, 2, 1, 'AD20', 0),
(54, 3, 1, 'CD06', 0),
(55, 3, 1, 'CD05', 0),
(56, 3, 1, 'CD11', 0),
(57, 3, 1, 'CD04', 0),
(58, 3, 1, 'CD05', 0),
(59, 3, 1, 'CD05', 0),
(60, 3, 1, 'CD09', 0),
(61, 3, 1, 'CD09', 0),
(62, 3, 1, 'CD08', 0),
(63, 3, 1, 'CD08', 0),
(64, 3, 1, 'CD05', 0),
(65, 3, 2, 'CD05', 3),
(66, 3, 1, 'CD05', 0),
(67, 3, 1, 'CD06', 0),
(68, 3, 1, 'CD06', 0);

--
-- Triggers `inventory`
--
DELIMITER $$
CREATE TRIGGER `updateStatus` BEFORE UPDATE ON `inventory` FOR EACH ROW BEGIN
SET NEW.statusID = IF (NEW.waitlist = 0, 1, 2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `inventorytitles`
-- (See below for the actual view)
--
CREATE TABLE `inventorytitles` (
`inventoryID` int(11)
,`title` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `itemStatus`
--

CREATE TABLE `itemStatus` (
  `statusID` int(2) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `itemStatus`
--

INSERT INTO `itemStatus` (`statusID`, `status`) VALUES
(1, 'available'),
(2, 'unavailable');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `employeeID` int(6) NOT NULL,
  `employeeFName` varchar(30) NOT NULL,
  `employeeLName` varchar(30) NOT NULL,
  `positionID` int(2) NOT NULL,
  `username` varchar(12) NOT NULL,
  `password` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`employeeID`, `employeeFName`, `employeeLName`, `positionID`, `username`, `password`) VALUES
(1, 'Bailey', 'Tills', 1, 'btills', 'abcd'),
(2, 'Jack', 'Jamison', 2, 'jjamison', '12345678'),
(3, 'Emily', 'Budd', 3, 'ebudd', 'abcdefgh'),
(4, 'Veronica', 'Sams', 3, 'vsams', '12345678'),
(5, 'Bryan', 'Hall', 4, 'bhall', 'abcdefgh'),
(6, 'Kelsey', 'Reynolds', 4, 'kreynolds', '12345678');

-- --------------------------------------------------------

--
-- Table structure for table `staffPosition`
--

CREATE TABLE `staffPosition` (
  `positionID` int(2) NOT NULL,
  `positionTitle` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staffPosition`
--

INSERT INTO `staffPosition` (`positionID`, `positionTitle`) VALUES
(1, 'Branch Manager'),
(2, 'Supervisor'),
(3, 'Librarian'),
(4, 'Volunteer');

-- --------------------------------------------------------

--
-- Stand-in structure for view `staffview`
-- (See below for the actual view)
--
CREATE TABLE `staffview` (
`employeeID` int(6)
,`employeeFName` varchar(30)
,`employeeLName` varchar(30)
,`username` varchar(12)
,`positionTitle` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `studio`
--

CREATE TABLE `studio` (
  `studioID` int(11) NOT NULL,
  `studio` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `studio`
--

INSERT INTO `studio` (`studioID`, `studio`) VALUES
(1, 'Disney Pixar'),
(2, 'Columbia Pictures'),
(3, 'Pinewood Studios'),
(4, 'Lightstorm Entertainment'),
(5, 'Dreamworks'),
(6, 'Paramount Pictures'),
(7, 'Disney'),
(8, 'Lucasfilm');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `typeNo` int(2) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`typeNo`, `type`) VALUES
(1, 'book'),
(2, 'DVD'),
(3, 'CD');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `cardNo` int(6) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `balance` decimal(6,2) DEFAULT '0.00',
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`cardNo`, `firstName`, `lastName`, `phone`, `email`, `balance`, `password`) VALUES
(1, 'John', 'Smith', '5555550000', 'abc@def.com', '0.00', 'password'),
(2, 'Jane', 'Doe', '5555551112', 'abb@def.com', '0.00', 'password2'),
(3, 'Thomas', 'Baker', NULL, 'sadf@adflkj.com', '4.23', 'password3'),
(4, 'Elizabeth', 'Johnson', '5555551122', NULL, '2.68', 'password4'),
(5, 'Michael', 'Kennedy', '5555551222', 'adfs@fga.com', '0.00', 'password5'),
(6, 'Brittany', 'Brown', '5555552222', 'ajfdkls@aldkjfs.com', '0.00', 'pass06'),
(7, 'Winston', 'Leonhard', NULL, 'wleonhard@cat.edu', '0.00', NULL);

-- --------------------------------------------------------

--
-- Structure for view `bookinfo`
--
DROP TABLE IF EXISTS `bookinfo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bookinfo`  AS SELECT `inventory`.`inventoryID` AS `inventoryID`, `bookinventory`.`ISBN` AS `ISBN`, `book`.`title` AS `title`, concat(`author`.`authorLName`,', ',`author`.`authorFName`) AS `author`, `itemstatus`.`status` AS `status` FROM ((((`inventory` join `itemstatus` on((`itemstatus`.`statusID` = `inventory`.`statusID`))) join `bookinventory` on((`bookinventory`.`inventoryID` = `inventory`.`inventoryID`))) join `book` on((`book`.`ISBN` = `bookinventory`.`ISBN`))) join `author` on((`author`.`authorID` = `book`.`authorID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `cdinfo`
--
DROP TABLE IF EXISTS `cdinfo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cdinfo`  AS SELECT `inventory`.`inventoryID` AS `inventoryID`, `cdinventory`.`cdID` AS `cdID`, `cd`.`cdTitle` AS `cdTitle`, `artist`.`artistName` AS `artistName`, `itemstatus`.`status` AS `status` FROM ((((`inventory` join `itemstatus` on((`itemstatus`.`statusID` = `inventory`.`statusID`))) join `cdinventory` on((`cdinventory`.`inventoryID` = `inventory`.`inventoryID`))) join `cd` on((`cd`.`cdID` = `cdinventory`.`cdID`))) join `artist` on((`artist`.`artistID` = `cd`.`artistID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `dvdinfo`
--
DROP TABLE IF EXISTS `dvdinfo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dvdinfo`  AS SELECT `inventory`.`inventoryID` AS `inventoryID`, `dvdinventory`.`dvdID` AS `dvdID`, `dvd`.`dvdTitle` AS `dvdTitle`, `genre`.`genre` AS `genre`, `itemstatus`.`status` AS `status` FROM ((((`inventory` join `itemstatus` on((`itemstatus`.`statusID` = `inventory`.`statusID`))) join `dvdinventory` on((`dvdinventory`.`inventoryID` = `inventory`.`inventoryID`))) join `dvd` on((`dvd`.`dvdID` = `dvdinventory`.`dvdID`))) join `genre` on((`genre`.`genreID` = `dvd`.`genreID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `inventorytitles`
--
DROP TABLE IF EXISTS `inventorytitles`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `inventorytitles`  AS SELECT `inventory`.`inventoryID` AS `inventoryID`, `book`.`title` AS `title` FROM ((`inventory` join `bookinventory` on((`inventory`.`inventoryID` = `bookinventory`.`inventoryID`))) join `book` on((`bookinventory`.`ISBN` = `book`.`ISBN`))) union all select `inventory`.`inventoryID` AS `inventoryID`,`cd`.`cdTitle` AS `title` from ((`inventory` join `cdinventory` on((`inventory`.`inventoryID` = `cdinventory`.`inventoryID`))) join `cd` on((`cdinventory`.`cdID` = `cd`.`cdID`))) union all select `inventory`.`inventoryID` AS `inventoryID`,`dvd`.`dvdTitle` AS `title` from ((`inventory` join `dvdinventory` on((`inventory`.`inventoryID` = `dvdinventory`.`inventoryID`))) join `dvd` on((`dvdinventory`.`dvdID` = `dvd`.`dvdID`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `staffview`
--
DROP TABLE IF EXISTS `staffview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `staffview`  AS SELECT `s`.`employeeID` AS `employeeID`, `s`.`employeeFName` AS `employeeFName`, `s`.`employeeLName` AS `employeeLName`, `s`.`username` AS `username`, `p`.`positionTitle` AS `positionTitle` FROM (`staff` `s` join `staffposition` `p` on((`s`.`positionID` = `p`.`positionID`)))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`artistID`);

--
-- Indexes for table `audioGenre`
--
ALTER TABLE `audioGenre`
  ADD PRIMARY KEY (`audioGenreID`);

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`authorID`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`ISBN`),
  ADD KEY `authorID` (`authorID`) USING BTREE,
  ADD KEY `genreID` (`genreID`);

--
-- Indexes for table `bookInventory`
--
ALTER TABLE `bookInventory`
  ADD PRIMARY KEY (`inventoryID`,`ISBN`),
  ADD KEY `ISBN` (`ISBN`);

--
-- Indexes for table `cd`
--
ALTER TABLE `cd`
  ADD PRIMARY KEY (`cdID`),
  ADD KEY `artistID` (`artistID`),
  ADD KEY `audioGenreID` (`audioGenreID`);

--
-- Indexes for table `cdInventory`
--
ALTER TABLE `cdInventory`
  ADD PRIMARY KEY (`inventoryID`,`cdID`),
  ADD KEY `cdID` (`cdID`);

--
-- Indexes for table `checkOutHistory`
--
ALTER TABLE `checkOutHistory`
  ADD PRIMARY KEY (`inventoryID`,`cardNo`,`checkOutDate`),
  ADD KEY `checkouthistory_ibfk_2` (`cardNo`);

--
-- Indexes for table `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`directorID`);

--
-- Indexes for table `dvd`
--
ALTER TABLE `dvd`
  ADD PRIMARY KEY (`dvdID`),
  ADD KEY `studioID` (`studioID`),
  ADD KEY `genreID` (`genreID`);

--
-- Indexes for table `dvdDirector`
--
ALTER TABLE `dvdDirector`
  ADD PRIMARY KEY (`dvdID`,`directorID`),
  ADD KEY `directorID` (`directorID`);

--
-- Indexes for table `dvdInventory`
--
ALTER TABLE `dvdInventory`
  ADD PRIMARY KEY (`inventoryID`,`dvdID`),
  ADD KEY `dvdID` (`dvdID`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`genreID`);

--
-- Indexes for table `holds`
--
ALTER TABLE `holds`
  ADD PRIMARY KEY (`inventoryID`,`cardNo`),
  ADD KEY `holds_ibfk_2` (`cardNo`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`inventoryID`),
  ADD KEY `statusID` (`statusID`),
  ADD KEY `inventory_ibfk_1` (`typeNo`);

--
-- Indexes for table `itemStatus`
--
ALTER TABLE `itemStatus`
  ADD PRIMARY KEY (`statusID`),
  ADD KEY `statusID` (`statusID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`employeeID`),
  ADD KEY `positionID` (`positionID`);

--
-- Indexes for table `staffPosition`
--
ALTER TABLE `staffPosition`
  ADD PRIMARY KEY (`positionID`);

--
-- Indexes for table `studio`
--
ALTER TABLE `studio`
  ADD PRIMARY KEY (`studioID`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`typeNo`),
  ADD KEY `typeNo` (`typeNo`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`cardNo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artist`
--
ALTER TABLE `artist`
  MODIFY `artistID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `audioGenre`
--
ALTER TABLE `audioGenre`
  MODIFY `audioGenreID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `authorID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `cd`
--
ALTER TABLE `cd`
  MODIFY `cdID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `director`
--
ALTER TABLE `director`
  MODIFY `directorID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `dvd`
--
ALTER TABLE `dvd`
  MODIFY `dvdID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `genreID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `inventoryID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `itemStatus`
--
ALTER TABLE `itemStatus`
  MODIFY `statusID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `employeeID` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `staffPosition`
--
ALTER TABLE `staffPosition`
  MODIFY `positionID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `studio`
--
ALTER TABLE `studio`
  MODIFY `studioID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `typeNo` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `cardNo` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`authorID`) REFERENCES `author` (`authorID`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`genreID`) REFERENCES `genre` (`genreID`) ON UPDATE NO ACTION;

--
-- Constraints for table `bookInventory`
--
ALTER TABLE `bookInventory`
  ADD CONSTRAINT `bookinventory_ibfk_1` FOREIGN KEY (`inventoryID`) REFERENCES `inventory` (`inventoryID`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `bookinventory_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON UPDATE NO ACTION;

--
-- Constraints for table `cd`
--
ALTER TABLE `cd`
  ADD CONSTRAINT `cd_ibfk_1` FOREIGN KEY (`artistID`) REFERENCES `artist` (`artistID`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `cd_ibfk_2` FOREIGN KEY (`audioGenreID`) REFERENCES `audioGenre` (`audioGenreID`) ON UPDATE NO ACTION;

--
-- Constraints for table `cdInventory`
--
ALTER TABLE `cdInventory`
  ADD CONSTRAINT `cdinventory_ibfk_1` FOREIGN KEY (`inventoryID`) REFERENCES `inventory` (`inventoryID`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `cdinventory_ibfk_2` FOREIGN KEY (`cdID`) REFERENCES `cd` (`cdID`) ON UPDATE NO ACTION;

--
-- Constraints for table `checkOutHistory`
--
ALTER TABLE `checkOutHistory`
  ADD CONSTRAINT `checkouthistory_ibfk_1` FOREIGN KEY (`inventoryID`) REFERENCES `inventory` (`inventoryID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `checkouthistory_ibfk_2` FOREIGN KEY (`cardNo`) REFERENCES `user` (`cardNo`) ON UPDATE CASCADE;

--
-- Constraints for table `dvd`
--
ALTER TABLE `dvd`
  ADD CONSTRAINT `dvd_ibfk_1` FOREIGN KEY (`genreID`) REFERENCES `genre` (`genreID`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `dvd_ibfk_3` FOREIGN KEY (`studioID`) REFERENCES `studio` (`studioID`) ON UPDATE NO ACTION;

--
-- Constraints for table `dvdDirector`
--
ALTER TABLE `dvdDirector`
  ADD CONSTRAINT `dvddirector_ibfk_1` FOREIGN KEY (`directorID`) REFERENCES `director` (`directorID`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `dvddirector_ibfk_2` FOREIGN KEY (`dvdID`) REFERENCES `dvd` (`dvdID`) ON UPDATE NO ACTION;

--
-- Constraints for table `dvdInventory`
--
ALTER TABLE `dvdInventory`
  ADD CONSTRAINT `dvdinventory_ibfk_1` FOREIGN KEY (`dvdID`) REFERENCES `dvd` (`dvdID`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `dvdinventory_ibfk_2` FOREIGN KEY (`inventoryID`) REFERENCES `inventory` (`inventoryID`) ON UPDATE NO ACTION;

--
-- Constraints for table `holds`
--
ALTER TABLE `holds`
  ADD CONSTRAINT `holds_ibfk_2` FOREIGN KEY (`cardNo`) REFERENCES `user` (`cardNo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `holds_ibfk_3` FOREIGN KEY (`inventoryID`) REFERENCES `inventory` (`inventoryID`) ON UPDATE CASCADE;

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`typeNo`) REFERENCES `type` (`typeNo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `inventory_ibfk_2` FOREIGN KEY (`statusID`) REFERENCES `itemstatus` (`statusID`) ON UPDATE CASCADE;

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`positionID`) REFERENCES `staffPosition` (`positionID`) ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
