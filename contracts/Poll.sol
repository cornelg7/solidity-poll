// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Poll {
  struct Answer {
    string text;
    uint votes;
  }
  struct Question {
    string text;
    Answer[2] answers;
  }
  Question question;
  // mapping(uint => Question) questions;
  // uint questionsLength;
  // uint activeQuestionIndex;

  constructor() {
    console.log("Hi from contract");
    // Initialize contract with default question
    question.text = "Cats or Dogs?";
    question.answers[0] = Answer("Cats", 2);
    question.answers[1] = Answer("Dogs", 0);
  }

  function vote(uint answerIndex) public {
    console.log("Voting for ", answerIndex, " -> ", question.answers[answerIndex].text);
    question.answers[answerIndex].votes += 1;
  }

  function getActiveQuestion() view public returns (Question memory) {
    console.log("Returning active question: %s", question.text);
    console.log("Answer 1: ", question.answers[0].text, " -> ", question.answers[0].votes);
    console.log("Answer 2: ", question.answers[1].text, " -> ", question.answers[1].votes);
    return question;
  }
}