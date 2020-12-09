IF OBJECT_ID('tempdb.dbo.#Input', 'U') IS NOT NULL
BEGIN
	DROP TABLE #Input
END

CREATE TABLE #Input (
	InputRowId bigint not null IDENTITY(1,1),
	Number bigint
)

INSERT INTO #Input
VALUES
(17),
(7),
(12),
(45),
(41),
(21),
(29),
(23),
(5),
(39),
(1),
(16),
(3),
(22),
(36),
(32),
(13),
(14),
(10),
(47),
(11),
(27),
(19),
(9),
(35),
(38),
(17),
(15),
(4),
(6),
(7),
(8),
(28),
(12),
(5),
(20),
(21),
(18),
(66),
(53),
(16),
(22),
(50),
(14),
(23),
(13),
(41),
(10),
(11),
(71),
(19),
(24),
(17),
(9),
(15),
(29),
(26),
(25),
(27),
(28),
(30),
(20),
(31),
(21),
(32),
(40),
(33),
(38),
(39),
(50),
(34),
(37),
(51),
(72),
(100),
(36),
(65),
(53),
(24),
(42),
(57),
(41),
(44),
(74),
(45),
(81),
(54),
(52),
(55),
(88),
(105),
(70),
(60),
(58),
(61),
(91),
(66),
(68),
(77),
(89),
(69),
(94),
(65),
(113),
(83),
(164),
(85),
(96),
(106),
(97),
(120),
(117),
(180),
(115),
(118),
(119),
(157),
(131),
(123),
(138),
(133),
(281),
(137),
(134),
(154),
(148),
(150),
(161),
(179),
(211),
(181),
(182),
(215),
(203),
(217),
(232),
(233),
(237),
(234),
(241),
(267),
(254),
(256),
(257),
(270),
(403),
(271),
(282),
(284),
(298),
(384),
(311),
(340),
(360),
(398),
(416),
(385),
(418),
(834),
(569),
(465),
(702),
(491),
(511),
(524),
(1403),
(510),
(513),
(624),
(541),
(714),
(1037),
(566),
(582),
(2237),
(651),
(671),
(700),
(1079),
(881),
(942),
(803),
(909),
(1082),
(1466),
(956),
(1524),
(1001),
(1619),
(1023),
(1051),
(1054),
(1095),
(1107),
(1123),
(1148),
(1217),
(1253),
(1233),
(1322),
(1351),
(1503),
(1609),
(1684),
(1745),
(1943),
(1712),
(1865),
(1957),
(1979),
(2118),
(2243),
(2376),
(2539),
(2417),
(2105),
(4361),
(6479),
(2381),
(4097),
(4060),
(3609),
(2486),
(2825),
(4956),
(2854),
(3922),
(3293),
(4075),
(3457),
(3577),
(3669),
(3822),
(4062),
(4084),
(7637),
(7390),
(4793),
(4522),
(6118),
(4486),
(5311),
(4867),
(5206),
(6095),
(5340),
(5679),
(7906),
(6147),
(7379),
(10911),
(6750),
(11272),
(14140),
(7034),
(10812),
(7491),
(8929),
(8146),
(8570),
(12701),
(9008),
(12013),
(9353),
(9692),
(9826),
(11014),
(10073),
(14001),
(15604),
(11826),
(12429),
(12897),
(16103),
(13784),
(24912),
(18262),
(17154),
(22825),
(16844),
(30316),
(15637),
(25296),
(33998),
(17578),
(18361),
(35840),
(19179),
(19045),
(19518),
(29583),
(22840),
(24074),
(24255),
(24723),
(36757),
(26213),
(26681),
(39669),
(33302),
(33899),
(32481),
(43657),
(33215),
(35889),
(40360),
(50842),
(35939),
(37879),
(36623),
(37406),
(42019),
(55668),
(43119),
(59515),
(46914),
(47095),
(48329),
(48978),
(51404),
(64087),
(52894),
(68420),
(72841),
(65696),
(66380),
(68370),
(69104),
(69154),
(74029),
(72562),
(73818),
(79742),
(74502),
(78642),
(84501),
(85138),
(116937),
(90033),
(94009),
(95243),
(139725),
(97307),
(100382),
(146903),
(116981),
(118590),
(134066),
(132076),
(138258),
(134750),
(178510),
(141666),
(141716),
(146591),
(173885),
(148320),
(153144),
(195623),
(275782),
(169639),
(175171),
(184042),
(187340),
(229993),
(286316),
(235132),
(215897),
(521448),
(235571),
(249057),
(250666),
(266142),
(266826),
(273008),
(276416),
(289986),
(321762),
(288307),
(294911),
(463478),
(362511),
(322783),
(470358),
(465157),
(344810),
(425837),
(371382),
(501958),
(445890),
(516808),
(583218),
(501713),
(484628),
(715823),
(499723),
(517492),
(992239),
(539834),
(617694),
(564723),
(644545),
(610069),
(611090),
(657422),
(667593),
(685294),
(694165),
(716192),
(770647),
(790700),
(797219),
(871105),
(1103312),
(945613),
(984351),
(1067846),
(986341),
(1002120),
(1017215),
(1039557),
(1057326),
(1381737),
(1157528),
(1254614),
(1209268),
(1267491),
(1221159),
(1268512),
(1325015),
(1458293),
(1567866),
(1410357),
(1486839),
(1561347),
(1783560),
(2255512),
(1857446),
(1929964),
(1986471),
(2270632),
(2392861),
(2238374),
(2041677),
(2197085),
(3816859),
(2412142),
(2426040),
(2366796),
(2677848),
(3250945),
(2488650),
(2489671),
(2593527),
(3975489),
(2868650),
(2897196),
(2971704),
(3048186),
(3344907),
(3641006),
(4269588),
(3787410),
(3971641),
(4353267),
(4685735),
(8502594),
(4238762),
(6053148),
(5840354),
(4838182),
(4792836),
(4915711),
(5167519),
(6947436),
(9627764),
(7132317),
(5083198),
(6868837),
(5765846),
(5868900),
(8064715),
(8870608),
(6393093),
(6985913),
(7428416),
(7759051),
(15739445),
(11078828),
(11785618),
(8924497),
(14555742),
(11186198),
(9631018),
(12551887),
(22620457),
(9708547),
(9998909),
(10250717),
(10849044),
(14457808),
(10952098),
(11476291),
(28291332),
(11634746),
(12261993),
(15050628),
(35277245),
(18711149),
(16683548),
(15187467),
(17390069),
(19175214),
(18555515),
(26190488),
(21727008),
(19339565),
(19629927),
(19707456),
(19959264),
(21202815),
(20249626),
(20847953),
(30190261),
(21801142),
(22586844),
(23111037),
(36390282),
(23896739),
(26685374),
(40832742),
(30238095),
(33898616),
(31871015),
(35945584),
(32577536),
(64729481),
(38805141),
(37895080),
(39337383),
(41508598),
(53073830),
(39666720),
(41452441),
(40208890),
(52039237),
(41097579),
(43434797),
(45697881),
(44912179),
(68808918),
(62815631),
(50582113),
(62109110),
(66022757),
(85906771),
(71335674),
(73323456),
(64448551),
(72244256),
(70472616),
(86009758),
(79004103),
(77232463),
(79546273),
(79875610),
(80764299),
(96951416),
(86364620),
(81306469),
(123310407),
(84532376),
(129444555),
(90610060),
(143255220),
(112691223),
(206070851),
(138267013),
(126557661),
(149476719),
(134921167),
(159688076),
(136692807),
(170485670),
(150348226),
(209675027),
(157108073),
(163536479),
(156778736),
(243472693),
(160639909),
(162070768),
(165838845),
(167671089),
(171916529),
(175142436),
(247612390),
(203301283),
(306791699),
(306837696),
(249384030),
(261478828),
(263250468),
(271613974),
(284397886),
(327909613),
(317418645),
(300229286),
(307126962),
(310988135),
(317747982),
(400580766),
(318849504),
(322617581),
(322710677),
(326478754),
(329741857),
(333509934),
(347058965),
(378443719),
(574091144),
(450913673),
(526011960),
(512634498),
(520998004),
(656220611),
(1056801377),
(534864442),
(556011860),
(684978652),
(607356248),
(617977268),
(611217421),
(629837639),
(779024485),
(976925633),
(900569898),
(641467085),
(645328258),
(1180192700),
(1077009864),
(663251791),
(797972638),
(725502684),
(1173989128),
(985778115),
(963548171),
(1082023820),
(1033632502),
(1237193887),
(1090876302),
(1241055060),
(1142220690),
(1163368108),
(1922172539),
(1370830942),
(1427810277),
(1252684506),
(1408862124),
(1286795343),
(1388754475),
(1304718876),
(1124361034),
(1308580049),
(1461224429),
(1523475322),
(1783750753),
(1867723374),
(1759135186),
(2172900122),
(2019410617),
(2695657467),
(2591178385),
(2197000610),
(2215237336),
(2233096992),
(2266581724),
(2287729142),
(3070546096),
(2513115509),
(2377045540),
(2411156377),
(3092330802),
(2429079910),
(3974372522),
(2432941083),
(2585585463),
(3894165512),
(3244975182),
(2984699751),
(5677916265),
(5570285214),
(3626858560),
(3778545803),
(4192310739),
(4484729752),
(4412237946),
(4430097602),
(4448334328),
(4481819060),
(4520826134),
(4643627264),
(4664774682),
(7726794242),
(7819169299),
(4809986623),
(4840236287),
(7023520985),
(4862020993),
(6881275411),
(5018526546),
(7067404523),
(8039096506),
(6763245554),
(7414797353),
(7405404363),
(8190783749),
(15132198605),
(14954029303),
(9032547026),
(19972434892),
(8930153388),
(8878431930),
(9505648257),
(9526795675),
(9164453398),
(9308401946),
(18197000424),
(11885541978),
(14286679774),
(12901117499),
(12042047531),
(9880547539),
(14388816668),
(11781772100),
(19109452054),
(13830650077),
(21779549429),
(14168649917),
(17696432006),
(22359433666),
(17069215679),
(17910978956),
(22760803465),
(17808585318),
(21206500929),
(18042885328),
(18186833876),
(27361453822),
(25716192055),
(25612422177),
(21193943924),
(21662319639),
(22781665038),
(36097812832),
(32017483953),
(21922595070),
(25950422017),
(43759007335),
(38275716608),
(36091244987),
(31527082083),
(31237865596),
(35256049555),
(34765647685),
(39236829252),
(49928462909),
(35719564274),
(35851470646),
(35995419194),
(36229719204),
(39380777800),
(39849153515),
(53311875839),
(72225138398),
(43584914709),
(67378552729),
(44443984677),
(96896790548),
(47873017087),
(58152314274),
(65799575532),
(61945841211),
(92692653639),
(62764947679),
(71087019111),
(66003513281),
(66957429870),
(88028899386),
(101794994726),
(132472884063),
(71571034920),
(71714983468),
(71846889840),
(75376196994),
(75610497004),
(79229931315),
(160254037784),
(91457931796),
(92317001764),
(124155827555),
(113876530368),
(106025331361),
(176126721863),
(167927498768),
(131803088813),
(134335982599),
(137574548201),
(128768460960),
(137718496749),
(200339495880),
(338057992629),
(138528464790),
(159743882854),
(143286018388),
(143417924760),
(251201814650),
(154840428319),
(203385758870),
(150986693998),
(171546933079),
(170687863111),
(183774933560),
(229891549965),
(265769214215),
(289800264921),
(219901861729),
(293368893109),
(471103676379),
(277622000987),
(310730576852),
(263104443559),
(266343009161),
(266486957709),
(276246961539),
(355179924199),
(281946389550),
(281814483178),
(346671777258),
(286703943148),
(691005538108),
(380878243963),
(305827122317),
(440786958919),
(321674557109),
(342234796190),
(354462796671),
(465721323110),
(513270754838),
(562950904687),
(483006305288),
(619856797177),
(529447452720),
(1076221659525),
(558061444717),
(529591401268),
(532829966870),
(542589970700),
(542733919248),
(558193351089),
(563760872728),
(592531065465),
(587641605495),
(1178050148266),
(641166739819),
(723113040153),
(660289918988),
(762461516028),
(998551289980),
(663909353299),
(696697592861),
(1025740224536),
(1122122466733),
(996277060126),
(1091023317959),
(1012453758008),
(1087652845985),
(1556612734697),
(1062421368138),
(1183756710519),
(1072325320516),
(1085323889948),
(1100783321789),
(1100927270337),
(1121954223817),
(1151402478223),
(1301456658807),
(1583918665621),
(2011005047988),
(1305076093118),
(1324199272287),
(1747942764973),
(1754932671258),
(1676363111307),
(1360606946160),
(1692974652987),
(2097060381915),
(2113237079797),
(2113381028345),
(2074875126146),
(2084779078524),
(2172976735933),
(2157649210464),
(3309051688687),
(2201710592126),
(3478052829051),
(2186107211737),
(2222737545606),
(2222881494154),
(2827765589530),
(2456478571341),
(2606532751925),
(2629275365405),
(5531933182841),
(2684806218447),
(3000562383594),
(3036970057467),
(3053581599147),
(3369337764294),
(3473987974505),
(4679216116947),
(4159654204670),
(4188112205943),
(5121749135991),
(4257755814457),
(6644590777284),
(8532495566435),
(5255292191273),
(4424592086280),
(8568903240308),
(4445619039760),
(4408844757343),
(5998613129699),
(4679360065495),
(5063011323266),
(8099981380733),
(5235808117330),
(5314081583852),
(5685368602041),
(5721776275914),
(8870211126040),
(6090551656614),
(7241693805090),
(7627093578751),
(9320767137723),
(9934652256768),
(8605273244430),
(8445868020400),
(8703374854217),
(10348307471071),
(8833436843623),
(8854463797103),
(9681427157090),
(9088204822838),
(9471856080609),
(9508630363026),
(9644652874673),
(9915168182825),
(10377092907118),
(10298819440596),
(10549889701182),
(10921176719371),
(16481557375854),
(11407144877955),
(11812327932528),
(14793926510831),
(14868787383841),
(18384802011307),
(19465297729956),
(33178728522138),
(17149242874617),
(18077129325039),
(18618543037042),
(17942668619941),
(17921641666461),
(18478089718296),
(18326319877712),
(25418677085023),
(18560060903447),
(18980486443635),
(19153283237699),
(19559821057498),
(20213987623421),
(21219996159967),
(36247961544173),
(21471066420553),
(22328321597326),
(26275932261796),
(41481604835025),
(26606254443359),
(40031127324000),
(32018030258458),
(35709303778064),
(35070884541078),
(39413735040494),
(35091911494558),
(37771826274741),
(37713344141146),
(43978737988470),
(36399731384757);

DECLARE @TargetAnswer bigint = 1124361034

DECLARE @FirstNumber bigint = 0;
DECLARE @LastNumber bigint = 0;

DECLARE @FirstIndex bigint = 2;
DECLARE @LastIndex bigint = 1;

DECLARE @MinNumber bigint = 99999999;
DECLARE @MaxNumber bigint = 0;

DECLARE XMAS_cursor_first CURSOR FOR (
	SELECT Number FROM #Input
)

OPEN XMAS_cursor_first

FETCH NEXT FROM XMAS_cursor_first
INTO @FirstNumber

DECLARE XMAS_cursor_last CURSOR FOR (
	SELECT Number FROM #Input
)

OPEN XMAS_cursor_last

FETCH NEXT FROM XMAS_cursor_last
INTO @LastNumber

DECLARE @CumulativeSum bigint = 0;

WHILE @@FETCH_STATUS = 0
BEGIN
	IF(@CumulativeSum < @TargetAnswer)
	BEGIN
		PRINT 'Increase'
		FETCH NEXT FROM XMAS_cursor_last
		INTO @LastNumber

		SET @CumulativeSum = @CumulativeSum + @LastNumber
		SET @LastIndex = @LastIndex + 1
	END
	ELSE IF (@CumulativeSum > @TargetAnswer)
	BEGIN
		PRINT 'Decrease'
		FETCH NEXT FROM XMAS_cursor_first
		INTO @FirstNumber

		SET @CumulativeSum = @CumulativeSum - @FirstNumber
		SET @FirstIndex = @FirstIndex + 1
	END
	ELSE
	BEGIN
		PRINT 'Spot on'
		BREAK
	END

	PRINT @CumulativeSum
END

SELECT
	MIN(Number) + MAX(Number)
FROM
	#Input
WHERE
	InputRowId >= @FirstIndex
	AND InputRowId <= @LastIndex

CLOSE XMAS_cursor_first
DEALLOCATE XMAS_cursor_first

CLOSE XMAS_cursor_last
DEALLOCATE XMAS_cursor_last