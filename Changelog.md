# Changelog

All notable changes to this project will be documented in this file. See the
Git log for all changes.

## 0.18.0 / 2025-02-07

* Use correct function signature for gtk_tree_path_new_from_indices ([#133] by [mvz])
* Support Ruby 3.1 through 3.4, dropping support for Ruby 3.0 ([#137] by [mvz])
* Update gir_ffi dependency to version 0.18.0 ([#138] by [mvz])

[#133]: https://github.com/mvz/gir_ffi-gtk/pull/133
[#137]: https://github.com/mvz/gir_ffi-gtk/pull/137
[#138]: https://github.com/mvz/gir_ffi-gtk/pull/138

## 0.17.0 / 2023-12-31

* Drop support for Ruby 2.7 ([#129] by [mvz])
* Depend on GirFFI 0.17.0 ([#130] by [mvz])

[mvz]: https://github.com/mvz

[#129]: https://github.com/mvz/gir_ffi-gtk/pull/129
[#130]: https://github.com/mvz/gir_ffi-gtk/pull/130

## 0.16.0 / 2022-05-21

* Drop support for Ruby 2.6 and JRuby
* Depend on GirFFI 0.16.0

## 0.15.1 / 2022-01-21

* Silence warnings about redefining initialize in FileChooserDialog override
* Depend on GirFFI 0.15.2
* Target Ruby 2.6+

## 0.15.0 / 2019-10-19

* Fix override for `Gtk::Menu#popup`
* Depend on GirFFI 0.15.0
* Target Ruby 2.4+

## 0.14.1 / 2018-12-19

* Override `Gtk::Widget#get_events`, `Gtk::Widget#set_events` and
  `Gtk::Widget#add_events` methods to take and return `EventMask` values
  instead of bare `int`s.
* Fix license in gemspec; it's LGPL 2.1 or later

## 0.14.0 / 2018-09-27

* Depend on GirFFI 0.14.0
* Add override for `Gtk::Dialog.new_with_buttons`
* Add override for `Gtk::FileChooserDialog.new`

## 0.13.1 / 2018-09-24

* Depend on GirFFI 0.13.1
* Add overrides for some methods that take a `Gtk::IconSize` parameter

## 0.13.0 / 2018-09-08

* Drop support for Ruby 2.1
* Depend on GirFFI 0.13.0

## 0.12.1 / 2018-05-31

* Restore support for Ruby 2.1 and 2.2

## 0.12.0 / 2016-10-16

* Depend on GirFFI 0.12.0
* Drop support for Ruby versions below 2.3

## 0.11.0 / 2016-10-16

* Depend on GirFFI 0.11.0

## 0.10.0 / 2016-03-23

* Depend on GirFFI 0.10.0

## 0.9.0 / 2016-01-21

* Propagate exceptions from callbacks during event loops
* Add new overrides:
  * for `Gtk::Container`
  * for `Gtk::TreeViewColumn`
  * for `Gtk::TreeStore`
  * for `Gtk::ListStore`
  * for `Gtk::TargetEntry.new`
  * for `GtkBuilder#connect_signals`
* Depend on GirFFI 0.9.0
* Use GirFFI's new way of handling callback parameters and user data and
  destroy notifier handling

## 0.8.1 / 2015-12-02

* Add override for `Gtk::RadioAction#set_group`
* Add `Gtk::Application` example (thanks, cedlemo)
* Add and update `WebKit` examples

## 0.8.0 / 2015-09-20

* Update dependency on GirFFI
* Update constructor overrides to match GirFFI's new constructor structure

## 0.7.2 / 2014-09-22

* Require at least Ruby 1.9.3
* Add overrides for `Gtk::TreePath`
* Add overrides for `Gtk::MessageDialog.new`
* Make other Ruby threads run during `Gtk.main` loop
* Update dependencies
* Update examples

## 0.7.1 / 2014-03-25

* Fix `Gtk::Builder#connect_signals_full` by updating dependency on GirFFI
* Only override `Gtk::Menu#popup` if needed
* Test both Gtk+ 2 and 3
* Provide constructors for `Gtk::RadioButton` if needed

## 0.7.0 / 2014-01-11

* Update dependency on GirFFI

## 0.6.0 / 2013-06-09

* Update dependency on GirFFI

## 0.5.0 / 2013-01-19

* Update dependency on GirFFI

## 0.4.1 / 2012-09-22

* New `TreeView` example (thanks, Kasper Johansen)
* Implement `Gtk::Menu#popup`
* Update dependency on GirFFI so interfaces can wrap pointers

## 0.4.0 / 2012-08-24

* Initial release
