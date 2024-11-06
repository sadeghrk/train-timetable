g++ -o a4.out Pr_experiments_diff_trains_RS.cpp -w

for trn in {3..3}; do
for k in {1..10}; do
./a4.out $k $trn > logs/res$k\_for_2*$trn\_trains_RS.log
done
done
