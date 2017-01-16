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
    public class OptionController : ApiController
    {
        ModelTriviaDBContainer db = new ModelTriviaDBContainer();
        [HttpGet]
        public IHttpActionResult GetOption()
        {
            try
            {
                return Ok(db.OptionSet.ToList());
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpPost]
        public IHttpActionResult InsertOption(Option option)
        {
            try
            {
                db.Entry(option).State = System.Data.Entity.EntityState.Added;
                db.SaveChanges();
                return Ok(option);
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpPost]
        public IHttpActionResult UpdateOption(Option option)
        {
            try
            {
                db.Entry(option).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return Ok(option);
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpPost]
        public IHttpActionResult DeleteOption(Option option)
        {
            try
            {
                db.Entry(option).State = System.Data.Entity.EntityState.Deleted;
                db.SaveChanges();
                return Ok(option);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
