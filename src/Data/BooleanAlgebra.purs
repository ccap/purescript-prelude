module Data.BooleanAlgebra
  ( class BooleanAlgebra
  , module Data.HeytingAlgebra
  ) where

import Data.HeytingAlgebra (class HeytingAlgebra, class HeytingAlgebraRecord, ff, tt, implies, conj, disj, not, (&&), (||))
import Data.Unit (Unit)
import Prim.RowList as RL

-- | The `BooleanAlgebra` type class represents types that behave like boolean
-- | values.
-- |
-- | Instances should satisfy the following laws in addition to the
-- | `HeytingAlgebra` law:
-- |
-- | - Excluded middle:
-- |   - `a || not a = tt`
class HeytingAlgebra a <= BooleanAlgebra a

instance booleanAlgebraBoolean :: BooleanAlgebra Boolean
instance booleanAlgebraUnit :: BooleanAlgebra Unit
instance booleanAlgebraFn :: BooleanAlgebra b => BooleanAlgebra (a -> b)

instance booleanAlgebraRecord
  :: ( RL.RowToList row list
     , HeytingAlgebraRecord list row row focus
     )
  => BooleanAlgebra (Record row)
