using System.Web;
using System.Web.Optimization;

namespace KStore
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new Bundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/site.css"));

            bundles.Add(new ScriptBundle("~/Style/ckeditor/jquery").Include(
                        "~/Areas/Style/ckeditor/ckeditor.js"));

            bundles.Add(new StyleBundle("~/Style/TinhTrangGiaoHang/css").Include(
                        "~/Content/TinhTrangGiaoHang.css"));

            bundles.Add(new StyleBundle("~/Content/datatable/jquery").Include(
                      "~/Content/datatables/dataTables.bootstrap.min.js",
                      "~/Content/datatables/jquery.dataTables.min.js"));
        }
    }
}
