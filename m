Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E02761E8383
	for <lists+dm-devel@lfdr.de>; Fri, 29 May 2020 18:21:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590769285;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oP4RtSvdmVzuEEF/9TdHof1L2ffaLIFYkmSiBs3sjh0=;
	b=ABx0P64Ut77G60Q/mrx2T5+C4E3vUh1ENF93/mf60U25soHRYM54u+2M8C6j98afp4BNbX
	Gfh8BIlco4nfwPV7yUEpw2TloTfUha9hSjDyk+AHHqbAxrQHIg7qEVpp6DYr8R9UTrBQVK
	Ve90ATs2iGT7RFiEWX3cIDXTwMWkonQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-bW-pnPOlOjaEjZ_6frEDbQ-1; Fri, 29 May 2020 12:21:21 -0400
X-MC-Unique: bW-pnPOlOjaEjZ_6frEDbQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B428106B247;
	Fri, 29 May 2020 16:21:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3542101E697;
	Fri, 29 May 2020 16:21:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3B7041809547;
	Fri, 29 May 2020 16:20:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04TGK89c027948 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 29 May 2020 12:20:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1535F2DE74; Fri, 29 May 2020 16:20:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 345A42DE7C;
	Fri, 29 May 2020 16:20:03 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 04TGK1a5007428; 
	Fri, 29 May 2020 11:20:01 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 04TGK0MN007427;
	Fri, 29 May 2020 11:20:00 -0500
Date: Fri, 29 May 2020 11:19:59 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20200529161959.GF5907@octiron.msp.redhat.com>
References: <1590725443-3519-1-git-send-email-bmarzins@redhat.com>
	<1590725443-3519-2-git-send-email-bmarzins@redhat.com>
	<d092428a245e0b5d88b70f03a473d7df7b95cd27.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <d092428a245e0b5d88b70f03a473d7df7b95cd27.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"xose.vazquez@gmail.com" <xose.vazquez@gmail.com>,
	"besser82@fedoraproject.org" <besser82@fedoraproject.org>,
	"mail@eworm.de" <mail@eworm.de>
Subject: Re: [dm-devel] [PATCH 1/1] libdmmp: Add support for upcoming json-c
	0.14.0.
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

On Fri, May 29, 2020 at 09:12:30AM +0000, Martin Wilck wrote:
> Hi Ben,
>=20
> On Thu, 2020-05-28 at 23:10 -0500, Benjamin Marzinski wrote:
> > From: Bj=F6rn Esser <besser82@fedoraproject.org>
> >=20
> > TRUE/FALSE are not defined anymore.  1 and 0 are used instead.
> > This is backwards compatible, as earlier versions of json-c are
> > using the same integer values in their present definitions.
> >=20
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > ---
> >  libdmmp/libdmmp_private.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/libdmmp/libdmmp_private.h b/libdmmp/libdmmp_private.h
> > index ac85b63f..4378962b 100644
> > --- a/libdmmp/libdmmp_private.h
> > +++ b/libdmmp/libdmmp_private.h
> > @@ -82,7 +82,7 @@ static out_type func_name(struct dmmp_context *ctx,
> > const char *var_name) { \
> >  do { \
> >  =09json_type j_type =3D json_type_null; \
> >  =09json_object *j_obj_tmp =3D NULL; \
> > -=09if (json_object_object_get_ex(j_obj, key, &j_obj_tmp) !=3D TRUE)
> > { \
> > +=09if (json_object_object_get_ex(j_obj, key, &j_obj_tmp) !=3D 1) { \
> >  =09=09_error(ctx, "Invalid JSON output from multipathd IPC: "
> > \
> >  =09=09       "key '%s' not found", key); \
> >  =09=09rc =3D DMMP_ERR_IPC_ERROR; \
>=20
> Did you see=20
> https://www.redhat.com/archives/dm-devel/2020-May/msg00261.html ?

Nope. Overlooked it. My bad. I'm fine with any version that compiles.
Either stdbool or int is fine.

-Ben

>=20
> This has first been reported to the list by Christian (
> https://www.redhat.com/archives/dm-devel/2020-April/msg00261.html), and
> brought to my attention later by Xose. I personally thought the change
> from boolean to int is a step in the wrong direction, therefore I
> submitted my modified version using stdboolh. If everyone else is fine
> with the int, it's not worth arguing about it.
>=20
> Regards,
> Martin
>=20
> PS: Can anyone explain why json-c did this? Looks like a "cause hassle
> for downstream devs and users for no good reason" kind of thing to
> me...
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

