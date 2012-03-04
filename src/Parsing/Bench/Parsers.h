-- CSV
import qualified Parsing.Bench.Attoparsec.CSV as APCV
import qualified Parsing.Bench.Parsec2.CSV as P2CV
import qualified Parsing.Bench.Parsec3.CSV as P3CV
import qualified Parsing.Bench.UU1.CSV as U1CV
import qualified Parsing.Bench.UU2.CSV as U2CV
import qualified Parsing.Bench.Polyparse.CSV as PPCV

-- Expr
import qualified Parsing.Bench.Attoparsec.Expr as APEX
import qualified Parsing.Bench.Parsec2.Expr as P2EX
import qualified Parsing.Bench.Parsec3.Expr as P3EX
import qualified Parsing.Bench.UU1.Expr as U1EX
import qualified Parsing.Bench.UU2.Expr as U2EX
import qualified Parsing.Bench.Polyparse.Expr as PPEX

-- URL
import qualified Parsing.Bench.Attoparsec.URL as APUR
import qualified Parsing.Bench.Parsec2.URL as P2UR
import qualified Parsing.Bench.Parsec3.URL as P3UR
import qualified Parsing.Bench.UU1.URL as U1UR
import qualified Parsing.Bench.UU2.URL as U2UR
import qualified Parsing.Bench.Polyparse.URL as PPUR

-- HTTP
import qualified Parsing.Bench.Attoparsec.HTTP as APHT
import qualified Parsing.Bench.Parsec2.HTTP as P2HT
import qualified Parsing.Bench.Parsec3.HTTP as P3HT
import qualified Parsing.Bench.UU1.HTTP as U1HT
import qualified Parsing.Bench.UU2.HTTP as U2HT
import qualified Parsing.Bench.Polyparse.HTTP as PPHT

-- JSON
import qualified Parsing.Bench.Attoparsec.JSON as APJS
import qualified Parsing.Bench.Parsec2.JSON as P2JS
import qualified Parsing.Bench.Parsec3.JSON as P3JS
import qualified Parsing.Bench.UU1.JSON as U1JS
import qualified Parsing.Bench.UU2.JSON as U2JS
import qualified Parsing.Bench.Polyparse.JSON as PPJS

-- CSS
import qualified Parsing.Bench.Attoparsec.CSS as APCS
import qualified Parsing.Bench.Parsec2.CSS as P2CS
import qualified Parsing.Bench.Parsec3.CSS as P3CS
import qualified Parsing.Bench.UU1.CSS as U1CS
import qualified Parsing.Bench.UU2.CSS as U2CS
import qualified Parsing.Bench.Polyparse.CSS as PPCS


import qualified Data.Text.IO as TIO
