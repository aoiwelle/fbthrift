{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-missing-fields #-}
{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-----------------------------------------------------------------
-- Autogenerated by Thrift
--                                                             --
-- DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
--  @generated
-----------------------------------------------------------------

module Module_Types where
import Prelude ( Bool(..), Enum, Float, IO, Double, String, Maybe(..),
                 Eq, Show, Ord,
                 concat, error, fromIntegral, fromEnum, length, map,
                 maybe, not, null, otherwise, return, show, toEnum,
                 enumFromTo, Bounded, minBound, maxBound, seq,
                 (.), (&&), (||), (==), (++), ($), (-), (>>=), (>>))

import Control.Applicative (ZipList(..), (<*>))
import Control.DeepSeq
import Control.Exception
import Control.Monad ( liftM, ap, when )
import Data.ByteString.Lazy (ByteString)
import Data.Functor ( (<$>) )
import Data.Hashable
import Data.Int
import Data.Maybe (catMaybes)
import Data.Text.Lazy.Encoding ( decodeUtf8, encodeUtf8 )
import qualified Data.Text.Lazy as LT
import Data.Typeable ( Typeable )
import qualified Data.HashMap.Strict as Map
import qualified Data.HashSet as Set
import qualified Data.Vector as Vector
import Test.QuickCheck.Arbitrary ( Arbitrary(..) )
import Test.QuickCheck ( elements )

import Thrift hiding (ProtocolExnType(..))
import qualified Thrift (ProtocolExnType(..))
import Thrift.Types
import Thrift.Arbitraries


data Foo = Foo
  { foo_MyInt :: Int64
  } deriving (Show,Eq,Typeable)
instance Hashable Foo where
  hashWithSalt salt record = salt   `hashWithSalt` foo_MyInt record  
instance NFData Foo where
  rnf record =
   rnf (foo_MyInt record) `seq`
   ()
instance Arbitrary Foo where 
  arbitrary = liftM Foo (arbitrary)
  shrink obj | obj == default_Foo = []
             | otherwise = catMaybes
    [ if obj == default_Foo{foo_MyInt = foo_MyInt obj} then Nothing else Just $ default_Foo{foo_MyInt = foo_MyInt obj}
    ]
from_Foo :: Foo -> ThriftVal
from_Foo record = TStruct $ Map.fromList $ catMaybes
  [ (\_v2 -> Just (1, ("MyInt",TI64 _v2))) $ foo_MyInt record
  ]
write_Foo :: (Protocol p, Transport t) => p t -> Foo -> IO ()
write_Foo oprot record = writeVal oprot $ from_Foo record
encode_Foo :: (Protocol p, Transport t) => p t -> Foo -> ByteString
encode_Foo oprot record = serializeVal oprot $ from_Foo record
to_Foo :: ThriftVal -> Foo
to_Foo (TStruct fields) = Foo{
  foo_MyInt = maybe (foo_MyInt default_Foo) (\(_,_val4) -> (case _val4 of {TI64 _val5 -> _val5; _ -> error "wrong type"})) (Map.lookup (1) fields)
  }
to_Foo _ = error "not a struct"
read_Foo :: (Transport t, Protocol p) => p t -> IO Foo
read_Foo iprot = to_Foo <$> readVal iprot (T_STRUCT typemap_Foo)
decode_Foo :: (Protocol p, Transport t) => p t -> ByteString -> Foo
decode_Foo iprot bs = to_Foo $ deserializeVal iprot (T_STRUCT typemap_Foo) bs
typemap_Foo :: TypeMap
typemap_Foo = Map.fromList [("MyInt",(1,T_I64))]
default_Foo :: Foo
default_Foo = Foo{
  foo_MyInt = 0}