Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4F39A2EA178
	for <lists+dm-devel@lfdr.de>; Tue,  5 Jan 2021 01:34:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1609806875;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=khVi49M6za1qvfkcvlU9aXplCFuN1OX6HeDwqHbQD0w=;
	b=isN0PxyC2SSquygYbCeURRdBypjoroP2y/iFGn7Iq+4eRZweHNuV13LQDovhCZJXZYTnBZ
	TEjGSNzpkVGkBjVOMQyolJvXwT1cWcpRWiYB9uTtaZNPCuZMJx2w4hlHUtyKaOzkJNCH17
	UeyCKaV5qTfMzHPv46o7TRXwwSFDxPI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-S-YndumOPNScgWccW3HfCA-1; Mon, 04 Jan 2021 19:34:32 -0500
X-MC-Unique: S-YndumOPNScgWccW3HfCA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE9979CC03;
	Tue,  5 Jan 2021 00:34:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BBB610023AB;
	Tue,  5 Jan 2021 00:34:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D96374A7C6;
	Tue,  5 Jan 2021 00:34:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1050XmsM024119 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 4 Jan 2021 19:33:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9366017250; Tue,  5 Jan 2021 00:33:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C5EE57;
	Tue,  5 Jan 2021 00:33:44 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1050Xhux017401; 
	Mon, 4 Jan 2021 18:33:43 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1050Xhxa017400;
	Mon, 4 Jan 2021 18:33:43 -0600
Date: Mon, 4 Jan 2021 18:33:42 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20210105003342.GT3103@octiron.msp.redhat.com>
References: <1608332802-9720-1-git-send-email-bmarzins@redhat.com>
	<1608332802-9720-7-git-send-email-bmarzins@redhat.com>
	<28b07148b5249f05e6509d5a34ed145a23975be4.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <28b07148b5249f05e6509d5a34ed145a23975be4.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 6/6] multipath.conf.5: Improve
	checker_timeout description
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 18, 2020 at 11:56:47PM +0000, Martin Wilck wrote:
> On Fri, 2020-12-18 at 17:06 -0600, Benjamin Marzinski wrote:
> > I was asked to explain how checker_timeout works for checkers like
> > directio, that don't issue scsi commands with an explicit timeout
> >=20
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > ---
> >  multipath/multipath.conf.5 | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
> > index ea66a01e..c7c4184b 100644
> > --- a/multipath/multipath.conf.5
> > +++ b/multipath/multipath.conf.5
> > @@ -639,8 +639,13 @@ The default is: \fBno\fR
> >  .
> >  .TP
> >  .B checker_timeout
> > -Specify the timeout to use for path checkers and prioritizers that
> > issue SCSI
> > -commands with an explicit timeout, in seconds.
> > +Specify the timeout to use for path checkers and prioritizers, in
> > seconds.
> > +Only prioritizers that issue scsi commands use checker_timeout.=20
> > Checkers
> > +that support an asynchronous mode (\fItur\fR and \fIdirectio\fR),
> > will
> > +return shortly after being called by multipathd, regardless of
> > whether the
> > +storage array responds. If the storage array hasn't responded,
> > mulitpathd will
>=20
> typo
>=20
> > +check for a response every second, until \fIchecker_timeout\fR
> > seconds have
> > +elapsed.
>=20
> This is a bit confusing IMHO. Most importantly, checkers will consider
> a path down if it doesn't respond to the checker command after the
> given timeout. The async behavior doesn't fit too well into this
> section. Maybe we should mention and explain the async property in the
> path_checkers section, and only refer to that here.

Sounds reasonable.

> (Btw is the directio checker still deprecated after all the work you
> recently put into it? The man page still says so).

No. I'll change that.  There are times when devices claim to be ready
with the tur checker, when in truth, IO to them will fail.  In these
cases, the directio checker is the best way to avoid having paths
bouncing up and down.

-Ben

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

