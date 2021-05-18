Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5ECC13882DE
	for <lists+dm-devel@lfdr.de>; Wed, 19 May 2021 00:46:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621377966;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jxP0WwSAGwqNPwLkd43Mr5FMb+AkmZWOi5wMuoauzzs=;
	b=RFSlXQG9Xo1KFekLwhTzFjk3d4ArUXqdTCwLRNeAATGrr9AjVLxfCzqkNyRT5ueCNqnKAw
	eq/rTau5psssbXUfHGjLRYcUVDvhXJ7AZpSQ2Yhce2IomUzWMFouayiPMxlkCg3ldfjwGi
	Yh0/PhjtkagCWgSGLpZc9RCNCY3BXx4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-TgYRQyW-NeGrvBsHFDdRug-1; Tue, 18 May 2021 18:46:04 -0400
X-MC-Unique: TgYRQyW-NeGrvBsHFDdRug-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 401D2107ACC7;
	Tue, 18 May 2021 22:45:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 158D259452;
	Tue, 18 May 2021 22:45:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EFDD61801028;
	Tue, 18 May 2021 22:45:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14IMcW6w007839 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 18 May 2021 18:38:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A37DB138E8; Tue, 18 May 2021 22:38:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA70FBA6D;
	Tue, 18 May 2021 22:38:28 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 14IMcRrr015277; 
	Tue, 18 May 2021 17:38:27 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 14IMcQko015276;
	Tue, 18 May 2021 17:38:26 -0500
Date: Tue, 18 May 2021 17:38:26 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20210518223826.GM25887@octiron.msp.redhat.com>
References: <1621268999-6280-1-git-send-email-bmarzins@redhat.com>
	<1621268999-6280-4-git-send-email-bmarzins@redhat.com>
	<d18212229ca58f069af5a7489548ff228a3552b6.camel@suse.com>
	<7058c8c0c6a6ee765dc2772ae497071228658518.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <7058c8c0c6a6ee765dc2772ae497071228658518.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v4 3/6] multipathd: fix ev_remove_path return
 code handling
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 07:33:34PM +0000, Martin Wilck wrote:
> On Mon, 2021-05-17 at 20:51 +0200, Martin Wilck wrote:
> > On Mon, 2021-05-17 at 11:29 -0500, Benjamin Marzinski wrote:
> > > When ev_remove_path() returned success, callers assumed that the
> > > path
> > > (and possibly the map) had been removed.=A0 When ev_remove_path()
> > > returned
> > > failure, callers assumed that the path had not been removed.
> > > However,
> > > the path could be removed on both success or failure. This could
> > > cause
> > > callers to dereference the path after it was removed.
> > >=20
> > > To deal with this, make ev_remove_path() return a different
> > > symbolic
> > > value for each outcome, and make the callers react appropriately
> > > for
> > > the different values. Found by coverity.
> > >=20
> > > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>+
> >=20
> > Reviewed-by: Martin Wilck <mwilck@suse.com>
> >=20
>=20
> It just occured to me that we should probably not have set changed the
> return code of cli_del_path() because of a strdup() failure for the
> reply string. (It was my suggestion, I know).

If we're at a point where we get an error on that strdup(), things are
probably going badly in general. But yeah, I agree that success makes
more sense than failure here.

-Ben
=20
> Anyway, I've pushed this to "queue" already.
> We can change this in a follow-up patch.
>=20
> Regards
> Martin

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

