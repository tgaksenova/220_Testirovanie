using PR30.Database;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Runtime.Remoting.Contexts;
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
    /// Логика взаимодействия для StudentsPage.xaml
    /// </summary>
    public partial class StudentsPage : Window
    {
        private Users _user;
        public StudentsPage(Users user)
        {
            InitializeComponent();
            _user = user;
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            var context = SingletonModel.GetContext();
            var table = from rep in context.TestingReport
                        where rep.IDStudent == _user.IDStudent
                        join qr in context.QuestionsReports on rep.id equals qr.IDTestingReport
                        group rep by rep.id into grep
                        select new
                        {
                            TestID = grep.Key,
                            RightAnswers = context.QuestionsReports.Where(x=> x.IDTestingReport == grep.Key)
                                .Where(x => x.Answer == context.TestQuestions.Where(q => q.id == x.IDTestQuestions).FirstOrDefault().CorrectAnswer).Count(),
                            QuestionsCount = grep.Count()
                        };
            TestTable.ItemsSource = table.ToList();
        }

        private void Export_Click(object sender, RoutedEventArgs e)
        {
            using (var file = new StreamWriter($"export-student{_user.IDStudent}.txt", false))
            {
                StringBuilder sb = new StringBuilder();
                foreach (var item in TestTable.Items)
                {
                    sb.AppendLine(item.ToString());
                }
                file.Write(sb.ToString());
            }
            MessageBox.Show("Экспорт завершён");
        }

        private void View_Click(object sender, RoutedEventArgs e)
        {
            if (TestTable.SelectedValue != null)
            {
                var id = (int)TestTable.SelectedValue.GetType().GetProperty("TestID").GetValue(TestTable.SelectedValue, null);
                new TestWindow(id).Show();
            }
        }
    }
}
