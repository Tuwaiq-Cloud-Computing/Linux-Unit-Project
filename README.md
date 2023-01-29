# Linux-Unit-Project


## Based on what you’ve learned until now , create a Bash script solve a problem of your choosing (impress us with your skills). This project must at least satisfy the following minimum requirements :
## bash script for showing the riyadh season events

### Bash script will do the following:
- Must be interactive on CLI.
- Use variables.
- Use conditions
- Use loops.

- bash script that has 2select options for the user to pick from as (visitor or employee) and based on the selection it will show information

## Example Project :  User Management System :
## project : Riyadh Season

#### Overview : A Bash script that you can use to make your user management easier. 

#### As a system administrator I should be able to do the following :
- Create a user.
- Update user info
- Delete a user.
- Create a group.
- Add user to group.
- and so on...

## team members:
- Lujean Alradhi
- Rawan Alsufyani
- Remaz Alghamdi


## code
!/bin/bash
echo "**************************************************"
echo           "Welcome to Riyadh Season "
echo              "Beyond Imagination"
echo "**************************************************"
echo "Are you ?"

Option="Visitor Employee"
select role in $Option; do
 if [ $role = "Employee" ]; then
        request="Add.employee Delete.employee Add.employee.to.group Remove.e>
        select req in $request; do
if [ $req = "Add.employee" ]; 
then
       echo "Enter the name of the employee "
       read Username

       echo "Enter the role of the employee "
       read role

       echo "Enter the expiration date "
       read eDate

       sudo useradd  -c $role $Username -e $eDate
        if [ $? -eq 0 ]; then
        echo "$Username  Employee created succssfully"
       else
        echo "Error,Try again"
        fi

if [ $role = "CEO" ]; then
sudo chown $Username /home/kali/RiyadhSeason/RiyadhSeason2.sh
if [ $? -eq 0 ]; then
        echo "$Username is the onwer "


       else
        echo "Error,Try again"
        fi
fi


elif [ $req = "Delete.employee" ];
 then
        echo "Enter the name of the employee you want to delete  "
        read deluser

        sudo userdel $deluser
        if [ $? -eq 0 ]; then
         echo "$deluser Employee deleted  succssfully"

   else
         echo "Error,Try again"
        fi
elif [ $req = "Add.employee.to.group" ]; then
        sudo groupadd CEO
        sudo groupadd Managers 
        sudo groupadd Employees 

          echo "Please write the name of the employee "
          read Ename

          echo "please write the group name "
          read Gname
          sudo gpasswd -a $Ename $Gname
        if [ $? -eq 0 ]; then
            echo "$Ename added  succssfully to $Gname group"

         else
            echo "Error,Try again"
         fi 

elif [ $req = "Remove.employee.from.group" ]; then
         echo "Please write the name of the employee "
         read Ename
echo "please write the group name "
         read Gname
         sudo gpasswd -d $Ename $Gname
if [ $? -eq 0 ]; then
            echo "$Ename removed  succssfully from $Gname group"

         else
           echo "Error,Try again"
         fi 


        fi
        done
else

select event in BLVC BUJAIRI QUIT 
do 
case $event in
 BLVC)
myArray=('This is the event and resturants in BLVC:' 'kutlet' 'public restur>
myArray[5]='fireworks'
delet=cinema
echo "${myArray[@]/$delet}"
echo "do you want to book ticket"
select ticket in yes no
do
case $ticket in
 yes)
echo "enter your name"
read name
echo "enter phone number"
read phone
echo "your ticket date 28-1-2023"
sudo useradd $name -c $phone

;;
no)
echo"no"
esac
done
;;

BUJAIRI)
myArray=('This is the events and resturants in Bujairi:' 'Brunch & cake' 'sa>
myArray[5]='fireworks'
delet=Angelina
echo "${myArray[@]/$delet}"
echo "do you want to book ticket"
select ticket in yes no
do
case $ticket in
 yes)
echo "enter your name"
read name
echo "enter phone number"
read phone
echo "your ticket date 28-1-2023"
sudo useradd $name -c $phone

;;
no)
echo"no"
esac
done
;;
quit)
break;;
*)
echo "error"
esac
done
fi

        done


#### For your project. Edit this README.md file to include your own project name, overview, user stories.
