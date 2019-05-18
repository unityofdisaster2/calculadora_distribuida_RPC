struct entrada{
    char arg1[100];
};

program CALCULADORACIENTIFICA{
    version CALCULADORACIENTIFICA_VER{
	float calcular(entrada) = 1;
    } = 1;
} = 0x30000001;
