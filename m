Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id F35B41C202B
	for <lists+dm-devel@lfdr.de>; Fri,  1 May 2020 23:59:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588370367;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ltigTlDn8tlB5tbUI+dq2s0E4FGTeInmGL1MCUX8z3U=;
	b=EN4VSCk6mxe81laTd3en482NvH3aURxBDMT53kIWQc3Y6e3vBl+BPB6qE7wBtHj8BSTuaH
	MNU1oom8yL5N+Mx+wxJ2igzsz+VUgvtUXR6NI4g2E9oJLGcCQEGJii/tGgtl48cH/ZyrZ+
	1j3gvvnUtCdyU1JMbIKmD1PQ3PP23Z0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-o8JQhjW_Ofqh8Nx3ojz7uQ-1; Fri, 01 May 2020 17:59:19 -0400
X-MC-Unique: o8JQhjW_Ofqh8Nx3ojz7uQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E41F080B719;
	Fri,  1 May 2020 21:59:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 969C15C1B0;
	Fri,  1 May 2020 21:59:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 053A64CAA0;
	Fri,  1 May 2020 21:58:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 041LwhIL010752 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 1 May 2020 17:58:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 09C9E5D9CC; Fri,  1 May 2020 21:58:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13DE85D9CA;
	Fri,  1 May 2020 21:58:40 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 041LwcU4020689; 
	Fri, 1 May 2020 16:58:38 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 041LwbFG020688;
	Fri, 1 May 2020 16:58:37 -0500
Date: Fri, 1 May 2020 16:58:37 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20200501215837.GM5907@octiron.msp.redhat.com>
References: <1585896641-22896-1-git-send-email-bmarzins@redhat.com>
	<1585896641-22896-4-git-send-email-bmarzins@redhat.com>
	<6d02d82677fec4fd371bce97cd14bd720c115d48.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <6d02d82677fec4fd371bce97cd14bd720c115d48.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [RFC PATCH v2 3/3] multipath: add libmpathvalid
	library
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Apr 28, 2020 at 09:42:52PM +0000, Martin Wilck wrote:
> On Fri, 2020-04-03 at 01:50 -0500, Benjamin Marzinski wrote:
> > +int mpath_get_mode(void)
> > +{
> > +=09int mode;
> > +=09struct config *conf;
> > +
> > +=09conf =3D load_config(DEFAULT_CONFIGFILE);
>=20
> By using this, you'd pull in a substantial part of libmultipath.=20
> Why don't you simply rely on the passed-in mode value?
>=20
> Actually, I wonder if we could split libmultipath into a part "below"
> libmpathvalid and a part "above" libmpathvalid. I wouldn't put
> "load_config()" in the "below" part. The problematic part is
> pathinfo(), which has to be "below" and which would pull in quite a bit
> of libmultipath functionality.

I would love to be able to not load the config, but I don't see how
that's possible.  The config tells us things like what's blacklisted,
what find_multipaths value is, etc.  If the library wants to get the
same result as multipathd, it needs to use the config. Or are you
suggesting something else here?
=20
> > +=09if (!conf)
> > +=09=09return -1;
> > +=09mode =3D get_conf_mode(conf);
> > +=09free_config(conf);
> > +=09return mode;
> > +}
> > +
> > +/*
> > + * name: name of path to check
> > + * mode: mode to use for determination. MPATH_DEFAULT uses
> > configured mode
> > + * info: on success, contains the path wwid
> > + * paths: array of the returned mpath_info from other claimed paths
> > + * nr_paths: the size of the paths array
> > + */
> > +int
> > +mpath_is_path(const char *name, unsigned int mode, struct mpath_info
> > *info,
> > +=09      struct mpath_info **paths_arg, unsigned int nr_paths)
>=20
> I wonder if you couldn't use a vector of "struct path*" instead
> of "struct mpath_info*". But well, I the data structures can be=20
> simply transformed into each other either way, so that's not a big
> issue.

I want to use a array of the same things we are passing back to the
caller.  The idea is that the SID collects the mpath infos from earlier
calls, and passes them back here to help mpath_valid pick devices
correctly.  And like you said, it's easy to build that array with the
wwids from existing stuct paths.

> > +{
> > +=09struct config *conf;
> > +=09struct path * pp;
> > +=09int r =3D MPATH_IS_ERROR;
> > +=09int fd =3D -1;
> > +=09unsigned int i, version[3];
> > +=09bool already_multipathed =3D false;
> > +=09/* stupid c implicit conversion rules fail */
> > +=09const struct mpath_info * const *paths =3D (const struct
> > mpath_info * const *)paths_arg;
> > +
> > +=09if (info)
> > +=09=09memset(info, 0, sizeof(struct mpath_info));
> > +
> > +=09if (!name || mode >=3D MPATH_MAX_MODE)
> > +=09=09return r;
> > +
> > +=09if (nr_paths > 0 && !paths)
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
>=20
> Wouldn't this basically preclude calling the function from "multipath
> -u", or any other place in multipath-tools assuming standard library
> initialization? I'd like to split this off into some wrapper.

Yes, to be useful for things other than SID (or even to play nicely with
SIDs verbosity settings), this needs to be configurable.
=20
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
>=20
> This is the "WWID overflow" case? I believe multipathd would never
> create a map with an WWID longer than WWID_SIZE, and thus this
> condition should be treated as an error.

Sure.

-Ben

> Other than that, you've done a magnificent job in making the logic
> of this function easy to understand. I'd love to replace the current
> "multipath -u" logic with this.
>=20
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
> > +=09if (dm_map_present_by_uuid(pp->wwid) =3D=3D 1) {
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
>=20
> It seems I misunderstood you before. This MPATH_STRICT logic looks
> fine.
>=20
> > +
> > +=09for (i =3D 0; i < nr_paths; i++) {
> > +=09=09if (strncmp(paths[i]->wwid, pp->wwid, 128) =3D=3D 0) {
> > +=09=09=09r =3D MPATH_IS_VALID;
> > +=09=09=09goto out_path;
> > +=09=09}
> > +=09}
> > +
> > +=09/* mode =3D=3D MPATH_SMART || mode =3D=3D MPATH_FIND */
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
> > index 00000000..f832beff
> > --- /dev/null
> > +++ b/libmpathvalid/mpath_valid.h
> > @@ -0,0 +1,56 @@
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
> > +=09MPATH_FIND,
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
> > +int mpath_get_mode(void);
> > +int mpath_is_path(const char *name, unsigned int mode, struct
> > mpath_info *info,
> > +=09=09  struct mpath_info **paths, unsigned int nr_paths);
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
> > index 7ed494a1..92f61133 100644
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
> > +dm_map_present_by_uuid(const char *uuid)
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
> > index 17fc9faf..5ed7edc5 100644
> > --- a/libmultipath/devmapper.h
> > +++ b/libmultipath/devmapper.h
> > @@ -39,6 +39,7 @@ int dm_simplecmd_noflush (int, const char *,
> > uint16_t);
> >  int dm_addmap_create (struct multipath *mpp, char *params);
> >  int dm_addmap_reload (struct multipath *mpp, char *params, int
> > flush);
> >  int dm_map_present (const char *);
> > +int dm_map_present_by_uuid(const char *uuid);
> >  int dm_get_map(const char *, unsigned long long *, char *);
> >  int dm_get_status(const char *, char *);
> >  int dm_type(const char *, char *);
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

