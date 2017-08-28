--# -path=.:../abstract

concrete ExtensionsEst of Extensions = 
  CatEst ** open MorphoEst, ResEst, ParadigmsEst, SyntaxEst, (G = GrammarEst), (E = ExtraEst), Prelude in {

flags coding = utf8 ;

lincat
  VPI = E.VPI ;
  ListVPI = E.ListVPI ;
  VPS = E.VPS ;
  ListVPS = E.ListVPS ;
  
lin
  MkVPI = E.MkVPI ;
  ConjVPI = E.ConjVPI ;
  ComplVPIVV = E.ComplVPIVV ;

  MkVPS = E.MkVPS ;
  ConjVPS = E.ConjVPS ;
  PredVPS = E.PredVPS ;

  BaseVPI = E.BaseVPI ;
  ConsVPI = E.ConsVPI ;
  BaseVPS = E.BaseVPS ;
  ConsVPS = E.ConsVPS ;

  GenNP = E.GenNP ;
  GenIP = E.GenIP ;
  GenRP = E.GenRP ;

  PassVPSlash = E.PassVPSlash ;

{- ---- rest TODO

  PassAgentVPSlash = E.PassAgentVPSlash ;

----  EmptyRelSlash = E.EmptyRelSlash ;

lin
    ComplVV v ant pol vp = 
      insertObj 
        (\\_,b,a => infVPGen pol.p v.sc b a vp (vvtype2infform v.vi)) 
        (predSV {s = v.s ; 
                sc = case vp.s.sc of {
                  NCNom => v.sc ;   -- minun täytyy pestä auto
                  c => c                 -- minulla täytyy olla auto
                  } ;
                h = v.h ; p = v.p
               }
         ) ;
-}

  CompoundN noun cn = lin N {
    s = \\nf => noun.s ! NCase Sg Gen ++ BIND ++ cn.s ! nf ---- AR genitive best?
    } ;

{-
  CompoundAP  noun adj = {
    s = \\_ => (snoun2nounSep {s = \\f => noun.s ! 10 ++ BIND ++ adj.s ! Posit ! sAN f ; h = adj.h}).s
    } ;

  PresPartAP vp = { ---- many things can go wrong here...
    s = \\bool,nform => 
         vp.s2 ! True ! Pos ! agrP3 Sg ++ vp.adv ! Pos ++ vp.ext ++ 
         (sverb2verbSep vp.s).s ! PresPartAct (AN nform)
    } ;

  PredVPosv np vp = mkCl np vp ; ----

  -- Ant -> Pol -> VPSlash -> RS ; --- here replaced by a relative clause 
  PastPartRS ant pol vps = mkRS ant pol (mkRCl which_RP (E.PassVPSlash (lin VPSlash vps))) ;

  ApposNP np1 np2 = {
      s = \\c => np1.s ! c ++ "," ++ np2.s ! c ;
      a = np1.a ;
      isPron = np1.isPron ; isNeg = np1.isNeg
      } ;

  GerundNP vp = {         
    s = \\c => vp.s2 ! True ! Pos ! agrP3 Sg ++ (mkNP the_Det (lin N (sverb2snoun vp.s))).s ! c ++ vp.adv ! Pos ++ vp.ext ; 
    a = agrP3 Sg ;
    isPron = False ; isNeg = False
    } ;
-- sen sanominen suoraan että... 
---- se --> sen
---- lost agreement, lost genitive, lost possessive
---- minun saamiseni mukaan


  -- : VP -> Adv ;   
  GerundAP vp = {s = \\f => vp.s2 ! True ! Pos ! agrP3 Sg ++ (snoun2nounSep (sverb2nounPresPartAct vp.s)).s ! f ++ vp.adv ! Pos ++ vp.ext} ;
-}
  GerundAdv vp = 
    { s = vp2adv vp True (VIInf InfDes) } ; 

  WithoutVP vp = -- ilma raamatut nägemata
    { s = "ilma" ++ vp2adv vp False (VIInf InfMata) } ;

  InOrderToVP vp = -- et raamatut paremini näha
    { s = "et" ++ vp2adv vp True (VIInf InfDa) } ;
 
  ByVP vp = 
    { s = vp2adv vp True (VIInf InfDes) } ; 

-- täna leitud
  PastPartAP vp = 
    { s = \\_,_ => vp2adv vp True (VIPass Past) ;
      infl = Invariable } ;

oper 
  vp2adv : VP -> Bool -> VIForm -> Str = \vp,b,vif ->
    vp.s2 ! b! Pos ! agrP3 Sg     -- raamatut
    ++ vp.adv                     -- paremini
    ++ vp.p                       -- ära 
    ++ (vp.s ! vif ! Simul ! Pos ! agrP3 Sg).fin -- tunda/tundes/tundmata/...
    ++ vp.ext ;
{-
-- miehen tänään löytämä
  PastPartAgentAP vp np = 
    {s = \\_,f => np.s ! NPCase Gen ++ vp.s2 ! True ! Pos ! agrP3 Sg ++ vp.adv ! Pos ++ (sverb2verbSep vp.s).s ! AgentPart (AN f) ++ vp.ext} ;


  OrdCompar a = snoun2nounSep {s = \\nc => a.s ! Compar ! SAN nc ; h = a.h} ; 

  PositAdVAdj a = {s = a.s ! Posit ! SAAdv} ;  -- A -> AdV really

  UseQuantPN quant pn = {
      s = \\c => let k = (npform2case Sg c) in
                 quant.s1 ! Sg ! k ++ snoun2np Sg pn ! c ++ quant.s2 ! pn.h ; 
      a = agrP3 Sg ;
      isPron = False ; 
      isNeg = quant.isNeg
      } ;

  SlashV2V v ant p vp = 
      insertObj (\\_,b,a => infVP v.sc b a vp (vvtype2infform v.vi)) (predSV v) ** {c2 = v.c2} ; ----
      ---- insertObj (\\_,b,a => infVPGen p.p v.sc b a vp v.vi) (predSV v) ** {c2 = v.c2} ;

  CompS s = {s = \\_ => "että" ++ s.s} ;  -- S -> Comp            ---- what are these expected to do ? 29/3/2013
  CompVP ant pol vp = {s = \\a => infVPGen pol.p vp.s.sc Pos a vp Inf1} ; -- VP -> Comp


  that_RP = which_RP ;
  no_RP = which_RP ;

  UttAdV a = a ;

  UncNeg = negativePol ;

  PresPartRS ant pol vp = mkRS ant pol (mkRCl which_RP vp) ;  ---- present participle attr "teräviä ottava"

     PredVPosv np vp = mkCl np vp ; ---- OSV yes, but not for Cl
     PredVPovs np vp = mkCl np vp ; ---- SVO

   EmptyRelSlash cls = mkRCl which_RP cls ;

  CompQS qs = {s = \\_ => qs.s} ;


  AdAdV ada adv = {s = ada.s ++ adv.s} ;

   SlashVPIV2V v pol vpi = -- : V2V -> Pol -> VPI -> VPSlash ;
      insertObj (\\_,b,a => vpi.s ! v.vi) (predSV v) ** {c2 = v.c2} ;

   VPSlashVS v vp = -- : VS -> VP -> VPSlash ; -- hän sanoo (minun) menevän (!) ---- menneen ?
      insertObj (\\_,b,a => infVP v.sc b a vp InfPresPart) (predSV v) ** 
                   {c2 = mkPrep []} ;
     
--   SlashSlashV2V v ant pol vps = -- : V2V -> Ant -> Pol -> VPSlash -> VPSlash ; --- not implemented in Eng so far
--      insertObj (\\_,b,a => infVPGen pol.p v.sc b a vps v.vi) (predSV v) ** {c2 = v.c2} ; --- or vps.c2 ??

--in Verb,   SlashV2VNP : V2V -> NP -> VPSlash -> VPSlash

  DirectComplVS t np vs utt = 
    mkS (lin Adv (optCommaSS utt)) (mkS t positivePol (mkCl np (lin V vs))) ;

  DirectComplVQ t np vs q = 
    mkS (lin Adv (optCommaSS (mkUtt q))) (mkS t positivePol (mkCl np (lin V vs))) ;

  FocusObjS np sslash = 
    mkS (lin Adv (optCommaSS (ss (appCompl True Pos sslash.c2 np)))) <lin S sslash : S> ; ---- Pos could be Neg: häntä minä en tunne
-}

}
