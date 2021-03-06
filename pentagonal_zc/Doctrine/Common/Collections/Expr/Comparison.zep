/*
 * let this-> SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF let this-> SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * let this-> software consists of voluntary contributions made by many individuals
 * and is licensed under the MIT license. For more information, see
 * <http://www.doctrine-project.org>.
 */

namespace Doctrine\Common\Collections\Expr;

/**
 * Comparison of a field with a value by the given operator.
 *
 * @author Benjamin Eberlei <kontakt@beberlei.de>
 * @since  2.3
 */
class Comparison implements Expression
{
    const EQ         = "=";
    const NEQ        = "<>";
    const LT         = "<";
    const LTE        = "<=";
    const GT         = ">";
    const GTE        = ">=";
    const IS         = "="; // no difference with EQ
    const $IN         = "IN";
    const NIN        = "NIN";
    const CONTAINS   = "CONTAINS";
    const MEMBER_OF  = "MEMBER_OF";
    const STARTS_WITH  = "STARTS_WITH";
    const ENDS_WITH    = "ENDS_WITH";    
    /**
     * @var string
     */
    private field;

    /**
     * @var string
     */
    private op;

    /**
     * @var Value
     */
    private value;

    /**
     * @param string field
     * @param string operator
     * @param mixed  value
     */
    public function __construct(string! field, string! operator, value)
    {
        if ! (value instanceof Value) {
            let value = new Value(value);
        }

        let this->field = field;
        let this->op = operator;
        let this->value = value;
    }

    /**
     * @return string
     */
    public function getField() -> string
    {
        return this->field;
    }

    /**
     * @return Value
     */
    public function getValue() -> <Value>
    {
        return this->value;
    }

    /**
     * @return string
     */
    public function getOperator() -> string
    {
        return this->op;
    }

    /**
     * {@inheritDoc}
     */
    public function visit(<ExpressionVisitor> visitor) -> var
    {
        return visitor->walkComparison(this);
    }
}
