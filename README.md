# Linux_102


# for ConoHaVPS

## usage(GUIあり)
LPI102用仮想マシンをCentOS6.8(64bit)をConoHaVPSのデフォルトから作る場合はprepareを実施。  
通常は新規サーバ作成追加画面から『保存イメージ』⇒『LPI101_image_Cent68_GUI』で構築

##### prepare
<pre> export gamen=`tty`; curl -s  https://raw.githubusercontent.com/dummyotsuka/102setup/master/102prepare_ConoHa_GUI_Cent68.sh   | sh ;  </pre>
<pre> export gamen=`tty`; curl -s  https://raw.githubusercontent.com/dummyotsuka/102setup/master/102prepare_ConoHa_GUI_Cent72.sh   | sh ;  </pre>

##### check_conoha
<pre> export gamen=`tty`; curl -s    https://raw.githubusercontent.com/dummyotsuka/102setup/master/102_check_ConoHa_GUI.sh   | sh </pre>
