Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 4A2381FFE82
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 01:18:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592522288;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=s/jn+9VzT4EesOsx9ii1lgUazIFpm+mb3KGC/SmWzis=;
	b=YrfGF/RAr2qs8Uker6hdembF4Onxias9XsoaCQI0FWufK9az8xh43OzQIGeFxI8ZLN16YK
	QgthZ5l+AujK7/6IBbEZsW2FvJKS44m3HB0HwfNOdWTQAwXRxbtvt7sddtAEvxImpXqY03
	WsSKSmh1UTirtbIAjf6lP+152STzQVs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-2F5hAZabMmuzzHYDuKsFBg-1; Thu, 18 Jun 2020 19:17:49 -0400
X-MC-Unique: 2F5hAZabMmuzzHYDuKsFBg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9191A18A8223;
	Thu, 18 Jun 2020 23:17:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7172C7CAA5;
	Thu, 18 Jun 2020 23:17:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 34FA1833CF;
	Thu, 18 Jun 2020 23:17:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05INHefX017916 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 19:17:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2DB737CAB9; Thu, 18 Jun 2020 23:17:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B81FE7CAA5;
	Thu, 18 Jun 2020 23:17:35 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 05INHYPa026235; 
	Thu, 18 Jun 2020 18:17:34 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 05INHYme026234;
	Thu, 18 Jun 2020 18:17:34 -0500
Date: Thu, 18 Jun 2020 18:17:33 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20200618231733.GN5894@octiron.msp.redhat.com>
References: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
	<1592439867-18427-2-git-send-email-bmarzins@redhat.com>
	<a0ac8df28c485019977a5baa3d1c4620604952db.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <a0ac8df28c485019977a5baa3d1c4620604952db.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/7] libmultipath: change do_get_info returns
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thu, Jun 18, 2020 at 03:27:22PM +0000, Martin Wilck wrote:
> On Wed, 2020-06-17 at 19:24 -0500, Benjamin Marzinski wrote:
> > Make do_get_info() differentiate between dm failures and missing
> > devices, and update callers to retain their current behavior. Also,
> > rename it and make it external. These changes will be used by future
> > commits.
> >=20
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > ---
> >  libmultipath/devmapper.c | 29 ++++++++++++++++-------------
> >  libmultipath/devmapper.h |  1 +
> >  2 files changed, 17 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
> > index 27d52398..b44f7545 100644
> > --- a/libmultipath/devmapper.c
> > +++ b/libmultipath/devmapper.c
> > @@ -496,8 +496,14 @@ int dm_addmap_reload(struct multipath *mpp, char
> > *params, int flush)
> >  =09return 0;
> >  }
> > =20
> > -static int
> > -do_get_info(const char *name, struct dm_info *info)
> > +/*
> > + * Returns:
> > + * -1: Error
> > + *  0: device does not exist
> > + *  1: device exists
> > + */
>=20
> Can we use symbolic values here please? In particular as you have
> changed the "success" return value from 0 to 1...
>=20
> One day we should come up with a proper return value scheme
> for libmultipath, defining specific enums for every function
> doesn't scale. But do it here for now nonetheless, please.

Sure

-Ben

>=20
> Apart from that, ok.
>=20
> Regards
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

