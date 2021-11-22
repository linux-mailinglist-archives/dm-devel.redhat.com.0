Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E27459422
	for <lists+dm-devel@lfdr.de>; Mon, 22 Nov 2021 18:43:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637603020;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tDUyr3eTdTvna+1qJoPdCbL/i1FiOXo79A3XJiV5fwU=;
	b=YJUVbwofRQoumBFxiVBDMAxNrFtZFxyHskxQieG+Wua0s7+Wv/D8dLObBcDUid+tiZnnXD
	b9dZ8VEqUQsGcVu+vCi5ix9cvQiobeOMaZsx9cHL93l3buTJjJ7946CAz5I5dJ22+/aDje
	aYDamICoFtp96gazz+d0ixcFNjkON+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-AoSszUkbPrqBbk60-8BqrQ-1; Mon, 22 Nov 2021 12:43:38 -0500
X-MC-Unique: AoSszUkbPrqBbk60-8BqrQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7AA910168C3;
	Mon, 22 Nov 2021 17:43:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A762660C28;
	Mon, 22 Nov 2021 17:43:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CE0F21832E7F;
	Mon, 22 Nov 2021 17:43:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AMHhAnY000833 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 22 Nov 2021 12:43:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 90D3260862; Mon, 22 Nov 2021 17:43:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE49B60843;
	Mon, 22 Nov 2021 17:43:05 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1AMHh3KW007327; 
	Mon, 22 Nov 2021 11:43:04 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1AMHh3ag007326;
	Mon, 22 Nov 2021 11:43:03 -0600
Date: Mon, 22 Nov 2021 11:43:03 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20211122174303.GL19591@octiron.msp.redhat.com>
References: <1637275667-13436-1-git-send-email-bmarzins@redhat.com>
	<6444fd097cf43bdfe6b1947f42f270e958310fff.camel@suse.com>
	<20211122153554.GJ19591@octiron.msp.redhat.com>
	<7ae474b1273b27a188593b716e5f0dfc1d09cad1.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <7ae474b1273b27a188593b716e5f0dfc1d09cad1.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH] multipathd: avoid unnecessary path read-only
	reloads
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 22, 2021 at 04:48:06PM +0000, Martin Wilck wrote:
> On Mon, 2021-11-22 at 09:35 -0600, Benjamin Marzinski wrote:
> > On Fri, Nov 19, 2021 at 09:33:39PM +0000, Martin Wilck wrote:
> > > On Thu, 2021-11-18 at 16:47 -0600, Benjamin Marzinski wrote:
> > > > A mulitpath device can only be reloaded read/write when all paths
> > > > are
> > > > read/write. Also, whenever a read-only device is rescanned, the
> > > > scsi
> > > > subsystem will first unconditionally issue a uevent with
> > > > DISK_RO=3D0
> > > > before checking the read-only status, and if it the device is
> > > > still
> > > > read-only, issuing another uevent with DISK_RO=3D1. These uevents
> > > > cause
> > > > pointless rereads when read-only paths are rescanned. To avoid
> > > > this,
> > > > check to see if all paths are read/write before changing a
> > > > multipath
> > > > device from read-only to read/write.
> > > >=20
> > > > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > > > ---
> > > > =A0libmultipath/libmultipath.version |=A0 5 +++++
> > > > =A0libmultipath/sysfs.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 22=
 ++++++++++++++++++++++
> > > > =A0libmultipath/sysfs.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=
 1 +
> > > > =A0multipathd/main.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 | 31
> > > > ++++++++++++++++++++++++++++++-
> > > > =A04 files changed, 58 insertions(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/libmultipath/libmultipath.version
> > > > b/libmultipath/libmultipath.version
> > > > index 58a7d1be..ab4c7e30 100644
> > > > --- a/multipathd/main.c
> > > > +++ b/multipathd/main.c
> > > > @@ -1440,6 +1440,35 @@ finish_path_init(struct path *pp, struct
> > > > vectors * vecs)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0return -1;
> > > > =A0}
> > > > =A0
> > > > +static bool
> > > > +needs_ro_update(struct multipath *mpp, int ro)
> > > > +{
> > > > +=A0=A0=A0=A0=A0=A0=A0struct pathgroup * pgp;
> > > > +=A0=A0=A0=A0=A0=A0=A0struct path * pp;
> > > > +=A0=A0=A0=A0=A0=A0=A0unsigned int i, j;
> > > > +=A0=A0=A0=A0=A0=A0=A0struct dm_info *dmi =3D NULL;
> > > > +
> > > > +=A0=A0=A0=A0=A0=A0=A0if (!mpp || ro < 0)
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return false;
> > > > +=A0=A0=A0=A0=A0=A0=A0dm_get_info(mpp->alias, &dmi);
> > >=20
> > > Why can't you just use mpp->dmi here?
> >=20
> > Since that value is set when the dmi is originally created, I didn't
> > want to not reload a map, if we simply haven't updated it yet to
> > reflect
> > a change in the read-only value, like with do with dm_is_suspended()
> > or dm_get_deferred_remove(), etc. I could make a dm_get_read_only()
> > function and put it libmultipath/devmapper.c like the others, if
> > you'd
> > rather.
>=20
> I had expected that this property wouldn't silently change under us.
> Actually, I do think that we should get an uevent if this happens.
> Not sure if we process it properly, though.

I think we will update the dmi, but I'm not sure that these uevents
won't race. The worry was that the device would switch to read-only and
then back too quickly, and we would get this event and still see the
device in read/write because we haven't processed the event which would
update the multipath dmi.

> > =A0
> > > > +=A0=A0=A0=A0=A0=A0=A0if (!dmi) /* assume we do need to reload the =
device */
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return true;
> > >=20
> > > Why that? I'd assume that if a DM_DEVICE_INFO ioctl fails on the
> > > device, a RELOAD would almost certainly fail, too.
> > >=20
> >=20
> > Since reloading when it's not necessary doesn't do any harm (it's
> > what
> > we currently do) while not switching to read/write when we should is
> > a
> > problem, I thought that I'd error on the side of caution, but I agree
> > that the reload is unlikey to succeed, so I can change this if you'd
> > like.
>=20
> I misunderstood what being "cautious" means in this context. I gather
> now that it's "if in doubt, reload". Fine with me.
>=20
> >=20
> > > > +=A0=A0=A0=A0=A0=A0=A0if (dmi->read_only =3D=3D ro) {
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0free(dmi);
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return false;
> > > > +=A0=A0=A0=A0=A0=A0=A0}
> > > > +=A0=A0=A0=A0=A0=A0=A0free(dmi);
> > > > +=A0=A0=A0=A0=A0=A0=A0if (ro =3D=3D 1)
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return true;
> > > > +=A0=A0=A0=A0=A0=A0=A0vector_foreach_slot (mpp->pg, pgp, i) {
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0vector_foreach_slot (=
pgp->paths, pp, j) {
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0if (sysfs_get_ro(pp) =3D=3D 1)
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0return false;
> > >=20
> > > I think you should also return false here if sysfs_get_ro() returns
> > > error.
> >=20
> > Same thing here. I was erroring on the side of caution, but it should
> > be
> > fine to change.
>=20
> Same misunderstanding on my part. Thanks for the clarification.
>=20
> Regards
> Martin
>=20
> >=20
> > -Ben
> >=20
> > =A0
> > > Regards,
> > > Martin
> > >=20
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> > > > +=A0=A0=A0=A0=A0=A0=A0}
> > > > +=A0=A0=A0=A0=A0=A0=A0return true;
> > > > +}
> > > > +
> > > > =A0static int
> > > > =A0uev_update_path (struct uevent *uev, struct vectors * vecs)
> > > > =A0{
> > > > @@ -1512,7 +1541,7 @@ uev_update_path (struct uevent *uev, struct
> > > > vectors * vecs)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> > > > =A0
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0ro =3D uevent_get_d=
isk_ro(uev);
> > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (mpp && ro >=3D 0)=
 {
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if (needs_ro_update(m=
pp, ro)) {
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0condlog(2, "%s: update path write_protect
> > > > to
> > > > '%d' (uevent)", uev->kernel, ro);
> > > > =A0
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0if (mpp->wait_for_udev)
> >=20

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

