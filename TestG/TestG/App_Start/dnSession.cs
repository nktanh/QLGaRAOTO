using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using TestG.Models;

namespace TestG.App_Start
{
    public class dnSession : AuthorizeAttribute
    {
        public int idQuyen { set; get; }
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            ChiTietUser user = (ChiTietUser)HttpContext.Current.Session["user"];
            if (user != null)
            {
               
                #region kiemtraquyen
                DA_QLGarageEntities db = new DA_QLGarageEntities();
                var dem = db.PhanQuyens.Count(n => n.IDUser == user.IDNguoiDung & n.IDQuyen == idQuyen);
                if (dem == 0)
                {
                    return;

                }
                else
                {
                    var returnURL = filterContext.RequestContext.HttpContext.Request.RawUrl;
                    filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new
                    {
                        controller = "User",
                        action = "KhongTheTruyCap",
                        area = "adminarea",
                        returnURL = returnURL.ToString()
                    }));
                }
                #endregion
                return;
            }
            else
            {
                var returnURL = filterContext.RequestContext.HttpContext.Request.RawUrl;
                filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new
                {
                    controller = "User",
                    action = "DangNhap",
                    area = "adminarea",
                    returnURL = returnURL.ToString()
                }));
                
                
            }
            
            
        }
    }
}