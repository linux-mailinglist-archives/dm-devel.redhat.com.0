Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 300A9212C65
	for <lists+dm-devel@lfdr.de>; Thu,  2 Jul 2020 20:34:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593714866;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=86isCRFniicLszHl60q0elSLvbk+pRriySJGt5w/L3o=;
	b=cJWyI25/1MPNLFTidjxojGHwXMEWwgRIcqTtYedGHK6eE5wKCpNI4hEIscjD+A/C1QSCYY
	mk8GLY7IcPKvLE4LYR9KDXJVxZKGD/tNN86edIIywptl4R3BQR2F2OkGG0dO8QjT364049
	iFH0N0FvSmL+sKf3YTcCC4EjpHc/I7s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-vvfVSHiXMqa1euPb7Le9Xg-1; Thu, 02 Jul 2020 14:34:19 -0400
X-MC-Unique: vvfVSHiXMqa1euPb7Le9Xg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E672B804001;
	Thu,  2 Jul 2020 18:34:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E48C71053B2B;
	Thu,  2 Jul 2020 18:34:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ABF091809547;
	Thu,  2 Jul 2020 18:33:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 062IXcoa018624 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Jul 2020 14:33:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D48D2100164C; Thu,  2 Jul 2020 18:33:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B895105B1E3;
	Thu,  2 Jul 2020 18:33:35 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 062IXYt4012313; 
	Thu, 2 Jul 2020 13:33:34 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 062IXYBm012312;
	Thu, 2 Jul 2020 13:33:34 -0500
Date: Thu, 2 Jul 2020 13:33:34 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20200702183334.GE11089@octiron.msp.redhat.com>
References: <1593117741-28750-1-git-send-email-bmarzins@redhat.com>
	<1593117741-28750-2-git-send-email-bmarzins@redhat.com>
	<b81e6932dd0c20b0b6053c08c3e27118fb338235.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <b81e6932dd0c20b0b6053c08c3e27118fb338235.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 1/7] libmultipath: make dm_get_map/status
 return codes symbolic
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, Jul 01, 2020 at 08:15:49PM +0000, Martin Wilck wrote:
> On Thu, 2020-06-25 at 15:42 -0500, Benjamin Marzinski wrote:
> > dm_get_map() and dm_get_status() now use symbolic return codes. They
> > also differentiate between failing to get information from device-
> > mapper
> > and not finding the requested device. These symboilc return codes are
> > also used by update_multipath_* functions.
> >=20
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > ---
> >  libmultipath/devmapper.c   | 51 +++++++++++++++++++++++++-----------
> > --
> >  libmultipath/devmapper.h   |  6 +++++
> >  libmultipath/structs_vec.c | 45 +++++++++++++++++++--------------
> >  multipathd/main.c          | 12 ++++-----
> >  4 files changed, 72 insertions(+), 42 deletions(-)
> >=20
> > diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
> > index 27d52398..f5cfe296 100644
> > --- a/libmultipath/devmapper.c
> > +++ b/libmultipath/devmapper.c
> > @@ -534,36 +534,43 @@ int dm_map_present(const char * str)
> > =20
> >  int dm_get_map(const char *name, unsigned long long *size, char
> > *outparams)
> >  {
> > -=09int r =3D 1;
> > +=09int r =3D DMP_ERR;
> >  =09struct dm_task *dmt;
> >  =09uint64_t start, length;
> >  =09char *target_type =3D NULL;
> >  =09char *params =3D NULL;
> > =20
> >  =09if (!(dmt =3D libmp_dm_task_create(DM_DEVICE_TABLE)))
> > -=09=09return 1;
> > +=09=09return r;
> > =20
> >  =09if (!dm_task_set_name(dmt, name))
> >  =09=09goto out;
> > =20
> >  =09dm_task_no_open_count(dmt);
> > =20
> > -=09if (!dm_task_run(dmt))
> > +=09errno =3D 0;
> > +=09if (!dm_task_run(dmt)) {
> > +=09=09if (errno =3D=3D ENXIO)
>=20
> Don't you have to use dm_task_get_errno(dmt) here?
> errno might have been overwritten... if you are certain you don't need
> it, a comment explaining it would be helpful.

Err.. I didn't know that existed. Sure I can use it, and your other
suggestions are reasonable as well

-Ben

>=20
>=20
> > +=09=09=09r =3D DMP_FAIL;
>=20
> You've created generic names, which is good, but these are perhaps a
> bit too generic. What's the difference bewteen DMP_FAIL and DMP_ERR? I
> can derive it from your code, but it's not obvious from the retcode
> names, and thus doesn't help the reader much. I suggest to keep DMT_ERR
> to denote a "generic" error condition, and use e.g. DMP_NOTFOUND for
> the other case.
>=20
> >  =09=09goto out;
> > +=09}
> > =20
> > +=09r =3D DMP_FAIL;
> >  =09/* Fetch 1st target */
> > -=09dm_get_next_target(dmt, NULL, &start, &length,
> > -=09=09=09   &target_type, &params);
> > +=09if (dm_get_next_target(dmt, NULL, &start, &length,
> > +=09=09=09       &target_type, &params) !=3D NULL)
> > +=09=09/* more than one target */
> > +=09=09goto out;
> > =20
> >  =09if (size)
> >  =09=09*size =3D length;
> > =20
> >  =09if (!outparams) {
> > -=09=09r =3D 0;
> > +=09=09r =3D DMP_PASS;
>=20
> Nit: DMP_OK or DMP_SUCCESS would be more conventional for successful
> completion. "pass" sounds like something more specific to me,
> like having passed a test or a filter.
>=20
> >  =09=09goto out;
> >  =09}
> >  =09if (snprintf(outparams, PARAMS_SIZE, "%s", params) <=3D
> > PARAMS_SIZE)
> > -=09=09r =3D 0;
> > +=09=09r =3D DMP_PASS;
> >  out:
> >  =09dm_task_destroy(dmt);
> >  =09return r;
> > @@ -637,35 +644,45 @@ is_mpath_part(const char *part_name, const char
> > *map_name)
> > =20
> >  int dm_get_status(const char *name, char *outstatus)
> >  {
> > -=09int r =3D 1;
> > +=09int r =3D DMP_ERR;
> >  =09struct dm_task *dmt;
> >  =09uint64_t start, length;
> >  =09char *target_type =3D NULL;
> >  =09char *status =3D NULL;
> > =20
> >  =09if (!(dmt =3D libmp_dm_task_create(DM_DEVICE_STATUS)))
> > -=09=09return 1;
> > +=09=09return r;
> > =20
> >  =09if (!dm_task_set_name(dmt, name))
> >  =09=09goto out;
> > =20
> >  =09dm_task_no_open_count(dmt);
> > =20
> > -=09if (!dm_task_run(dmt))
> > +=09errno =3D 0;
> > +=09if (!dm_task_run(dmt)) {
> > +=09=09if (errno =3D=3D ENXIO)
> > +=09=09=09r =3D DMP_FAIL;
> >  =09=09goto out;
> > +=09}
>=20
> see above
>=20
> > =20
> > +=09r =3D DMP_FAIL;
> >  =09/* Fetch 1st target */
> > -=09dm_get_next_target(dmt, NULL, &start, &length,
> > -=09=09=09   &target_type, &status);
> > +=09if (dm_get_next_target(dmt, NULL, &start, &length,
> > +=09=09=09       &target_type, &status) !=3D NULL)
> > +=09=09goto out;
> > +
> > +=09if (!target_type || strcmp(target_type, TGT_MPATH) !=3D 0)
> > +=09=09goto out;
> > +
> >  =09if (!status) {
> >  =09=09condlog(2, "get null status.");
> >  =09=09goto out;
> >  =09}
> > =20
> >  =09if (snprintf(outstatus, PARAMS_SIZE, "%s", status) <=3D
> > PARAMS_SIZE)
> > -=09=09r =3D 0;
> > +=09=09r =3D DMP_PASS;
> >  out:
> > -=09if (r)
> > +=09if (r !=3D DMP_PASS)
> >  =09=09condlog(0, "%s: error getting map status string",
> > name);
> > =20
> >  =09dm_task_destroy(dmt);
> > @@ -920,7 +937,7 @@ int _dm_flush_map (const char * mapname, int
> > need_sync, int deferred_remove,
> >  =09=09=09return 1;
> > =20
> >  =09if (need_suspend &&
> > -=09    !dm_get_map(mapname, &mapsize, params) &&
> > +=09    dm_get_map(mapname, &mapsize, params) =3D=3D DMP_PASS &&
> >  =09    strstr(params, "queue_if_no_path")) {
> >  =09=09if (!dm_queue_if_no_path(mapname, 0))
> >  =09=09=09queue_if_no_path =3D 1;
> > @@ -1129,7 +1146,7 @@ struct multipath *dm_get_multipath(const char
> > *name)
> >  =09if (!mpp->alias)
> >  =09=09goto out;
> > =20
> > -=09if (dm_get_map(name, &mpp->size, NULL))
> > +=09if (dm_get_map(name, &mpp->size, NULL) !=3D DMP_PASS)
> >  =09=09goto out;
> > =20
> >  =09dm_get_uuid(name, mpp->wwid, WWID_SIZE);
> > @@ -1313,7 +1330,7 @@ do_foreach_partmaps (const char * mapname,
> >  =09=09    /*
> >  =09=09     * and we can fetch the map table from the kernel
> >  =09=09     */
> > -=09=09    !dm_get_map(names->name, &size, &params[0]) &&
> > +=09=09    dm_get_map(names->name, &size, &params[0]) =3D=3D
> > DMP_PASS &&
> > =20
> >  =09=09    /*
> >  =09=09     * and the table maps over the multipath map
> > diff --git a/libmultipath/devmapper.h b/libmultipath/devmapper.h
> > index 5ed7edc5..5b18bf4b 100644
> > --- a/libmultipath/devmapper.h
> > +++ b/libmultipath/devmapper.h
> > @@ -27,6 +27,12 @@
> >  #define UUID_PREFIX "mpath-"
> >  #define UUID_PREFIX_LEN (sizeof(UUID_PREFIX) - 1)
> > =20
> > +enum {
> > +=09DMP_ERR =3D -1,
> > +=09DMP_PASS,
> > +=09DMP_FAIL,
> > +};
> > +
>=20
> Nit: Why use both negative and positive numbers? It's not important,
> but I feel that unless we really want to treat DM_ERR in a very special
> way, it would be better to use only positive values. (Actually, if we
> go for some generalized retcode convention some day, we might save
> negative return values for standard libc errno values such
> as -ENOENT and use positive values for or own specific ones).
>=20
> (We can change the numeric values later of course).
>=20
> Cheers,
> Martin
>=20
> >  void dm_init(int verbosity);
> >  int dm_prereq(unsigned int *v);
> >  void skip_libmp_dm_init(void);
> > diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
> > index 077f2e42..2225abeb 100644
> > --- a/libmultipath/structs_vec.c
> > +++ b/libmultipath/structs_vec.c
> > @@ -196,43 +196,47 @@ extract_hwe_from_path(struct multipath * mpp)
> >  int
> >  update_multipath_table (struct multipath *mpp, vector pathvec, int
> > is_daemon)
> >  {
> > +=09int r =3D DMP_ERR;
> >  =09char params[PARAMS_SIZE] =3D {0};
> > =20
> >  =09if (!mpp)
> > -=09=09return 1;
> > +=09=09return r;
> > =20
> > -=09if (dm_get_map(mpp->alias, &mpp->size, params)) {
> > -=09=09condlog(3, "%s: cannot get map", mpp->alias);
> > -=09=09return 1;
> > +=09r =3D dm_get_map(mpp->alias, &mpp->size, params);
> > +=09if (r !=3D DMP_PASS) {
> > +=09=09condlog(3, "%s: %s", mpp->alias, (r =3D=3D DMP_ERR)? "error
> > getting table" : "map not present");
> > +=09=09return r;
> >  =09}
> > =20
> >  =09if (disassemble_map(pathvec, params, mpp, is_daemon)) {
> >  =09=09condlog(3, "%s: cannot disassemble map", mpp->alias);
> > -=09=09return 1;
> > +=09=09return DMP_ERR;
> >  =09}
> > =20
> > -=09return 0;
> > +=09return DMP_PASS;
> >  }
> > =20
> >  int
> >  update_multipath_status (struct multipath *mpp)
> >  {
> > +=09int r =3D DMP_ERR;
> >  =09char status[PARAMS_SIZE] =3D {0};
> > =20
> >  =09if (!mpp)
> > -=09=09return 1;
> > +=09=09return r;
> > =20
> > -=09if (dm_get_status(mpp->alias, status)) {
> > -=09=09condlog(3, "%s: cannot get status", mpp->alias);
> > -=09=09return 1;
> > +=09r =3D dm_get_status(mpp->alias, status);
> > +=09if (r !=3D DMP_PASS) {
> > +=09=09condlog(3, "%s: %s", mpp->alias, (r =3D=3D DMP_ERR)? "error
> > getting status" : "map not present");
> > +=09=09return r;
> >  =09}
> > =20
> >  =09if (disassemble_status(status, mpp)) {
> >  =09=09condlog(3, "%s: cannot disassemble status", mpp-
> > >alias);
> > -=09=09return 1;
> > +=09=09return DMP_ERR;
> >  =09}
> > =20
> > -=09return 0;
> > +=09return DMP_PASS;
> >  }
> > =20
> >  void sync_paths(struct multipath *mpp, vector pathvec)
> > @@ -264,10 +268,10 @@ int
> >  update_multipath_strings(struct multipath *mpp, vector pathvec, int
> > is_daemon)
> >  {
> >  =09struct pathgroup *pgp;
> > -=09int i;
> > +=09int i, r =3D DMP_ERR;
> > =20
> >  =09if (!mpp)
> > -=09=09return 1;
> > +=09=09return r;
> > =20
> >  =09update_mpp_paths(mpp, pathvec);
> >  =09condlog(4, "%s: %s", mpp->alias, __FUNCTION__);
> > @@ -276,18 +280,21 @@ update_multipath_strings(struct multipath *mpp,
> > vector pathvec, int is_daemon)
> >  =09free_pgvec(mpp->pg, KEEP_PATHS);
> >  =09mpp->pg =3D NULL;
> > =20
> > -=09if (update_multipath_table(mpp, pathvec, is_daemon))
> > -=09=09return 1;
> > +=09r =3D update_multipath_table(mpp, pathvec, is_daemon);
> > +=09if (r !=3D DMP_PASS)
> > +=09=09return r;
> > +
> >  =09sync_paths(mpp, pathvec);
> > =20
> > -=09if (update_multipath_status(mpp))
> > -=09=09return 1;
> > +=09r =3D update_multipath_status(mpp);
> > +=09if (r !=3D DMP_PASS)
> > +=09=09return r;
> > =20
> >  =09vector_foreach_slot(mpp->pg, pgp, i)
> >  =09=09if (pgp->paths)
> >  =09=09=09path_group_prio_update(pgp);
> > =20
> > -=09return 0;
> > +=09return DMP_PASS;
> >  }
> > =20
> >  static void enter_recovery_mode(struct multipath *mpp)
> > diff --git a/multipathd/main.c b/multipathd/main.c
> > index 205ddb32..d73b1b9a 100644
> > --- a/multipathd/main.c
> > +++ b/multipathd/main.c
> > @@ -418,7 +418,7 @@ int __setup_multipath(struct vectors *vecs,
> > struct multipath *mpp,
> >  =09=09goto out;
> >  =09}
> > =20
> > -=09if (update_multipath_strings(mpp, vecs->pathvec, 1)) {
> > +=09if (update_multipath_strings(mpp, vecs->pathvec, 1) !=3D
> > DMP_PASS) {
> >  =09=09condlog(0, "%s: failed to setup multipath", mpp-
> > >alias);
> >  =09=09goto out;
> >  =09}
> > @@ -557,9 +557,9 @@ add_map_without_path (struct vectors *vecs, const
> > char *alias)
> >  =09mpp->mpe =3D find_mpe(conf->mptable, mpp->wwid);
> >  =09put_multipath_config(conf);
> > =20
> > -=09if (update_multipath_table(mpp, vecs->pathvec, 1))
> > +=09if (update_multipath_table(mpp, vecs->pathvec, 1) !=3D DMP_PASS)
> >  =09=09goto out;
> > -=09if (update_multipath_status(mpp))
> > +=09if (update_multipath_status(mpp) !=3D DMP_PASS)
> >  =09=09goto out;
> > =20
> >  =09if (!vector_alloc_slot(vecs->mpvec))
> > @@ -1350,8 +1350,8 @@ map_discovery (struct vectors * vecs)
> >  =09=09return 1;
> > =20
> >  =09vector_foreach_slot (vecs->mpvec, mpp, i)
> > -=09=09if (update_multipath_table(mpp, vecs->pathvec, 1) ||
> > -=09=09    update_multipath_status(mpp)) {
> > +=09=09if (update_multipath_table(mpp, vecs->pathvec, 1) !=3D
> > DMP_PASS ||
> > +=09=09    update_multipath_status(mpp) !=3D DMP_PASS) {
> >  =09=09=09remove_map(mpp, vecs, 1);
> >  =09=09=09i--;
> >  =09=09}
> > @@ -2091,7 +2091,7 @@ check_path (struct vectors * vecs, struct path
> > * pp, unsigned int ticks)
> >  =09/*
> >  =09 * Synchronize with kernel state
> >  =09 */
> > -=09if (update_multipath_strings(pp->mpp, vecs->pathvec, 1)) {
> > +=09if (update_multipath_strings(pp->mpp, vecs->pathvec, 1) !=3D
> > DMP_PASS) {
> >  =09=09condlog(1, "%s: Could not synchronize with kernel
> > state",
> >  =09=09=09pp->dev);
> >  =09=09pp->dmstate =3D PSTATE_UNDEF;
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

