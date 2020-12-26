SET NOCOUNT ON

IF OBJECT_ID('tempdb.dbo.#Input', 'U') IS NOT NULL
BEGIN
	DROP TABLE #Input
END

IF OBJECT_ID('tempdb.dbo.#BlackTiles', 'U') IS NOT NULL
BEGIN
	DROP TABLE #BlackTiles
END

IF OBJECT_ID('tempdb.dbo.#NewBlackTiles', 'U') IS NOT NULL
BEGIN
	DROP TABLE #NewBlackTiles
END

CREATE TABLE #Input (
	InputRowId bigint not null IDENTITY(1,1),
	DirectionRow nvarchar(max)
)

--INSERT INTO #Input
--VALUES
--('sesenwnenenewseeswwswswwnenewsewsw'),
--('neeenesenwnwwswnenewnwwsewnenwseswesw'),
--('seswneswswsenwwnwse'),
--('nwnwneseeswswnenewneswwnewseswneseene'),
--('swweswneswnenwsewnwneneseenw'),
--('eesenwseswswnenwswnwnwsewwnwsene'),
--('sewnenenenesenwsewnenwwwse'),
--('wenwwweseeeweswwwnwwe'),
--('wsweesenenewnwwnwsenewsenwwsesesenwne'),
--('neeswseenwwswnwswswnw'),
--('nenwswwsewswnenenewsenwsenwnesesenew'),
--('enewnwewneswsewnwswenweswnenwsenwsw'),
--('sweneswneswneneenwnewenewwneswswnese'),
--('swwesenesewenwneswnwwneseswwne'),
--('enesenwswwswneneswsenwnewswseenwsese'),
--('wnwnesenesenenwwnenwsewesewsesesew'),
--('nenewswnwewswnenesenwnesewesw'),
--('eneswnwswnwsenenwnwnwwseeswneewsenese'),
--('neswnwewnwnwseenwseesewsenwsweewe'),
--('wseweeenwnesenwwwswnew');

INSERT INTO #Input
VALUES
('nenwwwnwsenwneswnwnwnwnwnw'),
('senwwneeneeneneneenenesweneswenenene'),
('newnwnwnwnwnwnwesenwenenwenwnwnwwnwsw'),
('wswnesewwwnwwnewswswnesw'),
('wnwwwwswwwwswwswswwswnesweww'),
('esenwneswseeseseseneseeweseseseseswse'),
('neseesweenweeeewwswee'),
('senwnesewnwwsenenwsewwewswwnwwswew'),
('nwesesewswnwnwsenw'),
('nwnenewnwnwwsenwnwswnwwnww'),
('eeseeeeweneeeseneweneeeeeee'),
('nwweeeeeeeswnwneneneeesenenese'),
('wewwwwwwwwswnwnewswwwwseww'),
('sweneenwswswneewswnwnwneeneneswnew'),
('swsenewwsenesewseneswsenwseneswsesenee'),
('nenwnenwneswsenenenenenewnwne'),
('wwwwwwwwwew'),
('nenenenwnesenwnenesewswnenenenwne'),
('seeswnwsewwnweswneswswseseseseseswsw'),
('swswwenwnweswwseneneewsenwwwe'),
('eeneneenewneeewneeseneneeeneene'),
('nenweenwenenenenesenesenee'),
('eswweeswsenenwnwnwwseswwnwnwneenene'),
('nwswnenwnwneenenwnwneweneswneneenwnene'),
('newneneneeneneneneseenenenenewnwnewne'),
('swwwswwswwwwwwswneww'),
('swnwsenwsewnwnwneeswneeswneneswwnesene'),
('neneneenenwneeswswnenenenenene'),
('wnwswnwsenwnenwnwwnwewnwwnwwnwnwnww'),
('seswnwwesenwwnwneswwnwweenwnwenw'),
('wseseseseseseseseseewesenwseese'),
('seesesesesenwesesweneseweeesesesw'),
('ewnewnesenwswnesenwwsenenwenenenenew'),
('eeenenenenenwneneneswneneneenee'),
('seeeseeneeeseseseseseeeswe'),
('seswseseswneswseswswswswswseswswswse'),
('newwwwwswwswsenenewwwsenwswwww'),
('nenenenwnenwswenenenenenene'),
('nwnwnwnwnwnwnwsenwwwnwnwnwnwnwnwnwnesw'),
('seenewnwnenesewnenesweeneeneneesw'),
('nenewswenwnwnwwnewnwseneneneswenwswsene'),
('nwseesenwnenewnwswswsesenesewsesesesw'),
('sewseseeseseswseswse'),
('wswwswswsweswswswswsenwswneneseswswse'),
('eeeweneseeeeeeneneeweeneee'),
('enesweenwweneneeeseeeeneenewe'),
('wwenwnenwnwswsenwnenwwwnwweswww'),
('nenwenwnwnwnwnwneswnwnwswnwnwnwsenwnwnw'),
('nenwewneeneseswswesw'),
('nwswenwseswswswswsewswswswseseseneswsese'),
('nwswsesesenewsweswsweseswnesew'),
('nwnwnwneneenenwnenenewnenwsenwnenenwnew'),
('nwewwwswswswwwsenwwesweswswswnew'),
('sweseneswswswseswseswseswseswnwswswnwsw'),
('sweswenewneneneneneseneneeenenwnene'),
('swswswswswswswswnwswswswswswswswseeswnwse'),
('swseswenwseseseseswswsesewswseswswsese'),
('enwwwwwseenwewwwnwwwnwwwww'),
('wwswwwwwnwwwwwnenw'),
('eeswenwseeesenweeneeswseseeeese'),
('sweenwwneneenene'),
('enweswseeseeeeeeenweeeseee'),
('wswwwswsweswswswswnewwwsw'),
('nenwswnewnenwnwnwsewnenesenenenenenenw'),
('swwneweseswswswswswwswswneswswswnesw'),
('nenwnenwnwnwnenwnwsenenwnwnwnwnenwnw'),
('wnenenewneenenenwseneneneseneswwe'),
('wseenwnenwneswseneneenwneswnenwswnew'),
('enwwenenenesewsweneswseswsewnenewsw'),
('eweeeeeseneeseswsesenwswsenwweee'),
('seseeeenwseeeseenwseeeeeeee'),
('nwnwneneenenenenwnwnwnwnwnwneneswswnenw'),
('seeeseseseswnwseseneswnwseseswnenwsesee'),
('swswswswswswswswswswswswseewswswswswne'),
('wswwwswwswnwwsew'),
('wwnwwnewwwwswsewwwwwwnwseww'),
('enwnwswewneneseswnenenwswnwnwenwsenenene'),
('seseesesewneswnwsewswenwseneswwsesee'),
('swseswswswsenwswswswswswseswseswnw'),
('seseseswseeseseeseswnwnewseeesesese'),
('nwnenenwnewsewnwswenenwenenene'),
('ewwsesenwneneeesweeeneneeneenenew'),
('swswwneeneswswswswnwswsw'),
('neswswwwswnewwseneswnewwnwweswsew'),
('nwnenewwswnwwwwwesewweswwwsesw'),
('enweewwseeneeseneseenweseneee'),
('weswneeneseneenwnwswweeeneeswwe'),
('enweneeeseseeseww'),
('nenwswnenwnwnwswnwnwenwnenwnwsenenwnenene'),
('wweswseesenwsesenwe'),
('neswnwswnwneneenene'),
('nwnenenewnwswenenwenwnenwnwnenenwnenw'),
('eneneewswnwwseswneswsewnenwwswnewwse'),
('nwsesweeneeweseseseseseenesesesee'),
('seeseseseeeewsenwsesesenwseesesese'),
('neneswnenenwneneeneneneswnwnenenwnenenene'),
('seseswwsesenesesesesesesesesesesenesesese'),
('seneswesenesewneweseseneseseweeesee'),
('eeswswswseesenwsenwnweeeneeneesesw'),
('eeeseeseseesesenwseseseseeseenwnw'),
('swnwswswenwswsewneswseseswwswseswnwe'),
('nwneeenenewsenene'),
('nesesenwneseswseswswwnwseswswseswseseswsw'),
('sesenesewnesesesesesewseseseseesesesw'),
('wnesewsewseseswnwswswsenwswwneswnenewne'),
('eeseeeeeeseesweeeeeenwe'),
('neswsewnwneswwsewneeseswsee'),
('neswseseenenwswneneenwenweneneswew'),
('eeeeswseeeeeenweeeeewene'),
('nwwnwnwnwnwnwnwnwnwnenwswnwnwnw'),
('weeeesewseswsenwnwnwneswnwwnwnwne'),
('weneswswewewswseswswswswwnenwswnesw'),
('nwewnwenwnwnenwnwnwswnenenwnwnwnwnwnw'),
('swswswseswneeswswswwswwswswswswswswswsw'),
('sesewswenwsesewsesewnwnesesesenenwne'),
('eeeeseesweenweseeeneesweee'),
('newswsewnenwnwsewsenw'),
('wswnewwwsewsewwwwswwwsewwnenw'),
('seenwnwnwesenewseeswsew'),
('nenwwwwnwnwnwwsewwnwnwwwwwsenew'),
('eseeeeeeeeneeneeeeeeewseew'),
('nwneweeswnwnenenwweeweswseswene'),
('swswwwswneswswswswswseswsweswswnwswswswsw'),
('nwswesenweeenwsenweewnweseswneee'),
('swswseseswswnwswswswswswswseswswnwseswe'),
('wenewnwwwewwswwweesw'),
('wswswswwwswwnewswswneswseswwwswswsw'),
('nwswwesewsesewnenenwswwwwwwww'),
('eeneswnwseeeeenwweneneswnwswne'),
('wwwswwwnwwewwwnwwwwweswww'),
('sesenwseseseeseswnwsesewsesesenesesese'),
('seseswnwswswswswsesweswswnwswswswseswswsw'),
('enwseseswwseneseeneeseneseewseseew'),
('nwsenwnwnwnewnenwwseswnwsenwww'),
('ewneeeneweeenenweeneeeswenene'),
('swswswswwswneeswesesewneswswnwnewswsw'),
('sewseswnewseneswwnw'),
('wwnwnenenwnweeneneneenwnenenesw'),
('eseeneneneeswnweswesewsewneswwnene'),
('nwnwwnwnwnwnwwnwenwnwswnwnwswnwwnwe'),
('nwsenwseswwewnenwnewnwnwsenesenwnwnw'),
('newswenwseweswwswswswswswneswnwsesww'),
('swwswswseswwswnwsweswnenewwswswswsw'),
('neneneeswneneewneneneeneeeneswenenw'),
('eneeneneeeseweeneene'),
('swseswseseswwneseseswswsweswseseseswsw'),
('eeseeeseeeneseeeeeswseee'),
('eswnwswwswsenwseswswwswseswswneeswsenwsw'),
('swwnwnwswwseswwswwswenewswswwwswsw'),
('seseswseswseneseneeseswseswsesewswswsw'),
('nenenenenenwneswnwnwene'),
('wwwswneweswswwwseswswneswswswswwsw'),
('wswwswneneswwswwsenwnenesewwwswse'),
('nwewwwwwnwnwnwenwsenwnwwnweswswsw'),
('seseeeeeeseseswsenwsenwewseseese'),
('seenwsewseseseseeseseswseswseswsesenw'),
('nwswewwseneneseswseswnwswsenwsenwswnw'),
('swswswswswswneswnweswswswswnwswswswwsesw'),
('eeseeeseseswseweeesenwseeeeese'),
('wnwwwwwwwwwwenwnw'),
('eseseseseswswwneneseneeeswenesesee'),
('swneswnwnewwneeneseseneneneewnenenw'),
('weeeeeenweeeewswneeeeeese'),
('eeenwsweneneesweneneeeeeeee'),
('sewwewwswnwwswswesw'),
('newswneneneneeneeswnew'),
('nenenwnwwseswnenwnwnenwnenwseswneewnenw'),
('nenwnwwnwnwnwsenwnwwnwnwnwnwsenwnwnwnw'),
('wwnwnwwswwwnwwnwnwneewnwnwwsenw'),
('sweswswwneneswesesenwsenwwswseswsesesese'),
('wseseswseseseseseseseesenenwseseswwnwse'),
('wnwnwswwnwnwwnenwwnwwseenwwwwnwsew'),
('wenwseeseseswenwnweeeswneseesese'),
('eenenwewewneneneeswe'),
('swswseswswswnwseeswnwswswsenwswswsenesenw'),
('nwwnwseewnesweeeeeseeeeeeswee'),
('neneswnenenenenenenwenwwseswnenee'),
('swswswewswwwswnewsewswswsw'),
('nwnwwnwnwnwnweeswsenwnwnwnw'),
('swseseswneseswseswseseseseswseswsesw'),
('swsewsenwswswseseswswswswsweseswswswnw'),
('sesenwnwnwnenwnwnwnwnwnwnwnwnwnwnwnwnww'),
('swnesweswswswswswnwwwswswswswwswwsesw'),
('seeeeeeseeseeesweeswnweseswnwenw'),
('neesweeeweeewneeeseneeee'),
('nwwsenenwsenenwwnwnenwwnwnwnwsenenwnenene'),
('seseeseeseeseeneenwseweneswwnwse'),
('sewseseseseseesesesewseseseswseenesese'),
('wnwnesenwwwnenwwneswswwnenwwwwwsw'),
('nwneenenenenenwneseneseneneneswnenwnene'),
('wnenwseewwwwwwnenwswwwswnwwnese'),
('eneewwwsewwnenwnwwnewswnwswsese'),
('sweseswseeneswnenwneseesewewnwwse'),
('eeneeenewweeseseseseseeseseseeee'),
('wnwwnwnwnwwwwsewnwwenwnwnwwwnwne'),
('nwnwnwnwnwnwnwnesewnwnwnwnwnwnwewnwnwnwsw'),
('nenwwneeenenwnwnenwnwwswnenenesenenwne'),
('ewneeneeseweenweeeseeenweenesw'),
('enwweeseesweenwnesweweeeee'),
('seeeseseswseseswswsesewseweswsenwswsene'),
('eneeweeeeeeseswseeeeswenwee'),
('swswnwseswswsenwnwnwewwswswswwnwswese'),
('esenwnwseeeswswenwnwseneenwsenwswsene'),
('nwnwwnwnwnwnwnwsenwnwww'),
('swsesenwseseneswswesesesesenwseseseswsese'),
('eseswswseenwseseseseseseswwse'),
('wneenwnwnwnwnwnenenwswswnenwnesenenwsw'),
('seseeseneeseeseeeswneeswsee'),
('wswwswnewswnwweneseewwwnwwwww'),
('nwwwwwwnewwswwwwweeswnwwsw'),
('sewwwewwseewnewswwwnwnewnww'),
('weseseseneswesenwsesenwswseseswswsenene'),
('nwewnwswnwnenwnwwwnwwweewseswnww'),
('nenenwswwnwswnwnwsenwwnenwwenwnwsew'),
('wseeeseseseeeneseseseswseenwseee'),
('sesesesesesewseseeseseseseesesesenwse'),
('swseeseeeseeeeseswseweenwnwneee'),
('nweswnenwswnwnwweneswswnwsenwnweswnwnenw'),
('newwsewnwnwnwnwnw'),
('wwwswwswwwswwwswwnweswwswwe'),
('wswneswneseseseswsesesenwseseeswnwswsesesw'),
('nwnweneseesesweeneneeneswnewwnew'),
('enwnwwnwnwnwnwnwnwnwnwnenwwnwsesenenwnw'),
('nwwnwwnwwnwnewnwnwsenwnwwesenwnwswnw'),
('neenwewewesweneweeeseswnwee'),
('nwneseseseesweeeeeseweesesesee'),
('nwswenwswnwnwnwnwnwnesenenwswnenwsenwnw'),
('wwwwwswsewenwwwswnesenwwnwwnw'),
('wneswnwnwwwwwnewsewwwwww'),
('swnenenewswwsenwseseswnwseseswseseeseswe'),
('wewwwnwwseewwnwwnenwnwwwww'),
('swwwwwwwwwwnewwwweewww'),
('eeeneeewseweseeeeeeeewe'),
('wnwnwnwnenenenenenenwnesenwnw'),
('nenwswwnwsweneeseweneesw'),
('nenenewnewneeneneeneeneneneene'),
('seseseeseseseenwseenwseseeeseeesww'),
('nenwwsenwsewsewnwnwnwnwwnwnw'),
('seneeseseseseweeeeweseswse'),
('wswswswsweseseswsenwsese'),
('wnewnweenewsewswnwsenwwswswnwnwnese'),
('wwsenenwnewwwwwwswwse'),
('nenwswswswsewseseenwnwsweswswswsenwe'),
('wnwseeswseenwwnenweseswswswswnesww'),
('nenewneneeneseswnenesewnwnesenenenenwnwnw'),
('wenwnenesenwnenewnenenewnenesenenenwne'),
('swswnwswswswseswswswswswswswswswnwseswe'),
('sesesesesesesesesesenwseeseswsewsenenese'),
('wnwwweewwwewwswwwwwwwne'),
('weenwseeeeweswwneesewwwene'),
('wwswwwwwwwwwnwwwnwwnew'),
('swswseswswswnewswsewnenewswswswwwwsww'),
('wewwwnesenwswenwwswwwenweswnewsw'),
('eneneseneswnwneseneswneswenenenwneswwnwne'),
('eneseeneneneeweneneneneneneene'),
('swsewnwewseeneseeswseweenwne'),
('sesenwwseeswswseseseswsweswseswswswswsw'),
('neneeneneneneneneneneneswneswnwneneneene'),
('seseesesenwsesesesesesesesese'),
('neneenwnenwnwnwnewnwenenwnenwseneneswnw'),
('neeweeewneeeeeeeeeseeesee'),
('nwwwswswnwewnwnwwwnwewnwe'),
('wwwwwnewwswwwwse'),
('seswneneenewwnenenenenwnenesenenesewne'),
('wsesenwnwswneeswswseseswsweseenwswnwsw'),
('wseseneneswnenenwwnenwnwnwnewnwnwnwsenw'),
('seseseseswseseseseneswsesesesesenwsesese'),
('eeswswswnwseswsewnwswnwswnwswe'),
('wswswesewswweswswswwnwnwnesw'),
('neeneeneeewnewseeneseeneneeeee'),
('seesenwnesenwseseseseneswsesesenwsesesesw'),
('neswswwsenwseseseseswseseneseswnwwswnese'),
('nenesenwneneenenenewnwnenenwnwnenenenew'),
('wwswswwswnwswwswwswwwswseswsw'),
('wnwsesenewsewwswswnwsweswswenewswnesw'),
('eeeseswneesweenweenw'),
('senwswenesewnesenwswswweswswswseswnee'),
('wnwwwsewnwnwwswnenww'),
('neneneswswnenenenenweswneswneenenenenwne'),
('seseseseseenwsesee'),
('nwnwneneswenwwwsenewnesenewseswwse'),
('neswseweewenwewwwnenwsenesesesee'),
('wsewnenewewwwswswnwswwwewnwwwsw'),
('nweeeseweswseseewneeeseeenenwe'),
('wswnwenwenwwnenwswseswenwwnwnwesenwne'),
('seneswswneseseseswwseseseseseseseseseswse'),
('ewnweseseseseneeesewneewsweeneese'),
('seneneneneneneewnenewsenenewwsesew'),
('wwnwswwswsesweswwwwwswswswswnesw'),
('nwswnwswnwnwnwenenwnwnenwwnwnwenwnwnw'),
('seeneseeeeneneeneneneweneeenwnwe'),
('nenesewnwnwnwseswsenwnwsweswwwsenenwne'),
('seseseeweeeseseeeneseneseseesesesw'),
('nwneeneneneeseneeeneneenenewnesenee'),
('sesenwneswseswswswenenwswnwswswswswswsw'),
('nwwwnwnwsenwwwnwnwwnwwnwnwewnwsw'),
('nenenwseneswnenesenenenenwnenenenenwnwwne'),
('swswswswwweswwwswneswswwwswswswsw'),
('swswwswswwswnwswneseswswnewswwseseswswsw'),
('nwsenwswsweseseseseseseenwseswswseswsesesw'),
('ewnwswswneneswneseneeswswwnwseneswne'),
('wwwwwsewwwwsewneewnwwwww'),
('sewneswseseswnweeseeeeeseeneesewse'),
('seswneswswwswswseneswse'),
('nwneswnwnwnwnwnwnwnwnwenenwne'),
('wwewwwwwwwnwweseswswwwwnwsw'),
('eeswseneenweeenwnweeseeeenenwsw'),
('swswwwnwwswnwwwewweswewnwnwsewsw'),
('nwwsenwnwnwwnwwwnewesesw'),
('wwwnewnewwwnwwsenwsewwwwwww'),
('swsewswswseswsewseeneswseneswseswswswsw'),
('nwnenwnwnwnenwsenwnwenwnwnwswswnwnwwnwnwnw'),
('sweeswnewwwnwnweseneswsewnesewswnw'),
('swneseseeswseneswnwsw'),
('swweswnewswswwwswseneswnwwswnwsesesw'),
('eenwnwnenenewswswnwneenwnenwnwswnwne'),
('eseseseseeseswseeseseseneseeseseenwew'),
('swsweeneswswswnwwswswswwswwnwswsweswsw'),
('swsweswseswseswnwsesenewnenwswneswswswsw'),
('seswsesenweseseeeseenwseee'),
('seseeseeneeseseswsenweseewsesesesee'),
('swnwnwnewnesenenwnenesenwnwnwwneneenwnw'),
('seswswsesenwswseseseneswseseweenwswsw'),
('wnwnwnwnwnwnwwwnwwnenwnwnwsw'),
('nwnwswnesenwneewnwnwnwnweneseneeww'),
('seswwswneswswseswswswneseswswswswswswsw'),
('newwnwsesenwnenenwnenenwwenwsenenwswnwe'),
('eenewneseesweenwneesenwwsenweese'),
('seewswwwnwwseswswwnwswenenewnew'),
('seseseseseeewnenwee'),
('eeeeswwneneweneewenenweewe'),
('wsenenwswenenwesenwneswsenesenwneswnw'),
('nwnenenenenenenenwneswnwnenewswnwenee'),
('newswseseenweesenweswsewwseeenenw'),
('swsenenwnwnesewwwnwwwnwwsewnewnww'),
('neneneneneneneenenwnenwweneswnenewne'),
('swswseenwwsweswswswswswswewenwswwsw'),
('neeeeneneenewnewneneneseeenene'),
('senwnesenwseswswsesesesenesewwswseseswne'),
('wwsenewswewnwwwwwwnwwwswswswww'),
('eswwwwnenweweswewwwswnwnwsww'),
('nenwnwwnwnwsenwnenwnwsenwwnwnwnwnwnwesw'),
('eneseeneeneeseeneneeewnewneee'),
('eenenwnwneneneeswnweswseeenwneeesw'),
('senwseswswswnenwnwswwseesweeseswswsw'),
('swwnewswsenwwwwwwwnwsenwnwwnewnew'),
('nwnwnwnwnwnwseswnwnwnwnwnenwnenwnwnwnwnw'),
('swnwwswsenwnwwnwnwwnwenenwnwsenwnenwne'),
('nenenwnenewewnenwneeeeswswneese'),
('eeneeneeneneneeesweenwneneeswee'),
('swseswswnwseswseseseswswseswswswswneswsw'),
('wwewwwenwewnewwswwwswnwww'),
('wwnenwwsenwnwnwwwnwwwwwenwnwnww'),
('nwnenenenwnwneenenwnenwwsenwwnwnwnwnene'),
('swswsweswwwwswwwwwwsw'),
('eeneeeneswenenweenenene'),
('eseeswnwswneeeseenwsewseeeenwnwe'),
('seseseseseswsesesenesesesesewwwseesee'),
('esweeseseseseeenwsesesenweeeswe'),
('wwnewwenwnwsewswwnwnwwnwwwnww'),
('nenenesenenenenenenewnwnenewenenenene'),
('nweeeseeseweeenwnwsweeeeee'),
('senwnwnwnwwswnwenwnwwnwnwnwenwneswnw'),
('nwnwswnenenwnwsewsenwswsewsewnwnenenwnene'),
('wneewwwsenwewnwnwesewewnwwwsw'),
('swswneswswswwenwwseswseswnwswswseswswse'),
('swwswswswswswneswseswswswwswswneswsww'),
('wwseswswswswneswswswswswswswswswnwsww'),
('newwwsenewswswswwsw'),
('neneenenweneneneeneneenwneneswseswne'),
('eeesesesesesewseseenew'),
('weweneswsweeenenwewneeswseenene'),
('swnewneneseeeeweneeenwnenwweswsw'),
('seswsenwseesesenwseswsesesese'),
('eeweeseeeeeeneeee'),
('nwnwnesenenenenewnenwnwnwwene'),
('neseswswseeswseswswswseseneswnwseswsesw'),
('nwnwenwnwwwwnweweewwsewswswwnwe'),
('nesesenwewenwseseeseswseswseneeese'),
('ewnwwsenewenwwweewwnwwnwwnw'),
('nesewnwnwnwswwwswnwwnwsenwnwwnwnenewnw'),
('sewsesesewswseseneesesesesese'),
('newnwnwsesenenenwsenenwwwnwsenwnesenwnwse'),
('esesenwesesenweseseseseseswswseesesese'),
('sewwwswswneswwnewwsweewwwwnwsww'),
('swsewwwswwwswnwwnwwwwwewwww'),
('nenwswneneneneenwneewnesesenenenenenee'),
('nwnwnwnwneswsenwnwnwnwnwnwnwwnwenwnwnwnwnw'),
('eeeeesweeeeewseeeneneeswe'),
('nwnwnwnesesewnwnwnwwnwsenwwnwwnwnwnwne'),
('nenwneeneneewneeneeneneneswneeee'),
('seneswneneeswswswseseswseseseenwwswsesw'),
('swnesweswseswsenwsenwewswsenwnesenwse'),
('seseseeswsesesesewsesesenesesesenwsenesese'),
('wnwnenwnwwnwwwwnwseewwnwwewsew'),
('nwnwwnwnwnwwnwenwnwwnwnwnwnwnww'),
('sewsenwnenwnewnwnwnenwnwnwnwwnenwnwenw'),
('nwewwnesewwwwwsenwwwnwnwwwwsww'),
('swnwswswwswswsesewswswwwewnwswswsw'),
('swseneseseseswseswseswwswseswsesw'),
('swwnwwswnwnenwnwnwewsewewwnwwnw'),
('nwnwwnwnwwwwnwsesewnwnwnwnw'),
('wwnwwwenwnwseswwenwnwnwnwenwnwnwnw'),
('nwnwnenwnwwnwnwneesenwwnenenenwseswne'),
('swneenwswwsenwseswswswsenweseswneswseswse'),
('swsweswsewsweneswswswsenwseswsese'),
('eseeswnweeeseeeseswneesesesesesee'),
('nweswwewswnwewnwwnewsenwswwwwnw'),
('nwnenenwswneeeswewseneswneswseeenw'),
('wnwwswwnwnwswenenwwenwwnwnw'),
('eeeeneeeswnweeswenweeneeene'),
('swseeeweswnwneewwswnwswswesenwswnw'),
('seseswsesweseswsewswesesenwseseswsesw'),
('wnwwwnwnwwsenwnwnwnwnwnwwwwnenw'),
('wswnwwwwswwewswseswwwwneneseswww'),
('neseeeneenenwnweswene'),
('wwwwwwwwnewwwwswnwesewwe'),
('swnesewenesesewneweswnwswenw'),
('wsweeenwseswenwsenenweenwsee'),
('neneenwnwnwsenesenenenenenwnewsenwseswnesw'),
('wnwnwnwswnenenenwneneneneneenwsenenenenw'),
('swswswswswseneswswswswswwswswswswswnesw'),
('sewnenwneneneenenenwnwnwwnwnenenenenwne'),
('swwnwswewswswnwswneswswwswswswwsesw'),
('wseenwseesewseesesesene'),
('wsenweweeneeeneeneewseeeenee'),
('wswswwwswswwswswsweswwswnewswewsw'),
('wnewwwwnwseweswwswwwswwswwww'),
('wnwswnwseswswwswwwewewwswnew'),
('senweeeeeeewsweneeneeeeee'),
('sweeseeseeneswenwenenwnwenesenenwsw'),
('seenweseseseseseseseseseseesenewneswsese'),
('ewnweneeseeneeeeeneeeneenee'),
('nenwwsenwenwswnesewnwnenenesewswnene'),
('sewseswswswseseswswsenwseseswsesesesene'),
('nesenenwswswseswsenwneswswswseewwsew'),
('wnwnwnwnwwseeneneeswnewenwnwnwsenwne'),
('neneeneneswwneeenwneenee'),
('esenwenewneeweneneesesweesewe'),
('nenwnwnwnenenwnwnwnesenwnewnw'),
('nwenwswenwnwnwnwswenwsenwnwnwnwwnenwwnw'),
('wnenesenenenwnesenwnwnenenesenene'),
('eseeeeseewenenewnwsweeneenwee'),
('swswnewneseswseswwseneneneneswwswneswne'),
('enwenwwwswnwsenewe'),
('enwwswwseswwww'),
('nwnwswswnenwnenwnenwnwnwsenenenenenenenenwe'),
('wswwneswsenwnwnewwsweew'),
('seswseseseseeesesenweesesewesesenwe'),
('newswswswnenenwnwenenenwsenenwswnwwe'),
('nwneneeeneneneeswwenenenweeesesene'),
('wneneneseeneneeswwneneneswnenenenenene'),
('nwneeneneewneneneneneneneneswnenene'),
('nwnwneswnenwenewenenwnenewnwnesenene'),
('nwnenwenwswsenesesenwseneenwnwnwwnwsw'),
('swneweswswwwwswwwweseseneeww'),
('nwwnenesesenenenenenwnenwnewneneenene'),
('sesenwswseseseseseswenwseswswseswsesese'),
('newneeneneeweseneewneneneweeee'),
('newnwwswswwwswswwewesewwwwwnw'),
('nenwenenenewnwnenwnenwsenenenewnwnenwne'),
('nwnenwsenwnenwnwnwnwnenwnenenesenewnwnene'),
('wnweswnwneenwwwsenwnwsenwenwsenesesw'),
('enesenesenwwsweswneneswnenesenewswswnww'),
('nwnenwnesenwnenenenwnenenwseswnwnwnewnwnw'),
('nwswseneseseseswseseswswsesewnwswseseesw'),
('nwnwnwnwnwwsenwnwnwsenesesewnw'),
('neneneeneneeneneneenewnenenesenenenesw'),
('wsenenenwnenwnwnwwnenwnwsenwneenwnenww'),
('swwsenewneswseswnewww'),
('wswnwswswseswswswsweseneneseeswswnesew'),
('seneenenewswneneneenenenenenenenenene'),
('wnwnwnwsewesenwwwnewwwesww'),
('newswsewweenwewwnwswneeenwnwswnw'),
('neneneeswneneneneeeenene'),
('nwswwsenwwnwnwnweenwnwwewnwnwswnwne'),
('nwnwnenwneeeenesewnwswswsenwnwnwwnw'),
('ewnwneswseneeneenweneseesenenenww'),
('nwnenenwnwenwnwnesewnenewnwswneseenene'),
('neeweneneeneeneenenewneeeneneswse'),
('nwneswnwseseswswesewnwwswswswneesewe'),
('swswneswswsenwwswswwswswnwswswswswese'),
('swswneswswenewsweneswwwswnwse'),
('eeeeseeeeeeseewenese'),
('wewwwseswwwswwwwnwewnwwwww'),
('senwnwnwnwnwnenwwnenwswnwnwnenwnwnenwnwnw'),
('wwwsenwwswwweweswneswnwswwsww'),
('newwwwewwwwwwwewwwwwwse'),
('eeneeeeeweneneeeeeneweee'),
('seseswneseswnewsewseseseneseneseseswsew'),
('seeswswseswswswswseswswswseswswwswnwse'),
('sesewwseseseseseseneseseseesesesenwsese'),
('swewnwnenewswwewseswesenenwnwwnwwnw'),
('swenwseswwwswswwswswwwwenwnewsw'),
('swsesenwesesesenesesenesenwsew'),
('swwswswwnwswwwswewswwnwswewwwe'),
('wswseeneswesewneswswwsewenew'),
('swwsewnwwewwswwwnwwswswsw'),
('enweeeseneeeeneeeeee'),
('sweeeseeswenwenweeeeeeeeeee'),
('sewnwnwswswseeswsweswswsweswswswswsenesw'),
('swwswwswswwswwneswwswswsw'),
('seswnewneenesenwnesenwweneeneswew'),
('wnwesenwsenenweseseseswsesenesewswsene'),
('swwwwswwsewswwwneswwww'),
('wswwwswwswswewwwswwwewswwsw'),
('esewswswswswswswnewswswneswswnwswseswsw'),
('nwsenwnwnesenenenenewnwnwnenenwnenenenene'),
('swneneeneeseswnwneswwwneneenenenenenw'),
('swswswswwnwsweswswswswswesenwswswnesw'),
('eswswswwwswswnwweswswswwnweswswswnw'),
('seneneneeeneeneewswneeeenenenee'),
('swswswswsesweswswswnewswswswswswswnesw'),
('nwswnwewswwswwnwwneweenwnewnwe'),
('newseneswewnwseswnesesenwswneswswswse'),
('swwwwnwwewenenwwseww'),
('swsewneswseseseseseswnwsesesewenenwese'),
('sewsesweewseneeeseeseeeweee'),
('eeeewneseeeeeeswneeesweswne'),
('nenenwsewsenesesenwwwsenenwnwseneswnenww'),
('eeseesesesesewsesesesese'),
('newneenenwnesweseneneenenene'),
('swswnwweswneseseswnwswseswseseswswswse'),
('nwswwnwsenweseswswseswswswsw'),
('nwwnwnwwnwwnwnesewnesewsenewnwwswnw'),
('swnenwwnenenenenweseswsenenwenewnwswe'),
('nwnewnwseseswsewwneswneseseeswsesesenwse'),
('nwwnwwswnwnenwnwnwnwwsenwenwnwnwnwsw'),
('seeseeesenwweeeneweseee'),
('nwwwwwwsewwwswnewwwwwwww'),
('nwnwnwwwnwwwsewwneswnweewwsww'),
('esenwnenewnenenwnenenwnenweeseesenese'),
('wnenenenenenenwneenenenesenenenenenenew'),
('eswneeneeeneeneswnenenwneeeeenee'),
('wswseswsenewswwnwswwwswswwwswnesw'),
('swswsesesenewswneseseswswwneswswsw'),
('sesewswsenwswneenenenweswee'),
('seswswswswswswswneseswnwewswseswswswsw'),
('sesenwseseswswseswswsweseswswsenwsesesw'),
('eswswswseswnwswswswswseseswswswnesewsesw'),
('enenweeneweneneeeesweenenesene'),
('esenenwneswsenweswwwnwnenwnwnwwnwwnw'),
('swswesewswswswnwnwswwswswswweswswwsw'),
('seeseseseseneenwsesewnesenesewsesew'),
('eseswseseeswesenweenenweeseeeese'),
('senwnwswwwwwwseseneswsewswswneswnw'),
('esenwwwseswseseneenwe'),
('swneswseseswseswneneswwswswswseswswswnwsw'),
('swwwneswwswswswswneswesw'),
('nweeeneseseeeeeenenweeenwesw'),
('nesenwswnenwnwnwnwsenwneenenwnenenwnenw'),
('neeeeeswneesewnenenwe'),
('swsesesesesesesesenesewsesesese');

WITH SpaceSplit_CTE AS
(
	SELECT	InputRowId,
			REPLACE(
			REPLACE(
			REPLACE(
			REPLACE(
			REPLACE(
			REPLACE(
					DirectionRow
			, 'sw', 'sw ')
			, 'se', 'se ')
			, 'nw', 'nw ')
			, 'ne', 'ne ')
			, 'e', 'e ')
			, 'w', 'w ') AS SplitDirectionROw
	FROM	#Input
),
Directions_CTE AS
(
	SELECT			InputRowId,
					LTRIM(RTRIM(value)) as Direction
	FROM			SpaceSplit_CTE
	CROSS APPLY		STRING_SPLIT(SplitDirectionRow, ' ')
	WHERE			LTRIM(RTRIM(value)) != ''
),
DirectionCount_CTE AS
(
	SELECT		InputRowId,
				Direction,
				COUNT(*) as DirectionCount
	FROM		Directions_CTE
	GROUP BY	InputRowId, Direction
),
GroupedDirectionCount_CTE AS
(
	SELECT		DISTINCT InputRowId,
				COALESCE((SELECT DirectionCount FROM DirectionCount_CTE WHERE Direction = 'e' AND InputRowId = DC.InputRowId), 0) AS E,
				COALESCE((SELECT DirectionCount FROM DirectionCount_CTE WHERE Direction = 'ne' AND InputRowId = DC.InputRowId), 0) AS NE,
				COALESCE((SELECT DirectionCount FROM DirectionCount_CTE WHERE Direction = 'se' AND InputRowId = DC.InputRowId), 0) AS SE,
				COALESCE((SELECT DirectionCount FROM DirectionCount_CTE WHERE Direction = 'w' AND InputRowId = DC.InputRowId), 0) AS W,
				COALESCE((SELECT DirectionCount FROM DirectionCount_CTE WHERE Direction = 'nw' AND InputRowId = DC.InputRowId), 0) AS NW,
				COALESCE((SELECT DirectionCount FROM DirectionCount_CTE WHERE Direction = 'sw' AND InputRowId = DC.InputRowId), 0) AS SW
	FROM		DirectionCount_CTE DC
),
AffectedTiles_CTE AS
(
	SELECT		InputRowId,
				E + SE - W - NW AS TotalE,
				NE - SE + NW - SW As TotalNE
	FROM		GroupedDirectionCount_CTE
),
GroupedAffectedTiles_CTE AS
(
	SELECT		TotalE,
				TotalNE,
				COUNT(*) AS Totals
	FROM		AffectedTiles_CTE
	GROUP BY	TotalE, TotalNE
)
SELECT		TotalE,
			TotalNE
INTO		#BlackTiles
FROM		GroupedAffectedTiles_CTE
WHERE		Totals % 2 = 1

DECLARE @DayCount int = 0;

CREATE TABLE #NewBlackTiles (
	TotalE int,
	TotalNE int
)

--SELECT		*
--FROM		#BlackTiles


WHILE (@DayCount < 100)
BEGIN
	PRINT @DayCount;
	-- Identify white tiles that will become black
	WITH WhiteTileNeighbours_CTE AS(
		SELECT		TotalE,
					TotalNE,
					(
						SELECT		COUNT(*)
						FROM		#BlackTiles BTN
						WHERE		(
										(BTN.TotalE = BT.TotalE + 1 AND BTN.TotalNE = BT.TotalNE) OR
										(BTN.TotalE = BT.TotalE + 2 AND BTN.TotalNE = BT.TotalNE - 1) OR
										(BTN.TotalE = BT.TotalE + 2 AND BTN.TotalNE = BT.TotalNE - 2) OR
										(BTN.TotalE = BT.TotalE + 1 AND BTN.TotalNE = BT.TotalNE - 2) OR
										(BTN.TotalE = BT.TotalE AND BTN.TotalNE = BT.TotalNE - 1)
									)
					) AS NeighbourCountFromTL,
					(
						SELECT		COUNT(*)
						FROM		#BlackTiles BTN
						WHERE		(
										(BTN.TotalE = BT.TotalE + 1 AND BTN.TotalNE = BT.TotalNE - 1) OR
										(BTN.TotalE = BT.TotalE + 1 AND BTN.TotalNE = BT.TotalNE - 2) OR
										(BTN.TotalE = BT.TotalE AND BTN.TotalNE = BT.TotalNE - 2) OR
										(BTN.TotalE = BT.TotalE - 1 AND BTN.TotalNE = BT.TotalNE - 1) OR
										(BTN.TotalE = BT.TotalE - 1 AND BTN.TotalNE = BT.TotalNE)
									)
					) AS NeighbourCountFromTR,
					(
						SELECT		COUNT(*)
						FROM		#BlackTiles BTN
						WHERE		(
										(BTN.TotalE = BT.TotalE AND BTN.TotalNE = BT.TotalNE - 1) OR
										(BTN.TotalE = BT.TotalE - 1 AND BTN.TotalNE = BT.TotalNE - 1) OR
										(BTN.TotalE = BT.TotalE - 2 AND BTN.TotalNE = BT.TotalNE) OR
										(BTN.TotalE = BT.TotalE - 2 AND BTN.TotalNE = BT.TotalNE + 1) OR
										(BTN.TotalE = BT.TotalE - 1 AND BTN.TotalNE = BT.TotalNE + 1)
									)
					) AS NeighbourCountFromR,
					(
						SELECT		COUNT(*)
						FROM		#BlackTiles BTN
						WHERE		(
										(BTN.TotalE = BT.TotalE - 1 AND BTN.TotalNE = BT.TotalNE) OR
										(BTN.TotalE = BT.TotalE - 2 AND BTN.TotalNE = BT.TotalNE + 1) OR
										(BTN.TotalE = BT.TotalE - 2 AND BTN.TotalNE = BT.TotalNE + 2) OR
										(BTN.TotalE = BT.TotalE - 1 AND BTN.TotalNE = BT.TotalNE + 2) OR
										(BTN.TotalE = BT.TotalE AND BTN.TotalNE = BT.TotalNE + 1)
									)
					) AS NeighbourCountFromBR,
					(
						SELECT		COUNT(*)
						FROM		#BlackTiles BTN
						WHERE		(
										(BTN.TotalE = BT.TotalE - 1 AND BTN.TotalNE = BT.TotalNE + 1) OR
										(BTN.TotalE = BT.TotalE - 1 AND BTN.TotalNE = BT.TotalNE + 2) OR
										(BTN.TotalE = BT.TotalE AND BTN.TotalNE = BT.TotalNE + 2) OR
										(BTN.TotalE = BT.TotalE + 1 AND BTN.TotalNE = BT.TotalNE + 1) OR
										(BTN.TotalE = BT.TotalE + 1 AND BTN.TotalNE = BT.TotalNE)
									)
					) AS NeighbourCountFromBL
		FROM		#BlackTiles BT
	)
	--SELECT		*
	--FROM		WhiteTileNeighbours_CTE
	INSERT INTO	#NewBlackTiles (TotalE, TotalNE)
	SELECT		TotalE + 1,
				TotalNE - 1
	FROM		WhiteTileNeighbours_CTE WTN
	WHERE		NeighbourCountFromTL = 1
	AND NOT EXISTS
				(
					SELECT		TOP 1 *
					FROM		#BlackTiles BT
					WHERE		BT.TotalE = WTN.TotalE + 1 AND
								BT.TotalNE = WTN.TotalNE - 1
				)
	UNION
	SELECT		TotalE,
				TotalNE - 1
	FROM		WhiteTileNeighbours_CTE WTN
	WHERE		NeighbourCountFromTR = 1
	AND NOT EXISTS
				(
					SELECT		TOP 1 *
					FROM		#BlackTiles BT
					WHERE		BT.TotalE = WTN.TotalE AND
								BT.TotalNE = WTN.TotalNE - 1
				)
	UNION
	SELECT		TotalE - 1,
				TotalNE
	FROM		WhiteTileNeighbours_CTE WTN
	WHERE		NeighbourCountFromR = 1
	AND NOT EXISTS
				(
					SELECT		TOP 1 *
					FROM		#BlackTiles BT
					WHERE		BT.TotalE = WTN.TotalE - 1 AND
								BT.TotalNE = WTN.TotalNE
				)
	UNION
	SELECT		TotalE - 1,
				TotalNE + 1
	FROM		WhiteTileNeighbours_CTE WTN
	WHERE		NeighbourCountFromBR = 1
	AND NOT EXISTS
				(
					SELECT		TOP 1 *
					FROM		#BlackTiles BT
					WHERE		BT.TotalE = WTN.TotalE - 1 AND
								BT.TotalNE = WTN.TotalNE + 1
				)
	UNION
	SELECT		TotalE,
				TotalNE + 1
	FROM		WhiteTileNeighbours_CTE WTN
	WHERE		NeighbourCountFromBL = 1
	AND NOT EXISTS
				(
					SELECT		TOP 1 *
					FROM		#BlackTiles BT
					WHERE		BT.TotalE = WTN.TotalE AND
								BT.TotalNE = WTN.TotalNE + 1
				);

	--SELECT		*
	--FROM		#NewBlackTiles;

	-- Identify black tiles to remove
	WITH BlackTileNeighbours_CTE AS
	(
		SELECT		TotalE,
					TotalNE,
					(
						SELECT		COUNT(*)
						FROM		#BlackTiles BTN
						WHERE		(
										(BTN.TotalE = BT.TotalE + 1 AND BTN.TotalNE = BT.TotalNE) OR
										(BTN.TotalE = BT.TotalE AND BTN.TotalNE = BT.TotalNE + 1) OR
										(BTN.TotalE = BT.TotalE - 1 AND BTN.TotalNE = BT.TotalNE) OR
										(BTN.TotalE = BT.TotalE AND BTN.TotalNE = BT.TotalNE - 1) OR
										(BTN.TotalE = BT.TotalE - 1 AND BTN.TotalNE = BT.TotalNE + 1) OR
										(BTN.TotalE = BT.TotalE + 1 AND BTN.TotalNE = BT.TotalNE - 1)
									)
					) AS NeighbourCount
		FROM		#BlackTiles BT
	)
	DELETE		#BlackTiles
	FROM		#BlackTiles BT
	INNER JOIN	BlackTileNeighbours_CTE BTN ON
				(
					BT.TotalE = BTN.TotalE AND
					BT.TotalNE = BTN.TotalNE AND
					(BTN.NeighbourCount = 0 OR BTN.NeighbourCount > 2)
				)

	-- Insert new black tiles and clear
	INSERT INTO		#BlackTiles (TotalE, TotalNE)
	SELECT			TotalE,
					TotalNE
	FROM			#NewBlackTiles

	DELETE FROM		#NewBlackTiles

	-- Increment day count
	SET @DayCount = @DayCount + 1;

	--SELECT		@DayCount AS DayCount,
	--			COUNT(*) AS Count
	--FROM		#BlackTiles
END

SELECT		@DayCount AS DayCount,
			COUNT(*) AS Count
FROM		#BlackTiles

SET NOCOUNT OFF