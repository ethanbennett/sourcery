pragma solidity ^0.4.4;

contract PathsDB {
    struct Checkpoint {
        uint previous;
        uint next;
        address current;
    }
    
    uint size;
    uint head;
    uint tail;
    address product;
    mapping(uint => Checkpoint) checkpoints;
    
    function addCheckpoint(uint key, address current) returns (bool){
        Checkpoint checkpoint = checkpoints[key];
        
        if(checkpoint.current != 0x0){
            return false;
        }
        
        checkpoint.current = current;
        
        if (size==0) {
          head = key;
          tail = key;
        } else {
            checkpoints[tail].next = key;
            checkpoint.previous = tail;
            tail = key;
        }
        size++;
        return true;
    }
}