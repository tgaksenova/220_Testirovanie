using PR30.Database;
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
using System.Windows.Shapes;

namespace PR30.Pages
{
    /// <summary>
    /// Логика взаимодействия для Registration.xaml
    /// </summary>
    public partial class Registration : Window
    {
        public Registration()
        {
            InitializeComponent();
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            new MainWindow().Show();
        }

        private void RegistrationButton_Click(object sender, RoutedEventArgs e)
        {
            var context = SingletonModel.GetContext();
            if (!CheckInputs(context))
            {
                return;
            }

            if (IsTeacherBox.IsChecked == true)
            {
                var teacher = new Teacher();
                teacher.LastName = SurnameInput.Text;
                teacher.Name = NameInput.Text;
                teacher.Patronymic = PatronymicInput.Text;
                context.Teacher.Add(teacher);
                var user = new Users();
                user.Login = LoginInput.Text;
                user.Password = PasswordInput.Password;
                user.IsTeacher = true;
                user.IDTeacher = context.Teacher.Max(x => x.id);
                context.Users.Add(user);
                context.SaveChanges();
            }
            else
            {
                var student = new Student();
                student.LastName = SurnameInput.Text;
                student.Name = NameInput.Text;
                student.Patronymic = PatronymicInput.Text;
                student.StudentGroup = GroupInput.Text;
                context.Student.Add(student);
                var user = new Users();
                user.Login = LoginInput.Text;
                user.Password = PasswordInput.Password;
                user.IsTeacher = false;
                user.IDStudent = context.Student.Max(x => x.NumberStudentCard);
                context.Users.Add(user);
                context.SaveChanges();
            }

            MessageBox.Show("Регистрация успешна");
            this.Close();
        }

        private bool CheckInputs(TestEntities context)
        {
            if (string.IsNullOrWhiteSpace(LoginInput.Text))
            {
                MessageBox.Show("Логин не может быть пустым!");
                return false;
            }

            if (context.Users.Any(x => x.Login == LoginInput.Text))
            {
                MessageBox.Show("Такой аккаунт уже существует");
                return false;
            }

            if (string.IsNullOrWhiteSpace(PasswordInput.Password))
            {
                MessageBox.Show("Пароль не может быть пустым!");
                return false;
            }

            if (IsTeacherBox.IsChecked == false && string.IsNullOrWhiteSpace(GroupInput.Text))
            {
                MessageBox.Show("Заполните группу!");
                return false;
            }

            if (string.IsNullOrWhiteSpace(SurnameInput.Text))
            {
                MessageBox.Show("Заполните фамилию!");
                return false;
            }

            if (string.IsNullOrWhiteSpace(NameInput.Text))
            {
                MessageBox.Show("Заполните имя!");
                return false;
            }
            return true;
        }

        private void IsTeacherBox_Click(object sender, RoutedEventArgs e)
        {
            if (IsTeacherBox.IsChecked == true)
            {
                GroupGrid.Visibility = Visibility.Hidden;
            }
            else
            {
                GroupGrid.Visibility = Visibility.Visible;
            }
        }
    }
}
