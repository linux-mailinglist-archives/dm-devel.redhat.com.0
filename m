Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D99821FFE7E
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 01:16:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592522165;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vXBxkgBAjfaTOIXgLerXSn7eTmcC3F2xGmjE2bRFL48=;
	b=RA7BFEEwCfJkGVpt+nklx5N11yon66V4lGroGn9Oariro3Vvl/BIjEHBioGjeTguBOUxn8
	GDQBZyonouZISkH8ktu5fgDmPRGmMdlniQdhyXSrTHo//VSxVcsAaREh3moEoqyR50ziAm
	RHxQ90EQ4xCypmnZCu2yrNBb7RTdP3I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-9EccwmUsOOiOibiqbt0Cfg-1; Thu, 18 Jun 2020 19:16:03 -0400
X-MC-Unique: 9EccwmUsOOiOibiqbt0Cfg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 390FB18585A2;
	Thu, 18 Jun 2020 23:15:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DAABF5D9C5;
	Thu, 18 Jun 2020 23:15:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EC8BD1809547;
	Thu, 18 Jun 2020 23:15:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05INFpxO017729 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 19:15:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4B7C45D9EF; Thu, 18 Jun 2020 23:15:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AF785D9C5;
	Thu, 18 Jun 2020 23:15:46 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 05INFiW2026223; 
	Thu, 18 Jun 2020 18:15:45 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 05INFiwn026222;
	Thu, 18 Jun 2020 18:15:44 -0500
Date: Thu, 18 Jun 2020 18:15:44 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20200618231544.GL5894@octiron.msp.redhat.com>
References: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
	<1592439867-18427-8-git-send-email-bmarzins@redhat.com>
	<05515ff45562db8013db838cd13bdb1f106f1e87.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <05515ff45562db8013db838cd13bdb1f106f1e87.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 7/7] multipath: add option to skip multipathd
	delegation
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thu, Jun 18, 2020 at 08:44:10PM +0000, Martin Wilck wrote:
> On Wed, 2020-06-17 at 19:24 -0500, Benjamin Marzinski wrote:
> > Add the -D option to allow users to skip delegating commands to
> > multipathd.
> >=20
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > ---
> >  libmultipath/config.h |  1 +
> >  multipath/main.c      | 15 +++++++++++----
> >  multipath/multipath.8 | 16 +++++++++++-----
> >  3 files changed, 23 insertions(+), 9 deletions(-)
> >=20
>=20
> I wonder if we really need this. We fall back to NOT_DELEGATED anyway.
> If users really, really want this, they can run multipath while
> multipathd is stopped.
>=20
> I'm not saying it's totally useless, but the presence of this option
> suggests to users that they may want to use it, which I doubt.
> Perhaps we want to have it, for debugging or expert usage purpose, as a
> hidden/undocumented option?

I'm fine with having it as an undocumented option.

-Ben

>=20
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

