for filename in *.xpm; do
convert $filename -fuzz 1% -fill '#c3c3c3' -opaque '#c0c0c0' $filename 
done
