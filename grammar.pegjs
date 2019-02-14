Expression
    = head:Term tail:(_ ('+' / '-') _ Term)* {
        return tail.reduce(function(result, item) {
            if (item[1] === '+') { return result + item[3] }
            if (item[1] === '-') { return result - item[3] }
        }, head)
    }

Term
    = head:Factor tail:(_ ('*' / '/') _ Factor)* {
        return tail.reduce(function(result, item) {
            if (item[1] === '*') { return result * item[3] }
            if (item[1] === '/') { return result / item[3] }
        }, head)
    }

Factor
    = '(' _ expr:Expression _ ')' { return expr }
    / Integer

Integer
    = _ [0-9]+ { return parseInt(text(), 10) }

_
    = [ \t\n\r]*
