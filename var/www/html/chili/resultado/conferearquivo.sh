grep -vE '^((0[1-9]|[0-9]{2}) ){5}([0-9]{2}|60)$' jogos.txt |
while read -a Nums
do
    for ((i=1; i<=5; i++))
    {
        ((10#${Nums[i]} <= 10#${Nums[i-1]})) &&
        {
            echo Fora de ordem ${Nums[@]}
            break
        }
    }
done
