BEGIN		{FS = "/";
		 last_lex = "";
			 last_str = "";
		 printf("Note that the following equivalencies also hold");
		 printf(" for the given lexical items:\n");
			}

/LX_/		{
		 if (last_lex == $2)
		   {
			 printf("\n%-20s can also be %s\n", last_str, $3);
		   }
		 else
		   {
			 last_str = $3;
		   }
		 last_lex = $2;
		   }
