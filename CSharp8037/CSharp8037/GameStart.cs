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
			string inputWord;
			do
			{
				Console.WriteLine(string.Format(GreetingMessage, exitWord));
				inputWord = Console.ReadLine();
			}
			while (checkInputWord(inputWord));
		}

		bool checkInputWord(string inputWord)
		{
			bool isExitWord = inputWord.Equals(exitWord);
			Console.WriteLine(isExitWord ? GoodByeMessage : string.Format(InputAcceptMessage, inputWord));
			return !isExitWord;
		}
	}
}
