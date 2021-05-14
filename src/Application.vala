/*
* Copyright (c) 2011-2021 Your Organization (https://linkedin.com/saidbakr)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Said Bakr <said_fox/AT/yahoo.com>
*/
public class MyApp : Gtk.Application {
    public MyApp () {
        Object (
            application_id: "com.github.saidbakr.quick-shutdown",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }
    protected override void activate () {
        if (this.confirmActive()){
            // show confirmation box;
            this.createConfirm();
        }
        else{
            Posix.system("shutdown now");
        }
    }
    /*
    Check if confirmation message enabled or not
    */
    public bool confirmActive (){
        var file = File.new_for_path(Environment.get_home_dir ()+"/.config/com.github.saidbakr.quick-shutdown/confirm");
        if (file.query_exists()){
            return true;
        }
        else{
            return false;
        }        
    }
    /*
    Creates confirmation window.
    */
    public Object createConfirm(){       
        var window = new Gtk.Window ();
        var grid = new Gtk.Grid () {
            orientation = Gtk.Orientation.VERTICAL,
            column_spacing = 6,
            row_spacing = 6
        };
        window.add(grid);
        window.title = "Shutdown Confirmation";
        window.border_width = 10;
        window.window_position = Gtk.WindowPosition.CENTER;
        window.set_default_size (350, 80);
        window.destroy.connect (Gtk.main_quit);

        Gtk.CssProvider css_provider = new Gtk.CssProvider ();        
        css_provider.load_from_resource ("/com/github/saidbakr/quick-shutdown/src/resources/mycss.css");
        Gtk.StyleContext.add_provider_for_screen (Gdk.Screen.get_default (), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);

        var label = new Gtk.Label(null);
        var label_text = "Are you sure to turn off now?";
        label.get_style_context().add_class("ask");
        label.set_markup(label_text);

        var shutdown = new Gtk.Button.with_label ("Shutdown Now");
        shutdown.get_style_context().add_class("shutdown");
        //shutdown.
        shutdown.clicked.connect (() => {
            Posix.system("shutdown now");        
        });
        var cancel = new Gtk.Button.with_label ("Cancel");
        cancel.clicked.connect (() => {
        cancel.label = "Thank you";
        window.close();
        });

    grid.attach(label,0,0);
    grid.attach (shutdown, 0,1);
    grid.attach (cancel, 1,1);
    window.show_all ();

    Gtk.main ();
    return window;
    }
    public static int main(string[] args){
        var app = new MyApp();
        return app.run(args);
    }
} 