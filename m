Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB0423C016
	for <lists+dm-devel@lfdr.de>; Tue,  4 Aug 2020 21:35:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-WRM6g9BzM9qvy5muAuov2A-1; Tue, 04 Aug 2020 15:35:50 -0400
X-MC-Unique: WRM6g9BzM9qvy5muAuov2A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5ABBD800479;
	Tue,  4 Aug 2020 19:35:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 206D55DA73;
	Tue,  4 Aug 2020 19:35:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1CD504EDB7;
	Tue,  4 Aug 2020 19:35:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 074JZH8c021470 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 4 Aug 2020 15:35:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 877A2202B17C; Tue,  4 Aug 2020 19:35:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75C3C202B170
	for <dm-devel@redhat.com>; Tue,  4 Aug 2020 19:35:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AE988007D1
	for <dm-devel@redhat.com>; Tue,  4 Aug 2020 19:35:14 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-79-7OnVD6m3P-WmCp0A1CykIA-1;
	Tue, 04 Aug 2020 15:35:10 -0400
X-MC-Unique: 7OnVD6m3P-WmCp0A1CykIA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E6AECAC97;
	Tue,  4 Aug 2020 19:35:24 +0000 (UTC)
Message-ID: <8c69def7c61863e8b36502ebd08f5188734f7fa5.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue, 04 Aug 2020 21:35:08 +0200
In-Reply-To: <20200804162635.GJ19233@octiron.msp.redhat.com>
References: <20200709101620.6786-1-mwilck@suse.com>
	<20200709101620.6786-9-mwilck@suse.com>
	<20200716211708.GM11089@octiron.msp.redhat.com>
	<2ae4b38b8f07eb1ac9be31099b5be091fa6e9617.camel@suse.com>
	<bb9b9031513d4e806f0bb2f700a822ed25364e36.camel@suse.com>
	<20200804162635.GJ19233@octiron.msp.redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2020-08-04 at 11:26 -0500, Benjamin Marzinski wrote:
> On Tue, Aug 04, 2020 at 05:18:18PM +0200, Martin Wilck wrote:
> > On Tue, 2020-08-04 at 17:04 +0200, Martin Wilck wrote:
> > > On Thu, 2020-07-16 at 16:17 -0500, Benjamin Marzinski wrote:
> > > > On Thu, Jul 09, 2020 at 12:15:53PM +0200, mwilck@suse.com
> > > > wrote:
> > > > > From: Martin Wilck <mwilck@suse.com>
> > > > > +struct bitfield *alloc_bitfield(unsigned int maxbit)
> > > > > +{
> > > > > +	unsigned int n;
> > > > > +	struct bitfield *bf;
> > > > > +
> > > > > +	n = maxbit > 0 ? (maxbit - 1) / bits_per_slot + 1 : 0;
> > > > 
> > > > What's the point in accepting 0? That's an empty bitmap.
> > > > 
> > > Thanks for spotting these, I will fix them.
> > 
> > Thinking about it once more, I believe that accepting 0 as the
> > bitfield
> > length is actually the right thing. A bitfield of length 0 makes
> > not
> > much less sense than one of length 1. The code makes sure that the
> > bit
> > operations on the 0-length bitfield behave correctly (see
> > test_bitmask_len_0()). Thus callers can use bitfields without
> > bothering
> > for extra NULL checks. That was the intention. Like we support 0-
> > length 
> > vectors.
> 
> But the calloc call itself can return NULL, so deferencing bf (as in
> bf->len = maxbit), can crash.

Of course, I wasn't arguing about that. I'm going to resend with this
fixed.

> I'm also still fuzzy on why we want to support zero length bitfields.
> Since they can't be grown like vectors can, it seem like requesting a
> zero length bitfield will always be a sign of a coding error. We
> would get a more useful error by having the failure happen closer to
> the error in the code.  Or is there actually a use for a zero length
> bitfield that can't be grown?

The only "use" would be to be able to work with bitmaps in situations
where zero elements are possible, without the need to catch another
exception. 0-element bitfields are technically possible although
logically they make no sense. That's robust design for a library
function, IMO. I don't see why it'd be "better" to return NULL instead.
If we are after errors in callers, we might want to print an error
message and still not return NULL.

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

