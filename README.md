# Linux_102


# for ConoHaVPS

## usage
LPI102用仮想マシンをCentOS7.2(64bit)をConoHaVPSのデフォルトから作る場合はprepareを実施。  
通常は新規サーバ作成追加画面から  
『保存イメージ』⇒『LPI102_Cent72_1』で構築  
『保存イメージ』⇒『LPI102_Cent72_2』で構築

##### prepare
###### conoha(CentOS72)
<pre> export gamen=`tty`; curl -s  https://raw.githubusercontent.com/dummyotsuka/ver10_102setup/master/102prepare_ConoHa_GUI_Cent72_1.sh   | sh ;  </pre>
###### conoha(CentOS68)
<pre> export gamen=`tty`; curl -s  https://raw.githubusercontent.com/dummyotsuka/ver10_102setup/master/102prepare_ConoHa_GUI_Cent72_2.sh   | sh ;  </pre>

