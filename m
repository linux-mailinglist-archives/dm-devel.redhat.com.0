Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 183F2643963
	for <lists+dm-devel@lfdr.de>; Tue,  6 Dec 2022 00:23:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670282579;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FsDVbFrRUjGuj/tboC1tonf1jzCpQAUUZa/uQJqal+0=;
	b=PlGj9mEIwh7WA08stQaUmeecDnHsCsiCC6hWu0v423vHQAJOYt/nu0E58jV84Iu/9S8gQ8
	u9a+58HYL0mF42xV/a+B2mC55qDtTkQJExpkT0r068z3pavjgoJozcITbmoLx1tfQLVo3W
	3goj5YVhNtRAYjGStwqNxE3cgmyAVFY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-UKNsEo0LMbO1vmEN6LuPng-1; Mon, 05 Dec 2022 18:22:56 -0500
X-MC-Unique: UKNsEo0LMbO1vmEN6LuPng-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC920800B23;
	Mon,  5 Dec 2022 23:22:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 572E41415100;
	Mon,  5 Dec 2022 23:22:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4AC4619465A3;
	Mon,  5 Dec 2022 23:22:49 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 383191946589
 for <dm-devel@listman.corp.redhat.com>; Mon,  5 Dec 2022 23:22:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3C8F3C1908B; Mon,  5 Dec 2022 23:22:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 264B3C159CD;
 Mon,  5 Dec 2022 23:22:21 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 2B5NMJw1016317;
 Mon, 5 Dec 2022 17:22:20 -0600
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 2B5NMJE1016316;
 Mon, 5 Dec 2022 17:22:19 -0600
Date: Mon, 5 Dec 2022 17:22:19 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20221205232219.GB19568@octiron.msp.redhat.com>
References: <20221201103238.2601-2-mwilck@suse.com>
 <1d35c16a-105f-a2aa-ca5d-a952e505d9b0@gmail.com>
 <90467d9459a95a6910f55f3e0f93163a6541429a.camel@suse.com>
 <91e6e7158648b2f5f2bc583e62c9563f5d8fe914.camel@suse.com>
 <CAAMCDec=joUfwX3TFGPTAFB8UP7ihxqOz5EiLR-Mp2yJQtSsnQ@mail.gmail.com>
 <e506d4c8d63e0fda3c28297c4316b49c0e2a9fb1.camel@suse.com>
 <CAAMCDeeAQL8yaq2HVE+hFdYv=Ax7aSCn0gqKEW2AV-jzzN9esg@mail.gmail.com>
 <cf398b5ccefd3a1a6f458ab5e4811f8f6afc415c.camel@suse.com>
 <CAAMCDeeUkfetN6ABUcDTU29m0yR1gv7UPh8_2HtLg_ZPBougXg@mail.gmail.com>
 <2ac89d4413992bd1158e4552d0632cf8c6a8dd89.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <2ac89d4413992bd1158e4552d0632cf8c6a8dd89.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [dm-devel] [PATCH 2/2] multipath.conf(5): improve documentation
 of dev_loss_tmo
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
Cc: Roger Heflin <rogerheflin@gmail.com>, dm-devel@redhat.com,
 Xose Vazquez Perez <xose.vazquez@gmail.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 03, 2022 at 01:02:41AM +0100, Martin Wilck wrote:
> On Fri, 2022-12-02 at 18:00 -0600, Roger Heflin wrote:
> > One of the Enterprise 7 variants, Claims "0.4.9" multipath but
> > appears to have a number of recent features backported, so some
> > frankensteined version.
> >=20
> > On Fri, Dec 2, 2022 at 5:50 PM Martin Wilck <mwilck@suse.com> wrote:
> > > On Fri, 2022-12-02 at 17:44 -0600, Roger Heflin wrote:
> > > > Thanks.
> > > >=20
> > > > The older distribution I checked has this for -T
> > > > =A0 =A0=A0 -T tm:valid
> > > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 check if tm matches the multipathd conf=
iguration
> > > > timestamp value from /run/multipathd/timestamp If so, return
> > > > success
> > > > if valid is 1. Otherwise, return failure. If the timestamp
> > > > doesn't
> > > > match continue with multipath execution.=A0 This option is designed
> > > > to
> > > > be used with -c by the udev rules.
> > >=20
> > > Strange, I can't find this anywhere in the sources I know.
> > > What distro is this? "multipath -T" in the sense I described has
> > > existed since 0.7.7, so for more than 4 years.
> > >=20
> > > Martin
> > >=20
>=20
> Funny, Ben never told me there was a conflicting option name in RHEL.
> I guess it's too late now, as I said, the upstream option has existed
> for 4 years.

This was a fix for a RHEL specific systemd issue, that's long since been
resolved in more up to date versions of RHEL. RHEL-8 and RHEL-9 have the
same code as upstream for the -T option.

-Ben

>=20
> Martin
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

