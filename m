Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A83DF242CD9
	for <lists+dm-devel@lfdr.de>; Wed, 12 Aug 2020 18:08:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597248485;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qc8xvBdVgarBpsOkM9SOtB96nROZgsOWpAF+IprSLu8=;
	b=FEklriqnUmxYineKkIHLo+LZqbqel/msRFp0w2ZIPu2S2h6ZNkQmOrKQZyRbawWe5XjdVf
	SDTsPknLk+Wp0Xl/hRO2NopqfxjdAA1KUmNsSKbkBRslqSu6fTp0UrwQm0DkVXrDtWofcI
	kCPkICn1kwCrxv7MhR5O5mwsze5rzdg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-qDUUhmIPOouxk-KNgPIIdg-1; Wed, 12 Aug 2020 12:08:03 -0400
X-MC-Unique: qDUUhmIPOouxk-KNgPIIdg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B5D418B9F88;
	Wed, 12 Aug 2020 16:07:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A24175D6BD;
	Wed, 12 Aug 2020 16:07:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DA82C9A036;
	Wed, 12 Aug 2020 16:07:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07CG7mfJ004933 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Aug 2020 12:07:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 09713600D4; Wed, 12 Aug 2020 16:07:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1924B600C5;
	Wed, 12 Aug 2020 16:07:45 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07CG7h1q021382; 
	Wed, 12 Aug 2020 11:07:43 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07CG7gkq021381;
	Wed, 12 Aug 2020 11:07:42 -0500
Date: Wed, 12 Aug 2020 11:07:42 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20200812160742.GT19233@octiron.msp.redhat.com>
References: <1597183123-15797-1-git-send-email-bmarzins@redhat.com>
	<1597183123-15797-8-git-send-email-bmarzins@redhat.com>
	<6b8bb17983936f267f0b8ef05079dbac78e9e4fa.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <6b8bb17983936f267f0b8ef05079dbac78e9e4fa.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 7/8] multipathd: unset mpp->hwe when
	removing map
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, Aug 12, 2020 at 09:28:14AM +0000, Martin Wilck wrote:
> On Tue, 2020-08-11 at 16:58 -0500, Benjamin Marzinski wrote:
> > If the map doesn't unset its hwe pointer before orphaning all the
> > paths,
> > multipathd will print a warning message in orphan_path() because of
> > commit "libmultipath: warn if freeing path that holds mpp->hwe".
> >=20
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
>=20
> Do you have a specific reason to put "mpp->hwe =3D NULL" in the *callers*
> of orphan_paths()?

Nope.

> I observed the same problem, and fixed it
> directly in orphan_paths() (the patch is part of in my upcoming v2
> series).

we can go with yours then.

-Ben

> Regards,
> Martin
>=20
>=20
> > ---
> >  libmultipath/structs_vec.c | 1 +
> >  multipathd/main.c          | 1 +
> >  2 files changed, 2 insertions(+)
> >=20
> > diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
> > index ede14297..103ea11e 100644
> > --- a/libmultipath/structs_vec.c
> > +++ b/libmultipath/structs_vec.c
> > @@ -129,6 +129,7 @@ remove_map(struct multipath * mpp, struct vectors
> > * vecs, int purge_vec)
> >  =09/*
> >  =09 * clear references to this map
> >  =09 */
> > +=09mpp->hwe =3D NULL;
> >  =09orphan_paths(vecs->pathvec, mpp, "map removed internally");
> > =20
> >  =09if (purge_vec &&
> > diff --git a/multipathd/main.c b/multipathd/main.c
> > index f014d2a1..2b0e2734 100644
> > --- a/multipathd/main.c
> > +++ b/multipathd/main.c
> > @@ -666,6 +666,7 @@ flush_map(struct multipath * mpp, struct vectors
> > * vecs, int nopaths)
> >  =09=09condlog(2, "%s: map flushed", mpp->alias);
> >  =09}
> > =20
> > +=09mpp->hwe =3D NULL;
> >  =09orphan_paths(vecs->pathvec, mpp, "map flushed");
> >  =09remove_map_and_stop_waiter(mpp, vecs);
> > =20
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

