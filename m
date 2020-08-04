Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 986BA23BD0F
	for <lists+dm-devel@lfdr.de>; Tue,  4 Aug 2020 17:19:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-6D-UIBRWOKWE3kaMGoigaA-1; Tue, 04 Aug 2020 11:18:57 -0400
X-MC-Unique: 6D-UIBRWOKWE3kaMGoigaA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64F798010C7;
	Tue,  4 Aug 2020 15:18:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 44819100EBB8;
	Tue,  4 Aug 2020 15:18:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A27A8A35BC;
	Tue,  4 Aug 2020 15:18:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 074FIVx9017749 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 4 Aug 2020 11:18:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D9C372156A52; Tue,  4 Aug 2020 15:18:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CAD32157F25
	for <dm-devel@redhat.com>; Tue,  4 Aug 2020 15:18:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4DFC918A667E
	for <dm-devel@redhat.com>; Tue,  4 Aug 2020 15:18:22 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-33-9yW-grdnOVqC_xa99ifmxw-1;
	Tue, 04 Aug 2020 11:18:20 -0400
X-MC-Unique: 9yW-grdnOVqC_xa99ifmxw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id F1173AF3F;
	Tue,  4 Aug 2020 15:18:34 +0000 (UTC)
Message-ID: <bb9b9031513d4e806f0bb2f700a822ed25364e36.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue, 04 Aug 2020 17:18:18 +0200
In-Reply-To: <2ae4b38b8f07eb1ac9be31099b5be091fa6e9617.camel@suse.com>
References: <20200709101620.6786-1-mwilck@suse.com>
	<20200709101620.6786-9-mwilck@suse.com>
	<20200716211708.GM11089@octiron.msp.redhat.com>
	<2ae4b38b8f07eb1ac9be31099b5be091fa6e9617.camel@suse.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2020-08-04 at 17:04 +0200, Martin Wilck wrote:
> On Thu, 2020-07-16 at 16:17 -0500, Benjamin Marzinski wrote:
> > On Thu, Jul 09, 2020 at 12:15:53PM +0200, mwilck@suse.com wrote:
> > > From: Martin Wilck <mwilck@suse.com>
> > > 
> > > In e32d521d ("libmultipath: coalesce_paths: fix size mismatch
> > > handling"),
> > > we introduced simple bitmap handling functions. We can do better.
> > > This
> > > patch introduces a bitfield type with overflow detection and a
> > > find_first_set() method.
> > > 
> > > Use this in coalesce_paths(), and adapt the unit tests. Also, add
> > > unit tests for "odd" bitfield sizes; so far we tested only
> > > multiples
> > > of 64.
> > > 
> > > Signed-off-by: Martin Wilck <mwilck@suse.com>
> > > ---
> > >  libmultipath/configure.c |   9 +-
> > >  libmultipath/util.c      |  35 ++++++
> > >  libmultipath/util.h      |  57 ++++++++-
> > >  tests/util.c             | 263
> > > +++++++++++++++++++++++++++++++++++----
> > >  4 files changed, 327 insertions(+), 37 deletions(-)
> > > 
> > > ...
> > > diff --git a/libmultipath/util.c b/libmultipath/util.c
> > > index 3c43f28..46cacd4 100644
> > > --- a/libmultipath/util.c
> > > +++ b/libmultipath/util.c
> > > @@ -404,3 +404,38 @@ void close_fd(void *arg)
> > >  {
> > >  	close((long)arg);
> > >  }
> > > +
> > > +struct bitfield *alloc_bitfield(unsigned int maxbit)
> > > +{
> > > +	unsigned int n;
> > > +	struct bitfield *bf;
> > > +
> > > +	n = maxbit > 0 ? (maxbit - 1) / bits_per_slot + 1 : 0;
> > 
> > What's the point in accepting 0? That's an empty bitmap.
> > 
> Thanks for spotting these, I will fix them.

Thinking about it once more, I believe that accepting 0 as the bitfield
length is actually the right thing. A bitfield of length 0 makes not
much less sense than one of length 1. The code makes sure that the bit
operations on the 0-length bitfield behave correctly (see
test_bitmask_len_0()). Thus callers can use bitfields without bothering
for extra NULL checks. That was the intention. Like we support 0-length 
vectors.

Regards,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

