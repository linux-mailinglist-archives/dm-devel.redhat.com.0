Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 271551FFE80
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 01:17:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592522257;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NBj/NlGDPJ5l1gk+V0Zl4iGfzf2D7aHvNY/FTfCoPjw=;
	b=PnS5j8w+MnuyBUyuAL9uXVqgEKUGRy9y2fLvo7bu4gq9eolNgo2pto4hBy/gtouWWn+rd8
	SnVGHBTzjMa3drsyuX2k/cG15Vo5PKzoh7yw41owNu8zWbgZ9rPRlz7vPnNuAfTDb03jHm
	vJqWx29ErZxhvfzlAbXHUS7awemuhm0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-b0FO1wi5P2av2AQaL_LzRA-1; Thu, 18 Jun 2020 19:17:35 -0400
X-MC-Unique: b0FO1wi5P2av2AQaL_LzRA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 546DC107ACCA;
	Thu, 18 Jun 2020 23:17:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2808210013C4;
	Thu, 18 Jun 2020 23:17:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D74AD833C8;
	Thu, 18 Jun 2020 23:17:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05INHIKT017877 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 19:17:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 884B45BAC8; Thu, 18 Jun 2020 23:17:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA3DF5BAC3;
	Thu, 18 Jun 2020 23:17:13 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 05INHCTc026229; 
	Thu, 18 Jun 2020 18:17:12 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 05INHBWu026228;
	Thu, 18 Jun 2020 18:17:11 -0500
Date: Thu, 18 Jun 2020 18:17:11 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20200618231711.GM5894@octiron.msp.redhat.com>
References: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
	<1592439867-18427-3-git-send-email-bmarzins@redhat.com>
	<f09ec3b6537a7b7ac1ae26433e43846176f1dd48.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <f09ec3b6537a7b7ac1ae26433e43846176f1dd48.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/7] multipathd: fix check_path errors with
	removed map
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thu, Jun 18, 2020 at 07:34:38PM +0000, Martin Wilck wrote:
> On Wed, 2020-06-17 at 19:24 -0500, Benjamin Marzinski wrote:
> > If a multipath device is removed during, or immediately before the
> > call
> > to check_path(), multipathd can behave incorrectly. A missing
> > multpath
> > device will cause update_multipath_strings() to fail, setting
> > pp->dmstate to PSTATE_UNDEF.  If the path is up, this state will
> > cause
> > reinstate_path() to be called, which will also fail.  This will
> > trigger
> > a reload, restoring the recently removed device.
> >=20
> > If update_multipath_strings() fails because there is no multipath
> > device, check_path should just quit, since the remove dmevent and
> > uevent
> > are likely already queued up. Also, I don't see any reason to reload
> > the
> > multipath device if reinstate fails. This code was added by
> > fac68d7a99ef17d496079538a5c6836acd7911ab, which clamined that
> > reinstate
> > could fail if the path was disabled.  Looking through the current
> > kernel
> > code, I can't see any reason why a reinstate would fail, where a
> > reload
> > would help. If the path was missing from the multipath device,
> > update_multipath_strings() would already catch that, and quit
> > check_path() early, which make more sense to me than reloading does.
>=20
> fac68d7 is related to the famous "dm-multipath: Accept failed paths for
> multipath maps" patch (e.g.=20
> https://patchwork.kernel.org/patch/3368381/#7193001), which never made
> it upstream. SUSE kernels have shipped this patch for a long time, but
> we don't apply it any more in recent kernels.
>=20
> With this patch, The reinstate_path() failure would occur if multipathd
> had created a table with a "disabled" device (one which would be
> present in a dm map even though the actual block device didn't exist),
> and then tried to reinstate such a path. It sounds unlikely, but it
> might be possible if devices are coming and going in quick succession.
> In that situation, and with the "accept failed path" patch applied, a
> reload makes some sense, because reload (unlike reinstate) would not
> fail (at least not for this reason) and would actually add that just-
> reinstated path. OTOH, it's not likely that the reload would improve
> matters, either. After all, multipathd is just trying to reinstate a
> non-existing path. So, I'm fine with skipping the reload.
>=20
> >=20
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > ---
> >  multipathd/main.c | 36 ++++++++++++++----------------------
> >  1 file changed, 14 insertions(+), 22 deletions(-)
> >=20
> > diff --git a/multipathd/main.c b/multipathd/main.c
> > index 6b7db2c0..8fb73922 100644
> > --- a/multipathd/main.c
> > +++ b/multipathd/main.c
> > @@ -1611,22 +1611,18 @@ fail_path (struct path * pp, int del_active)
> >  /*
> >   * caller must have locked the path list before calling that
> > function
> >   */
> > -static int
> > +static void
> >  reinstate_path (struct path * pp)
> >  {
> > -=09int ret =3D 0;
> > -
> >  =09if (!pp->mpp)
> > -=09=09return 0;
> > +=09=09return;
> > =20
> > -=09if (dm_reinstate_path(pp->mpp->alias, pp->dev_t)) {
> > +=09if (dm_reinstate_path(pp->mpp->alias, pp->dev_t))
> >  =09=09condlog(0, "%s: reinstate failed", pp->dev_t);
> > -=09=09ret =3D 1;
> > -=09} else {
> > +=09else {
> >  =09=09condlog(2, "%s: reinstated", pp->dev_t);
> >  =09=09update_queue_mode_add_path(pp->mpp);
> >  =09}
> > -=09return ret;
> >  }
> >  static void
> > @@ -2088,8 +2084,13 @@ check_path (struct vectors * vecs, struct path
> > * pp, unsigned int ticks)
> >  =09 * Synchronize with kernel state
> >  =09 */
> >  =09if (update_multipath_strings(pp->mpp, vecs->pathvec, 1)) {
> > +=09=09struct dm_info info;
> >  =09=09condlog(1, "%s: Could not synchronize with kernel
> > state",
> >  =09=09=09pp->dev);
> > +=09=09if (pp->mpp && pp->mpp->alias &&
> > +=09=09    do_dm_get_info(pp->mpp->alias, &info) =3D=3D 0)
> > +=09=09=09/* multipath device missing. Likely removed */
> > +=09=09=09return 0;
> >  =09=09pp->dmstate =3D PSTATE_UNDEF;
>=20
> It would be more elegant if we could distinguish different failure
> modes from update_multipath_strings() directly, without having to call
> do_dm_get_info() again.

Seems reasonable. I'll take a look at that.

-Ben
=20
> >  =09}
> >  =09/* if update_multipath_strings orphaned the path, quit early */
> > @@ -2179,12 +2180,8 @@ check_path (struct vectors * vecs, struct path
> > * pp, unsigned int ticks)
> >  =09=09/*
> >  =09=09 * reinstate this path
> >  =09=09 */
> > -=09=09if (!disable_reinstate && reinstate_path(pp)) {
> > -=09=09=09condlog(3, "%s: reload map", pp->dev);
> > -=09=09=09ev_add_path(pp, vecs, 1);
> > -=09=09=09pp->tick =3D 1;
> > -=09=09=09return 0;
> > -=09=09}
> > +=09=09if (!disable_reinstate)
> > +=09=09=09reinstate_path(pp);
> >  =09=09new_path_up =3D 1;
> > =20
> >  =09=09if (oldchkrstate !=3D PATH_UP && oldchkrstate !=3D
> > PATH_GHOST)
> > @@ -2200,15 +2197,10 @@ check_path (struct vectors * vecs, struct
> > path * pp, unsigned int ticks)
> >  =09else if (newstate =3D=3D PATH_UP || newstate =3D=3D PATH_GHOST) {
> >  =09=09if ((pp->dmstate =3D=3D PSTATE_FAILED ||
> >  =09=09    pp->dmstate =3D=3D PSTATE_UNDEF) &&
> > -=09=09    !disable_reinstate) {
> > +=09=09    !disable_reinstate)
> >  =09=09=09/* Clear IO errors */
> > -=09=09=09if (reinstate_path(pp)) {
> > -=09=09=09=09condlog(3, "%s: reload map", pp->dev);
> > -=09=09=09=09ev_add_path(pp, vecs, 1);
> > -=09=09=09=09pp->tick =3D 1;
> > -=09=09=09=09return 0;
> > -=09=09=09}
> > -=09=09} else {
> > +=09=09=09reinstate_path(pp);
> > +=09=09else {
> >  =09=09=09LOG_MSG(4, verbosity, pp);
> >  =09=09=09if (pp->checkint !=3D max_checkint) {
> >  =09=09=09=09/*
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

