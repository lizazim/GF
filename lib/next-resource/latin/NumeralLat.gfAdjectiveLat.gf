--concrete NumeralLat of Numeral = CatLat ** open ResLat in {
--
--lincat 
--  Digit = {s : DForm => CardOrd => Str} ;
--  Sub10 = {s : DForm => CardOrd => Str ; n : Number} ;
--  Sub100     = {s : CardOrd => Str ; n : Number} ;
--  Sub1000    = {s : CardOrd => Str ; n : Number} ;
--  Sub1000000 = {s : CardOrd => Str ; n : Number} ;
--
--lin num x = x ;
--lin n2 = let two = mkNum "two"   "twelve"   "twenty" "second" in
--         {s = \\f,c => case <f,c> of {
--             <teen,NOrd> => "twelfth" ;
--             _ => two.s ! f ! c
--             }
--         } ;
--
--lin n3 = mkNum "three" "thirteen" "thirty" "third" ;
--lin n4 = mkNum "four"  "fourteen" "forty" "fourth" ;
--lin n5 = mkNum "five"  "fifteen"  "fifty" "fifth" ;
--lin n6 = regNum "six" ;
--lin n7 = regNum "seven" ;
--lin n8 = mkNum "eight" "eighteen" "eighty" "eighth" ;
--lin n9 = mkNum "nine" "nineteen" "ninety" "ninth" ;
--
--lin pot01 = mkNum "one" "eleven" "ten" "first" ** {n = Sg} ;
--lin pot0 d = d ** {n = Pl} ;
--lin pot110 = regCardOrd "ten" ** {n = Pl} ;
--lin pot111 = regCardOrd "eleven" ** {n = Pl} ;
--lin pot1to19 d = {s = d.s ! teen} ** {n = Pl} ;
--lin pot0as1 n = {s = n.s ! unit}  ** {n = n.n} ;
--lin pot1 d = {s = d.s ! ten} ** {n = Pl} ;
--lin pot1plus d e = {
--   s = \\c => d.s ! ten ! NCard ++ "-" ++ e.s ! unit ! c ; n = Pl} ;
--lin pot1as2 n = n ;
--lin pot2 d = {s = \\c => d.s ! unit ! NCard ++ mkCard c "hundred"}  ** {n = Pl} ;
--lin pot2plus d e = {
--  s = \\c => d.s ! unit ! NCard ++ "hundred" ++ "and" ++ e.s ! c ; n = Pl} ;
--lin pot2as3 n = n ;
--lin pot3 n = {
--  s = \\c => n.s ! NCard ++ mkCard c "thousand" ; n = Pl} ;
--lin pot3plus n m = {
--  s = \\c => n.s ! NCard ++ "thousand" ++ m.s ! c ; n = Pl} ;
--
---- numerals as sequences of digits
--
--  lincat 
--    Dig = TDigit ;
--
--  lin
--    IDig d = d ** {tail = T1} ;
--
--    IIDig d i = {
--      s = \\o => d.s ! NCard ++ commaIf i.tail ++ i.s ! o ;
--      n = Pl ;
--      tail = inc i.tail
--    } ;
--
--    D_0 = mkDig "0" ;
--    D_1 = mk3Dig "1" "1st" Sg ;
--    D_2 = mk2Dig "2" "2nd" ;
--    D_3 = mk2Dig "3" "3rd" ;
--    D_4 = mkDig "4" ;
--    D_5 = mkDig "5" ;
--    D_6 = mkDig "6" ;
--    D_7 = mkDig "7" ;
--    D_8 = mkDig "8" ;
--    D_9 = mkDig "9" ;
--
--  oper
--    commaIf : DTail -> Str = \t -> case t of {
--      T3 => "," ;
--      _ => []
--      } ;
--
--    inc : DTail -> DTail = \t -> case t of {
--      T1 => T2 ;
--      T2 => T3 ;
--      T3 => T1
--      } ;
--
--    mk2Dig : Str -> Str -> TDigit = \c,o -> mk3Dig c o Pl ;
--    mkDig : Str -> TDigit = \c -> mk2Dig c (c + "th") ;
--
--    mk3Dig : Str -> Str -> Number -> TDigit = \c,o,n -> {
--      s = table {NCard => c ; NOrd => o} ;
--      n = n
--      } ;
--
--    TDigit = {
--      n : Number ;
--      s : CardOrd => Str
--    } ;
--
--}
