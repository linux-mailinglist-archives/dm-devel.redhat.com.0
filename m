Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 927D01FFE7C
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 01:12:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592521953;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=O5RA6GAAZcmUorESo/DlvCY5CxspT9S+a4wh89IaAXU=;
	b=LkYPYaxRSYWREUqXOQIQ9Q1G7by1OnAdXM/fngwYfVR383zza0McmPifHlqafV7upg49lh
	HCoLsX92utFkmFO3GY2j8x8HI8uRl38jY8KVKnRr1cW19Zf8PgQ8ErXkzs/Kw0FqZ8uAaf
	v0khsZmsu+d0OnQ3a+hPidD7Ta0w7Cw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-mISALCXnOU20M_sb3V28zQ-1; Thu, 18 Jun 2020 19:12:31 -0400
X-MC-Unique: mISALCXnOU20M_sb3V28zQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 886FA8015CE;
	Thu, 18 Jun 2020 23:12:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A43A5C1BB;
	Thu, 18 Jun 2020 23:12:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 08F82833C8;
	Thu, 18 Jun 2020 23:12:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05INCChg017412 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 19:12:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0A8655C1D0; Thu, 18 Jun 2020 23:12:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 045845C1BB;
	Thu, 18 Jun 2020 23:12:08 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 05INC7Cc026213; 
	Thu, 18 Jun 2020 18:12:07 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 05INC7FV026212;
	Thu, 18 Jun 2020 18:12:07 -0500
Date: Thu, 18 Jun 2020 18:12:06 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20200618231206.GK5894@octiron.msp.redhat.com>
References: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
	<1592439867-18427-5-git-send-email-bmarzins@redhat.com>
	<e27f7ecbc221185773df1db7b36209db6d1bd61a.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <e27f7ecbc221185773df1db7b36209db6d1bd61a.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 4/7] multipathd: add "del maps" multipathd
	command
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

On Thu, Jun 18, 2020 at 08:37:20PM +0000, Martin Wilck wrote:
> On Wed, 2020-06-17 at 19:24 -0500, Benjamin Marzinski wrote:
> > This will flush all multipath devices.
> >=20
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > ---
> >  libmultipath/devmapper.c  |  7 +++++--
> >  libmultipath/devmapper.h  |  2 +-
> >  multipath/main.c          |  2 +-
> >  multipathd/cli.c          |  1 +
> >  multipathd/cli_handlers.c | 19 +++++++++++++++++++
> >  multipathd/cli_handlers.h |  1 +
> >  multipathd/main.c         |  3 ++-
> >  multipathd/main.h         |  1 +
> >  8 files changed, 31 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
> > index 682c0038..a5e0d298 100644
> > --- a/libmultipath/devmapper.c
> > +++ b/libmultipath/devmapper.c
> > @@ -991,7 +991,7 @@ dm_flush_map_nopaths(const char * mapname, int
> > deferred_remove)
> > =20
> >  #endif
> > =20
> > -int dm_flush_maps (int retries)
> > +int dm_flush_maps (int need_suspend, int retries)
> >  {
> >  =09int r =3D 1;
> >  =09struct dm_task *dmt;
> > @@ -1014,7 +1014,10 @@ int dm_flush_maps (int retries)
> > =20
> >  =09r =3D 0;
> >  =09do {
> > -=09=09r |=3D dm_suspend_and_flush_map(names->name, retries);
> > +=09=09if (need_suspend)
> > +=09=09=09r |=3D dm_suspend_and_flush_map(names->name,
> > retries);
> > +=09=09else
> > +=09=09=09r |=3D dm_flush_map(names->name);
>=20
> This is fine, but considering the previous discussion, I'd prefer to
> get rid of need_suspend and dm_suspend_and_flush_map() entirely. It
> would simplify the _dm_flush_map code path significantly.
>=20
> As we determined that we use the suspend/resume only in multipath
> anyway, we could add it there in the "non-delegated" code path.

I'm confused. dm_flush_maps() is also called in the non-delegated code
path, where it uses the dm_suspend_and_flush_map(). Are you proposing
an alternative version of dm_flush_maps() for multipath?

-Ben

> Thanks,
> Martin
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

