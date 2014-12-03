# only run this on relaxed input structures

if [[ $# < 1 ]]; then 
  echo 'usage: bash systematic-matcher.bash <scaf>'
  exit 1
fi

for p in $( cat $1.pos ); do
  for d in HIS; do
    echo "REMARK 0 MATCH TEMPLATE X NAX 1 MATCH MOTIF Y OXI 1 1 1" > t
    echo "REMARK 0 MATCH TEMPLATE A" $d $p "MATCH MOTIF Y OXI 1 2 1" >> t
    gawk 'BEGIN{FIELDWIDTHS="13 2 2 3 2 4 54"}{if($6+0=="'${p}'") \
          {if($2=="N "||$2=="CA"||$2=="C "||$2=="O ") \
          {$4="'${d}'"; print $1 $2 $3 $4 $5 $6 $7} \
          else next}else print $0}' scaf-2a.pdb >> t
    cat t > $1-$p-his.pdb && rm t
  done
done
