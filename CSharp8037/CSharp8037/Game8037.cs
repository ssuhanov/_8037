using System;

namespace CSharp8037
{
	public class Game8037 : IGame
	{
		const string EasyLevelNumber = "1";
		const string NormalLevelNumber = "2";
		const string Hard1LevelNumber = "3";
		const string Hard2LevelNumber = "4";

		const string EasyLevelName = "easy";
		const string NormalLevelName = "normal";
		const string Hard1LevelName = "hard1";
		const string Hard2LevelName = "hard2";

		const string StartGreeting = "Hello, let's play. Please select difficulty level:{0}";
		const string LevelForSelect = "\n{0} - {1}";
		const string BaseGreeting = "{0} {1} {2} {3}";
		const string TaskMessage = "The next task is {0}\n(enter \"{1}\" for exit)";
		const string CorrectMessage = "Absolutely right.\n";
		const string WrongMessage = "Sorry, you made a mistake. Try again.\n";
		const string ErrorLevelMessage = "Sorry, you have selected wrong level. Good bye.\n";

		enum Level { Easy, Normal, Hard1, Hard2 };

		Level level;
		int result;

		private Game8037(Level level)
		{
			this.level = level;
			result = 0;
		}

		public static Game8037 Create()
		{
			string levels = string.Format("{0}{1}{2}{3}", levelForSelect(Level.Easy), levelForSelect(Level.Normal), levelForSelect(Level.Hard1), levelForSelect(Level.Hard2));
			Console.WriteLine(string.Format(StartGreeting, levels));

			Game8037 game8037;

			string selectedLevel = Console.ReadLine();
			switch (selectedLevel)
			{
				case EasyLevelNumber:
				case EasyLevelName:
					game8037 = new Game8037(Level.Easy);
					break;
				case NormalLevelNumber:
				case NormalLevelName:
					game8037 = new Game8037(Level.Normal);
					break;
				case Hard1LevelNumber:
				case Hard1LevelName:
					game8037 = new Game8037(Level.Hard1);
					break;
				case Hard2LevelNumber:
				case Hard2LevelName:
					game8037 = new Game8037(Level.Hard2);
					break;
				default:
					game8037 = null;
					Console.WriteLine(ErrorLevelMessage);
					break;
			}

			return game8037;
		}

		static string levelForSelect(Level level)
		{
			string levelNumber = "";
			string levelName = "";

			switch (level)
			{
				case Level.Easy:
					levelNumber = EasyLevelNumber;
					levelName = EasyLevelName;
					break;
				case Level.Normal:
					levelNumber = NormalLevelNumber;
					levelName = NormalLevelName;
					break;
				case Level.Hard1:
					levelNumber = Hard1LevelNumber;
					levelName = Hard1LevelName;
					break;
				case Level.Hard2:
					levelNumber = Hard2LevelNumber;
					levelName = Hard2LevelName;
					break;
			}

			return string.Format(LevelForSelect, levelNumber, levelName);
		}

		int resultWithLevelAndRandomizer(Level level, Randomizer randomizer)
		{
			int result = 0;

			switch (level)
			{
				case Level.Easy:
					result = randomizer.firstNumber + randomizer.secondNumber + randomizer.thirdNumber + randomizer.fourthNumber;
					break;
				case Level.Normal:
					result = randomizer.firstNumber * 10 + randomizer.secondNumber + randomizer.thirdNumber * 10 + randomizer.fourthNumber;
					break;
				case Level.Hard1:
					result = randomizer.firstNumber * randomizer.secondNumber * randomizer.thirdNumber * randomizer.fourthNumber;
					break;
				case Level.Hard2:
					result = (randomizer.firstNumber * 10 + randomizer.secondNumber) * (randomizer.thirdNumber * 10 + randomizer.fourthNumber);
					break;
			}

			return result;
		}

		string descriptionOfLevel(Level level)
		{
			string result = "";

			switch (level)
			{
				case Level.Easy:
					result = "easy";
					break;
				case Level.Normal:
					result = "normal";
					break;
				case Level.Hard1:
					result = "hard1";
					break;
				case Level.Hard2:
					result = "hard2";
					break;
			}

			return result;
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
