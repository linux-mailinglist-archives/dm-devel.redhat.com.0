Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 071FD51736F
	for <lists+dm-devel@lfdr.de>; Mon,  2 May 2022 18:02:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651507322;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=walsre37l9aYu2hk00N6KzSQ2ETYmCAjmfPnOFbkiwA=;
	b=WgoL0g6427zEh+2eU0lm7zYLABlwj3oq4BHXzS/LTOJgZ+dbK+t4W59viN0YKFCyAZs7b2
	BllDLBvMhEl8T4YLi4PKg5M9EV3xYkW/qw7gYpanfaISRKhWLWObEgXJE1nbI3pf0ncQcz
	clBUu3f6lX8NGI+QVYreTjFjKHVZV5I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-JzQjm7YaNoyG7DaZaJQmOg-1; Mon, 02 May 2022 12:02:01 -0400
X-MC-Unique: JzQjm7YaNoyG7DaZaJQmOg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3281D1014A6B;
	Mon,  2 May 2022 16:01:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6FFC6463DE7;
	Mon,  2 May 2022 16:01:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B27271947068;
	Mon,  2 May 2022 16:01:49 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 26930194705F
 for <dm-devel@listman.corp.redhat.com>; Mon,  2 May 2022 16:01:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 02A2C40CF8F6; Mon,  2 May 2022 16:01:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 731F9400E88F;
 Mon,  2 May 2022 16:01:43 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 242G1gcg014570;
 Mon, 2 May 2022 11:01:42 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 242G1fAT014569;
 Mon, 2 May 2022 11:01:41 -0500
Date: Mon, 2 May 2022 11:01:40 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20220502160140.GR24684@octiron.msp.redhat.com>
References: <1651270144-29953-1-git-send-email-bmarzins@redhat.com>
 <dc486bce737a9784543af9d910cb4f4ea15e5260.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <dc486bce737a9784543af9d910cb4f4ea15e5260.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [dm-devel] [PATCH] update HPE MSA builtin config
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
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "Jon.Paul@hpe.com" <Jon.Paul@hpe.com>,
 "xose.vazquez@gmail.com" <xose.vazquez@gmail.com>
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

On Mon, May 02, 2022 at 10:31:36AM +0000, Martin Wilck wrote:
> On Fri, 2022-04-29 at 17:09 -0500, Benjamin Marzinski wrote:
> > Make the config better align to MSA 4th, 5th and 6th Generation
> > systems.
> >=20
> > Suggested-by: Jon Paul <Jon.Paul@hpe.com>
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > ---
> > =A0libmultipath/hwtable.c | 4 ++--
> > =A01 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c
> > index 0e1c0a41..0f0795c3 100644
> > --- a/libmultipath/hwtable.c
> > +++ b/libmultipath/hwtable.c
> > @@ -182,8 +182,8 @@ static struct hwentry default_hw[] =3D {
> > =A0=A0=A0=A0=A0=A0=A0=A0},
> > =A0=A0=A0=A0=A0=A0=A0=A0{
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* MSA 1040, 1050, 1060=
, 2040, 2050 and 2060 families
> > */
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.vendor=A0=A0=A0=A0=A0=A0=
=A0 =3D "HP",
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.product=A0=A0=A0=A0=A0=
=A0 =3D "MSA [12]0[456]0 SA[NS]",
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.vendor=A0=A0=A0=A0=A0=A0=
=A0 =3D "(HP|HPE)",
>=20
> This changes nothing unless you use "^(HP|HPE)$", as our regex matching
> is by substring.

Fair enough. I'm just passing along the config I got. I'm not sure if
they what it to be more immediately obvious to people looking at the
configs that this applies to their device (which could have a vendor
string of "HPE"). I'll leave it to HP to decide what, if anything, they
want to change here.

-Ben=20
=20
> Regards,
> Martin
>=20
>=20
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.product=A0=A0=A0=A0=A0=
=A0 =3D "MSA [12]0[456]0
> > (SAN|SAS|FC|iSCSI)",
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.pgpolicy=A0=A0=A0=A0=
=A0 =3D GROUP_BY_PRIO,
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.pgfailback=A0=A0=A0 =
=3D -FAILBACK_IMMEDIATE,
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.no_path_retry =3D 18,
>=20
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

