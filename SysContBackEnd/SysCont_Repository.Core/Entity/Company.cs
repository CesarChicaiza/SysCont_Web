using SysCont_Framework.DataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace SysCont_Repository.Core.Entity
{
    public class Company:EntityBase
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public string ConnectionString { get; set; }
        public DataProvider DataProvider { get; set; }
    }
}
