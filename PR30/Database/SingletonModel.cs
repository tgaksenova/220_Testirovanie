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
        private static TestEntities _context;

        public static TestEntities GetContext()
        {
            return _context = _context ?? new TestEntities();
        }
    }
}
