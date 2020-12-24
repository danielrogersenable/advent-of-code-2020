IF OBJECT_ID('tempdb.dbo.#Input', 'U') IS NOT NULL
BEGIN
	DROP TABLE #Input
END

IF OBJECT_ID('tempdb.dbo.#PossibleAllergens', 'U') IS NOT NULL
BEGIN
	DROP TABLE #PossibleAllergens
END

IF OBJECT_ID('tempdb.dbo.#ConfirmedAllergens', 'U') IS NOT NULL
BEGIN
	DROP TABLE #ConfirmedAllergens
END

CREATE TABLE #Input (
	InputRowId bigint not null IDENTITY(1,1),
	AllergyText nvarchar(max)
)

--INSERT INTO #Input
--VALUES
--('mxmxvkd kfcds sqjhc nhms (contains dairy, fish)'),
--('trh fvjkl sbzzf mxmxvkd (contains dairy)'),
--('sqjhc fvjkl (contains soy)'),
--('sqjhc mxmxvkd sbzzf (contains fish)');

INSERT INTO #Input
VALUES
('lkv dhj ppxbh scqg vgmmcg jrgxc jzhql hrkhfl phhrpt fljmthl pcfxgn zkls dckkr rvhkkp ffj lrfmpx trsd jhsrjlj glmb zfvq vsj scbl xkltn jrhvk lcfxzll lcp fdxdp hslbs bzlfvx smvhmh gjz tcnqs ckpnbz xslr djlht slg pzqbcnq qxhm xfp prng qhdq tpxph qvbk jcx gsxnqd djkb kslv vdccvnn fvjqkh cxfgnn fjmm bhdtrkds krlgn cdfmd bttsc zmrl fpgk kltxdk qkdmtk scqslq dglk qjltjd rznx cfkjjc clnr hk bffqk qvzl jsdkg jmbj bbsqm mbvt lfcppl (contains dairy)'),
('qvbk tzhmt hk zlxrx clnr vjpcnl djkb smvhmh gkfxt mbvt qjltjd jbcpqb jhsrjlj zmnvg bffqk tjvs zrkhvq xhxslhf njjgv nkgzr fpffx tjbngs zkls msxhsxl xql jrhvk jlpz cdfmd zmrl mxdd rjfjcb ndpnq lpfzsbd lppxvs bxcjrdr vsj xslr fvnkvt cxfgnn qvzl lkv xkltn kltxdk rkqvz ggfrz vkzxrm svzk vkqxgr fb gsxnqd rfpbpn djmg lzlds mlqnfs lrfmpx ppxbh phdv qxml slg jrgxc bpfk svmvp qkdmtk nfl qxhm ljfv (contains dairy, nuts, shellfish)'),
('xghl sxvkrs zqmmqd lzlds fpgk nfgs tpxph jrhvk bttss lcp sllrrh qdnfxx zfqnj sjrzdg qjltjd mld zcfbq vdccvnn shlzrzq vgmmcg zmq pzqbcnq qhqml phhrpt pnn nfl rtdzk svzk dxmnp vhl njjgv fvjqkh skzb rkqvz xgfqd zfvq bffqk qvbk zzdckn xjsp bpfk fljmthl zmrl zlxrx pcfxgn ffdnx bmmdth zkls qxhm vkqxgr fpffx fb mlqnfs mxdd krlgn jhsrjlj rjfjcb hxbzr nkgzr ndpnq tcq ljfv fdqzvn dglk kslv gcls xslr rznx lkv hkvxh rkgrl dckkr kcvhh msxhsxl lppxvs rfpbpn tjvs (contains nuts)'),
('pntfmz jzhql szskn gcls ljfv zrlv vgmmcg hkvxh hsr gchmxm txvx hgtkgd qjltjd zkls cppf krlgn qhqml ffdnx rjfjcb xkltn jhsrjlj jrhvk mbvt jmbj rkgrl vntsh xqnktk vkzxrm ckrhr fljmthl rbvqg rfpbpn ckpnbz hgdxfc fdxdp tjbngs lfcppl bcrp bqzd rznx dvhhjp bmmdth tjvs vdccvnn rkqvz rvhkkp lkv clnr qxml msxhsxl zfqnj mld ffj mlqnfs pzqbcnq (contains eggs, sesame)'),
('znhd hjp zkls rfpbpn jcx lfcppl kcvhh pzxfq gsxnqd vkbfhpq phdv lppxvs dglk zcfbq fb qkdmtk lvrrr vhl fdxdp rznx jrhvk jhsrjlj gchmxm cxfgnn qjltjd xkltn bmmdth qnb ggfrz jrgxc vgmmcg ffdnx bxcjrdr qhdq tfrnr mxdd tjbngs lcfxzll hgggjq zfqnj zvrdpk njjgv fhqvnvf ckpnbz hgdxfc qdnfxx dzgdrl zrlv pcfxgn scbl ndpnq lkv mbvt nvmppng zbcln xghl qvzl qnnhpv jvmx pzqbcnq skzb gkfxt vjpcnl (contains peanuts)'),
('sllrrh zfqnj sjrzdg mlqnfs dvhhjp jrhvk zmq lvrrr zchp xslr rbvqg ckpnbz qftqv jrgxc qdnfxx nkgzr hvcnl glmb lpfzsbd rfpbpn dzgdrl jhsrjlj zfvq zrlv bkdh nsssf mxdd fdxdp lkv qjltjd bbsqm znhd jzhql lfcppl jcx jbcpqb qhdq (contains eggs, nuts, soy)'),
('jrgxc zcfbq jmbj fhqvnvf qdnfxx lrfmpx zmq zrlv dckkr cppf zqmmqd ndpnq ffj gkfxt qhdq vgmmcg kltxdk fdqzvn qvbk nkgzr bffqk xgfqd scbl zzdckn lbdkmc lzlds nsssf hxbzr jhsrjlj dvhhjp txvx rfpbpn lfcppl kcvhh zfvq gsxnqd svzk hkvs lcfxzll phdv jlpz vsj hslbs fb fjrk szskn rkgrl mbvt jrhvk bcrp spgkts jvmx pzqbcnq sxvkrs ztjqt bxcjrdr lkv pzxfq lcp fpgk xtsbkgf dzgdrl sjrzdg glmb zkls bttss lpfzsbd sllrrh svmvp clnr jkcgcl skzb tjbngs msxhsxl xql fvjqkh qjltjd (contains eggs, wheat)'),
('ndpnq msxhsxl cfkjjc lkv kcvhh shlzrzq jrhvk bpfk phdv tzhmt rrbvcs rjfjcb jhsrjlj pntfmz bkdh ztjqt hgdxfc gkfxt tpxph mbvt tjbngs jsdkg qjltjd xgfqd hgtkgd mlqnfs vdccvnn vntsh hk rkqvz zkls skzb qdnfxx bzlfvx pzqbcnq gjz pzxfq qhqml fjrk pnn zchp rfpbpn jlpz jgldk gsxnqd jzhql lfcppl svmvp fb jmbj bffqk njjgv mtvp znhd hvcnl lpfzsbd zbcln lzlds lcfxzll fljmthl vkzxrm qnb nsssf qvzl bhdtrkds qftqv (contains nuts, wheat, peanuts)'),
('gkfxt hgtkgd lcfxzll dzgdrl lvrrr rfpbpn hrkhfl hsr ndpnq zchp qkdmtk xjsp cdfmd skzb zmq zkls vkqxgr mtvp lcp qftqv jrhvk txvx ffj jhsrjlj bpfk qjltjd rrbvcs lfcppl ztjqt bxcjrdr hjp sllrrh cxfgnn fhqvnvf lppxvs zvkll lkv rkgrl vkzxrm rbvqg nkgzr jlpz xhxslhf zzdckn (contains peanuts)'),
('hkvxh vsj rfpbpn rrbvcs bhdtrkds ztjqt gkfxt dhj lvrrr qhqml lfcppl zfvq jrhvk hgdxfc cppf sxvkrs xql njjgv lcp rjfjcb hslbs fdxdp skzb jsdkg jbcpqb svmvp cdfmd hjp xjsp xkltn zmnvg bkdh xslr szlhpq bzlfvx zkls xtsbkgf zqmmqd tfrnr slg qvzl zrkhvq ffj vntsh hsr zfqnj djlht shlzrzq lpfzsbd pnn zchp tpxph jhsrjlj xqnktk qjltjd ljfv sllrrh nvmppng rbvqg fvjqkh (contains soy, peanuts, nuts)'),
('qdnfxx znhd vntsh mlqnfs kddsgbr gchmxm sjrzdg tjbngs qhdq hslbs ztjqt nfl hk rznx lvrrr tfrnr fpffx fb pnn szlhpq bffqk xkltn trsd hxbzr rtdzk dckkr nkgzr ppxbh nsssf jzhql jbcpqb spgkts qxhm szskn mtvp jcx scqslq fdxdp jhpvdp rrnmhx scbl jkcgcl dhj hrkhfl gcls qnnhpv bkdh zkls xslr krlgn tcq zmnvg jvmx rfpbpn zchp vkqxgr jhsrjlj qjltjd jrhvk lfcppl xttp (contains wheat, peanuts)'),
('vhl qnb zlxrx hsr hjp jrhvk lfcppl xslr rrnmhx lrfmpx jhsrjlj dglk tjbngs lkv fpgk gcls xghl xgfqd zkls zqmmqd smvhmh svmvp zrkhvq bkdh qxhm nkgzr fljmthl vntsh szlhpq gchmxm nsssf djmg vkzxrm qhqml nfgs xtsbkgf vjpcnl hvcnl djlht cppf qjltjd jsdkg jmbj rbvqg lfqq dxmnp szskn tcq txvx zmq jzhql vdccvnn krlgn lppxvs hk zvkll (contains sesame, nuts)'),
('scbl dzgdrl jrhvk rbvqg bkdh rrnmhx qnnhpv kslv rfpbpn phdv pzxfq qkdmtk vgmmcg hk ffj ppxbh vkzxrm tpxph vjpcnl cxfgnn bqzd jvmx scqslq lvrrr mlqnfs jkcgcl lfcppl bzlfvx zfqnj glmb dglk vsj zrkhvq gkfxt tcq xfp lfqq qxml hjp jhsrjlj qjltjd nsxs ffdnx hxbzr rkgrl ztjqt zkls zcfbq tfrnr tjbngs qvzl bpfk fb zlxrx gcls zzdckn msxhsxl dhj ckpnbz jmbj lkv krlgn hslbs rjfjcb qxhm xttp ggfrz pntfmz djlht (contains peanuts)'),
('spgkts sllrrh zkls nsxs lkv mtvp cdfmd lfcppl phdv kltxdk mxdd fdxdp zmq bmmdth qvzl xhxslhf vjpcnl szlhpq scbl bzlfvx krlgn zfqnj fvnkvt gcls svzk nsssf lpfzsbd fpffx xslr szskn fdqzvn pcfxgn xghl vhl pntfmz jgldk jrgxc zrlv zzdckn pnn nvmppng hk hkvs vkbfhpq vkzxrm pzxfq hxbzr qjltjd lrfmpx jhpvdp njjgv qhdq jhsrjlj tcq zmrl glmb qdnfxx jrhvk gjz bbsqm bkdh bpfk rkgrl nfgs (contains shellfish)'),
('rfpbpn jhsrjlj scbl xfp fb mlqnfs nfgs dzgdrl hgdxfc jsdkg zkls ztjqt qxhm xtsbkgf bxcjrdr mtvp qnb bqzd zvrdpk ndpnq zmrl dckkr rbvqg rkgrl znhd fjmm glmb vhl szskn qvbk ljfv dvhhjp pntfmz xslr nvmppng ckrhr kslv xttp scqg trsd ffj jlpz fpffx bbsqm pnn zzdckn fvnkvt prng zfvq sllrrh qjltjd vdccvnn lcp tcnqs phdv hgtkgd ppxbh zcfbq qxml xhxslhf xgfqd spgkts jrhvk cfkjjc msrbcfk hjp jgldk hsr hk lbdkmc hrkhfl lkv nhq dhj (contains peanuts)'),
('fvjqkh jhpvdp sxvkrs hxbzr jhsrjlj xjsp bbsqm mtvp lkv kltxdk jzhql jmbj lppxvs jsdkg lfcppl fb trsd xqnktk dglk fpffx cdfmd zmq dzgdrl dhj vgmmcg hgdxfc znhd qvzl mxdd lfqq hrkhfl jrhvk bpfk jkcgcl pzqbcnq zkls rrbvcs rfpbpn nfgs njjgv xslr xttp vjpcnl jvmx phhrpt ccc tjbngs fdqzvn tzhmt zvkll nhq fjrk svzk pcfxgn gchmxm dvhhjp kslv krlgn ffj sjrzdg ggfrz lcfxzll djlht fpgk nkgzr tcq phdv (contains eggs)'),
('gkfxt msrbcfk vkzxrm zcfbq lkv lbdkmc ggfrz hgggjq xslr vdccvnn zmnvg bkdh fljmthl qhdq djkb skzb shlzrzq kltxdk krlgn fvjqkh msxhsxl lpfzsbd mxdd jhsrjlj hvcnl zfvq txvx rfpbpn jrhvk jmbj scbl lfcppl fvnkvt szskn jzhql gchmxm smvhmh bmmdth hk tjbngs nkgzr tjvs gcls ckrhr zlxrx bttsc sllrrh fdxdp slg qjltjd qnb szlhpq jvmx tfrnr tcnqs xfp zfqnj ndpnq jhpvdp rvhkkp fpgk jsdkg xtsbkgf djlht tcq (contains dairy)'),
('szlhpq nhq fjmm cdfmd gcls zvrdpk lppxvs sllrrh kcvhh mxdd bbsqm sjrzdg qhdq zqmmqd fljmthl ckpnbz skzb bqzd xhxslhf xghl dglk prng gsxnqd fpffx zmq qvbk ckrhr dxmnp nkgzr cfkjjc vjpcnl qjltjd vkbfhpq slg jhsrjlj ggfrz zvkll znhd hjp lzlds hkvs svzk lkv pnn mtvp clnr jrhvk rznx ztjqt hkvxh dvhhjp scbl smvhmh pcfxgn kslv hgdxfc rfpbpn phhrpt zzdckn fpgk vdccvnn tjvs xtsbkgf zlxrx rrnmhx hgtkgd rtdzk zkls hslbs ndpnq xslr jhpvdp bzlfvx (contains shellfish)'),
('ljfv jhsrjlj bcrp zmnvg hkvs bmmdth fhqvnvf vgmmcg bhdtrkds xql rkqvz bkdh bqzd ndpnq jrhvk cppf qkdmtk rrbvcs pnn lpfzsbd msxhsxl rznx zcfbq tjvs mld ffdnx zrkhvq lkv bffqk nsxs svmvp jrgxc hrkhfl fvjqkh hslbs bbsqm scqg rfpbpn znhd zfqnj krlgn xslr qjltjd jcx dvhhjp kcvhh kddsgbr lfcppl kslv gcls qvbk phdv dhj mtvp lbdkmc (contains shellfish, wheat, nuts)'),
('jbcpqb zfvq jrhvk krlgn slg jrgxc pzqbcnq hgdxfc kddsgbr vsj nsssf spgkts cdfmd qjltjd ztjqt qxhm qnb sjrzdg ljfv dglk nfl zkls pzxfq zmnvg lfcppl tjvs tjbngs qvzl fdxdp tcq djkb skzb fpffx gchmxm lkv xslr dxmnp qkdmtk prng fljmthl zmq rfpbpn zrlv jcx rjfjcb clnr xhxslhf bzlfvx pcfxgn (contains wheat)'),
('kltxdk fvjqkh xttp lvrrr qhqml bmmdth zcfbq scbl nfgs pzqbcnq djmg qxml fvnkvt ndpnq hk jcx tjbngs fjmm zrkhvq rtdzk dxmnp hgtkgd bbsqm gkfxt zvkll bcrp vhl fpgk scqg rfpbpn bttss dhj jlpz kddsgbr xslr cfkjjc sjrzdg lzlds hkvs vjpcnl lpfzsbd nvmppng lfcppl slg znhd trsd qnb vkzxrm kslv pntfmz jrhvk szlhpq zrlv shlzrzq ggfrz lcp qjltjd tfrnr tjvs phhrpt zkls xjsp jhsrjlj (contains shellfish, peanuts, eggs)'),
('rbvqg lpfzsbd zcfbq spgkts ckpnbz hsr glmb bxcjrdr jgldk fvnkvt vkqxgr scbl qkdmtk jhsrjlj jsdkg tcnqs ffj scqg jrhvk zbcln xttp gkfxt xgfqd bbsqm jlpz fvjqkh fdxdp nsssf xslr dxmnp lbdkmc rtdzk rkqvz qdnfxx pzxfq slg phhrpt qvbk qnb hgggjq nfgs scqslq qjltjd zvrdpk jkcgcl xfp rvhkkp gcls rjfjcb msrbcfk nsxs mbvt lkv tpxph kddsgbr mlqnfs hk rrnmhx hgdxfc zkls rfpbpn ppxbh bpfk lppxvs pntfmz (contains nuts)'),
('gchmxm zzdckn qnnhpv hvcnl sjrzdg vkbfhpq qxml bffqk lvrrr ckrhr rkgrl hxbzr zkls nsssf svmvp bcrp qjltjd mtvp vsj phhrpt hslbs jhpvdp pzqbcnq zchp rznx nvmppng lkv scqslq xgfqd jsdkg xhxslhf zlxrx tjbngs cxfgnn rfpbpn zqmmqd msrbcfk fvnkvt prng rrnmhx shlzrzq rbvqg xslr scqg vgmmcg pzxfq jrhvk rkqvz mxdd spgkts mld lfcppl rjfjcb nfl bpfk ndpnq rvhkkp xjsp bkdh zmrl dhj zvrdpk lcp zbcln (contains peanuts, eggs, sesame)'),
('vgmmcg hxbzr txvx qnnhpv rrnmhx fvjqkh jgldk lkv skzb xjsp bkdh ckrhr gkfxt hgggjq nfl hslbs ffdnx rznx qjltjd qkdmtk jrhvk vhl xslr fvnkvt lfcppl fdxdp pnn lpfzsbd tzhmt bttsc phhrpt gchmxm fdqzvn qhqml lfqq gsxnqd zkls vntsh bxcjrdr mxdd fjmm vkqxgr msxhsxl hgdxfc djkb spgkts bpfk scqslq hjp cdfmd jhsrjlj fljmthl xkltn tjbngs hkvs lcfxzll clnr bhdtrkds ppxbh (contains peanuts, eggs, nuts)'),
('rrbvcs jgldk hgtkgd bzlfvx lkv jhpvdp hxbzr nsxs lpfzsbd hvcnl zrlv zrkhvq nfgs fdqzvn xslr tcq mbvt jcx qhdq zbcln tzhmt ckpnbz sjrzdg qkdmtk lppxvs hgggjq ffdnx hslbs skzb bpfk msrbcfk vntsh gsxnqd qxhm rkgrl zvrdpk zkls xhxslhf pzqbcnq rfpbpn xqnktk qjltjd hkvs bmmdth hgdxfc ccc scbl szlhpq vsj zmrl szskn jhsrjlj rznx qhqml vdccvnn jrhvk zvkll zmq fpffx ffj bkdh gjz znhd xgfqd qxml kddsgbr lrfmpx dhj djlht cppf vhl fvnkvt tpxph fljmthl (contains wheat, soy)'),
('rznx fvnkvt fjrk hgtkgd xslr djkb zmnvg kslv vkbfhpq znhd lkv xttp qjltjd phhrpt hk pcfxgn cdfmd jrgxc njjgv lzlds lrfmpx qdnfxx lfcppl pzxfq jlpz bxcjrdr jhsrjlj jcx kddsgbr hrkhfl zbcln qftqv mxdd zkls fljmthl rtdzk qnb rkgrl pnn xghl rrbvcs jrhvk nfgs vjpcnl jhpvdp scqslq tcq bttss qhdq bkdh slg xgfqd qnnhpv dglk (contains soy, peanuts)'),
('pzxfq xfp qvzl jgldk rkqvz xjsp zkls dckkr lbdkmc dglk lcfxzll jsdkg fdqzvn smvhmh bttsc cfkjjc fhqvnvf slg jrhvk qnnhpv fjmm njjgv lfcppl jrgxc kcvhh rrnmhx bpfk rfpbpn jhsrjlj ccc skzb svzk qftqv hjp ckpnbz nsssf djkb zmnvg fvjqkh glmb lpfzsbd nhq fpgk vdccvnn zchp zqmmqd sjrzdg bqzd nkgzr zrlv lcp ppxbh hgggjq hslbs nfgs xhxslhf vntsh bcrp xttp tzhmt zfvq znhd zcfbq hxbzr xslr tjvs lkv dxmnp (contains dairy, peanuts)'),
('rkqvz fjmm dhj zlxrx zbcln xslr phdv znhd trsd jhsrjlj tpxph lzlds jcx zvrdpk hvcnl qjltjd hkvxh zcfbq gsxnqd lfcppl jrgxc lcfxzll qvbk kslv kddsgbr zmrl qkdmtk skzb fljmthl jrhvk zrlv lcp xqnktk hjp lkv xhxslhf svmvp lppxvs zfvq fdxdp xjsp pntfmz ljfv bqzd rfpbpn fdqzvn (contains soy, peanuts)'),
('prng szskn jkcgcl rkgrl lvrrr nvmppng zmnvg mbvt xqnktk zlxrx hsr jhsrjlj kcvhh bkdh bqzd dckkr scqslq vkbfhpq bpfk ztjqt bhdtrkds nsssf jvmx rrbvcs vntsh rfpbpn xhxslhf njjgv ffj dxmnp tjvs xttp qvbk zkls qxml tjbngs dhj gchmxm msrbcfk qxhm dvhhjp mlqnfs vkzxrm xslr djmg fvjqkh rvhkkp hgggjq sjrzdg nsxs hgdxfc tcq xfp fjmm zmq bbsqm hjp ggfrz vkqxgr zfvq qkdmtk fpffx clnr kslv fvnkvt lfcppl zrlv bcrp mxdd slg pzqbcnq qjltjd nfl jgldk vjpcnl pntfmz qnb jrgxc gsxnqd xkltn jrhvk jcx (contains peanuts, eggs)'),
('rfpbpn szlhpq bbsqm jvmx zfqnj pntfmz msrbcfk sxvkrs vkqxgr jrhvk phdv lpfzsbd prng hkvs djkb zkls fdqzvn hk lfcppl jkcgcl tpxph pnn fpgk tcnqs pzxfq mtvp fjrk hsr rvhkkp bcrp bzlfvx njjgv lkv qkdmtk xslr dglk gchmxm kcvhh szskn qjltjd rznx lfqq tjbngs zcfbq cxfgnn spgkts fhqvnvf vhl zrlv qnb (contains soy)'),
('lkv ljfv mbvt lvrrr msrbcfk djlht bkdh nsxs mld ccc xttp hgdxfc jrhvk qkdmtk jhsrjlj xql zzdckn cppf vkzxrm xslr dzgdrl nvmppng hrkhfl qxhm nfl bttss lfcppl pnn scbl zqmmqd xfp tjbngs svmvp pzxfq skzb qnnhpv rznx nkgzr zkls sllrrh ppxbh bbsqm jkcgcl ckpnbz mxdd nsssf jgldk glmb fhqvnvf qjltjd djkb bzlfvx bqzd fb zfqnj mlqnfs ndpnq fdxdp qhqml lppxvs djmg jsdkg (contains nuts, soy)'),
('znhd msxhsxl scqslq txvx qkdmtk bxcjrdr xkltn xfp xqnktk lfcppl hgdxfc nfl vkqxgr mxdd nvmppng fpgk gkfxt kslv ckpnbz ztjqt rfpbpn gsxnqd djkb msrbcfk lppxvs ggfrz xql fpffx slg mlqnfs dckkr pzqbcnq gchmxm rvhkkp cfkjjc jhsrjlj bqzd lkv szskn lcfxzll jmbj xtsbkgf ffdnx zmrl ccc qdnfxx zvkll ndpnq jrhvk bmmdth ffj pcfxgn vdccvnn fvnkvt sxvkrs gjz zkls hxbzr qhdq qjltjd rrbvcs (contains wheat, shellfish, peanuts)'),
('mxdd xghl sxvkrs ppxbh qftqv rjfjcb dzgdrl spgkts kddsgbr pntfmz vkqxgr qhqml mtvp nsxs jhsrjlj zvrdpk fljmthl tcq rkgrl hjp lpfzsbd gkfxt jrhvk xslr vhl bbsqm hgggjq fhqvnvf nfgs lkv jhpvdp nsssf kltxdk qhdq zkls hsr qjltjd xjsp lbdkmc pnn njjgv skzb zlxrx pzqbcnq fdqzvn kcvhh vkzxrm fvnkvt gcls fpgk trsd ckpnbz hrkhfl xql gsxnqd ljfv tpxph qxhm lfcppl bpfk fdxdp ztjqt dvhhjp zmnvg (contains eggs, shellfish, sesame)'),
('kltxdk sjrzdg prng hrkhfl hslbs jhsrjlj qnb clnr pzxfq rrnmhx xkltn qftqv bcrp xqnktk qxhm tzhmt scqg zkls tjvs njjgv rfpbpn gchmxm lvrrr qhdq glmb sxvkrs mxdd lppxvs fdqzvn jrhvk bmmdth xslr phdv tjbngs gsxnqd lbdkmc shlzrzq zfvq lfqq phhrpt lcfxzll ffj nsssf zrkhvq fb vkqxgr skzb jlpz bxcjrdr qkdmtk zmrl vsj svmvp qjltjd zcfbq gjz vkzxrm ffdnx xtsbkgf bkdh krlgn pcfxgn qvbk bzlfvx rznx lfcppl rvhkkp msxhsxl djkb qxml dckkr szlhpq dxmnp kcvhh xql vjpcnl fdxdp svzk (contains shellfish, soy)'),
('vkqxgr tcq dvhhjp qvbk mbvt djlht zrlv qkdmtk szlhpq ztjqt vntsh xslr gkfxt hkvxh jzhql fvjqkh nkgzr clnr ffj cfkjjc dxmnp rkqvz pcfxgn glmb phdv fhqvnvf zkls qnnhpv nfgs jrgxc fjrk zmq lfcppl vkzxrm djmg nfl gchmxm lkv qnb jhsrjlj ccc dhj jbcpqb xhxslhf rfpbpn nvmppng ppxbh slg xttp hjp pnn qjltjd bcrp rjfjcb bttss hrkhfl sjrzdg ljfv (contains sesame)'),
('svmvp bbsqm jgldk nhq xql nvmppng fdqzvn znhd bhdtrkds fdxdp lkv zmnvg tpxph jkcgcl hkvxh dckkr dxmnp gchmxm xqnktk qnnhpv vntsh jzhql jhpvdp skzb gsxnqd cdfmd bqzd krlgn phhrpt vkzxrm nfl xfp rfpbpn hslbs sjrzdg fvnkvt mld vkqxgr zmrl vkbfhpq hjp qjltjd xslr qxhm kcvhh xhxslhf xghl jrhvk zzdckn clnr nfgs szskn xtsbkgf dvhhjp lppxvs bttss hrkhfl hgtkgd hgggjq rkgrl lfcppl zqmmqd kddsgbr jvmx cppf bttsc zlxrx prng msxhsxl qftqv scbl zfqnj spgkts zkls (contains shellfish)'),
('mxdd ccc qkdmtk vkzxrm msrbcfk ggfrz zkls qjltjd qhdq cppf djmg bkdh hkvxh mtvp fjmm qdnfxx jhpvdp nfgs xjsp fpffx jhsrjlj ndpnq rvhkkp gsxnqd shlzrzq vhl kcvhh hxbzr rkgrl fb phdv krlgn jrhvk hsr zzdckn tjvs ffdnx zfvq xslr szskn dvhhjp lcfxzll lkv dxmnp hgtkgd rfpbpn jmbj qhqml sllrrh zcfbq nsxs smvhmh tfrnr pnn (contains dairy)'),
('vhl qnb lfcppl rrnmhx rbvqg txvx svmvp kddsgbr lpfzsbd xfp lkv cdfmd hkvxh nkgzr rrbvcs jrhvk zvrdpk nsxs znhd lfqq hvcnl bqzd slg qkdmtk pntfmz jlpz zrkhvq vkzxrm zmq xhxslhf jkcgcl dxmnp jgldk bbsqm svzk hgtkgd jrgxc nhq phdv fvnkvt hkvs zzdckn zrlv djlht kltxdk xgfqd ljfv xslr qnnhpv mlqnfs prng zqmmqd zfqnj nfgs jbcpqb gjz scqg zlxrx hsr fljmthl rfpbpn xttp qjltjd sxvkrs rkgrl djmg bttsc lrfmpx zbcln qxhm lzlds jhsrjlj (contains shellfish)'),
('glmb kcvhh zfvq djlht xql tjbngs jrhvk jsdkg scqg slg lfcppl dglk xslr zcfbq rfpbpn fdqzvn rjfjcb qnnhpv skzb krlgn djkb bttss bqzd ggfrz lbdkmc ccc jhpvdp cfkjjc zmq mld fvnkvt xgfqd hsr hkvs svmvp gchmxm zfqnj dhj hslbs vkbfhpq djmg zkls zmnvg fdxdp nkgzr gsxnqd pntfmz jhsrjlj hxbzr fvjqkh dckkr ztjqt fljmthl cppf dvhhjp rtdzk jbcpqb lkv zmrl tcq (contains eggs)'),
('lfcppl xqnktk pntfmz rkgrl jlpz rfpbpn xkltn bxcjrdr jrgxc dzgdrl phhrpt phdv jvmx xslr ffj kltxdk vsj nsxs bqzd zcfbq ccc sxvkrs vkzxrm kcvhh qkdmtk glmb jrhvk mbvt zkls qhqml lkv nfl jmbj msrbcfk nfgs zfvq xhxslhf qjltjd qnnhpv smvhmh tcq bffqk txvx zrlv xgfqd zvrdpk lcfxzll qftqv vhl znhd fljmthl cfkjjc gcls qxml qvbk hjp hkvxh (contains eggs, soy, dairy)'),
('xkltn vkbfhpq bmmdth fb tcq bttsc svzk lppxvs cppf phhrpt ffj dxmnp ffdnx hgtkgd hkvs cdfmd ndpnq lcfxzll rrnmhx qnb fvnkvt bxcjrdr qhdq pcfxgn fdqzvn jgldk zmq ccc jhpvdp bffqk jrhvk lrfmpx jmbj tpxph qjltjd vdccvnn hvcnl bbsqm lkv hkvxh jcx nhq ckrhr hjp rvhkkp cfkjjc lfcppl dhj rtdzk scqslq xgfqd qxhm ggfrz zfqnj jzhql rfpbpn nsssf zmrl sjrzdg nsxs nfl djmg gkfxt zkls pntfmz zbcln mlqnfs phdv qvbk gjz xslr zfvq dglk ljfv hrkhfl bkdh vgmmcg fhqvnvf txvx tcnqs zchp nvmppng vhl rkgrl rznx (contains eggs)'),
('fvjqkh qhdq lppxvs zlxrx phdv jrgxc msrbcfk fvnkvt xttp lkv zmnvg pzxfq sxvkrs lcfxzll lcp fjrk xkltn tjvs qhqml phhrpt pntfmz nsxs clnr jbcpqb zvkll ckrhr glmb lbdkmc jmbj zmq jrhvk xghl hkvs tcq gjz lvrrr znhd mbvt fdxdp lfcppl rznx lrfmpx nhq jzhql vntsh ppxbh cxfgnn hvcnl xslr ggfrz jhsrjlj rkqvz cfkjjc jkcgcl xql vkqxgr fb sllrrh jcx bffqk kcvhh nvmppng hrkhfl qjltjd sjrzdg pcfxgn shlzrzq pzqbcnq zkls djlht dzgdrl fhqvnvf slg hxbzr vgmmcg vsj tcnqs (contains soy)'),
('lkv jgldk fdxdp bmmdth fljmthl qjltjd gkfxt vhl zzdckn zmrl lcfxzll dglk zchp jzhql rrnmhx vkzxrm rfpbpn zkls nsxs pcfxgn nhq rznx glmb fpffx zvkll mlqnfs zvrdpk xtsbkgf lppxvs jlpz qkdmtk hk nfgs ggfrz dhj pzqbcnq xslr pnn bcrp krlgn skzb vdccvnn jkcgcl vjpcnl jrhvk ckrhr fhqvnvf rrbvcs lvrrr tfrnr fvjqkh mtvp nkgzr njjgv pntfmz xttp xjsp lfcppl bpfk (contains soy, eggs, sesame)'),
('ggfrz vhl lppxvs ckpnbz scqg mtvp jhpvdp qkdmtk zmq lbdkmc vntsh kcvhh bcrp ffdnx qnnhpv xghl dhj jvmx sllrrh qdnfxx shlzrzq qvbk glmb scqslq rrnmhx hgtkgd kddsgbr zkls lfcppl hxbzr qxml kslv dvhhjp rznx hgdxfc fb dckkr bzlfvx fjmm xslr rfpbpn qhqml nhq jrhvk qjltjd xgfqd prng zqmmqd lkv (contains soy)'),
('fpffx clnr jbcpqb ggfrz jrhvk pntfmz hk cfkjjc lbdkmc bkdh spgkts hvcnl fb qftqv szskn bzlfvx bffqk jzhql gkfxt djkb cdfmd sxvkrs svzk jsdkg tjbngs gsxnqd kcvhh qxhm rrnmhx szlhpq zvkll qxml trsd qjltjd bxcjrdr txvx hgggjq djlht zfqnj bqzd jkcgcl phhrpt qdnfxx skzb phdv lkv slg nhq jhsrjlj fhqvnvf fljmthl tfrnr dglk rvhkkp gjz scqslq lfcppl xttp tzhmt gchmxm zkls tcq jlpz bhdtrkds nsxs zmnvg smvhmh xslr lrfmpx hgtkgd vkbfhpq lcfxzll vjpcnl rkgrl hxbzr tpxph zcfbq zqmmqd pnn xql hslbs (contains nuts, soy)'),
('bqzd lrfmpx cfkjjc hkvs mld dhj jlpz tpxph lkv nsxs tcnqs rbvqg nkgzr vdccvnn jhsrjlj ffdnx qvzl vntsh kcvhh jhpvdp gcls dckkr xslr sxvkrs zfqnj djlht jrhvk ggfrz trsd zkls szlhpq qnnhpv vkzxrm lpfzsbd scqg tjbngs ztjqt rfpbpn phhrpt lbdkmc fjmm bkdh zzdckn nhq ffj qhqml hjp hkvxh bttsc gsxnqd jmbj zvrdpk zrkhvq jzhql jsdkg xttp rtdzk qjltjd krlgn rrbvcs (contains soy)'),
('dzgdrl szskn bqzd fb fdqzvn djmg xgfqd hvcnl kddsgbr rfpbpn bttss zmq fjrk jrhvk scqslq lbdkmc rkqvz xghl pcfxgn txvx xqnktk zqmmqd msxhsxl ccc zlxrx trsd prng tzhmt qftqv pntfmz gsxnqd tjvs qnnhpv sxvkrs lkv xhxslhf rkgrl ljfv phhrpt rbvqg hxbzr kltxdk bzlfvx hsr qkdmtk nsssf bttsc mlqnfs vdccvnn rjfjcb lfcppl qxhm hkvs zkls qjltjd svmvp ckpnbz krlgn rznx szlhpq lvrrr clnr hk fhqvnvf hgtkgd fpgk zbcln ckrhr jsdkg lzlds zchp jhpvdp xslr ndpnq (contains shellfish)'),
('djlht lfqq nhq nsxs jvmx rkqvz fpffx smvhmh lfcppl qdnfxx fvnkvt pntfmz rfpbpn zfqnj tpxph lpfzsbd hsr sllrrh fpgk dxmnp nvmppng jhsrjlj qnnhpv zrlv vkqxgr ffdnx qxml dzgdrl rrnmhx nsssf hgtkgd bffqk lkv trsd zbcln zkls hvcnl dvhhjp xslr jmbj ndpnq nfgs zfvq zrkhvq zzdckn fvjqkh fdqzvn rvhkkp pzqbcnq qvzl ppxbh prng fb cfkjjc zchp bqzd fjrk kslv xhxslhf xfp bkdh jrhvk qnb hgdxfc zlxrx lbdkmc gsxnqd (contains eggs, peanuts, nuts)'),
('qvzl lkv bcrp znhd qkdmtk lvrrr vhl bbsqm fvjqkh zkls ccc xfp shlzrzq pzqbcnq ffdnx xjsp nfgs ckpnbz bttss sllrrh cdfmd zchp fdqzvn jrhvk svzk bmmdth qxml zfqnj vntsh xslr fb qjltjd fljmthl jgldk gjz jlpz spgkts dzgdrl prng slg mlqnfs qhqml jzhql hk jhsrjlj zmq hsr scqslq rfpbpn fhqvnvf xtsbkgf lfqq rjfjcb zlxrx (contains dairy)');

WITH AllergensText_CTE AS
(
	SELECT		InputRowId,
				SUBSTRING(AllergyText, CHARINDEX('(', AllergyText), 10000) As AllergenText
	FROM		#Input
),
AllergensList_CTE AS
(
	SELECT		InputRowId,
				LTRIM(RTRIM(value)) AS Allergen
	FROM		AllergensText_CTE
	CROSS APPLY	STRING_SPLIT(SUBSTRING(AllergenText, 10, LEN(AllergenText) - 10), ',')
),
Ingredients_CTE AS
(
	SELECT		InputRowId,
				value as Ingredient
	FROM		#Input
	CROSS APPLY	STRING_SPLIT(SUBSTRING(AllergyText, 0, CHARINDEX('(', AllergyText) -1), ' ')
),
DistinctIngredients_CTE AS
(
	SELECT		DISTINCT Ingredient
	FROM		Ingredients_CTE
),
PossibleAllergenCounts_CTE AS
(
	SELECT			Allergen,
					Ingredient,
					COUNT(*) AS TotalCount
	FROM			AllergensList_CTE AL
	INNER JOIN		Ingredients_CTE I ON AL.InputRowId = I.InputRowId
	GROUP BY		Allergen, Ingredient
),
PossibleAllergens_CTE AS
(
	SELECT		Ingredient,
				Allergen
	FROM		PossibleAllergenCounts_CTE PA
	WHERE		TotalCount = (
			SELECT		COUNT(*)
			FROM		AllergensList_CTE AL
			WHERE		AL.Allergen = PA.Allergen
	)
)
SELECT		*
INTO		#PossibleAllergens
FROM		PossibleAllergens_CTE

CREATE TABLE #ConfirmedAllergens
(
	Allergen nvarchar(max),
	Ingredient nvarchar(max)
);

WHILE (SELECT COUNT(*) FROM #PossibleAllergens) > 0
BEGIN
	WITH Count_CTE AS
	(
		SELECT		Allergen,
					COUNT(*) AS C
		FROM		#PossibleAllergens
		GROUP BY	Allergen
	)
	INSERT INTO		#ConfirmedAllergens
	SELECT			C.Allergen,
					Ingredient
	FROM			Count_CTE C
	INNER JOIN		#PossibleAllergens PA ON C.Allergen = PA.Allergen
	WHERE			C.C = 1

	DELETE FROM		#PossibleAllergens
	WHERE			Allergen IN
	(
			SELECT		Allergen
			FROM		#ConfirmedAllergens
	)

	DELETE FROM		#PossibleAllergens
	WHERE			Ingredient IN
	(
			SELECT		Ingredient
			FROM		#ConfirmedAllergens
	)

END

SELECT		STRING_AGG(Ingredient, ',') WITHIN GROUP (ORDER BY Allergen)
FROM		#ConfirmedAllergens