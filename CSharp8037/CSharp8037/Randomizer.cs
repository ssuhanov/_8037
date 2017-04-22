using System;

namespace CSharp8037
{
	public class Randomizer
	{
		static Random random = new Random();

		public int firstNumber;
		public int secondNumber;
		public int thirdNumber;
		public int fourthNumber;

		public Randomizer()
		{
			firstNumber = random.Next(10);
			secondNumber = random.Next(10);
			thirdNumber = random.Next(10);
			fourthNumber = random.Next(10);
		}
	}
}
