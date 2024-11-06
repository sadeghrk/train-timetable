#include <stdio.h>
#include <string.h>
#include <stdlib.h>


char* inttostring(int);
int stations[200] = {0};
int num_of_trains = 3;
int num_of_stations = 12;
int sts[1000][120];
int sts2[1000][120];

int starts[2000];
double best_val;
double simulator();
int iters;


int main(int argc, char** argv)
{
	int i,j,k, k1, k2;
 	j = (argv[1][1] - 48) % 10 + (argv[1][0] - 48) * 10;
	if(argv[2] != NULL)
	{
		i = 0;
		if(argv[2][0] <= '9' && argv[2][0] >= '0')
			i = (argv[2][0] - 48);
		if(argv[2][1] <= '9' && argv[2][1] >= '0')
	 		i = i * 10 + (argv[2][1] - 48) % 10;
		num_of_trains = i;
	}
	printf("\nNumber of trains: %d ", num_of_trains);
	srand(j + num_of_trains*10);

	for(i = 1; i < num_of_stations; i++)
		stations[i] = stations[i-1] + 12 + rand()%25;
	
	char str1[1000], str2[1000], str3[1000];
	char tmp1[40], tmp2[40];
	char filename[20] = "rl01.pm";

	float rews[1000];

	FILE *report;
	best_val = 10000;
	double bstv;
	int num_of_iters, sim_samps;
	num_of_iters = 200;
	float res;
	printf("\nLocations of the stations:\n");
	for(i = 0; i < num_of_stations; i++)
		printf("%d\t", stations[i]);


	for(iters = 0; iters < num_of_iters; iters++)
	{
		starts[0] = 0;
		for(j = 1; j < num_of_trains; j++)
			starts[j] = rand() % 240; // Departure time can be between 3-11pm
		for(i = 0; i < num_of_trains; i++)
			for(j = 0; j < num_of_trains - 1; j++)
				if(starts[j] > starts[j+1])
				{
					k1 = starts[j+1];
					starts[j+1] = starts[j];
					starts[j] = k1;
				}
		for(i = 0; i < num_of_trains; i++)
			if(starts[i+1] < starts[i] + 15)
				starts[i+1] = starts[i] + 15;

		starts[num_of_trains] = 2 + rand() % 10;
		for(j = num_of_trains + 1; j < 2 * num_of_trains; j++)
			starts[j] = rand() % 240; // Departure time can be between 3-11pm
		for(i = 0; i < num_of_trains; i++)
			for(j = num_of_trains; j < 2*num_of_trains - 1; j++)
				if(starts[j] > starts[j+1])
				{
					k1 = starts[j+1];
					starts[j+1] = starts[j];
					starts[j] = k1;
				}

		for(i = num_of_trains; i < 2*num_of_trains; i++)
			if(starts[i+1] < starts[i] + 15)
				starts[i+1] = starts[i] + 15;

		res = simulator();			/////////		
		rews[iters] = res;
		if(res < best_val)
			best_val = res;
		if(iters < num_of_iters)
			bstv = best_val;
		printf("\nIter %d:  result: %f , best results: %f ", iters, res, bstv);
		//report = fopen("report_1.log", "a");
		//fprintf(report, "\nIter %d:  result: %f , best results: %f ", iters, res, bstv);
		//fclose(report);
	}

	int sels = 0, chance;

	double avg, max, sum;
	int crom[10000];
	double prio[1000];
	int ind = 0;

	printf("\nFirst Step in finished.");

	for(int round = 0; round < 4; round++)
	{
		printf("\n\n===================\n===================\nRound%d:\n", round+2);
		//report = fopen("report_1.log", "a+");
		//fprintf(report, "\n====================\n===================\nRound%d:\n", round+2);
		//fclose(report);
		max = 0;
		sum = 0;
		for(i = 0; i < num_of_iters; i++)
		{
			sum += rews[i];
			if(max < rews[i])
				max = rews[i];
		}
		avg = sum / num_of_iters;
		sum = 0;
		ind = 0;
		for(i = 0; i < num_of_iters; i++)
			if(rews[i] < avg)
			{
				prio[i] = avg - rews[i];
				sum += prio[i];
				sels++;
			}
			else
				prio[i] = 0;

		for(i = 0; i < num_of_iters; i++)
		{
			//printf("\n%d  %f ", i, prio[i]);
			chance = 10000 * prio[i] / sum;
			j = ind;
			while(ind - j < chance)
				crom[ind++] = i;
		}
		
		//printf("\nind: %d \n", ind);

		for(i = 0; i < num_of_iters; i++)
			for(j = 0; j < 2 * num_of_trains; j++)
				sts2[i][j] = sts[i][j];

		for(iters = 0; iters < num_of_iters; iters++)
		{
			starts[0] = 0;

			if(rand() % 100 > 60)	//	don't apply cross-over
			{
				j = crom[rand() % ind];
			//	printf("\nCromosome# %d has been selected.  ", j);
				for(k = 1; k < 2 * num_of_trains; k++)
				{
					starts[k] = sts2[j][k] - 2 + rand()% 5;
					if(starts[k] < 0) starts[k] = 0;
					if(starts[k] - starts[k-1] < 15 && k != num_of_trains)
						starts[k] = starts[k-1] + 15;
				}
			}
			else
			{
				j = crom[rand() % ind];
				//printf("\nCromosome# %d has been selected.  ", j);
				for(k = 1; k < num_of_trains; k++)
				{
					starts[k] = sts2[j][k] - 2 + rand()% 5;
					if(starts[k] < 0) starts[k] = 0;
					if(starts[k] - starts[k-1] < 15 && k != num_of_trains)
						starts[k] = starts[k-1] + 15;
				}
				j = crom[rand() % ind];
				//printf("\nCromosome# %d has been selected.  ", j);
				for(k = num_of_trains; k < 2*num_of_trains; k++)
				{
					starts[k] = sts2[j][k] - 2 + rand()% 5;
					if(starts[k] < 0) starts[k] = 0;
					if(starts[k] - starts[k-1] < 15 && k != num_of_trains)
						starts[k] = starts[k-1] + 15;
				}
			}

			res = simulator();			/////////
			
			rews[iters] = res;
			if(res < best_val)
				best_val = res;
			if(iters < num_of_iters)
				bstv = best_val;
			printf("\nIter %d:   result: %f , best results: %f ", iters, res, bstv);
			//report = fopen("report_1.log", "a+");
			//fprintf(report, "\nIter %d:   result: %f , best results: %f ", iters, res, bstv);
			//fclose(report);
		}
	}
//	fclose(report);
	return 0;
}

double simulator()
{
	char str1[1000], str2[1000], str3[1000];
	char tmp1[40], tmp2[40];
	char filename[20] = "rl01.pm";

	float rews[1000];

	FILE *fp;//
	double bstv;
	int i, j, k, k1, k2;



	//for(j = 0; j < num_of_trains * 2; j++)
	//	printf("\ntrain%d starts at: %d ", j+1, starts[j]);

	//filename[2] = iters / 10 + 48;
	//filename[3] = iters % 10 + 48;
	fp = fopen(filename, "w+");

	fprintf(fp, "dtmc\n");
	for(j = 0; j < num_of_trains; j++)
	{
		fprintf(fp, "const st%d = %d;\n", j+1, starts[j]);
		fprintf(fp, "const st_B%d = %d;\n", j+1, starts[num_of_trains+j]);		
		sts[iters][j] = starts[j];
		sts[iters][j+num_of_trains] = starts[num_of_trains+j];
	}

	fprintf(fp, "const alpha = 2;\n\n");
	fprintf(fp, "module timer\n");
	fprintf(fp, " t : [0..720];\n");
	fprintf(fp, " [tick] t < 720 -> (t' = t + 1);\n");
	fprintf(fp, " [tick] t = 720 -> (t' = t);\n");
	fprintf(fp, "endmodule\n\n");

	fprintf(fp, "module train_A1\n");
	fprintf(fp, " loc1 : [0..720] init 0;\n");
	fprintf(fp, " delay1 : [0..1250];\n");
	fprintf(fp, " dl1 : [0..1250] init 0;\n");
	fprintf(fp, " dwl_1 : [0..2] init 0;\n");
	fprintf(fp, " [tick] t <= st1 & loc1 = 0 -> (delay1' = 0);\n");
	fprintf(fp, " [tick] t >= st1 & loc1 = 0 & cond_R1   -> (loc1' = 1);\n");
	fprintf(fp, " [tick] t >= st1 & loc1 = 0 & !cond_R1   -> (dl1' = min(dl1 + 1 , 1250));\n\n");

	for(i = 0; i < num_of_stations - 2; i++)
	{

		fprintf(fp, " [tick] loc1 >= %d & loc1 < %d & delay1 < 1250 -> (1 - alpha/100):(loc1' = loc1 + 1) + alpha/100:(delay1' = delay1 + 1);\n", stations[i] + 1, stations[i+1]);
		fprintf(fp, " [tick] loc1 >= %d & loc1 < %d & delay1 = 1250 -> (loc1' = loc1 + 1);\n", stations[i] + 1, stations[i+1]);
		fprintf(fp, " [tick] loc1 = %d & dwl_1 < 2 -> (dwl_1' = dwl_1 + 1);\n", stations[i+1]);
		fprintf(fp, " [tick] loc1 = %d & dwl_1 = 2 & cond_R%d -> (loc1' = %d) & (dwl_1' = 0);\n", stations[i + 1], i + 2, stations[i + 1]+1);
		fprintf(fp, " [tick] loc1 = %d & dwl_1 = 2 & !cond_R%d   -> (dl1' = min(dl1 + 1 , 1250)); \n\n", stations[i + 1], i + 2);
	}


	fprintf(fp, " [tick] loc1 >= %d & loc1 < %d & delay1 < 1250 -> (1 - alpha/100):(loc1' = loc1 + 1) + alpha/100:(delay1' = delay1 + 1);\n", stations[i] + 1, stations[i+1]);
	fprintf(fp, " [tick] loc1 >= %d & loc1 < %d & delay1 = 1250 -> (loc1' = loc1 + 1);\n", stations[i] + 1, stations[i+1]);
	fprintf(fp, " [tick] loc1 = %d -> (loc1' = %d);\n", stations[i+1], stations[i+1]);
	fprintf(fp, "endmodule\n");

	/////////////////////////////////////////////////////////

	for(j = 2; j <= num_of_trains; j++)
	{
		fprintf(fp, "\nmodule train_A%d\n", j);
		fprintf(fp, " loc%d : [0..720] init 0;\n", j);
		fprintf(fp, " delay%d : [0..1250];\n", j);
		fprintf(fp, " dl%d : [0..1250];\n", j);
		fprintf(fp, " dwl_%d : [0..2];\n", j);
		fprintf(fp, " [tick] t < st%d & loc%d = 0 -> (delay%d' = 0);\n", j, j, j);
		fprintf(fp, " [tick] t >= st%d & loc%d = 0 & loc%d > 1 & cond_R%d -> (loc%d' = 1);\n", j, j, j-1, 1, j);
		fprintf(fp, " [tick] t >= st%d & loc%d = 0 & (loc%d <= 1 | !cond_R%d) -> (loc%d' = 0);\n\n", j, j, j-1, 1, j);

		for(i = 0; i < num_of_stations - 2; i++)
		{
			k1 = stations[i] + 1;
			k2 = stations[i+1];
			fprintf(fp, " [tick] loc%d >= %d & loc%d < %d & loc%d-loc%d >= 2 & delay%d < 1250 -> (1 - alpha/100):(loc%d' = loc%d + 1) + alpha/100:(delay%d' = delay%d+1);\n", j, k1, j, k2-1, j-1, j, j, j, j, j, j);
			fprintf(fp, " [tick] loc%d >= %d & loc%d < %d & loc%d-loc%d < 2 & delay%d <= 1250 & dl%d < 1250 -> (dl%d' = dl%d + 1);\n", j, k1, j, k2-1, j-1, j, j, j, j, j);
			fprintf(fp, " [tick] loc%d >= %d & loc%d < %d & loc%d-loc%d < 2 & delay%d <= 1250 & dl%d = 1250 -> (dl%d' = dl%d);\n", j, k1, j, k2-1, j-1, j, j, j, j, j);
			fprintf(fp, " [tick] loc%d >= %d & loc%d < %d & loc%d-loc%d >= 2 & delay%d = 1250 -> (loc%d' = loc%d+1);\n", j, k1, j, k2-1, j-1, j, j, j, j);
			fprintf(fp, " [tick] loc%d >= %d & loc%d = %d & delay%d < 1250 -> (1 - alpha/100):(loc%d' = loc%d + 1) + alpha/100:(delay%d' = delay%d+1);\n", j-1, k2, j, k2-1, j,j,j,j,j);
			fprintf(fp, " [tick] loc%d >= %d & loc%d = %d & delay%d = 1250 -> (loc%d' = loc%d + 1);\n", j-1, k2, j, k2-1, j, j, j);
			fprintf(fp, " [tick] loc%d = %d & dwl_%d < 2 -> (dwl_%d' = dwl_%d + 1);\n", j, k2, j, j, j);
			fprintf(fp, " [tick] loc%d > %d & loc%d = %d & dwl_%d = 2 & cond_R%d -> (loc%d' = %d) & (dwl_%d' = 0);\n", j-1, k2+1, j, k2,j, i+2, j, k2+1 ,j);
			fprintf(fp, " [tick] (loc%d <= %d | !cond_R%d) & dwl_%d = 2 & loc%d = %d & dl%d <= 1250 -> (dl%d' = min(1250,dl%d+1));\n\n",j-1, k2+1, i+2, j, j, k2, j, j, j);
		}

			k1 = stations[i] + 1;
			k2 = stations[i+1];
			fprintf(fp, " [tick] loc%d >= %d & loc%d < %d & loc%d-loc%d >= 2 & delay%d < 1250 -> (1 - alpha/100):(loc%d' = loc%d + 1) + alpha/100:(delay%d' = delay%d+1);\n", j, k1, j, k2-1, j-1, j, j, j, j, j, j);
			fprintf(fp, " [tick] loc%d >= %d & loc%d < %d & loc%d-loc%d < 2 & delay%d <= 1250 & dl%d <= 1250 -> (dl%d' = min(1250, dl%d + 1));\n", j, k1, j, k2-1, j-1, j, j, j, j, j);
			fprintf(fp, " [tick] loc%d >= %d & loc%d < %d & loc%d-loc%d >= 2 & delay%d = 1250 -> (loc%d' = loc%d+1);\n", j, k1, j, k2-1, j-1, j, j, j, j);
			fprintf(fp, " [tick] loc%d >= %d & loc%d = %d & delay%d < 1250 -> (1 - alpha/100):(loc%d' = loc%d + 1) + alpha/100:(delay%d' = delay%d+1);\n", j-1, k2, j, k2-1, j,j,j,j,j);
			fprintf(fp, " [tick] loc%d >= %d & loc%d = %d & delay%d = 1250 -> (loc%d' = loc%d + 1);\n", j-1, k2, j, k2-1, j, j, j);
			fprintf(fp, " [tick] loc%d = %d -> (loc%d' = loc%d);\n", j, k2, j, j);

			fprintf(fp, "endmodule\n\n");
	}


	/////////////////////   The Reverse side. //////////////////

	fprintf(fp, "module train_B1\n");
	k = stations[num_of_stations - 1];
	tmp1[2] = k % 10 + 48;
	k /= 10;
	tmp1[1] = k % 10 + 48;
	k /= 10;
	tmp1[0] = k % 10 + 48;
	tmp1[3] = '\0';
	if(tmp1[0] == '0')
		tmp1[0] = ' ';
	if(tmp1[1] == '0' && tmp1[0] == ' ') 
		tmp1[1] = ' ';

	k = stations[num_of_stations - 1];
	fprintf(fp, " loc_B1 : [0..720] init %d;\n", k);

	fprintf(fp, " delay_B1 : [0..1250];\n");
	fprintf(fp, " dl_B1 : [0..1250] init 0;\n");
	fprintf(fp, " dwl_B1 : [0..2] init 0;\n");

	fprintf(fp, " [tick] t < st_B1 & loc_B1 = %d -> (delay_B1' = 0);\n", k);
	fprintf(fp, " [tick] t>= st_B1 & loc_B1 = %d & cond_1 -> (loc_B1' = %d - 1);\n", k, k);
	fprintf(fp, " [tick] t>= st_B1 & loc_B1 = %d & !cond_1 -> (dl_B1' = min(dl_B1 + 1 , 1250));\n\n", k);

	for(i = num_of_stations - 1; i > 1; i--)
	{
		k = stations[i] - 1;
		tmp1[2] = k % 10 + 48;
		k /= 10;
		tmp1[1] = k % 10 + 48;
		k /= 10;
		tmp1[0] = k % 10 + 48;
		tmp1[3] = '\0';
		if(tmp1[0] == '0') tmp1[0] = ' ';
		if(tmp1[1] == '0' && tmp1[0] == ' ') tmp1[1] = ' ';

		k = stations[i-1];
		tmp2[2] = k % 10 + 48;
		k /= 10;
		tmp2[1] = k % 10 + 48;
		k /= 10;
		tmp2[0] = k % 10 + 48;
		tmp2[3] = '\0';
		if(tmp2[0] == '0') tmp2[0] = ' ';
		if(tmp2[1] == '0' && tmp2[0] == ' ') tmp2[1] = ' ';

		k1 = stations[i] - 1;
		k2 = stations[i-1];
		fprintf(fp, " [tick] loc_B1 <= %d & loc_B1 > %d & delay_B1 < 1250 -> (1-alpha/100):(loc_B1' = loc_B1 - 1) + alpha/100:(delay_B1' = delay_B1 + 1);\n", k1, k2);
	
		fprintf(fp, " [tick] loc_B1 <= %d & loc_B1 > %d & delay_B1 = 1250 -> (loc_B1' = loc_B1 - 1);\n", k1, k2);
		fprintf(fp, " [tick] loc_B1 = %d & dwl_B1 < 2 -> (dwl_B1' = dwl_B1 + 1);\n", k2);
		fprintf(fp, " [tick] loc_B1 = %d & dwl_B1 = 2 & cond_%d  -> (loc_B1' = %d-1) & (dwl_B1' = 0);\n",k2,num_of_stations - i+1,k2);					
		fprintf(fp, " [tick] loc_B1 = %d & dwl_B1 = 2 & !cond_%d -> (dl_B1' = min(dl_B1 + 1 , 1250)); \n\n", k2, num_of_stations - i + 1);
	}

	k1 = k = stations[i] - 1;
	k2 = k = stations[i-1];

	fprintf(fp, " [tick] loc_B1 <= %d & loc_B1 > %d & delay_B1 < 1250 -> (1 - alpha/100):(loc_B1' = loc_B1 - 1) + alpha/100:(delay_B1' = delay_B1 + 1);\n", k1, k2 );
	fprintf(fp, " [tick] loc_B1 <= %d & loc_B1 > %d & delay_B1 = 1250 -> (loc_B1' = loc_B1 - 1);\n", k1, k2);
	fprintf(fp, " [tick] loc_B1 = %d -> (loc_B1' = %d);\n", k2, k2);
	fprintf(fp, "endmodule\n\n");

	//////////////////////// 

	for(j = 2; j <= num_of_trains; j++)
	{

		fprintf(fp, "\nmodule train_B%d\n", j);

		k1 = k = stations[num_of_stations - 1];

		fprintf(fp, " loc_B%d : [0..720] init %d;\n", j, k1);
		fprintf(fp, " delay_B%d : [0..1250] init 0;\n", j);
		fprintf(fp, " dl_B%d : [0..1250] init 0;\n", j);
		fprintf(fp, " dwl_B%d : [0..2] init 0;\n", j);
		fprintf(fp, " [tick] t < st_B%d & loc_B%d = %d -> (delay_B%d' = 0);\n", j, j, k1, j);
		fprintf(fp, " [tick] t >= st_B%d & loc_B%d = %d & loc_B%d < %d-1 & cond_1 -> (loc_B%d' = %d - 1);\n", j,j,k1,j-1,k1,j,k1);
		fprintf(fp," [tick] t >= st_B%d & loc_B%d =%d&(loc_B%d>=%d-1|!cond_1) -> (loc_B%d' = loc_B%d);\n\n",j,j,k1,j-1,k1,j,j);

		for(i = 0; i < num_of_stations - 2; i++)
		{
			k1 = k = stations[num_of_stations - i - 1] - 1;
			tmp1[2] = k % 10 + 48;
			k /= 10;
			tmp1[1] = k % 10 + 48;
			k /= 10;
			tmp1[0] = k % 10 + 48;
			tmp1[3] = '\0';
			if(tmp1[0] == '0') tmp1[0] = ' ';
			if(tmp1[1] == '0' && tmp1[0] == ' ') tmp1[1] = ' ';

			k2 = k = stations[num_of_stations - i - 2];
			tmp2[2] = k % 10 + 48;
			k /= 10;
			tmp2[1] = k % 10 + 48;
			k /= 10;
			tmp2[0] = k % 10 + 48;
			tmp2[3] = '\0';
			if(tmp2[0] == '0') tmp2[0] = ' ';
			if(tmp2[1] == '0' && tmp2[0] == ' ') tmp2[1] = ' ';

			fprintf(fp, " [tick] loc_B%d <=%d& loc_B%d >%d+1& loc_B%d-loc_B%d >= 2 & delay_B%d < 1250 -> (1 - alpha/100):(loc_B%d' = loc_B%d - 1) + alpha/100:(delay_B%d' = delay_B%d + 1);\n", j, k1, j, k2, j, j-1, j, j, j, j, j);
			fprintf(fp, " [tick] loc_B%d <=%d& loc_B%d >%d+1& loc_B%d-loc_B%d < 2 & delay_B%d <= 1250 & dl_B%d < 1250 -> (dl_B%d' = dl_B%d + 1);\n",j, k1, j, k2, j, j-1, j, j, j, j);
			fprintf(fp, " [tick] loc_B%d <=%d& loc_B%d >%d+1& loc_B%d-loc_B%d < 2 & delay_B%d <= 1250 & dl_B%d = 1250 -> (dl_B%d' = dl_B%d);\n", j, k1, j, k2, j, j-1, j, j, j, j);
			fprintf(fp,  " [tick] loc_B%d <= %d & loc_B%d >%d+1& loc_B%d-loc_B%d >= 2 &delay_B%d  = 1250 -> (loc_B%d' = loc_B%d - 1);\n", j, k1, j, k2, j, j-1, j, j, j);
			fprintf(fp, "  [tick] loc_B%d <=%d& loc_B%d =%d+1& delay_B%d < 1250 -> (1 - alpha/100):(loc_B%d' = loc_B%d - 1) + alpha/100:(delay_B%d' = delay_B%d + 1);\n", j-1, k2, j, k2, j, j, j, j, j);
			fprintf(fp, " [tick] loc_B%d <=%d& loc_B%d =%d+1& delay_B%d = 1250 -> (loc_B%d' = loc_B%d - 1);\n", j-1, k2, j, k2, j, j, j);
			fprintf(fp, " [tick] loc_B%d =%d& dwl_B%d < 2 -> (dwl_B%d' = dwl_B%d + 1);\n", j, k2, j, j, j);
			fprintf(fp, " [tick] loc_B%d <%d-1& loc_B%d =%d& dwl_B%d = 2 & cond_%d -> (loc_B%d' =%d-1) & (dwl_B%d' = 0);\n", j-1, k2, j, k2, j, i+2, j, k2, j);
			fprintf(fp, " [tick] (loc_B%d >=%d-1| !cond_%d) & dwl_B%d = 2 & loc_B%d =%d& dl_B%d <= 1250 -> (dl_B%d' = min(1250,dl_B%d + 1));\n\n", j-1, k2, i+2, j, j, k2, j, j, j);
		}
		
			k1 = k = stations[num_of_stations - i - 1] - 1;		
			k2 = k = stations[num_of_stations - i - 2];
	
			fprintf(fp, " [tick] loc_B%d <=%d& loc_B%d >%d+1& loc_B%d-loc_B%d >= 2 & delay_B%d < 1250 -> (1 - alpha/100):(loc_B%d' = loc_B%d - 1) + alpha/100:(delay_B%d' = delay_B%d + 1);\n", j, k1, j, k2, j, j-1, j, j, j, j, j);
			fprintf(fp, " [tick] loc_B%d <=%d& loc_B%d >%d+1& loc_B%d-loc_B%d < 2 & delay_B%d <= 1250 & dl_B%d < 1250 -> (dl_B%d' = dl_B%d + 1);\n", j, k1, j, k2, j, j-1, j, j, j, j);
			fprintf(fp, " [tick] loc_B%d <= %d & loc_B%d >%d+1& loc_B%d-loc_B%d >= 2 &delay_B%d = 1250 -> (loc_B%d' = loc_B%d - 1);\n", j, k1, j, k2, j, j-1, j, j, j);
			fprintf(fp, " [tick] loc_B%d <= %d & loc_B%d =%d+1& delay_B%d < 1250 -> (1 - alpha/100):(loc_B%d' = loc_B%d - 1) + alpha/100:(delay_B%d' = delay_B%d + 1);\n", j-1, k2, j, k2, j, j, j, j, j);
			fprintf(fp, " [tick] loc_B%d <= %d & loc_B%d = %d+1& delay_B%d = 1250 -> (loc_B%d' = loc_B%d - 1);\n", j-1, k2, j, k2, j, j, j);
			fprintf(fp, " [tick] loc_B%d = %d -> (loc_B%d' = loc_B%d);\n", j, k2, j, j);
			fprintf(fp, "endmodule\n\n");
	}

	fprintf(fp , "module ckrew\n");
	fprintf(fp, " ck :[0..2] init 0;\n");
	char dst[1000];


	strcpy(dst, " [tt] ck <= 1");
	strcpy(tmp1, " & loc_B_ = 0 ");
	strcpy(tmp2, " & loc_ = ___");
	for(i = 1; i <= num_of_trains; i++)
	{
		tmp1[8] = i%10 + 48;
		if(i >= 10)
		{
			tmp1[8] = i/10 + 48;
			tmp1[9] = i%10 + 48;
		}
		strcat(dst, tmp1);
		tmp2[6] = i%10 + 48;
		if(i >= 10)
		{
			tmp2[6] = i/10 + 48;
			tmp2[7] = i%10 + 48;
		}
		tmp2[10] = stations[num_of_stations - 1]/100 + 48;
		tmp2[11] = (stations[num_of_stations - 1] / 10) % 10 + 48;
		tmp2[12] = stations[num_of_stations - 1] % 10 + 48;
		strcat(dst, tmp2);
	}
		strcat(dst, " -> (ck' = ck + 1);\nendmodule\n\n");
		fprintf(fp, dst);
		
		strcpy(dst, "formula total_prpg_dl = dl1 + dl_B1");
		strcpy(tmp1, " + dl1 ");
		strcpy(tmp2, " + dl_B1 ");
		for(i = 2; i <= num_of_trains; i++)
		{
			if(i < 10)
			{
				tmp1[5] = i + 48;
				tmp2[7] = i + 48;
			}
			else
			{
				tmp1[5] = i/10 + 48;
				tmp1[6] = i%10 + 48;
				tmp2[7] = i/10 + 48;
				tmp2[8] = i%10 + 48;				
			}
			strcat(dst, tmp1);
			strcat(dst, tmp2);
		}
		strcat(dst, ";\n\n");
		fprintf(fp, dst);
		fprintf(fp, "rewards\n [tt] ck = 1 : total_prpg_dl; \nendrewards\n\n");

		for(j = 1; j < num_of_stations; j++)
		{
			if(j < 10)
			{
				strcpy(dst, "formula cond_1 = (loc1 <___ | loc1 >=___ | (loc1 =___ & dwl_1 <= 2))");
				dst[13] = j + 48;
				k = stations[num_of_stations - j];
				tmp1[2] = k % 10 + 48;
				k /= 10;
				tmp1[1] = k % 10 + 48;
				k /= 10;
				tmp1[0] = k % 10 + 48;
				if(tmp1[0] == '0') tmp1[0] = ' ';

				k = stations[num_of_stations - j - 1];
				tmp2[2] = k % 10 + 48;
				k /= 10;
				tmp2[1] = k % 10 + 48;
				k /= 10;
				tmp2[0] = k % 10 + 48;
			//	tmp2[3] = '\0';
				if(tmp2[0] == '0') tmp2[0] = ' ';
				if(tmp2[1] == '0' && tmp2[0] == ' ') tmp2[11] = ' ';
				dst[24] = tmp2[0];
				dst[25] = tmp2[1];
				dst[26] = tmp2[2];
				dst[37] = tmp1[0];
				dst[38] = tmp1[1];
				dst[39] = tmp1[2];
				dst[50] = tmp2[0];
				dst[51] = tmp2[1];
				dst[52] = tmp2[2];

				for(i = 1; i < num_of_trains; i++)
				{
					strcpy(str2, "\n & (loc? <___ | loc? >=___ | (loc? =___ & dwl_? <= 2))");
					if(i < 10)
					{
						str2[11] = tmp2[0];
						str2[12] = tmp2[1];
						str2[13] = tmp2[2];
						str2[24] = tmp1[0];
						str2[25] = tmp1[1];
						str2[26] = tmp1[2];
						str2[37] = tmp2[0];
						str2[38] = tmp2[1];
						str2[39] = tmp2[2];
						str2[8] = str2[20] = str2[34] = str2[47] = i + 49;
						if(i == 9)
						{
							str2[8] = str2[20] = str2[34] = str2[47] = '1';
							str2[9] = str2[21] = str2[35] = str2[48] = '0';
						}
					}				
					else
					{
						str2[11] = tmp2[0];
						str2[12] = tmp2[1];
						str2[13] = tmp2[2];
						str2[24] = tmp1[0];
						str2[25] = tmp1[1];
						str2[26] = tmp1[2];
						str2[37] = tmp2[0];
						str2[38] = tmp2[1];
						str2[39] = tmp2[2];
					
						str2[8] = str2[20] = str2[34] = str2[47] = i/10 + 48;
						str2[9] = str2[21] = str2[35] = str2[48] = i%10 + 49;
					}
					strcat(dst, str2);
				}
			}
			else
			{
				strcpy(dst, "formula cond_1  =(loc1 <___ | loc1 >=___ | (loc1 =___ & dwl_1 <= 2))");			
				dst[13] = j/10 + 48;
				dst[14] = j%10 + 48;

				k = stations[num_of_stations - j];
				tmp1[2] = k % 10 + 48;
				k /= 10;
				tmp1[1] = k % 10 + 48;
				k /= 10;
				tmp1[0] = k % 10 + 48;
				if(tmp1[0] == '0') tmp1[0] = ' ';

				k = stations[num_of_stations - j - 1];
				tmp2[2] = k % 10 + 48;
				k /= 10;
				tmp2[1] = k % 10 + 48;
				k /= 10;
				tmp2[0] = k % 10 + 48;
			//	tmp2[3] = '\0';
				if(tmp2[0] == '0') tmp2[0] = ' ';
				if(tmp2[1] == '0' && tmp2[0] == ' ') tmp2[11] = ' ';
				dst[24] = tmp2[0];
				dst[25] = tmp2[1];
				dst[26] = tmp2[2];
				dst[37] = tmp1[0];
				dst[38] = tmp1[1];
				dst[39] = tmp1[2];
				dst[50] = tmp2[0];
				dst[51] = tmp2[1];
				dst[52] = tmp2[2];

				for(i = 1; i < num_of_trains; i++)
				{
					strcpy(str2, "\n & (loc? <___ | loc?>=___ | (loc? =___ & dwl_? <= 2))");
					str2[11] = tmp2[0];
					str2[12] = tmp2[1];
					str2[13] = tmp2[2];
					str2[23] = tmp1[0];
					str2[24] = tmp1[1];
					str2[25] = tmp1[2];
					str2[36] = tmp2[0];
					str2[37] = tmp2[1];
					str2[38] = tmp2[2];
					if(i < 10)
					{
						if(i == 9)
						{
						str2[8] = str2[20] = str2[33] = str2[46] = '1';
						str2[9] = str2[21] = str2[34] = str2[47] = '0';
						}
						else
						str2[8] = str2[20] = str2[33] = str2[46] = i%10 + 49;
					}
					else
					{
						str2[8] = str2[20] = str2[33] = str2[46] = i/10 + 48;
						str2[9] = str2[21] = str2[34] = str2[47] = i%10 + 49;
					}
					strcat(dst, str2);
				}

			}
			strcat(dst, ";\n\n");
			fprintf(fp, dst);
		}

		for(j = 1; j < num_of_stations; j++)
		{
			strcpy(dst, "formula cond_R1 = (loc_B1 > ___ | loc_B1<=___ | (loc_B1 =___ & dwl_B1 < 2))");
			dst[14] = j + 48;
			if(j >= 10)
			{
				dst[14] = j/10 + 48;
				dst[15] = j%10 + 48;	
			}
			k = stations[j-1];
			tmp1[2] = k % 10 + 48;
			k /= 10;
			tmp1[1] = k % 10 + 48;
			k /= 10;
			tmp1[0] = k % 10 + 48;
			if(tmp1[0] == '0') tmp1[0] = ' ';
		//	if(tmp1[1] == '0' && tmp1[0] == ' ') tmp1[1] = ' ';

			k = stations[j];
			tmp2[2] = k % 10 + 48;
			k /= 10;
			tmp2[1] = k % 10 + 48;
			k /= 10;
			tmp2[0] = k % 10 + 48;
			if(tmp2[0] == '0') tmp2[0] = ' ';
			if(tmp2[1] == '0' && tmp2[0] == ' ') tmp2[11] = ' ';
			dst[28] = tmp2[0];
			dst[29] = tmp2[1];
			dst[30] = tmp2[2];
			dst[42] = tmp1[0];
			dst[43] = tmp1[1];
			dst[44] = tmp1[2];
			dst[57] = tmp2[0];
			dst[58] = tmp2[1];
			dst[59] = tmp2[2];

			for(i = 1; i < num_of_trains; i++)
			{
				strcpy(str2, "\n & (loc_B? >___ | loc_B? <=___| (loc_B? =___ & dwl_B? < 2))");
				str2[13] = tmp2[0];
				str2[14] = tmp2[1];
				str2[15] = tmp2[2];
				str2[28] = tmp1[0];
				str2[29] = tmp1[1];
				str2[30] = tmp1[2];
				str2[42] = tmp2[0];
				str2[43] = tmp2[1];
				str2[44] = tmp2[2];
				if(i < 9)
					str2[10] = str2[24] = str2[39] = str2[53] = i + 49;
				else if (i == 9)	
				{
					str2[10] = str2[24] = str2[39] = str2[53] = '1';
					str2[11] = str2[25] = str2[40] = str2[54] = '0';
				}
				else
				{
					str2[10] = str2[24] = str2[39] = str2[53] = i/10 + 48;
					str2[11] = str2[25] = str2[40] = str2[54] = i%10 + 49;
				}
				strcat(dst, str2);
			}
			strcat(dst, ";\n");
			fprintf(fp, dst);
		}
		fprintf(fp, "\nlabel \"fin\" = ck = 2;\n");

		fclose(fp);
	
		fp = fopen("prop.pctl", "w+");
//		fprintf(fp,"P=?[F \"fin\"];\n");
		fprintf(fp,"R=?[F \"fin\"];\n");
		fclose(fp);

		float res;
		char comm1[200] = "./prism rl01.pm prop.pctl -prop 1 -sim -simwidth 29 > out01.txt";
		char comm2[200] = "./prism rl01.pm prop.pctl -prop 1 -sim -simwidth 16.7 > out01.txt";
		char comm3[200] = "./prism rl01.pm prop.pctl -prop 1 -sim -simwidth 4  > out01.txt";
		char comm4[200] = "./prism rl01.pm prop.pctl -prop 1 -sim -simwidth 1  > out01.txt";

		system(comm1);

		char comm_[50] = "out01.txt";
		char *str = new char[1000];
		fp = fopen(comm_, "r");
		for(i = 0; i < 198; i++)
		{
			fscanf(fp, "%s", str);
			if(str[0] == 'R' && str[1] == 'e')
				break;
		}
		fscanf(fp, "%f", &res);
		fclose(fp);
		if(res < 64 + best_val)
		{
			system(comm2);
			fp = fopen(comm_, "r");
			for(i = 0; i < 198; i++)
			{
				fscanf(fp, "%s", str);
				if(str[0] == 'R' && str[1] == 'e')
					break;
			}
			fscanf(fp, "%f", &res);
			fclose(fp);
		}
		if(res < 16 + best_val)
		{
			system(comm3);
			fp = fopen(comm_, "r");
			for(i = 0; i < 198; i++)
			{
				fscanf(fp, "%s", str);
				if(str[0] == 'R' && str[1] == 'e')
					break;
			}
			fscanf(fp, "%f", &res);
			fclose(fp);
		}
		if(res < 4 + best_val)
		{
			//if(res < 140)
			//	comm4[50] = comm4[51] = comm4[52] = ' ';

			system(comm4);
			fp = fopen(comm_, "r");
			for(i = 0; i < 198; i++)
			{
				fscanf(fp, "%s", str);
				if(str[0] == 'R' && str[1] == 'e')
					break;
			}
			fscanf(fp, "%f", &res);
			fclose(fp);
		}
	return res;
}

char* inttostring(int k)
{
	char res[10];
	int i, j;
	j = 0;
	while(k)
	{
		res[j] = k % 10 + 48;
		k /= 10;
		j++;
	}
	res[j] = '\0';
	strcpy(res, "500");
	return res;
}
