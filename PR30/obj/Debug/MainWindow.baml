   M S B A M L   `   `   `  ����?  ;PR30, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:PR30PR30  5   	       PR30.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   $localclr-namespace:PR30     5   	     � Title$  
MainWindow��5   	   $	��450��6   $	��800��6)    � 
ResizeMode$ NoResize=�65   .��5	      �  � RowDefinitions 5
   
   �� 5      �� 5      �� 5      �� 5      .+�5   
   �� -   5         ��Name$ 
LoginInput��5         	MyTextBox#��[  5      $��30(�5      6    �� 5   
   -   5         ��Name$ LoginPlaceholder��5        Placeholder#��[ 5      $��
Логин��5      G� 5   
   -   5         G�Name$ PasswordInput��5      $��1��5        MyPasswordBox#��[ 5      $��30(�5      6$   �� 5   
   -   5        $ PasswordPlaceholder��5      $��1��5      #��[ 5      $��Пароль��5      �� 5!   
   -   5         ��Name$ 
AuthButton��5!      $��2��5"        MyButton#��[ 5#      $"��Авторизоваться��5$      $��20q�5%      $��30(�5&      $	��350��5'      6   �� 5(   
   -   5        $ 	RegButton��5(      $��3��5)      #��[ 5*      $*��$Зарегистрироваться��5+      $��30(�5,      $��20q�5-      $	��350��5.      6   5/      50      