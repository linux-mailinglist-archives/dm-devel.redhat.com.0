Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 68C4F1041A5
	for <lists+dm-devel@lfdr.de>; Wed, 20 Nov 2019 18:02:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574269328;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hON727+C6ZW5+CMlylkKFg4RU+gwrahUzOE8U5N8z58=;
	b=MEE4hN90RPRsNE+K9E0XWq0fIQaZheyWDXq6ff2FzomFtRQ6u4lrJlo+ASEp5BQqyPrdwQ
	TWgD0jJQt3RMKYkI/AtKCAi9Sxl5NARWEVcs1CTD1BIrtFwj3MjyxJjxJY+HR+sYaWQiKU
	9j08XcwzwCGS4PRJAcDFvVztqtzapEs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-c2GBqwWJPTaPjFx1kmPdfw-1; Wed, 20 Nov 2019 12:02:06 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AD361005509;
	Wed, 20 Nov 2019 17:01:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 84C0C5ED4B;
	Wed, 20 Nov 2019 17:01:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B61D84BB65;
	Wed, 20 Nov 2019 17:01:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAKH1URp010570 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 20 Nov 2019 12:01:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 27E895ED43; Wed, 20 Nov 2019 17:01:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 900545E7A0;
	Wed, 20 Nov 2019 17:01:27 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id xAKH1QUx027087; 
	Wed, 20 Nov 2019 11:01:26 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id xAKH1NW1027084;
	Wed, 20 Nov 2019 11:01:23 -0600
Date: Wed, 20 Nov 2019 11:01:23 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20191120170122.GQ30153@octiron.msp.redhat.com>
References: <20191115143403.31692-1-martin.wilck@suse.com>
	<20191115143403.31692-6-martin.wilck@suse.com>
	<20191119222954.GM30153@octiron.msp.redhat.com>
	<9dbb15bcf8c527c950876505aaf52e0ea606cb5e.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <9dbb15bcf8c527c950876505aaf52e0ea606cb5e.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: "xose.vazquez@gmail.com" <xose.vazquez@gmail.com>,
	"wu.chongyun@h3c.com" <wu.chongyun@h3c.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"Bart.VanAssche@sandisk.com" <Bart.VanAssche@sandisk.com>
Subject: Re: [dm-devel] [PATCH 5/5] libmultipath: fix ALUA autodetection
 when paths are down
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
X-MC-Unique: c2GBqwWJPTaPjFx1kmPdfw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, Nov 20, 2019 at 12:33:15PM +0000, Martin Wilck wrote:
> On Tue, 2019-11-19 at 16:29 -0600, Benjamin Marzinski wrote:
> > On Fri, Nov 15, 2019 at 02:41:54PM +0000, Martin Wilck wrote:
> > > From: Martin Wilck <mwilck@suse.com>
> > >=20
> > > If a single path was offline when detect_alua() was called,
> > > multipathd would assume ALUA was generally unsupported.
> > >=20
> > > Fix that by assuming that if at least one path has ALUA support and
> > > no path explicitly does not have it, ALUA is supported.
> > >=20
> > > Signed-off-by: Martin Wilck <mwilck@suse.com>
> > > ---
> > >  libmultipath/discovery.c | 22 +++++++++++++++++++++-
> > >  libmultipath/propsel.c   | 20 +++++++++++++++++---
> > >  2 files changed, 38 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
> > > index 4288c9fd..5f41dcb7 100644
> > > --- a/libmultipath/discovery.c
> > > +++ b/libmultipath/discovery.c
> > > @@ -871,6 +871,10 @@ get_serial (char * str, int maxlen, int fd)
> > >  =09return 1;
> > >  }
> > > =20
> > > /*
> > > + * Side effect: sets pp->tpgs if it could be determined.
> > > + * If ALUA calls fail because paths are unreachable, pp->tpgs
> > > remains unchanged.
> > > + */
> > >  static void
> > >  detect_alua(struct path * pp)
> > >  {
> > > @@ -881,12 +885,28 @@ detect_alua(struct path * pp)
> > >  =09if (sysfs_get_timeout(pp, &timeout) <=3D 0)
> > >  =09=09timeout =3D DEF_TIMEOUT;
> > > =20
> > > -=09if ((tpgs =3D get_target_port_group_support(pp, timeout)) <=3D 0)=
 {
> > > +=09tpgs =3D get_target_port_group_support(pp, timeout);
> > > +=09if (tpgs =3D=3D -RTPG_INQUIRY_FAILED)
> > > +=09=09return;
> > > +=09else if (tpgs <=3D 0) {
> > >  =09=09pp->tpgs =3D TPGS_NONE;
> > >  =09=09return;
> > >  =09}
> > > +
> > > +=09if (pp->fd =3D=3D -1 || pp->offline)
> > > +=09=09return;
> > > +
> > =20
> > This is just a nitpick, but won't tpgs already be
> > -RTPG_INQUIRY_FAILED
> > if pp->fd =3D=3D -1. This check makes more sense before
> > get_target_port_group_support().
>=20
> Not really, because get_target_port_group_support() normally obtains
> INQUIRY data from sysfs, which can return something reasonable even
> if fd =3D=3D -1 (e.g. if the path is temporarily offline). In particular,
> it could indicate that the device has no TPGS support. That's why I
> call it first.

Oops. My bad.

Reviewed-by: Benjamin Marzinsk <bmarzins@redhat.com>

-Ben

>=20
> Regards,
> Martin
>=20

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

