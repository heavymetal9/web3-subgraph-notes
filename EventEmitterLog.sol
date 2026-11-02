// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract EventEmitterLog {
    uint256 public indexedCursor;
    bytes32 public lastPayloadHash;

    event SubgraphCheckpoint(uint256 indexed cursor, bytes32 payloadHash, uint256 blockNum);

    function emitIndexerCheckpoint(uint256 _blockSpan) external {
        indexedCursor += 1;
        lastPayloadHash = keccak256(abi.encodePacked(indexedCursor, _blockSpan, msg.sender));
        emit SubgraphCheckpoint(indexedCursor, lastPayloadHash, block.number);
    }
}
