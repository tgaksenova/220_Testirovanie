using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace PR30.Database
{
    static class SingletonModel
    {
        private static TestingEntities _context;

        public static TestingEntities GetContext()
        {
            return _context = _context ?? new TestingEntities();
        }
    }
}
