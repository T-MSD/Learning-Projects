// Seleciona os botões de ação e elementos de exibição
const btnRock = document.querySelector('#rock');
const btnPaper = document.querySelector('#paper');
const btnScissors = document.querySelector('#scissors');
const btnRestart = document.querySelector('#restartBtn');
const pScore = document.querySelector('#pScore');
const cScore = document.querySelector('#cScore');
const tCounter = document.querySelector('#tCounter');
const popup = document.querySelector('#popup');
const container = document.querySelector('#container');
const popupW = document.querySelector('#popupWinner');

// Inicializa as variáveis de pontuação
let playerScore = 0;
let computerScore = 0;
let tieCounter = 0;

// Adiciona eventos de clique para os botões
btnRock.addEventListener('click', () => handlePlayerChoice('rock'));
btnPaper.addEventListener('click', () => handlePlayerChoice('paper'));
btnScissors.addEventListener('click', () => handlePlayerChoice('scissors'));
btnRestart.addEventListener('click', restartGame);

// Função para obter a escolha aleatória do computador
function getComputerChoice() {
  const choices = ['rock', 'paper', 'scissors'];
  const randomIndex = Math.floor(Math.random() * choices.length);
  return choices[randomIndex];
}

// Função que gerencia a escolha do jogador
function handlePlayerChoice(playerChoice) {
  if (isGameOver()) return; // Verifica se o jogo já acabou
  
  const computerChoice = getComputerChoice();
  const resultMessage = determineRoundOutcome(playerChoice, computerChoice);
  
  updateScores();
  console.log(resultMessage);
  
  if (isGameOver()) {
    displayFinalResult();
  }
}

// Determina o resultado da rodada
function determineRoundOutcome(playerChoice, computerChoice) {
  if (playerChoice === computerChoice) {
    tieCounter++;
    return 'It\'s a tie!';
  }
  
  const winningConditions = {
    rock: 'scissors',
    paper: 'rock',
    scissors: 'paper'
  };

  if (winningConditions[playerChoice] === computerChoice) {
    playerScore++;
    return 'You win!';
  } else {
    computerScore++;
    return 'You lose!';
  }
}

// Verifica se o jogo acabou
function isGameOver() {
  return playerScore === 5 || computerScore === 5;
}

// Exibe o resultado final do jogo
function displayFinalResult() {
  openPopup();
  popupW.textContent = playerScore > computerScore ? 'Winner: Player' : 'Winner: Computer';
}

// Atualiza a exibição dos pontos
function updateScores() {
  pScore.textContent = "Player Score: " + playerScore;
  cScore.textContent = "Computer Score: " + computerScore;
  tCounter.textContent = 'Ties: ' + tieCounter;
}

// Reinicia o jogo
function restartGame() {
  closePopup();
  playerScore = 0;
  computerScore = 0;
  tieCounter = 0;
  popupW.textContent = '';
  updateScores();
}

// Função para mostrar o popup
function openPopup() {
  popup.classList.add("open-popup");
  container.classList.add("blur");
}

// Função para fechar o popup
function closePopup() {
  popup.classList.remove("open-popup");
  container.classList.remove("blur");
}
