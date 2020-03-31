Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id DF5501999FD
	for <lists+dm-devel@lfdr.de>; Tue, 31 Mar 2020 17:42:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585669329;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wv1zgWg2PNv09soCFLwkGokJA9ZujTlZD5ok0IswmU0=;
	b=N/7Egc1Jn7GUxk4fhJBCP8/LL/3Q9y5bZDpBDcTGLiWBM92mz6wvm9Ui/uDjZJ0Bm+EuG5
	OQT7DThPuuC/3jDTiii0/K6ZkSl6vHu4M5LG3rszDqzOjyuoyoze3Q1w8FSRihFCNHyELW
	0cj6tjmrC76zwPJR8ycmgXWb4YWjxM8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-oUQ3PW5_OriN3e94uEHcBQ-1; Tue, 31 Mar 2020 11:42:06 -0400
X-MC-Unique: oUQ3PW5_OriN3e94uEHcBQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FBE9800D5F;
	Tue, 31 Mar 2020 15:41:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB47D790D7;
	Tue, 31 Mar 2020 15:41:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 60F3A18089C8;
	Tue, 31 Mar 2020 15:41:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02VFfsnB019671 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 31 Mar 2020 11:41:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9478D2166B2A; Tue, 31 Mar 2020 15:41:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F9EF2166B31
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 15:41:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4FFF88F8400
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 15:41:54 +0000 (UTC)
Received: from m9a0014g.houston.softwaregrp.com
	(m9a0014g.houston.softwaregrp.com [15.124.64.90]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-172-auJeB1XVPKaPWeF2RMNpLg-1;
	Tue, 31 Mar 2020 11:41:52 -0400
X-MC-Unique: auJeB1XVPKaPWeF2RMNpLg-1
Received: FROM m9a0014g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0014g.houston.softwaregrp.com WITH ESMTP; 
	Tue, 31 Mar 2020 15:40:23 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Tue, 31 Mar 2020 15:38:26 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (15.124.72.11) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Tue, 31 Mar 2020 15:38:26 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com (2603:10b6:3:14a::16)
	by DM5PR18MB1338.namprd18.prod.outlook.com (2603:10b6:3:14a::12) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20;
	Tue, 31 Mar 2020 15:38:25 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::d1ec:4fbe:928d:8675]) by
	DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::d1ec:4fbe:928d:8675%9]) with mapi id 15.20.2856.019;
	Tue, 31 Mar 2020 15:38:25 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [RFC Patch 3/3] multipath: add libmpathvalid library
Thread-Index: AQHWBwBENL3rjIinMkyJOcEYO+YD1qhi1tKA
Date: Tue, 31 Mar 2020 15:38:25 +0000
Message-ID: <1e138c8f609a34f7fc6cc244f7516797c5e97a2b.camel@suse.com>
References: <1585620055-27112-1-git-send-email-bmarzins@redhat.com>
	<1585620055-27112-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1585620055-27112-4-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4
x-originating-ip: [92.211.129.134]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b2308b52-a71d-43f5-2553-08d7d5898d4a
x-ms-traffictypediagnostic: DM5PR18MB1338:
x-microsoft-antispam-prvs: <DM5PR18MB1338DA50859E1EC6FBF110D6FCC80@DM5PR18MB1338.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DM5PR18MB1355.namprd18.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10019020)(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(26005)(6506007)(66574012)(186003)(5660300002)(30864003)(86362001)(71200400001)(4326008)(76116006)(66946007)(6512007)(478600001)(316002)(66476007)(66556008)(2906002)(66446008)(81156014)(8676002)(966005)(36756003)(8936002)(64756008)(91956017)(6486002)(110136005)(2616005)(81166006)(2004002);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YyQ62DSeAXwjFgL7Q/8tAKfO+TVdMTUM5Wt58ESDLRSwC7tHifqEpBDCfotROM35pT8We4ekgQ194NbD/o2lnYLdxy4i8WTWw1YJkN3UkXNC7fAgeTYkO+cpAYyxoKzX//5M6vJsPP/4nUVnL2G3qkzwqUgZL0rJQj3COqj/mfT3PkZwdS1GmAE7wnRIWPjkt1ZGqHNw4av6MVlBt9fa1XO86wiZAhKJK60DXC1qrMirVUj1u9OVa+GGC5EoMGzHsbvxUxfHSD4EaRJ7FPJUnGumcdBpwwNS/cvUUnYvGVqhHvLN0QWl3JRTcMcxHhBb/Lp3F95kgKZa2nh++CgifxpIiZF2rFjcIYSxBxBAuCZPFvfA771YZFffnhoiYwQQ2jMjUt3EVeVIVMO8w+sCJxVZXabRJF2rDQzLqsP6Y/BBwSpZtyim5seRT/6ZPFTIY0vPYIZs2phWB5uPQKJDqknjD1MriewuH3EN0liwWvu9dLRcXTA7DmCKXtss6zur9X+zpfMuFOhFrEwr9pPa/wcwsKYA0yZGrLwksCjOoaj8CZbNIoH83Y52y+ssX/UJ
x-ms-exchange-antispam-messagedata: vzvbvLcTZ5qKOHX0dLVBKljlEN65xYIwiEB31Y+nDGiPF4AdCj2lduBVnvmVA9vWC4WvvQwhp22ZNp14Aj6gDK7eYJLPc3V8FPICbTwTA7RPofEkO5ukx6pClBajDC/rg6GkkUKFKnR/JypY3Und0A==
x-ms-exchange-transport-forked: True
Content-ID: <86059B56617DAF40B607986114D53EF0@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b2308b52-a71d-43f5-2553-08d7d5898d4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 15:38:25.2257 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0SY92olYDAeDRKaj8rcgfu3qfilLbbQZinKLIpHz+y41OEA13gbr0c4pDDqkeKT3wgnf+Q3CfdUyX/NjpSHbMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB1338
X-OriginatorOrg: suse.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02VFfsnB019671
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-03-30 at 21:00 -0500, Benjamin Marzinski wrote:
> This library allows other programs to check if a path should be
> claimed
> by multipath.  Currently, it only includes one function,
> mpath_is_path(), which takes a device name, mode to for checking the
> path, and an optional info structure, to return the wwid. The modes
> work
> mostly like they do for "multipath -c/-u", with a few exceptions.
>=20
> 1. If a device is currently multipathed, it is always VALID. This
> perhaps should be true for the existing path valid code.

AFAICS, this is already the case, except if:

 1 WWID_IS_FAILED is set, i.e. dm_addmap() failed to set up
   the multipath with this WWID last time we tried. In this case it's
   unlikely that the path is currently multipathed. But there may be
   some corner case in which your new code would return "valid"
   while the current code would not; possibly if someone set up a
   multipath device with "dmsetup" directly, or because of some race
   condition. I just realized that we don't check for -EBUSY when we
   create a map...

   I agree that perhaps the "is_multipath" test should be done before
   the "failed" test in multipath -u, too.

 2 ignore_wwids is off, and check_wwids_file returned a negative
   result. IMO this logic is correct. But you are the inventor of
   the wwids file, so fine with me to change it.
 =20
And also if multipathd is neither running nor enabled, but see below.

>=20
> 2. There is no seperate "on" mode. It is instead treated like
> "smart".
> This is because the library only looks at a single path, so it can
> only
> say that a device could be multpathed, if there was another path.  It
> is
> the caller's job to check if another path exists, or to wait for
> another
> path appear.

I'm not sure if I like this. Returning "no" for the first path and
"yes" for the second and later paths is exactly how
"find_multipaths=3Dyes" is supposed to behave. If that's not useful for
an application, the application should choose a different mode; and
that's what I believe SID should do (assuming that SID will be the main
/ only user of this API for some time).

>=20
> 3. The library does check if there already is an existing multipath
> device with the same wwid, and if so, will declare the path valid.

What if there are other paths, not multipathed (yet) but with the same
wwid as the path in question? The current code checks that by calling
coalesce_paths() in "dry-run" mode, which would cover both this case
and your case 3.


>=20
> In order to act more library-like, libmpathvalid doesn't set its own
> device-mapper log functions. It leaves this to the caller. It
> currently
> keeps condlog() from printing anything, but should eventually include
> a
> function to allow the caller set the logging. It also uses a
> statically
> compiled version of libmultipath, both to keep that library from
> polluting the namespace of the caller, and to avoid the caller
> needing
> to set up the variables and functions (like logsink, and
> get_multipath_config) that it expects.


All fair, but I'd prefer a solution where we use as much common code
as possible, to avoid bit rot of either code path in the future. Your
new function has the advantage to be much better readable than the
current code in multipath/main.c. Maybe we can find a way to use it
from "multipath -u"? The mentioned semantic changes are minor and could
be resolved (not sure about the coalesce_paths() call, I guess you had
a reason to skip it).

The namespace issue could be fixed by using=20
"-fvisibility=3Dhidden" and using explicit visibility attributes for
those functions we want to export. The logsink and get_multipath_config
issues should be solvable by using a sane default implementation and
allowing applications to change it.

Both would be improvements for libmultipath that we should have made
long ago.

>=20
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  Makefile                            |   1 +
>  Makefile.inc                        |   1 +
>  libmpathvalid/Makefile              |  38 +++++++
>  libmpathvalid/libmpathvalid.version |   6 +
>  libmpathvalid/mpath_valid.c         | 171
> ++++++++++++++++++++++++++++
>  libmpathvalid/mpath_valid.h         |  53 +++++++++
>  libmultipath/Makefile               |   1 +
>  libmultipath/devmapper.c            |  49 ++++++++
>  libmultipath/devmapper.h            |   1 +
>  9 files changed, 321 insertions(+)
>  create mode 100644 libmpathvalid/Makefile
>  create mode 100644 libmpathvalid/libmpathvalid.version
>  create mode 100644 libmpathvalid/mpath_valid.c
>  create mode 100644 libmpathvalid/mpath_valid.h
>=20
> diff --git a/Makefile b/Makefile
> index 1dee3680..462d6655 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -9,6 +9,7 @@ BUILDDIRS :=3D \
>  =09libmultipath/checkers \
>  =09libmultipath/foreign \
>  =09libmpathpersist \
> +=09libmpathvalid \
>  =09multipath \
>  =09multipathd \
>  =09mpathpersist \
> diff --git a/Makefile.inc b/Makefile.inc
> index d4d1e0dd..7e0e8203 100644
> --- a/Makefile.inc
> +++ b/Makefile.inc
> @@ -66,6 +66,7 @@ libdir=09=09=3D $(prefix)/$(LIB)/multipath
>  unitdir=09=09=3D $(prefix)/$(SYSTEMDPATH)/systemd/system
>  mpathpersistdir=09=3D $(TOPDIR)/libmpathpersist
>  mpathcmddir=09=3D $(TOPDIR)/libmpathcmd
> +mpathvaliddir=09=3D $(TOPDIR)/libmpathvalid
>  thirdpartydir=09=3D $(TOPDIR)/third-party
>  libdmmpdir=09=3D $(TOPDIR)/libdmmp
>  nvmedir=09=09=3D $(TOPDIR)/libmultipath/nvme
> diff --git a/libmpathvalid/Makefile b/libmpathvalid/Makefile
> new file mode 100644
> index 00000000..5fc97022
> --- /dev/null
> +++ b/libmpathvalid/Makefile
> @@ -0,0 +1,38 @@
> +include ../Makefile.inc
> +
> +SONAME =3D 0
> +DEVLIB =3D libmpathvalid.so
> +LIBS =3D $(DEVLIB).$(SONAME)
> +
> +CFLAGS +=3D $(LIB_CFLAGS) -I$(multipathdir) -I$(mpathcmddir)
> +
> +LIBDEPS +=3D -lpthread -ldevmapper -ldl -L$(multipathdir) \
> +=09   -lmultipath_nonshared -L$(mpathcmddir) -lmpathcmd -ludev
> +
> +OBJS =3D mpath_valid.o
> +
> +all: $(LIBS)
> +
> +$(LIBS): $(OBJS)
> +=09$(CC) $(LDFLAGS) $(SHARED_FLAGS) -Wl,-soname=3D$@ -o $@ $(OBJS)
> $(LIBDEPS) -Wl,--version-script=3Dlibmpathvalid.version
> +=09$(LN) $(LIBS) $(DEVLIB)
> +
> +install: $(LIBS)
> +=09$(INSTALL_PROGRAM) -m 755 -d $(DESTDIR)$(syslibdir)
> +=09$(INSTALL_PROGRAM) -m 755 $(LIBS)
> $(DESTDIR)$(syslibdir)/$(LIBS)
> +=09$(LN) $(LIBS) $(DESTDIR)$(syslibdir)/$(DEVLIB)
> +=09$(INSTALL_PROGRAM) -m 755 -d $(DESTDIR)$(includedir)
> +=09$(INSTALL_PROGRAM) -m 644 mpath_valid.h $(DESTDIR)$(includedir)
> +
> +uninstall:
> +=09$(RM) $(DESTDIR)$(syslibdir)/$(LIBS)
> +=09$(RM) $(DESTDIR)$(syslibdir)/$(DEVLIB)
> +=09$(RM) $(DESTDIR)$(includedir)/mpath_valid.h
> +
> +clean: dep_clean
> +=09$(RM) core *.a *.o *.so *.so.* *.gz
> +
> +include $(wildcard $(OBJS:.o=3D.d))
> +
> +dep_clean:
> +=09$(RM) $(OBJS:.o=3D.d)
> diff --git a/libmpathvalid/libmpathvalid.version
> b/libmpathvalid/libmpathvalid.version
> new file mode 100644
> index 00000000..e8967951
> --- /dev/null
> +++ b/libmpathvalid/libmpathvalid.version
> @@ -0,0 +1,6 @@
> +MPATH_1.0 {
> +=09global:
> +=09=09mpath_is_path;
> +=09local:
> +=09=09*;
> +};
> diff --git a/libmpathvalid/mpath_valid.c
> b/libmpathvalid/mpath_valid.c
> new file mode 100644
> index 00000000..3d96c32f
> --- /dev/null
> +++ b/libmpathvalid/mpath_valid.c
> @@ -0,0 +1,171 @@
> +#include <stdio.h>
> +#include <stdint.h>
> +#include <libdevmapper.h>
> +#include <libudev.h>
> +#include <errno.h>
> +
> +#include "devmapper.h"
> +#include "structs.h"
> +#include "util.h"
> +#include "config.h"
> +#include "discovery.h"
> +#include "wwids.h"
> +#include "sysfs.h"
> +#include "mpath_cmd.h"
> +#include "mpath_valid.h"
> +
> +struct udev *udev;
> +int logsink =3D -1;
> +static struct config default_config =3D { .verbosity =3D -1 };
> +static struct config *multipath_conf;
> +
> +struct config *get_multipath_config(void)
> +{
> +=09return (multipath_conf)? multipath_conf : &default_config;
> +}
> +
> +void put_multipath_config(__attribute__((unused))void *conf)
> +{
> +=09/* Noop */
> +}
> +
> +static int get_conf_mode(struct config *conf)
> +{
> +=09if (conf->find_multipaths =3D=3D FIND_MULTIPATHS_ON ||
> +=09    conf->find_multipaths =3D=3D FIND_MULTIPATHS_SMART)
> +=09=09return MPATH_SMART;
> +=09if (conf->find_multipaths =3D=3D FIND_MULTIPATHS_GREEDY)
> +=09=09return MPATH_GREEDY;
> +=09return MPATH_STRICT;
> +}
> +
> +
> +/*
> + * Return
> + *  2: possible path (only in MPATH_GREEDY mode)
> + *  1: mpath path
> + *  0: not mpath path
> + * -1: Failure
> + */
> +int
> +mpath_is_path(const char *name, unsigned int mode, struct mpath_info
> *info)
> +{
> +=09struct config *conf;
> +=09struct path * pp;
> +=09int r =3D MPATH_IS_ERROR;
> +=09int fd =3D -1;
> +=09unsigned int version[3];
> +=09bool already_multipathed =3D false;
> +
> +=09if (info)
> +=09=09memset(info, 0, sizeof(struct mpath_info));
> +
> +=09if (!name || mode >=3D MPATH_MAX_MODE)
> +=09=09return r;
> +
> +=09skip_libmp_dm_init();
> +=09udev =3D udev_new();
> +=09if (!udev)
> +=09=09goto out;
> +=09conf =3D load_config(DEFAULT_CONFIGFILE);
> +=09if (!conf)
> +=09=09goto out_udev;
> +=09conf->verbosity =3D -1;
> +=09if (mode =3D=3D MPATH_DEFAULT)
> +=09=09mode =3D get_conf_mode(conf);
> +
> +=09if (dm_prereq(version))
> +=09=09goto out_config;
> +=09memcpy(conf->version, version, sizeof(version));
> +=09multipath_conf =3D conf;
> +
> +=09pp =3D alloc_path();
> +=09if (!pp)
> +=09=09goto out_config;
> +
> +=09if (safe_sprintf(pp->dev, "%s", name))
> +=09=09goto out_path;
> +
> +=09if (sysfs_is_multipathed(pp, true)) {
> +=09=09if (!info || pp->wwid[0] !=3D '\0') {
> +=09=09=09r =3D MPATH_IS_VALID;
> +=09=09=09goto out_path;
> +=09=09}
> +=09=09already_multipathed =3D true;
> +=09}
> +
> +=09fd =3D __mpath_connect(1);
> +=09if (fd < 0) {
> +=09=09if (errno !=3D EAGAIN && !systemd_service_enabled(name))
> {
> +=09=09=09r =3D MPATH_IS_NOT_VALID;
> +=09=09=09goto out_path;
> +=09=09}
> +=09} else
> +=09=09mpath_disconnect(fd);

So "multipathd not running" takes precedence over "is already
multipathed"? That contradicts your statement 1. above. Would SID
(or any other external application using your API) really require
multipathd?

> +
> +=09pp->udev =3D udev_device_new_from_subsystem_sysname(udev,
> "block", name);
> +=09if (!pp->udev)
> +=09=09goto out_path;
> +
> +=09r =3D pathinfo(pp, conf, DI_SYSFS | DI_WWID | DI_BLACKLIST);
> +=09if (r) {
> +=09=09if (r =3D=3D PATHINFO_SKIPPED)
> +=09=09=09r =3D MPATH_IS_NOT_VALID;
> +=09=09else
> +=09=09=09r =3D MPATH_IS_ERROR;
> +=09=09goto out_path;
> +=09}
> +
> +=09if (pp->wwid[0] =3D=3D '\0') {
> +=09=09r =3D MPATH_IS_NOT_VALID;
> +=09=09goto out_path;
> +=09}
> +
> +=09if (already_multipathed)
> +=09=09goto out_path;
> +
> +=09if (dm_is_mpath_uuid(pp->wwid) =3D=3D 1) {
> +=09=09r =3D MPATH_IS_VALID;
> +=09=09goto out_path;
> +=09}
> +
> +=09r =3D is_failed_wwid(pp->wwid);
> +=09if (r !=3D WWID_IS_NOT_FAILED) {
> +=09=09if (r =3D=3D WWID_IS_FAILED)
> +=09=09=09r =3D MPATH_IS_NOT_VALID;
> +=09=09else
> +=09=09=09r =3D MPATH_IS_ERROR;
> +=09=09goto out_path;
> +=09}
> +
> +=09if (mode =3D=3D MPATH_GREEDY) {
> +=09=09r =3D MPATH_IS_VALID;
> +=09=09goto out_path;
> +=09}
> +
> +=09if (check_wwids_file(pp->wwid, 0) =3D=3D 0) {
> +=09=09r =3D MPATH_IS_VALID;
> +=09=09goto out_path;
> +=09}
> +
> +=09if (mode =3D=3D MPATH_STRICT) {
> +=09=09r =3D MPATH_IS_NOT_VALID;
> +=09=09goto out_path;
> +=09}
> +
> +=09/* mode =3D=3D SMART */
> +=09r =3D MPATH_IS_MAYBE_VALID;
> +
> +out_path:
> +=09if (already_multipathed)
> +=09=09r =3D MPATH_IS_VALID;
> +=09if (info && (r =3D=3D MPATH_IS_VALID || r =3D=3D MPATH_IS_MAYBE_VALID=
))
> +=09=09strlcpy(info->wwid, pp->wwid, 128);
> +=09free_path(pp);
> +out_config:
> +=09free_config(conf);
> +out_udev:
> +=09udev_unref(udev);
> +out:
> +=09return r;
> +}
> diff --git a/libmpathvalid/mpath_valid.h
> b/libmpathvalid/mpath_valid.h
> new file mode 100644
> index 00000000..b9e420a8
> --- /dev/null
> +++ b/libmpathvalid/mpath_valid.h
> @@ -0,0 +1,53 @@
> +/*
> + * Copyright (C) 2015 Red Hat, Inc.
> + *
> + * This file is part of the device-mapper multipath userspace tools.
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> License
> + * as published by the Free Software Foundation; either version 2
> + * of the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> License
> + * along with this program.  If not, see <
> http://www.gnu.org/licenses/>;.
> + */
> +
> +#ifndef LIB_MPATH_VALID_H
> +#define LIB_MPATH_VALID_H
> +
> +#ifdef __cpluscplus
> +extern "C" {
> +#endif
> +
> +enum mpath_valid_mode {
> +=09MPATH_DEFAULT,
> +=09MPATH_STRICT,
> +=09MPATH_SMART,
> +=09MPATH_GREEDY,
> +=09MPATH_MAX_MODE,  /* used only for bounds checking */
> +};
> +
> +enum mpath_valid_result {
> +=09MPATH_IS_ERROR =3D -1,
> +=09MPATH_IS_NOT_VALID,
> +=09MPATH_IS_VALID,
> +=09MPATH_IS_MAYBE_VALID,
> +};
> +
> +struct mpath_info {
> +=09char wwid[128];
> +};
> +
> +int mpath_is_path(const char *name, unsigned int mode, struct
> mpath_info *info);
> +
> +
> +#ifdef __cplusplus
> +}
> +#endif
> +#endif /* LIB_PATH_VALID_H */
> +
> diff --git a/libmultipath/Makefile b/libmultipath/Makefile
> index ad690a49..7e2c00cf 100644
> --- a/libmultipath/Makefile
> +++ b/libmultipath/Makefile
> @@ -69,6 +69,7 @@ nvme-ioctl.h: nvme/nvme-ioctl.h
> =20
>  $(LIBS): $(OBJS)
>  =09$(CC) $(LDFLAGS) $(SHARED_FLAGS) -Wl,-soname=3D$@ -o $@ $(OBJS)
> $(LIBDEPS)
> +=09ar rcs libmultipath_nonshared.a $(OBJS)
>  =09$(LN) $@ $(DEVLIB)
> =20
>  install:
> diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
> index 7ed494a1..27d4f61f 100644
> --- a/libmultipath/devmapper.c
> +++ b/libmultipath/devmapper.c
> @@ -770,6 +770,55 @@ out:
>  =09return r;
>  }
> =20
> +/*
> + * Return
> + *   1 : map with uuid exists
> + *   0 : map with uuid doesn't exist
> + *  -1 : error
> + */
> +int
> +dm_is_mpath_uuid(const char *uuid)

We should probably replace our current dm_map_present() implementation
with something like this, checking for the UUID. The name of the
function irritated me, perhaps it should be  called
dm_map_present_by_uuid() or so.

Regards,
Martin


> +{
> +=09struct dm_task *dmt;
> +=09struct dm_info info;
> +=09char prefixed_uuid[WWID_SIZE + UUID_PREFIX_LEN];
> +=09int r =3D -1;
> +
> +=09if (!uuid || uuid[0] =3D=3D '\0')
> +=09=09return 0;
> +
> +=09if (safe_sprintf(prefixed_uuid, UUID_PREFIX "%s", uuid))
> +=09=09goto out;
> +
> +=09if (!(dmt =3D dm_task_create(DM_DEVICE_INFO)))
> +=09=09goto out;
> +
> +=09dm_task_no_open_count(dmt);
> +
> +=09if (!dm_task_set_uuid(dmt, prefixed_uuid))
> +=09=09goto out_task;
> +
> +=09if (!dm_task_run(dmt))
> +=09=09goto out_task;
> +
> +=09if (!dm_task_get_info(dmt, &info))
> +=09=09goto out_task;
> +
> +=09r =3D 0;
> +
> +=09if (!info.exists)
> +=09=09goto out_task;
> +
> +=09r =3D 1;
> +out_task:
> +=09dm_task_destroy(dmt);
> +out:
> +=09if (r < 0)
> +=09=09condlog(3, "%s: dm command failed in %s: %s", uuid,
> +=09=09=09__FUNCTION__, strerror(errno));
> +=09return r;
> +}
> +
>  static int
>  dm_dev_t (const char * mapname, char * dev_t, int len)
>  {
> diff --git a/libmultipath/devmapper.h b/libmultipath/devmapper.h
> index 17fc9faf..fa2513c2 100644
> --- a/libmultipath/devmapper.h
> +++ b/libmultipath/devmapper.h
> @@ -43,6 +43,7 @@ int dm_get_map(const char *, unsigned long long *,
> char *);
>  int dm_get_status(const char *, char *);
>  int dm_type(const char *, char *);
>  int dm_is_mpath(const char *);
> +int dm_is_mpath_uuid(const char *uuid);
>  int _dm_flush_map (const char *, int, int, int, int);
>  int dm_flush_map_nopaths(const char * mapname, int deferred_remove);
>  #define dm_flush_map(mapname) _dm_flush_map(mapname, 1, 0, 0, 0)

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

