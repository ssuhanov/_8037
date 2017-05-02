using System;

namespace CSharp8037
{
	public class GameStart
	{
		const string GreetingMessage = "Please enter your answer (enter \"{0}\" for exit):";
		const string InputAcceptMessage = "You entered \"{0}\".\n";
		const string GoodByeMessage = "Good bye.\n";

		readonly string exitWord;
		readonly IGame iGame;

		public GameStart(string exitWord)
		{
			this.exitWord = exitWord;
			iGame = Game8037.Create();
		}

		public void startGame()
		{
			if (iGame != null)
			{
				string inputWord;
				do
				{
					iGame.greet(exitWord);
					inputWord = Console.ReadLine();
				}
				while (checkInputWord(inputWord));
			}
		}

		bool checkInputWord(string inputWord)
		{
			bool isExitWord = inputWord.Equals(exitWord);
			if (isExitWord)
			{
				Console.WriteLine(GoodByeMessage);
			}
			else
			{
				iGame.checkUserAnswer(inputWord);
			}
			return !isExitWord;
		}
	}
}
