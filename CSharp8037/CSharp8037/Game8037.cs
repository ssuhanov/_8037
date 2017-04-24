using System;

namespace CSharp8037
{
	public class Game8037 : IGame
	{
		const string StartGreeting = "Hello, let's play. Current difficulty level is {0}\n";
		const string BaseGreeting = "{0} {1} {2} {3}";
		const string TaskMessage = "The next task is {0}\n(enter \"{1}\" for exit)";
		const string CorrectMessage = "Absolutely right.\n";
		const string WrongMessage = "Sorry, you made a mistake. Try again.\n";

		enum Level { Easy, Normal, Hard1, Hard2 };

		Level level;
		int result;

		public Game8037()
		{
			level = Level.Normal;
			result = 0;
			Console.WriteLine(string.Format(StartGreeting, descriptionOfLevel(level)));
		}

		int resultWithLevelAndRandomizer(Level level, Randomizer randomizer)
		{
			switch (level)
			{
				case Level.Easy:
					return randomizer.firstNumber + randomizer.secondNumber + randomizer.thirdNumber + randomizer.fourthNumber;
				case Level.Normal:
					return randomizer.firstNumber * 10 + randomizer.secondNumber + randomizer.thirdNumber * 10 + randomizer.fourthNumber;
				case Level.Hard1:
					return randomizer.firstNumber * randomizer.secondNumber * randomizer.thirdNumber * randomizer.fourthNumber;
				case Level.Hard2:
					return (randomizer.firstNumber * 10 + randomizer.secondNumber) * (randomizer.thirdNumber * 10 + randomizer.fourthNumber);
				default:
					return 0;
			}
		}

		string descriptionOfLevel(Level level)
		{
			switch (level)
			{
				case Level.Easy:
					return "easy";
				case Level.Normal:
					return "normal";
				case Level.Hard1:
					return "hard1";
				case Level.Hard2:
					return "hard2";
				default:
					return "";
			}
		}

		public void greet(string exitWord)
		{
			Randomizer randomizer = new Randomizer();
			result = resultWithLevelAndRandomizer(level, randomizer);

			string task = string.Format(BaseGreeting, randomizer.firstNumber, randomizer.secondNumber, randomizer.thirdNumber, randomizer.fourthNumber);
			Console.WriteLine(string.Format(TaskMessage, task, exitWord));
		}

		public void checkUserAnswer(string userAnswer)
		{
			int answer;

			try
			{
				answer = int.Parse(userAnswer);
			}
			catch
			{
				Console.WriteLine(WrongMessage);
				return;
			}

			if (result == answer)
			{
				Console.WriteLine(CorrectMessage);
			}
			else
			{
				Console.WriteLine(WrongMessage);
			}
		}
	}
}
