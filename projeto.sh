#!/bin/bash
Principal () {
echo "Exemplo ShellScript by K"
echo "-------------------"
echo "Opções"
echo
echo "1 - Tranformar nomes de arquivos"
echo "2 - Adicionar um usuário no sistema"
echo "3 - Deletar um usuário do sistema"
echo "4 - Fazer Backup dos arquivos /etc/"
echo "5 - Sair do script"
echo
echo -n "Qual a opção desejada?"
read opcao
case $opcao in 
 1)Transformar ;;
 2)Adicionar ;;
 3)Deletar ;;
 4)Backup ;;
 5) exit ;;
 *)"Opção desconhecida" ; echo ; Pricipal ;;
esac
}

Transformar() {
 echo -n "Para Maiusculo ou minusculo? (M/m)"
 read var
 if [ $var = "M" ]; then
   echo -n "Que diretório? "
   read dir
  
  for x in '/bin/ls' $dir; do
   y =`echo $x | tr '(:lower:)' '(:upper:)'`
   if [ ! -e $y ]; then
   mv $x $y
   fi
 done
elif [ $var = "m" ]; then
 echo -n "Que diretorio? "
 read dir 

 for x in `/bin/ls` $dir; do
  y=`echo $x | tr '[:upper:]' '[:lower:]'`
  if [ ! -e $y ]; then
  mv $x $y
  fi
  done

fi
}

Adicionar() {
clear echo -n "Qual o nome do usuario a se adicionar?"
read nome
adduser nome
Principal
}

Deletar() {
clear
echo -n "Qual onome do usuario a deletar?"
read nome
userdel nome
Principal
}

Backup() {
for x in `/bin/ls` /etc; do
cp -R /etc/$x /etc/$x.bck
mv /etc/$x.bck /usr/backup
done
}

Principal
