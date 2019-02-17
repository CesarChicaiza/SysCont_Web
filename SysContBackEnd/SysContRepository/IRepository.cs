using SysCont_Framework.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;

namespace SysCont_Repository
{
    public interface IRepository<TEntity>
    {
        IEnumerable<TEntity> Get(Expression<Func<TEntity, bool>> filter = null,
                               Func<IQueryable<TEntity>, IOrderedQueryable<TEntity>> orderBy = null,
                               string includeProperties = "");

        TEntity GetByID(object id);

        void Insert(TEntity entity);

        void Delete(Guid id);

        void Update(TEntity entityToUpdate);
    }
}
