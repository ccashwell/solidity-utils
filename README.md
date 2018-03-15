# Solidity Utilities

This is a small collection of helpers for building better Solidity contracts.

## Maths.sol

This is intended as an extension to `uint256`. To use it:

```
contract MyContract {
  using Maths for uint256;

  struct Thing {
    bytes32 name;
    uint256 price;
  }

  Thing[] public things;
  uint256 public totalSales;

  // constructor, etc...

  function buyThings(uint256 _thingId) payable public {
    require(_thingId.isLessThan(things.length));
    Thing storage thing = things[_thingId];

    require(msg.value.isAtLeast(thing.price));
    totalSales = totalSales.plus(msg.value);

    deliverThing(msg.sender);
  }
}
```
