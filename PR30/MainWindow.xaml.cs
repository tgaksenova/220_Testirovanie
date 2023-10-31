using PR30.Database;
using PR30.Pages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace PR30
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void LoginInput_TextChanged(object sender, TextChangedEventArgs e)
        {
            SetVisibility(LoginInput.Text, LoginPlaceholder);
        }

        private void PasswordInput_PasswordChanged(object sender, RoutedEventArgs e)
        {
            SetVisibility(PasswordInput.Password, PasswordPlaceholder);
        }

        private void SetVisibility(string text, Label placeholder)
        {
            placeholder.Visibility = text.Length > 0 ? Visibility.Hidden : Visibility.Visible;
        }

        private void RegButton_Click(object sender, RoutedEventArgs e)
        {
            new Registration().Show();
            this.Close();
        }

        private void AuthButton_Click(object sender, RoutedEventArgs e)
        {
            if (LoginInput.Text.Length == 0)
            {
                MessageBox.Show("Логин не может быть пустым!");
                return;
            }

            var context = SingletonModel.GetContext();
            if (context.Users.Any(x => x.Login == LoginInput.Text))
            {
                var user = context.Users.Where(x => x.Login == LoginInput.Text).First();
                if (PasswordInput.Password == user.Password)
                {
                    if (user.IsTeacher)
                    {
                        new TeachersPage(user).Show();
                    }
                    else
                    {
                        new StudentsPage(user).Show();
                    }
                    this.Close();
                }
                else
                {
                    MessageBox.Show("Неправильный пароль");
                }
            }
            else
            {
                MessageBox.Show("Такого аккаунта не существует");
            }
        }
    }
}
