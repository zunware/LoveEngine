echo "";
echo "Love Engine Tests:";
echo ""; busted .;
luacov ; echo "";
tail -n 2 luacov.report.out; echo "";
