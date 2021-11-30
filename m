Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B842463CDE
	for <lists+dm-devel@lfdr.de>; Tue, 30 Nov 2021 18:32:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638293569;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=N9eKmMLlUgWRVTjAjtNkkvSWG/RMXeIlPQ43ZlG8gAw=;
	b=WxaEpKZRZck+PCFu/REsID8TNY9eSkb6irFLOg7gRJB/xb+w76sVHmqk50SiiwnRvBMlQj
	NMzSqJTJF+fnKqecTXR/jD90CEh3FUsjZsv9scV76jRZpdJLaGa/TLZ7IMAXOaf5W63BKA
	u+4NmSwZZYTvWplnueoPL5cKoTeglEA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-HeQBZLziMSualpehZE3zLA-1; Tue, 30 Nov 2021 12:32:47 -0500
X-MC-Unique: HeQBZLziMSualpehZE3zLA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5681D349D9;
	Tue, 30 Nov 2021 17:31:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AFB160622;
	Tue, 30 Nov 2021 17:31:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 548474BB7C;
	Tue, 30 Nov 2021 17:31:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AUHUs5x009152 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Nov 2021 12:30:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 634DE1972D; Tue, 30 Nov 2021 17:30:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B7CF19724;
	Tue, 30 Nov 2021 17:30:54 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1AUHUqTg029955; 
	Tue, 30 Nov 2021 11:30:52 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1AUHUqlc029954;
	Tue, 30 Nov 2021 11:30:52 -0600
Date: Tue, 30 Nov 2021 11:30:51 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20211130173051.GL19591@octiron.msp.redhat.com>
References: <20211118231338.22358-1-mwilck@suse.com>
	<20211118231338.22358-6-mwilck@suse.com>
	<20211130011759.GG19591@octiron.msp.redhat.com>
	<e56fcde94769fcdd44d0237b152407618be7f23e.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <e56fcde94769fcdd44d0237b152407618be7f23e.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 05/21] libmultipath (coverity): improve input
 checking in parse_vpd_pg83
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 30, 2021 at 12:21:44PM +0100, Martin Wilck wrote:
> On Mon, 2021-11-29 at 19:17 -0600, Benjamin Marzinski wrote:
> > On Fri, Nov 19, 2021 at 12:13:22AM +0100, mwilck@suse.com=A0wrote:
> > > From: Martin Wilck <mwilck@suse.com>
> > >=20
> > > Check offsets and other obvious errors in the VPD83 data.
> > >=20
> > > The original reason to do this was to fix "tained scalar"
> > > warnings from coverity. But this doesn't suffice for coverity
> > > without using a constant boundary (WWID_SIZE) for "len" in
> > > parse_vpd_pg80() and for "vpd_len" in parse_vpd_pg83(), even
> > > though the computed boundaries are tighter than the constant
> > > ones.
> > >=20
> >=20
> > This looks fine, but I do wonder if we are being too strict.=A0 I'm not
> > sure we should be failing, if sg_inq wouldn't fail.=A0 The goal of the
> > fallback code is to get the WWID the udev would have gotten, and
> > being
> > lenient with scsi devices that don't quite follow the standard is
> > usually the best policy. Thoughts?
>=20
> If we encounter a broken VPD entry, IMO we can't continue reading
> further entries, because if the entry is broken, we can't trust the
> length value which is part of the entry. We may be reading total junk
> if we follow it.
>=20
> We might simply discard the broken entry, stop iterating over the
> designators, see if we got a usable designator up to that point (i.e.,
> previously), and if yes, use that entry, printing a big fat warning.=A0
> That means we'd ultimately fail only if there was no usable designator
> before the broken one.
>=20
> Would you prefer that strategy?

If you export scsi IDs from sg_inq, it will print them out until it
hits an error, so I would prefer if we used the best designator we got
before we hit the error, to match it.

-Ben

>=20
> Martin

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

