module Transfer.Syntax.Skel where

-- Haskell module generated by the BNF converter

import Transfer.Syntax.Abs
import Transfer.ErrM
type Result = Err String

failure :: Show a => a -> Result
failure x = Bad $ "Undefined case: " ++ show x

transTree :: Tree c -> Result
transTree t = case t of
  Module imports decls -> failure t
  Import i -> failure t
  DataDecl i exp consdecls -> failure t
  TypeDecl i exp -> failure t
  ValueDecl i patterns exp -> failure t
  DeriveDecl i0 i1 -> failure t
  ConsDecl i exp -> failure t
  POr pattern0 pattern1 -> failure t
  PConsTop i pattern patterns -> failure t
  PCons i patterns -> failure t
  PRec fieldpatterns -> failure t
  PType  -> failure t
  PStr str -> failure t
  PInt n -> failure t
  PVar i -> failure t
  PWild  -> failure t
  FieldPattern i pattern -> failure t
  ELet letdefs exp -> failure t
  ECase exp cases -> failure t
  EIf exp0 exp1 exp2 -> failure t
  EDo binds exp -> failure t
  EAbs varorwild exp -> failure t
  EPi varorwild exp0 exp1 -> failure t
  EPiNoVar exp0 exp1 -> failure t
  EBind exp0 exp1 -> failure t
  EBindC exp0 exp1 -> failure t
  EOr exp0 exp1 -> failure t
  EAnd exp0 exp1 -> failure t
  EEq exp0 exp1 -> failure t
  ENe exp0 exp1 -> failure t
  ELt exp0 exp1 -> failure t
  ELe exp0 exp1 -> failure t
  EGt exp0 exp1 -> failure t
  EGe exp0 exp1 -> failure t
  EListCons exp0 exp1 -> failure t
  EAdd exp0 exp1 -> failure t
  ESub exp0 exp1 -> failure t
  EMul exp0 exp1 -> failure t
  EDiv exp0 exp1 -> failure t
  EMod exp0 exp1 -> failure t
  ENeg exp -> failure t
  EApp exp0 exp1 -> failure t
  EProj exp i -> failure t
  ERecType fieldtypes -> failure t
  ERec fieldvalues -> failure t
  EList exps -> failure t
  EVar i -> failure t
  EType  -> failure t
  EStr str -> failure t
  EInt n -> failure t
  EMeta  -> failure t
  LetDef i exp0 exp1 -> failure t
  Case pattern exp -> failure t
  BindVar varorwild exp -> failure t
  BindNoVar exp -> failure t
  VVar i -> failure t
  VWild  -> failure t
  FieldType i exp -> failure t
  FieldValue i exp -> failure t
  Ident str -> failure t

transModule :: Module -> Result
transModule t = case t of
  Module imports decls -> failure t

transImport :: Import -> Result
transImport t = case t of
  Import i -> failure t

transDecl :: Decl -> Result
transDecl t = case t of
  DataDecl i exp consdecls -> failure t
  TypeDecl i exp -> failure t
  ValueDecl i patterns exp -> failure t
  DeriveDecl i0 i1 -> failure t

transConsDecl :: ConsDecl -> Result
transConsDecl t = case t of
  ConsDecl i exp -> failure t

transPattern :: Pattern -> Result
transPattern t = case t of
  POr pattern0 pattern1 -> failure t
  PConsTop i pattern patterns -> failure t
  PCons i patterns -> failure t
  PRec fieldpatterns -> failure t
  PType  -> failure t
  PStr str -> failure t
  PInt n -> failure t
  PVar i -> failure t
  PWild  -> failure t

transFieldPattern :: FieldPattern -> Result
transFieldPattern t = case t of
  FieldPattern i pattern -> failure t

transExp :: Exp -> Result
transExp t = case t of
  ELet letdefs exp -> failure t
  ECase exp cases -> failure t
  EIf exp0 exp1 exp2 -> failure t
  EDo binds exp -> failure t
  EAbs varorwild exp -> failure t
  EPi varorwild exp0 exp1 -> failure t
  EPiNoVar exp0 exp1 -> failure t
  EBind exp0 exp1 -> failure t
  EBindC exp0 exp1 -> failure t
  EOr exp0 exp1 -> failure t
  EAnd exp0 exp1 -> failure t
  EEq exp0 exp1 -> failure t
  ENe exp0 exp1 -> failure t
  ELt exp0 exp1 -> failure t
  ELe exp0 exp1 -> failure t
  EGt exp0 exp1 -> failure t
  EGe exp0 exp1 -> failure t
  EListCons exp0 exp1 -> failure t
  EAdd exp0 exp1 -> failure t
  ESub exp0 exp1 -> failure t
  EMul exp0 exp1 -> failure t
  EDiv exp0 exp1 -> failure t
  EMod exp0 exp1 -> failure t
  ENeg exp -> failure t
  EApp exp0 exp1 -> failure t
  EProj exp i -> failure t
  ERecType fieldtypes -> failure t
  ERec fieldvalues -> failure t
  EList exps -> failure t
  EVar i -> failure t
  EType  -> failure t
  EStr str -> failure t
  EInt n -> failure t
  EMeta  -> failure t

transLetDef :: LetDef -> Result
transLetDef t = case t of
  LetDef i exp0 exp1 -> failure t

transCase :: Case -> Result
transCase t = case t of
  Case pattern exp -> failure t

transBind :: Bind -> Result
transBind t = case t of
  BindVar varorwild exp -> failure t
  BindNoVar exp -> failure t

transVarOrWild :: VarOrWild -> Result
transVarOrWild t = case t of
  VVar i -> failure t
  VWild  -> failure t

transFieldType :: FieldType -> Result
transFieldType t = case t of
  FieldType i exp -> failure t

transFieldValue :: FieldValue -> Result
transFieldValue t = case t of
  FieldValue i exp -> failure t

transIdent :: Ident -> Result
transIdent t = case t of
  Ident str -> failure t

