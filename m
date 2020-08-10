Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 3938D240D50
	for <lists+dm-devel@lfdr.de>; Mon, 10 Aug 2020 20:59:59 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-HBGa_DCwMASxnKd6HyKsNA-1; Mon, 10 Aug 2020 14:59:56 -0400
X-MC-Unique: HBGa_DCwMASxnKd6HyKsNA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0B451005510;
	Mon, 10 Aug 2020 18:59:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5D858A16F;
	Mon, 10 Aug 2020 18:59:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1C1661809554;
	Mon, 10 Aug 2020 18:59:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07AIxLj8005780 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Aug 2020 14:59:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 86F2A202B171; Mon, 10 Aug 2020 18:59:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82656202B16B
	for <dm-devel@redhat.com>; Mon, 10 Aug 2020 18:59:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53111856F96
	for <dm-devel@redhat.com>; Mon, 10 Aug 2020 18:59:19 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-190-U62Q2Lc4OhCsKE5UHc0RKA-1;
	Mon, 10 Aug 2020 14:59:17 -0400
X-MC-Unique: U62Q2Lc4OhCsKE5UHc0RKA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 347BAAB3E;
	Mon, 10 Aug 2020 18:59:36 +0000 (UTC)
Message-ID: <7f5040a66421b9d63578079e0c31fb9d5b1d4155.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Mon, 10 Aug 2020 20:59:15 +0200
In-Reply-To: <20200810180525.GL19233@octiron.msp.redhat.com>
References: <20200709101620.6786-1-mwilck@suse.com>
	<20200709101620.6786-9-mwilck@suse.com>
	<20200716211708.GM11089@octiron.msp.redhat.com>
	<2ae4b38b8f07eb1ac9be31099b5be091fa6e9617.camel@suse.com>
	<bb9b9031513d4e806f0bb2f700a822ed25364e36.camel@suse.com>
	<20200804162635.GJ19233@octiron.msp.redhat.com>
	<8c69def7c61863e8b36502ebd08f5188734f7fa5.camel@suse.com>
	<20200810180525.GL19233@octiron.msp.redhat.com>
User-Agent: Evolution 3.36.4
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 08/35] libmultipath: create bitfield
	abstraction
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Ben,

On Mon, 2020-08-10 at 13:05 -0500, Benjamin Marzinski wrote:
> On Tue, Aug 04, 2020 at 09:35:08PM +0200, Martin Wilck wrote:
> > On Tue, 2020-08-04 at 11:26 -0500, Benjamin Marzinski wrote:
> > > 
> > > I'm also still fuzzy on why we want to support zero length
> > > bitfields.
> > > Since they can't be grown like vectors can, it seem like
> > > requesting a
> > > zero length bitfield will always be a sign of a coding error. We
> > > would get a more useful error by having the failure happen closer
> > > to
> > > the error in the code.  Or is there actually a use for a zero
> > > length
> > > bitfield that can't be grown?
> > 
> > The only "use" would be to be able to work with bitmaps in
> > situations
> > where zero elements are possible, without the need to catch another
> > exception. 0-element bitfields are technically possible although
> > logically they make no sense. That's robust design for a library
> > function, IMO. I don't see why it'd be "better" to return NULL
> > instead.
> > If we are after errors in callers, we might want to print an error
> > message and still not return NULL.
> 
> Fine. It's a pretty trivial thing either way.

It took me a while, but ...

The current typical usage e.g. in group_by_match() looks like this:

	bitmap = alloc_bitfield(VECTOR_SIZE(paths));

	if (!bitmap)
		goto out;

	for (i = 0; i < VECTOR_SIZE(paths); i++) {
	        ....

Here, VECTOR_SIZE(paths) == 0 is a valid value that just causes nothing
to happen in the function. The other callers aren't much different. I
think we rather don't want to print an error message in these cases.

Every caller needs to check the return value of alloc_bitfield()
anyway, to guard against OOM. The code above would actually be slightly
optimized by returning NULL from alloc_bitfield() for maxbit == 0, by
returning immediately. Besides, we eliminate an (albeit minimal) risk
of hitting OOM by avoiding one needless memory allocation. 

The fact that all our callers work like this convinces me. I'll change
the return value to NULL like you suggested.

Cheers,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

