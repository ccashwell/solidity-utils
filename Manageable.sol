pragma solidity ^0.4.19;

/**
 * @title Manageable
 */
contract Manageable {
  address public owner;
  address public manager;

  event OwnershipChanged(address indexed previousOwner, address indexed newOwner);
  event ManagementChanged(address indexed previousManager, address indexed newManager);

  /**
   * @dev The Manageable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  function Manageable() public {
    owner = msg.sender;
    manager = msg.sender;
  }

  /**
   * @dev Throws if called by any account other than the owner or manager.
   */
  modifier requiresAuthorization() {
    require(msg.sender == owner || msg.sender == manager);
    _;
  }

  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
  function transferOwnership(address newOwner) public requiresAuthorization {
    require(newOwner != address(0));
    OwnershipChanged(owner, newOwner);
    owner = newOwner;
  }

  /**
   * @dev Allows the current owner to replace the manager with newManager
   * @param newManager The address to give contract management rights.
   */
  function replaceManager(address newManager) public requiresAuthorization {
    require(newManager != address(0));
    ManagementChanged(manager, newManager);
    manager = newManager;
  }
}
