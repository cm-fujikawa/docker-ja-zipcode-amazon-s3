#!/bin/sh

mkdir zipcode
cd zipcode
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/01hokkai.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/02aomori.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/03iwate.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/04miyagi.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/05akita.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/06yamaga.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/07fukush.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/08ibarak.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/09tochig.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/10gumma.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/11saitam.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/12chiba.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/13tokyo.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/14kanaga.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/15niigat.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/16toyama.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/17ishika.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/18fukui.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/19yamana.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/20nagano.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/21gifu.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/22shizuo.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/23aichi.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/24mie.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/25shiga.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/26kyouto.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/27osaka.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/28hyogo.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/29nara.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/30wakaya.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/31tottor.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/32shiman.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/33okayam.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/34hirosh.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/35yamagu.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/36tokush.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/37kagawa.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/38ehime.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/39kochi.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/40fukuok.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/41saga.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/42nagasa.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/43kumamo.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/44oita.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/45miyaza.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/46kagosh.zip
wget https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/47okinaw.zip
find . -name '*.zip' | xargs -L1 unzip
rename 's/.CSV/.csv/;' *.CSV
find . -name '*.csv' | xargs -L1 nkf -S -w --in-place
find . -name '*.csv' | xargs -L1 gzip
rm *.zip
aws s3 mb s3://$BUCKET_NAME
aws s3 sync ../zipcode s3://$BUCKET_NAME/zipcode/kogaki_`date '+%Y%m%d'`/
