// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Blockchain-Powered Medical Trial Registry
 * @dev A simple smart contract to register medical trials, update their status,
 *      and fetch trial information publicly.
 */
contract Project {

    struct Trial {
        string title;
        string description;
        string phase;
        string status;
        address registeredBy;
        uint256 timestamp;
    }

    mapping(uint256 => Trial) public trials;
    uint256 public trialCount;

    event TrialRegistered(uint256 indexed trialId, string title, address indexed registeredBy);
    event TrialStatusUpdated(uint256 indexed trialId, string newStatus);

    /**
     * @dev Register a new medical trial.
     * @param _title Title of the trial.
     * @param _description Short description of the trial.
     * @param _phase Clinical phase (Phase I, II, III, etc.).
     */
    function registerTrial(
        string memory _title,
        string memory _description,
        string memory _phase
    ) public {
        trials[trialCount] = Trial({
            title: _title,
            description: _description,
            phase: _phase,
            status: "Registered",
            registeredBy: msg.sender,
            timestamp: block.timestamp
        });

        emit TrialRegistered(trialCount, _title, msg.sender);
        trialCount++;
    }

    /**
     * @dev Update the status of an existing trial.
     * @param _trialId Trial identifier.
     * @param _newStatus New status string.
     */
}
