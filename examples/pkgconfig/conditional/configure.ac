dnl SPDX-FileCopyrightText: 2009- Diego Elio Pettenò
dnl
dnl SPDX-License-Identifier: MIT

AC_INIT([test], [0.1])

m4_include([pkg.m4])

AC_ARG_WITH([gtk], AS_HELP_STRING([--with-gtk], [Build with the GTK+ interface]))

if test "x$with_gtk" = "xyes"; then
   PKG_CHECK_MODULES([GTK], [gtk+-2.0])
fi

PKG_CHECK_MODULES([GLIB], [glib-2.0])
