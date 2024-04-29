A `Registry` has many `Transactions`. A `Transaction` is a legal event which impacts one or multiple `Properties` of a `Record`. `Transaction` is the level at which business metadata should be added (who?, why?, when?,...).

A `Transaction` encapsulates one or multiple `Statements`. `Statements` either assert a discrete fact concerning a `Record` (`Assertion`) or retract an existing `Assertion` that is no longer valid (`Retraction`). A `Statement` takes the form of a entity-attribute-value triplet. A `Statement` holds a single `Value` and is confined to a single `Property`.

The registry operates on an append-only basis. Updates to properties are executed through a two-step process: first, the assertion under update is marked as retracted; second, a new assertion is appended. A retraction operation follows the same process, but a new assertion is not provided.
