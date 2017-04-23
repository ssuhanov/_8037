using System;

namespace CSharp8037
{
	public class GameStart
	{
		const string GreetingMessage = "Please enter your answer (enter \"{0}\" for exit):";
		const string InputAcceptMessage = "You entered \"{0}\".\n";
		const string GoodByeMessage = "Good bye.\n";

		readonly string exitWord;

		public GameStart(string exitWord)
		{
			this.exitWord = exitWord;
		}

		public void startGame()
		{
			Console.WriteLine(string.Format(GreetingMessage, exitWord));
			string inputWord = Console.ReadLine();

			checkInputWord(inputWord);
		}

		void checkInputWord(string inputWord)
		{
			if (inputWord.Equals(exitWord))
			{
				Console.WriteLine(GoodByeMessage);
			}
			else
			{
				Console.WriteLine(string.Format(InputAcceptMessage, inputWord));
				startGame();
			}
		}
	}
}
