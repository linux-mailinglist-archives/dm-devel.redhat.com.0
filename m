Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9B434277680
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 18:21:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600964477;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CWjzsAkCtV5HDc+NgZEBdpfsfwNaen6Cwvu/arh/qzI=;
	b=KbwHnLbfEiOaL2QL50s0c67pOQpIEBrvxidKyB+iOFqBoqbEPV66xqmos+zuhld+EfcWGT
	eVBq0OcoU6XEBvglqBNVUuHGvNWfCV+35XH2JykN9hGsgqYAhFrkd8PDgBlWgD3T+2NNcg
	wOlRvHmYmHd9RYCPPRp4LMXqHJCgxQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-S3aTv3pHNY-sdlWUBVv7dQ-1; Thu, 24 Sep 2020 12:21:15 -0400
X-MC-Unique: S3aTv3pHNY-sdlWUBVv7dQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93CEF64091;
	Thu, 24 Sep 2020 16:21:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BF7A5D9D2;
	Thu, 24 Sep 2020 16:21:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 66E271826D2A;
	Thu, 24 Sep 2020 16:21:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OGL2pq015742 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 12:21:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9E02E5D9DD; Thu, 24 Sep 2020 16:21:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF1D55D9D3;
	Thu, 24 Sep 2020 16:20:57 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08OGKuaV021713; 
	Thu, 24 Sep 2020 11:20:56 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08OGKtU2021712;
	Thu, 24 Sep 2020 11:20:55 -0500
Date: Thu, 24 Sep 2020 11:20:55 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20200924162055.GF11108@octiron.msp.redhat.com>
References: <1600923569-17412-1-git-send-email-bmarzins@redhat.com>
	<1600923569-17412-4-git-send-email-bmarzins@redhat.com>
	<62ced86c81b139e6461fe0dc14207606548a652a.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <62ced86c81b139e6461fe0dc14207606548a652a.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [RFC PATCH v2 3/3] libmultipath: change log level
 for null uid_attribute
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2020 at 08:06:41AM +0000, Martin Wilck wrote:
> On Wed, 2020-09-23 at 23:59 -0500, Benjamin Marzinski wrote:
> > If uid_attribute is explicitly set to an empty string, multipath
> > should
> > log the uid at the default log level, since using the fallback code
> > is
> > the expected behavior.
> >=20
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > ---
> >  libmultipath/discovery.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
> > index f650534f..435f2639 100644
> > --- a/libmultipath/discovery.c
> > +++ b/libmultipath/discovery.c
> > @@ -2091,7 +2091,8 @@ get_uid (struct path * pp, int path_state,
> > struct udev_device *udev,
> >  =09=09}
> >  =09=09if ((!udev_available || (len <=3D 0 && allow_fallback))
> >  =09=09    && has_uid_fallback(pp)) {
> > -=09=09=09used_fallback =3D 1;
> > +=09=09=09if (udev_available || !(udev && pp-
> > >uid_attribute))
> > +=09=09=09=09used_fallback =3D 1;
> >  =09=09=09len =3D uid_fallback(pp, path_state, &origin);
> >  =09=09}
> >  =09}
>=20
> Uff, this logic was convoluted anyway, now it's even harder to grasp.
> IIUC, if !udev, used_fallback will be set to 1, even if=20
> pp->uid_attribute is the empty string. Is that intended?
> To make this easier to read, I'd suggest something like this:

My though was that not having a udev device is an unexpected situation,
and so we should continue to log the message at an increased logging
level.  If you're against that, it's not that important. I can certainly
go with your code logic, or "if (!udev || !empty_uid_attr)" if you think
it's reasonable to log at an increased level whenever the udev_device is
NULL, even if the device was configured to ignore the udev database.

-Ben

>=20
> =09=09bool valid_uid_attr =3D pp->uid_attribute
> =09=09=09&& *pp->uid_attribute;
> =09=09bool empty_uid_attr =3D pp->uid_attribute
> =09=09=09&& !*pp->uid_attribute;
> =09=09bool udev_available =3D udev && valid_uid_attr;
>       ...
> =09=09if ((!udev_available || (len <=3D 0 && allow_fallback))
> =09=09    && has_uid_fallback(pp)) {
> =09=09=09if (!empty_uid_attr)
> =09=09=09=09used_fallback =3D 1;
> =09=09=09len =3D uid_fallback(pp, path_state, &origin);
>=20
> Regards,
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

