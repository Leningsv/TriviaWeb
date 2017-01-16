using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using TriviaWeb.Models.DB;

namespace TriviaWeb.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class CategoryController : ApiController
    {
        ModelTriviaDBContainer db = new ModelTriviaDBContainer();
        [HttpGet]
        public IHttpActionResult GetCategory()
        {
            try
            {
                return Ok(db.CategorySet.ToList());
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpPost]
        public IHttpActionResult InsertCategory(Category category)
        {
            try
            {
                db.Entry(category).State = System.Data.Entity.EntityState.Added;
                db.SaveChanges();
                return Ok(category);
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpPost]
        public IHttpActionResult UpdateCategory(Category category)
        {
            try
            {
                db.Entry(category).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return Ok(category);
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpPost]
        public IHttpActionResult DeleteCategory(Category category)
        {
            try
            {
                db.Entry(category).State = System.Data.Entity.EntityState.Deleted;
                db.SaveChanges();
                return Ok(category);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
