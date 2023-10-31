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
    /// 
    /// Логика взаимодействия для TestWindow.xaml
    /// </summary>
    public partial class TestWindow : Window
    {
        private int _id;
        public TestWindow(int id)
        {
            InitializeComponent();
            _id = id;
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            var context = SingletonModel.GetContext();
            var table = from rep in context.TestingReport
            where rep.id == _id
            join qr in context.QuestionsReports on rep.id equals qr.IDTestingReport
            join q in context.TestQuestions on qr.IDTestQuestions equals q.id
            select new
            {
                rep.id,
                q.Question,
                GivenAnswer = qr.Answer,
                CorrectAnswer = q.CorrectAnswer,
                Variant1 = q.AnswerVariant1,
                Variant2 = q.AnswerVariant2,
                Variant3 = q.AnswerVariant3,
                Variant4 = q.AnswerVariant4
            };
            QuestionsGrid.DataContext = table.ToList();
        }
    }
}
