g++ -o a3.out Pr_experiments_diff_trains_GA.cpp -w

for trn in {3..8}; do
for k in {1..10}; do
./a3.out $k $trn > logs/res$k\_for_2*$trn\_trains_GA.log
done
done
