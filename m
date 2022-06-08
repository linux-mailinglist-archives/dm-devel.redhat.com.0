Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 688C55432C5
	for <lists+dm-devel@lfdr.de>; Wed,  8 Jun 2022 16:40:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654699253;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eHL+093gk7HM9SPi8hGfZ6xvkwfAzPpVXuIlhup0D5g=;
	b=bJchYrUMo0ZKjPxdoEjXqGADfZRRB/6Y7n709nQhCcSioXXOBFfdV0HVQjt1NXCYR4MMqw
	TFatoaiE+KSZwsfyTEP0IJ6j1kq5DXpTdJIpi31BSlA/c/ZzEF8Ss9Du6WmVyWQ30lDt1Z
	/aFAy7NdhFzj+GsBdHLIhAswy0hew0I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-PGT8R3wnMiKARSozpFW3Og-1; Wed, 08 Jun 2022 10:40:51 -0400
X-MC-Unique: PGT8R3wnMiKARSozpFW3Og-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80CE338005C5;
	Wed,  8 Jun 2022 14:40:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E94564328C9;
	Wed,  8 Jun 2022 14:40:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9931E194705F;
	Wed,  8 Jun 2022 14:40:44 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4BACC194704A
 for <dm-devel@listman.corp.redhat.com>; Wed,  8 Jun 2022 14:40:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 198A7400DF1C; Wed,  8 Jun 2022 14:40:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07EE540CF8E8;
 Wed,  8 Jun 2022 14:40:08 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 258Ee7o7027834;
 Wed, 8 Jun 2022 09:40:07 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 258Ee639027833;
 Wed, 8 Jun 2022 09:40:06 -0500
Date: Wed, 8 Jun 2022 09:40:06 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20220608144006.GW5254@octiron.msp.redhat.com>
References: <1654641901-12324-1-git-send-email-bmarzins@redhat.com>
 <1675cd007bfee3f944c986e7e8a9eec8969487cd.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <1675cd007bfee3f944c986e7e8a9eec8969487cd.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [dm-devel] [PATCH] libmultipath: unset detect_checker for
 clariion / Unity arrays
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: "vincent.chen1@dell.com" <vincent.chen1@dell.com>,
 "christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 08, 2022 at 07:56:27AM +0000, Martin Wilck wrote:
> On Tue, 2022-06-07 at 17:45 -0500, Benjamin Marzinski wrote:
> > Dell EMC would like to always use the emc_clariion checker. Currently
> > detect_checker will switch the checker to TUR for Unity arrays.
> > This can cause problems on some setups with replicated Unity LUNs,
> > which are handled correctly the the emc_checker, but not the TUR
> > checker.
> >=20
> > Cc: vincent.chen1@dell.com
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
>=20
> This points us to a flaw in our logic.
>=20
> It was wrong in the first place to have autodetection take precedence,
> even over "overrides". The effect for users is that whenever
> "path_checker" is set, "detect_checker no" must also be set, which
> is highly surprising and adds no benefit.
>=20
> We should assume that if a device has an explicit checker configured
> either in the device configuration, overrides, or the hwtable, this
> checker must be used, and fall back to autodetection only if this is
> not the case.
>=20
> So while this patch is alright, I'd prefer a patch that fixes the
> logic.

I'm not sure that this is a good idea. IIRC, the current method was an
intentional choice.  The idea was that if a checker was autodetected, we
would use that. If not, we would fall back to the user defined checker.
For the most part this is useful for arrays that could be run in ALUA or
non-alua mode.  Changing the priority of detect_checker will suddenly
change how these arrays are configured.  Users that configured a
failback checker for cases where their arrays weren't in ALUA mode would
suddenly find that their arrays were always using the fallback method.=20

Now I'm not saying that the original logic was the best option. But I am
saying that it hasn't caused many issues over the years that it's been
in existance. There are a number of arrays in the builtin hardware table
that define checkers. I assume that they either don't support ALUA, or
they are happy with only using their configured checker when their
arrays aren't in ALUA mode. I would rather fix the remaining cases where
the existing priority gives the wrong answer than suddenly change how
things work, in a way that could suddenly break things for an unknown
(but quite possibly large) number of existing users.

> (The same could be said for detect_prio, but I don't want to make
> outrageous demands).

The above arguments apply here, only moreso.
=20
-Ben

> Martin
>=20
>=20
>=20
>=20
>=20
> > ---
> > =A0libmultipath/hwtable.c | 1 +
> > =A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c
> > index 39daadc2..415bf683 100644
> > --- a/libmultipath/hwtable.c
> > +++ b/libmultipath/hwtable.c
> > @@ -350,6 +350,7 @@ static struct hwentry default_hw[] =3D {
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.no_path_retry =3D (300=
 / DEFAULT_CHECKINT),
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.checker_name=A0 =3D EM=
C_CLARIION,
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.prio_name=A0=A0=A0=A0 =
=3D PRIO_EMC,
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.detect_checker =3D DETEC=
T_CHECKER_OFF,
> > =A0=A0=A0=A0=A0=A0=A0=A0},
> > =A0=A0=A0=A0=A0=A0=A0=A0{
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* Invista / VPLEX */
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

