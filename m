Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 86F39240C9F
	for <lists+dm-devel@lfdr.de>; Mon, 10 Aug 2020 20:06:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597082759;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WCSYYBDMlkYNMCTjkr+ZRhTi+dw+O/8etgxaAx652Ew=;
	b=SgE5UYCnlyNeWo4vAiDeW5W+EHDp7zJRRIZQg885AofOh3ihFXNfzCQWQ9iDUAcQNDDO9a
	AO8PhQgM84xnQfUyJPVfP6VWaKSrrGeowGAZSgkNne6hNUoXMoy/Lml5MIs+j6xAnxOuqa
	/hq9n5G6BE2Hkv11gUh4jGEwdxJs/tk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-GUVjriM6PjmVZaWFWjc8Dg-1; Mon, 10 Aug 2020 14:05:57 -0400
X-MC-Unique: GUVjriM6PjmVZaWFWjc8Dg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AF7C80183C;
	Mon, 10 Aug 2020 18:05:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF30F6F125;
	Mon, 10 Aug 2020 18:05:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E357597554;
	Mon, 10 Aug 2020 18:05:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07AI5UTD032136 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Aug 2020 14:05:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CF18D6F127; Mon, 10 Aug 2020 18:05:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6B046F125;
	Mon, 10 Aug 2020 18:05:27 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07AI5QPC002441; 
	Mon, 10 Aug 2020 13:05:26 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07AI5PCt002440;
	Mon, 10 Aug 2020 13:05:25 -0500
Date: Mon, 10 Aug 2020 13:05:25 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20200810180525.GL19233@octiron.msp.redhat.com>
References: <20200709101620.6786-1-mwilck@suse.com>
	<20200709101620.6786-9-mwilck@suse.com>
	<20200716211708.GM11089@octiron.msp.redhat.com>
	<2ae4b38b8f07eb1ac9be31099b5be091fa6e9617.camel@suse.com>
	<bb9b9031513d4e806f0bb2f700a822ed25364e36.camel@suse.com>
	<20200804162635.GJ19233@octiron.msp.redhat.com>
	<8c69def7c61863e8b36502ebd08f5188734f7fa5.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <8c69def7c61863e8b36502ebd08f5188734f7fa5.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Aug 04, 2020 at 09:35:08PM +0200, Martin Wilck wrote:
> On Tue, 2020-08-04 at 11:26 -0500, Benjamin Marzinski wrote:
> > On Tue, Aug 04, 2020 at 05:18:18PM +0200, Martin Wilck wrote:
> > > On Tue, 2020-08-04 at 17:04 +0200, Martin Wilck wrote:
> > > > On Thu, 2020-07-16 at 16:17 -0500, Benjamin Marzinski wrote:
> > > > > On Thu, Jul 09, 2020 at 12:15:53PM +0200, mwilck@suse.com
> > > > > wrote:
> > > > > > From: Martin Wilck <mwilck@suse.com>
> > > > > > +struct bitfield *alloc_bitfield(unsigned int maxbit)
> > > > > > +{
> > > > > > +	unsigned int n;
> > > > > > +	struct bitfield *bf;
> > > > > > +
> > > > > > +	n = maxbit > 0 ? (maxbit - 1) / bits_per_slot + 1 : 0;
> > > > > 
> > > > > What's the point in accepting 0? That's an empty bitmap.
> > > > > 
> > > > Thanks for spotting these, I will fix them.
> > > 
> > > Thinking about it once more, I believe that accepting 0 as the
> > > bitfield
> > > length is actually the right thing. A bitfield of length 0 makes
> > > not
> > > much less sense than one of length 1. The code makes sure that the
> > > bit
> > > operations on the 0-length bitfield behave correctly (see
> > > test_bitmask_len_0()). Thus callers can use bitfields without
> > > bothering
> > > for extra NULL checks. That was the intention. Like we support 0-
> > > length 
> > > vectors.
> > 
> > But the calloc call itself can return NULL, so deferencing bf (as in
> > bf->len = maxbit), can crash.
> 
> Of course, I wasn't arguing about that. I'm going to resend with this
> fixed.
> 
> > I'm also still fuzzy on why we want to support zero length bitfields.
> > Since they can't be grown like vectors can, it seem like requesting a
> > zero length bitfield will always be a sign of a coding error. We
> > would get a more useful error by having the failure happen closer to
> > the error in the code.  Or is there actually a use for a zero length
> > bitfield that can't be grown?
> 
> The only "use" would be to be able to work with bitmaps in situations
> where zero elements are possible, without the need to catch another
> exception. 0-element bitfields are technically possible although
> logically they make no sense. That's robust design for a library
> function, IMO. I don't see why it'd be "better" to return NULL instead.
> If we are after errors in callers, we might want to print an error
> message and still not return NULL.

Fine. It's a pretty trivial thing either way.

-Ben

> 
> Martin
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

