Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1F087199CEB
	for <lists+dm-devel@lfdr.de>; Tue, 31 Mar 2020 19:31:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585675910;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0myY7DwSA/Od/DguyXvzjmevJuaQ/bv0RNIHaX1TB2g=;
	b=Ewsf0Og090aX3+oJ5j78i91zclcuD6HgHo3K/HEwIBhDZfxFhUhV/zVpJaM09wCSEVemZ9
	wCTpy4MxFWxq/WbR/5ULyi/7VJNnqriBLuqjWGL3ZdPsjIdB/Gn2tVF1FaMVbCY1qUIJWj
	+ECmvgif4vWlnxjOKppjaYsHHMuh67c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-5YHASbTCO2ybLjMFOC4b-w-1; Tue, 31 Mar 2020 13:31:47 -0400
X-MC-Unique: 5YHASbTCO2ybLjMFOC4b-w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 001BA1005509;
	Tue, 31 Mar 2020 17:31:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A32FE5D9C5;
	Tue, 31 Mar 2020 17:31:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1DBD486C04;
	Tue, 31 Mar 2020 17:31:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02VHVAdu027470 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 31 Mar 2020 13:31:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AFC7960BE1; Tue, 31 Mar 2020 17:31:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3852E60BE0;
	Tue, 31 Mar 2020 17:31:07 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 02VHV5jP005898; 
	Tue, 31 Mar 2020 12:31:05 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 02VHV4TD005897;
	Tue, 31 Mar 2020 12:31:04 -0500
Date: Tue, 31 Mar 2020 12:31:03 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20200331173103.GI17313@octiron.msp.redhat.com>
References: <1585620055-27112-1-git-send-email-bmarzins@redhat.com>
	<1585620055-27112-4-git-send-email-bmarzins@redhat.com>
	<1e138c8f609a34f7fc6cc244f7516797c5e97a2b.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <1e138c8f609a34f7fc6cc244f7516797c5e97a2b.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [RFC Patch 3/3] multipath: add libmpathvalid library
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Mar 31, 2020 at 03:38:25PM +0000, Martin Wilck wrote:
> On Mon, 2020-03-30 at 21:00 -0500, Benjamin Marzinski wrote:
> > This library allows other programs to check if a path should be
> > claimed
> > by multipath.  Currently, it only includes one function,
> > mpath_is_path(), which takes a device name, mode to for checking the
> > path, and an optional info structure, to return the wwid. The modes
> > work
> > mostly like they do for "multipath -c/-u", with a few exceptions.
> >=20
> > 1. If a device is currently multipathed, it is always VALID. This
> > perhaps should be true for the existing path valid code.
>=20
> AFAICS, this is already the case, except if:
>=20
>  1 WWID_IS_FAILED is set, i.e. dm_addmap() failed to set up
>    the multipath with this WWID last time we tried. In this case it's
>    unlikely that the path is currently multipathed. But there may be
>    some corner case in which your new code would return "valid"
>    while the current code would not; possibly if someone set up a
>    multipath device with "dmsetup" directly, or because of some race
>    condition. I just realized that we don't check for -EBUSY when we
>    create a map...
>=20
>    I agree that perhaps the "is_multipath" test should be done before
>    the "failed" test in multipath -u, too.
>=20
>  2 ignore_wwids is off, and check_wwids_file returned a negative
>    result. IMO this logic is correct. But you are the inventor of
>    the wwids file, so fine with me to change it.
>  =20
> And also if multipathd is neither running nor enabled, but see below.

See below for my thoughts on its placement

>=20
> >=20
> > 2. There is no seperate "on" mode. It is instead treated like
> > "smart".
> > This is because the library only looks at a single path, so it can
> > only
> > say that a device could be multpathed, if there was another path.  It
> > is
> > the caller's job to check if another path exists, or to wait for
> > another
> > path appear.
>=20
> I'm not sure if I like this. Returning "no" for the first path and
> "yes" for the second and later paths is exactly how
> "find_multipaths=3Dyes" is supposed to behave. If that's not useful for
> an application, the application should choose a different mode; and
> that's what I believe SID should do (assuming that SID will be the main
> / only user of this API for some time).


SID just wants to be able to look at one path at a time.  It will be
storing the information from previous path runs, so it will be able to
check if there are other paths with that wwid.  I really don't want to
run coalesce_paths in the library, to search repeatedly for all the
paths. It's completely unnecessary, since the information will have
already been gotten by previous calls to the library.

To deal with SID, I could have the function take an array of path_info
structures holding all the known wwids. This would allow the function to
return "No" for the first path in the "find_multipaths=3Dyes" case.
However, this would make the library worse for use by "multipath -u",
since multipath would have to gather the existing path wwids before it
knew if it needed them.

Assuming we are moving the main part of this into libmultipath, I could
make that run in two modes. One would be like it currently works and not
require the array of wwids, which would be for the "multipath -u" code.
The other would require the array, and that would be what libmpathvalid
used. Perhaps something as simply as passing -1 for the array length
could mean make no assumptions about other paths, and return "maybe", if
this path needs a second path in order to be claimed. Then the
"multipath -u" could run coalesce_paths() later, if necessary.

> >=20
> > 3. The library does check if there already is an existing multipath
> > device with the same wwid, and if so, will declare the path valid.
>=20
> What if there are other paths, not multipathed (yet) but with the same
> wwid as the path in question? The current code checks that by calling
> coalesce_paths() in "dry-run" mode, which would cover both this case
> and your case 3.
>=20
>=20
> >=20
> > In order to act more library-like, libmpathvalid doesn't set its own
> > device-mapper log functions. It leaves this to the caller. It
> > currently
> > keeps condlog() from printing anything, but should eventually include
> > a
> > function to allow the caller set the logging. It also uses a
> > statically
> > compiled version of libmultipath, both to keep that library from
> > polluting the namespace of the caller, and to avoid the caller
> > needing
> > to set up the variables and functions (like logsink, and
> > get_multipath_config) that it expects.
>=20
>=20
> All fair, but I'd prefer a solution where we use as much common code
> as possible, to avoid bit rot of either code path in the future. Your
> new function has the advantage to be much better readable than the
> current code in multipath/main.c. Maybe we can find a way to use it
> from "multipath -u"? The mentioned semantic changes are minor and could
> be resolved (not sure about the coalesce_paths() call, I guess you had
> a reason to skip it).
>=20
> The namespace issue could be fixed by using=20
> "-fvisibility=3Dhidden" and using explicit visibility attributes for
> those functions we want to export. The logsink and get_multipath_config
> issues should be solvable by using a sane default implementation and
> allowing applications to change it.
>=20
> Both would be improvements for libmultipath that we should have made
> long ago.

Having libmultipath store logsink and get_multipath_config, and making
getter and setter functions would be great. But I'm worried that making
that change might mess with current users of libmpathpersist.

There are still a number of functions that multipath, multipathd, and
libmpathpersist need from libmultipath, that libmpathvalid doesn't, but
-fvisibility=3Dhidden would fix a large part of my dislike with the
namesapce polution. I'm still not crazy about telling people to link
against a library with a number of exposed, undocumented functions, but
we already been doing it for a while with libmpathpersist.

> >=20
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > ---
> >  Makefile                            |   1 +
> >  Makefile.inc                        |   1 +
> >  libmpathvalid/Makefile              |  38 +++++++
> >  libmpathvalid/libmpathvalid.version |   6 +
> >  libmpathvalid/mpath_valid.c         | 171
> > ++++++++++++++++++++++++++++
> >  libmpathvalid/mpath_valid.h         |  53 +++++++++
> >  libmultipath/Makefile               |   1 +
> >  libmultipath/devmapper.c            |  49 ++++++++
> >  libmultipath/devmapper.h            |   1 +
> >  9 files changed, 321 insertions(+)
> >  create mode 100644 libmpathvalid/Makefile
> >  create mode 100644 libmpathvalid/libmpathvalid.version
> >  create mode 100644 libmpathvalid/mpath_valid.c
> >  create mode 100644 libmpathvalid/mpath_valid.h
> >=20
> > diff --git a/Makefile b/Makefile
> > index 1dee3680..462d6655 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -9,6 +9,7 @@ BUILDDIRS :=3D \
> >  =09libmultipath/checkers \
> >  =09libmultipath/foreign \
> >  =09libmpathpersist \
> > +=09libmpathvalid \
> >  =09multipath \
> >  =09multipathd \
> >  =09mpathpersist \
> > diff --git a/Makefile.inc b/Makefile.inc
> > index d4d1e0dd..7e0e8203 100644
> > --- a/Makefile.inc
> > +++ b/Makefile.inc
> > @@ -66,6 +66,7 @@ libdir=09=09=3D $(prefix)/$(LIB)/multipath
> >  unitdir=09=09=3D $(prefix)/$(SYSTEMDPATH)/systemd/system
> >  mpathpersistdir=09=3D $(TOPDIR)/libmpathpersist
> >  mpathcmddir=09=3D $(TOPDIR)/libmpathcmd
> > +mpathvaliddir=09=3D $(TOPDIR)/libmpathvalid
> >  thirdpartydir=09=3D $(TOPDIR)/third-party
> >  libdmmpdir=09=3D $(TOPDIR)/libdmmp
> >  nvmedir=09=09=3D $(TOPDIR)/libmultipath/nvme
> > diff --git a/libmpathvalid/Makefile b/libmpathvalid/Makefile
> > new file mode 100644
> > index 00000000..5fc97022
> > --- /dev/null
> > +++ b/libmpathvalid/Makefile
> > @@ -0,0 +1,38 @@
> > +include ../Makefile.inc
> > +
> > +SONAME =3D 0
> > +DEVLIB =3D libmpathvalid.so
> > +LIBS =3D $(DEVLIB).$(SONAME)
> > +
> > +CFLAGS +=3D $(LIB_CFLAGS) -I$(multipathdir) -I$(mpathcmddir)
> > +
> > +LIBDEPS +=3D -lpthread -ldevmapper -ldl -L$(multipathdir) \
> > +=09   -lmultipath_nonshared -L$(mpathcmddir) -lmpathcmd -ludev
> > +
> > +OBJS =3D mpath_valid.o
> > +
> > +all: $(LIBS)
> > +
> > +$(LIBS): $(OBJS)
> > +=09$(CC) $(LDFLAGS) $(SHARED_FLAGS) -Wl,-soname=3D$@ -o $@ $(OBJS)
> > $(LIBDEPS) -Wl,--version-script=3Dlibmpathvalid.version
> > +=09$(LN) $(LIBS) $(DEVLIB)
> > +
> > +install: $(LIBS)
> > +=09$(INSTALL_PROGRAM) -m 755 -d $(DESTDIR)$(syslibdir)
> > +=09$(INSTALL_PROGRAM) -m 755 $(LIBS)
> > $(DESTDIR)$(syslibdir)/$(LIBS)
> > +=09$(LN) $(LIBS) $(DESTDIR)$(syslibdir)/$(DEVLIB)
> > +=09$(INSTALL_PROGRAM) -m 755 -d $(DESTDIR)$(includedir)
> > +=09$(INSTALL_PROGRAM) -m 644 mpath_valid.h $(DESTDIR)$(includedir)
> > +
> > +uninstall:
> > +=09$(RM) $(DESTDIR)$(syslibdir)/$(LIBS)
> > +=09$(RM) $(DESTDIR)$(syslibdir)/$(DEVLIB)
> > +=09$(RM) $(DESTDIR)$(includedir)/mpath_valid.h
> > +
> > +clean: dep_clean
> > +=09$(RM) core *.a *.o *.so *.so.* *.gz
> > +
> > +include $(wildcard $(OBJS:.o=3D.d))
> > +
> > +dep_clean:
> > +=09$(RM) $(OBJS:.o=3D.d)
> > diff --git a/libmpathvalid/libmpathvalid.version
> > b/libmpathvalid/libmpathvalid.version
> > new file mode 100644
> > index 00000000..e8967951
> > --- /dev/null
> > +++ b/libmpathvalid/libmpathvalid.version
> > @@ -0,0 +1,6 @@
> > +MPATH_1.0 {
> > +=09global:
> > +=09=09mpath_is_path;
> > +=09local:
> > +=09=09*;
> > +};
> > diff --git a/libmpathvalid/mpath_valid.c
> > b/libmpathvalid/mpath_valid.c
> > new file mode 100644
> > index 00000000..3d96c32f
> > --- /dev/null
> > +++ b/libmpathvalid/mpath_valid.c
> > @@ -0,0 +1,171 @@
> > +#include <stdio.h>
> > +#include <stdint.h>
> > +#include <libdevmapper.h>
> > +#include <libudev.h>
> > +#include <errno.h>
> > +
> > +#include "devmapper.h"
> > +#include "structs.h"
> > +#include "util.h"
> > +#include "config.h"
> > +#include "discovery.h"
> > +#include "wwids.h"
> > +#include "sysfs.h"
> > +#include "mpath_cmd.h"
> > +#include "mpath_valid.h"
> > +
> > +struct udev *udev;
> > +int logsink =3D -1;
> > +static struct config default_config =3D { .verbosity =3D -1 };
> > +static struct config *multipath_conf;
> > +
> > +struct config *get_multipath_config(void)
> > +{
> > +=09return (multipath_conf)? multipath_conf : &default_config;
> > +}
> > +
> > +void put_multipath_config(__attribute__((unused))void *conf)
> > +{
> > +=09/* Noop */
> > +}
> > +
> > +static int get_conf_mode(struct config *conf)
> > +{
> > +=09if (conf->find_multipaths =3D=3D FIND_MULTIPATHS_ON ||
> > +=09    conf->find_multipaths =3D=3D FIND_MULTIPATHS_SMART)
> > +=09=09return MPATH_SMART;
> > +=09if (conf->find_multipaths =3D=3D FIND_MULTIPATHS_GREEDY)
> > +=09=09return MPATH_GREEDY;
> > +=09return MPATH_STRICT;
> > +}
> > +
> > +
> > +/*
> > + * Return
> > + *  2: possible path (only in MPATH_GREEDY mode)
> > + *  1: mpath path
> > + *  0: not mpath path
> > + * -1: Failure
> > + */
> > +int
> > +mpath_is_path(const char *name, unsigned int mode, struct mpath_info
> > *info)
> > +{
> > +=09struct config *conf;
> > +=09struct path * pp;
> > +=09int r =3D MPATH_IS_ERROR;
> > +=09int fd =3D -1;
> > +=09unsigned int version[3];
> > +=09bool already_multipathed =3D false;
> > +
> > +=09if (info)
> > +=09=09memset(info, 0, sizeof(struct mpath_info));
> > +
> > +=09if (!name || mode >=3D MPATH_MAX_MODE)
> > +=09=09return r;
> > +
> > +=09skip_libmp_dm_init();
> > +=09udev =3D udev_new();
> > +=09if (!udev)
> > +=09=09goto out;
> > +=09conf =3D load_config(DEFAULT_CONFIGFILE);
> > +=09if (!conf)
> > +=09=09goto out_udev;
> > +=09conf->verbosity =3D -1;
> > +=09if (mode =3D=3D MPATH_DEFAULT)
> > +=09=09mode =3D get_conf_mode(conf);
> > +
> > +=09if (dm_prereq(version))
> > +=09=09goto out_config;
> > +=09memcpy(conf->version, version, sizeof(version));
> > +=09multipath_conf =3D conf;
> > +
> > +=09pp =3D alloc_path();
> > +=09if (!pp)
> > +=09=09goto out_config;
> > +
> > +=09if (safe_sprintf(pp->dev, "%s", name))
> > +=09=09goto out_path;
> > +
> > +=09if (sysfs_is_multipathed(pp, true)) {
> > +=09=09if (!info || pp->wwid[0] !=3D '\0') {
> > +=09=09=09r =3D MPATH_IS_VALID;
> > +=09=09=09goto out_path;
> > +=09=09}
> > +=09=09already_multipathed =3D true;
> > +=09}
> > +
> > +=09fd =3D __mpath_connect(1);
> > +=09if (fd < 0) {
> > +=09=09if (errno !=3D EAGAIN && !systemd_service_enabled(name))
> > {
> > +=09=09=09r =3D MPATH_IS_NOT_VALID;
> > +=09=09=09goto out_path;
> > +=09=09}
> > +=09} else
> > +=09=09mpath_disconnect(fd);
>=20
> So "multipathd not running" takes precedence over "is already
> multipathed"? That contradicts your statement 1. above. Would SID
> (or any other external application using your API) really require
> multipathd?

I've waffled on this.  SID will require multipathd, but if a device
actually is part of a multipath device, then the reality of the
situation is that it has been claimed by multipath, and there will be
things that won't be able to use it.  For instance, LVM will not be able
to be set up on a partition, and filesystems won't mount.  So, should
the code return "not a multipath path" for a device that IS a multipath
path, just because it shouldn't be, especially when there is nothing
that is going to un-multipath it.

I think that the best answer is to report that the path has been, in
fact, claimed by multipath, even if we don't know why, or think it
shouldn't be.  But this is a corner case, and I'm open to being
convinced otherwise.
=20
> > +
> > +=09pp->udev =3D udev_device_new_from_subsystem_sysname(udev,
> > "block", name);
> > +=09if (!pp->udev)
> > +=09=09goto out_path;
> > +
> > +=09r =3D pathinfo(pp, conf, DI_SYSFS | DI_WWID | DI_BLACKLIST);
> > +=09if (r) {
> > +=09=09if (r =3D=3D PATHINFO_SKIPPED)
> > +=09=09=09r =3D MPATH_IS_NOT_VALID;
> > +=09=09else
> > +=09=09=09r =3D MPATH_IS_ERROR;
> > +=09=09goto out_path;
> > +=09}
> > +
> > +=09if (pp->wwid[0] =3D=3D '\0') {
> > +=09=09r =3D MPATH_IS_NOT_VALID;
> > +=09=09goto out_path;
> > +=09}
> > +
> > +=09if (already_multipathed)
> > +=09=09goto out_path;
> > +
> > +=09if (dm_is_mpath_uuid(pp->wwid) =3D=3D 1) {
> > +=09=09r =3D MPATH_IS_VALID;
> > +=09=09goto out_path;
> > +=09}
> > +
> > +=09r =3D is_failed_wwid(pp->wwid);
> > +=09if (r !=3D WWID_IS_NOT_FAILED) {
> > +=09=09if (r =3D=3D WWID_IS_FAILED)
> > +=09=09=09r =3D MPATH_IS_NOT_VALID;
> > +=09=09else
> > +=09=09=09r =3D MPATH_IS_ERROR;
> > +=09=09goto out_path;
> > +=09}
> > +
> > +=09if (mode =3D=3D MPATH_GREEDY) {
> > +=09=09r =3D MPATH_IS_VALID;
> > +=09=09goto out_path;
> > +=09}
> > +
> > +=09if (check_wwids_file(pp->wwid, 0) =3D=3D 0) {
> > +=09=09r =3D MPATH_IS_VALID;
> > +=09=09goto out_path;
> > +=09}
> > +
> > +=09if (mode =3D=3D MPATH_STRICT) {
> > +=09=09r =3D MPATH_IS_NOT_VALID;
> > +=09=09goto out_path;
> > +=09}
> > +
> > +=09/* mode =3D=3D SMART */
> > +=09r =3D MPATH_IS_MAYBE_VALID;
> > +
> > +out_path:
> > +=09if (already_multipathed)
> > +=09=09r =3D MPATH_IS_VALID;
> > +=09if (info && (r =3D=3D MPATH_IS_VALID || r =3D=3D MPATH_IS_MAYBE_VAL=
ID))
> > +=09=09strlcpy(info->wwid, pp->wwid, 128);
> > +=09free_path(pp);
> > +out_config:
> > +=09free_config(conf);
> > +out_udev:
> > +=09udev_unref(udev);
> > +out:
> > +=09return r;
> > +}
> > diff --git a/libmpathvalid/mpath_valid.h
> > b/libmpathvalid/mpath_valid.h
> > new file mode 100644
> > index 00000000..b9e420a8
> > --- /dev/null
> > +++ b/libmpathvalid/mpath_valid.h
> > @@ -0,0 +1,53 @@
> > +/*
> > + * Copyright (C) 2015 Red Hat, Inc.
> > + *
> > + * This file is part of the device-mapper multipath userspace tools.
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU Lesser General Public
> > License
> > + * as published by the Free Software Foundation; either version 2
> > + * of the License, or (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU Lesser General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU Lesser General Public
> > License
> > + * along with this program.  If not, see <
> > http://www.gnu.org/licenses/>;.
> > + */
> > +
> > +#ifndef LIB_MPATH_VALID_H
> > +#define LIB_MPATH_VALID_H
> > +
> > +#ifdef __cpluscplus
> > +extern "C" {
> > +#endif
> > +
> > +enum mpath_valid_mode {
> > +=09MPATH_DEFAULT,
> > +=09MPATH_STRICT,
> > +=09MPATH_SMART,
> > +=09MPATH_GREEDY,
> > +=09MPATH_MAX_MODE,  /* used only for bounds checking */
> > +};
> > +
> > +enum mpath_valid_result {
> > +=09MPATH_IS_ERROR =3D -1,
> > +=09MPATH_IS_NOT_VALID,
> > +=09MPATH_IS_VALID,
> > +=09MPATH_IS_MAYBE_VALID,
> > +};
> > +
> > +struct mpath_info {
> > +=09char wwid[128];
> > +};
> > +
> > +int mpath_is_path(const char *name, unsigned int mode, struct
> > mpath_info *info);
> > +
> > +
> > +#ifdef __cplusplus
> > +}
> > +#endif
> > +#endif /* LIB_PATH_VALID_H */
> > +
> > diff --git a/libmultipath/Makefile b/libmultipath/Makefile
> > index ad690a49..7e2c00cf 100644
> > --- a/libmultipath/Makefile
> > +++ b/libmultipath/Makefile
> > @@ -69,6 +69,7 @@ nvme-ioctl.h: nvme/nvme-ioctl.h
> > =20
> >  $(LIBS): $(OBJS)
> >  =09$(CC) $(LDFLAGS) $(SHARED_FLAGS) -Wl,-soname=3D$@ -o $@ $(OBJS)
> > $(LIBDEPS)
> > +=09ar rcs libmultipath_nonshared.a $(OBJS)
> >  =09$(LN) $@ $(DEVLIB)
> > =20
> >  install:
> > diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
> > index 7ed494a1..27d4f61f 100644
> > --- a/libmultipath/devmapper.c
> > +++ b/libmultipath/devmapper.c
> > @@ -770,6 +770,55 @@ out:
> >  =09return r;
> >  }
> > =20
> > +/*
> > + * Return
> > + *   1 : map with uuid exists
> > + *   0 : map with uuid doesn't exist
> > + *  -1 : error
> > + */
> > +int
> > +dm_is_mpath_uuid(const char *uuid)
>=20
> We should probably replace our current dm_map_present() implementation
> with something like this, checking for the UUID. The name of the
> function irritated me, perhaps it should be  called
> dm_map_present_by_uuid() or so.

Sure. There is one thing that I'm conflicted about with this function,
and with sysfs_is_multipathed(). They both return success if the wwid
looks good. But they don't bother to check the the device target is
actually a multipath type.  It would add an extra libdm command to both
of them to deal with an unlikely corner case, but nothing stops anyone
from creating a dm device with the mpath- prefix.

> Regards,
> Martin
>=20
>=20
> > +{
> > +=09struct dm_task *dmt;
> > +=09struct dm_info info;
> > +=09char prefixed_uuid[WWID_SIZE + UUID_PREFIX_LEN];
> > +=09int r =3D -1;
> > +
> > +=09if (!uuid || uuid[0] =3D=3D '\0')
> > +=09=09return 0;
> > +
> > +=09if (safe_sprintf(prefixed_uuid, UUID_PREFIX "%s", uuid))
> > +=09=09goto out;
> > +
> > +=09if (!(dmt =3D dm_task_create(DM_DEVICE_INFO)))
> > +=09=09goto out;
> > +
> > +=09dm_task_no_open_count(dmt);
> > +
> > +=09if (!dm_task_set_uuid(dmt, prefixed_uuid))
> > +=09=09goto out_task;
> > +
> > +=09if (!dm_task_run(dmt))
> > +=09=09goto out_task;
> > +
> > +=09if (!dm_task_get_info(dmt, &info))
> > +=09=09goto out_task;
> > +
> > +=09r =3D 0;
> > +
> > +=09if (!info.exists)
> > +=09=09goto out_task;
> > +
> > +=09r =3D 1;
> > +out_task:
> > +=09dm_task_destroy(dmt);
> > +out:
> > +=09if (r < 0)
> > +=09=09condlog(3, "%s: dm command failed in %s: %s", uuid,
> > +=09=09=09__FUNCTION__, strerror(errno));
> > +=09return r;
> > +}
> > +
> >  static int
> >  dm_dev_t (const char * mapname, char * dev_t, int len)
> >  {
> > diff --git a/libmultipath/devmapper.h b/libmultipath/devmapper.h
> > index 17fc9faf..fa2513c2 100644
> > --- a/libmultipath/devmapper.h
> > +++ b/libmultipath/devmapper.h
> > @@ -43,6 +43,7 @@ int dm_get_map(const char *, unsigned long long *,
> > char *);
> >  int dm_get_status(const char *, char *);
> >  int dm_type(const char *, char *);
> >  int dm_is_mpath(const char *);
> > +int dm_is_mpath_uuid(const char *uuid);
> >  int _dm_flush_map (const char *, int, int, int, int);
> >  int dm_flush_map_nopaths(const char * mapname, int deferred_remove);
> >  #define dm_flush_map(mapname) _dm_flush_map(mapname, 1, 0, 0, 0)
>=20
> --=20
> Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
> SUSE  Software Solutions Germany GmbH
> HRB 36809, AG N=FCrnberg GF: Felix
> Imend=F6rffer
>=20

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

