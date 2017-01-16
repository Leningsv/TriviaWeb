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
    public class CompanyController : ApiController
    {
        ModelTriviaDBContainer db = new ModelTriviaDBContainer();
        [HttpPost]
        public IHttpActionResult GetCompanyById(Company company)
        {
            try
            {
                return Ok(db.CompanySet.Where(item => item.Id == company.Id).FirstOrDefault());
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpPost]
        public IHttpActionResult InsertCompany(Company company)
        {
            try
            {
                db.Entry(company).State = System.Data.Entity.EntityState.Added;
                db.SaveChanges();
                return Ok(company);
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpPost]
        public IHttpActionResult UpdateCompany(Company company)
        {
            try
            {
                db.Entry(company).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return Ok(company);
            }
            catch (Exception)
            {

                throw;
            }
        }
        [HttpPost]
        public IHttpActionResult DeleteCompany(Company company)
        {            
            try
            {
                db.Entry(company).State = System.Data.Entity.EntityState.Deleted;
                db.SaveChanges();
                return Ok(company);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
