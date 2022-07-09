for filename in *.png; do
convert $filename -fuzz 1% -fill '#c3c3c3' -opaque '#c3c7cb' $filename 
done
