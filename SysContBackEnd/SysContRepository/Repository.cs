using SysCont_Repository.Driver;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;

namespace SysCont_Repository
{
    public class Repository<TEntity> : IRepository<TEntity> where TEntity : class
    {
        Driver<TEntity> driver;

        public Repository()
        {
            driver = new Driver<TEntity>();
        }

        public IEnumerable<TEntity> Get(Expression<Func<TEntity, bool>> filter = null,
                                        Func<IQueryable<TEntity>, IOrderedQueryable<TEntity>> orderBy = null,
                                        string includeProperties = "")
        {
            return driver.Get(filter, orderBy, includeProperties);
        }


        public TEntity GetByID(object id)
        {
            return driver.GetByID(id);
        }

        public void Insert(TEntity entity)
        {
            driver.Insert(entity);
        }

        public void Delete(Guid id)
        {
            driver.Delete(id);
        }

        public void Update(TEntity entityToUpdate)
        {
            driver.Update(entityToUpdate);
        }


    }
}
