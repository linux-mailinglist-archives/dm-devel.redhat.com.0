Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 59A192FAB88
	for <lists+dm-devel@lfdr.de>; Mon, 18 Jan 2021 21:33:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611001995;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PTHlWb3kFvFTeVj4EM2tC9MV5qJsZuGM9xSiPsmmVss=;
	b=K24abhgwYuucu3KJCNpgx9CmqpBgfODa83ET9Iz+Me4rUD0Z8xuA+dl97kw0R41Gg5/pag
	RfE9JPSp4Cskk/IUageyv3pnoYQz4Ct2UK2wnveuJTMUEiFneOLPIc2iM6+b4I3S2taCGm
	EzE/W0zCEycYLPVZHD5mbZXKdIr9UlI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-8Lq69ohjNpOHURFUbeEfmw-1; Mon, 18 Jan 2021 15:33:13 -0500
X-MC-Unique: 8Lq69ohjNpOHURFUbeEfmw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C16D1800D42;
	Mon, 18 Jan 2021 20:33:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0241F5C3E6;
	Mon, 18 Jan 2021 20:33:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 078B34BB7B;
	Mon, 18 Jan 2021 20:32:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10IKWbTM003693 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 18 Jan 2021 15:32:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D51D817511; Mon, 18 Jan 2021 20:32:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9ED1B5E1A8;
	Mon, 18 Jan 2021 20:32:34 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 10IKWXhF016361; 
	Mon, 18 Jan 2021 14:32:33 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 10IKWWCi016360;
	Mon, 18 Jan 2021 14:32:32 -0600
Date: Mon, 18 Jan 2021 14:32:32 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20210118203232.GB15006@octiron.msp.redhat.com>
References: <1610677227-23550-1-git-send-email-bmarzins@redhat.com>
	<1610677227-23550-7-git-send-email-bmarzins@redhat.com>
	<ee9749b44993cc007d0657488c98617fe69e4058.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <ee9749b44993cc007d0657488c98617fe69e4058.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 6/6] multipathd: cleanup logging for
	marginal paths
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 15, 2021 at 01:55:09PM +0000, Martin Wilck wrote:
> On Thu, 2021-01-14 at 20:20 -0600, Benjamin Marzinski wrote:
> > io_err_stat logged at level 2 whenever it enqueued a path to check,
> > which could happen multiple times while a path was marginal.=A0 On the
> > other hand if marginal_pathgroups wasn't set, multipathd didn't log
> > when
> > paths were set to marginal. Now io_err_stat only logs at level 2 when
> > something unexpected happens, but multipathd will always log when a
> > path switches its marginal state.
> >=20
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>

> > diff --git a/multipathd/main.c b/multipathd/main.c
> > index 92c45d44..99a89a69 100644
> > --- a/multipathd/main.c
> > +++ b/multipathd/main.c
> > @@ -2132,8 +2132,8 @@ check_path (struct vectors * vecs, struct path
> > * pp, unsigned int ticks)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pathinfo(pp, conf, 0);
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pthread_cleanup_pop(1);
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return 1;
> > -=A0=A0=A0=A0=A0=A0=A0} else if ((newstate !=3D PATH_UP && newstate !=
=3D PATH_GHOST) &&
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0(=
pp->state =3D=3D PATH_DELAYED)) {
> > +=A0=A0=A0=A0=A0=A0=A0} else if ((newstate !=3D PATH_UP && newstate !=
=3D PATH_GHOST &&
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 newstate !=3D P=
ATH_PENDING) && (pp->state =3D=3D
> > PATH_DELAYED)) {
>=20
> I think this is correct, but it needs to  be mentioned in the commit
> message (or go into a separate patch).

It needs to go in this patch. Without it, devices in the delayed state
can change to pending, and then back again. The code logs another
message every time this happens. But I can add an explanation to the
commit message.

I'll make a v3 release with just this patch.

-Ben
=20
> Regards,
> Martin
>=20
>=20
> --=20
> Dr. Martin Wilck <mwilck@suse.com>, Tel.=A0+49 (0)911 74053 2107
> SUSE Software Solutions Germany GmbH
> HRB 36809, AG N=FCrnberg GF: Felix Imend=F6rffer
>=20

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

