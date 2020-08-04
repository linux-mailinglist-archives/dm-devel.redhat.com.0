Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 56C7F23BE23
	for <lists+dm-devel@lfdr.de>; Tue,  4 Aug 2020 18:29:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596558560;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jOoqtp8be9T2LFtTU/EuoNncSTt+L5qRYNvZOwvl400=;
	b=g4N2O+hkkWL0DLXXT3nkoa/oEe1gfCYRhNAys1motouWU3Ww6XpVOVpu5K/D0t9jPhX2CS
	clDmTIZl+KmnOoDWlIpMeInOv7TTmXr0C3wYuts0JnFJ+FgZissB3VwoVS+NsArME/V1lc
	vidOHW/29fQUEe0l+jLyhAy1+OCOj68=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-KuTQw3KdMe-9Oj0h8ZAQOA-1; Tue, 04 Aug 2020 12:29:17 -0400
X-MC-Unique: KuTQw3KdMe-9Oj0h8ZAQOA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DB0A1902EA0;
	Tue,  4 Aug 2020 16:29:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51BD688D70;
	Tue,  4 Aug 2020 16:29:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7D917A35BF;
	Tue,  4 Aug 2020 16:29:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 074GQfmV027877 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 4 Aug 2020 12:26:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 19B9A7B90A; Tue,  4 Aug 2020 16:26:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E70A87B906;
	Tue,  4 Aug 2020 16:26:37 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 074GQaPt028055; 
	Tue, 4 Aug 2020 11:26:36 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 074GQZ4c028054;
	Tue, 4 Aug 2020 11:26:35 -0500
Date: Tue, 4 Aug 2020 11:26:35 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20200804162635.GJ19233@octiron.msp.redhat.com>
References: <20200709101620.6786-1-mwilck@suse.com>
	<20200709101620.6786-9-mwilck@suse.com>
	<20200716211708.GM11089@octiron.msp.redhat.com>
	<2ae4b38b8f07eb1ac9be31099b5be091fa6e9617.camel@suse.com>
	<bb9b9031513d4e806f0bb2f700a822ed25364e36.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <bb9b9031513d4e806f0bb2f700a822ed25364e36.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Aug 04, 2020 at 05:18:18PM +0200, Martin Wilck wrote:
> On Tue, 2020-08-04 at 17:04 +0200, Martin Wilck wrote:
> > On Thu, 2020-07-16 at 16:17 -0500, Benjamin Marzinski wrote:
> > > On Thu, Jul 09, 2020 at 12:15:53PM +0200, mwilck@suse.com wrote:
> > > > From: Martin Wilck <mwilck@suse.com>
> > > > +struct bitfield *alloc_bitfield(unsigned int maxbit)
> > > > +{
> > > > +	unsigned int n;
> > > > +	struct bitfield *bf;
> > > > +
> > > > +	n = maxbit > 0 ? (maxbit - 1) / bits_per_slot + 1 : 0;
> > > 
> > > What's the point in accepting 0? That's an empty bitmap.
> > > 
> > Thanks for spotting these, I will fix them.
> 
> Thinking about it once more, I believe that accepting 0 as the bitfield
> length is actually the right thing. A bitfield of length 0 makes not
> much less sense than one of length 1. The code makes sure that the bit
> operations on the 0-length bitfield behave correctly (see
> test_bitmask_len_0()). Thus callers can use bitfields without bothering
> for extra NULL checks. That was the intention. Like we support 0-length 
> vectors.

But the calloc call itself can return NULL, so deferencing bf (as in
bf->len = maxbit), can crash.

I'm also still fuzzy on why we want to support zero length bitfields.
Since they can't be grown like vectors can, it seem like requesting a
zero length bitfield will always be a sign of a coding error. We
would get a more useful error by having the failure happen closer to
the error in the code.  Or is there actually a use for a zero length
bitfield that can't be grown?

-Ben

> Regards,
> Martin
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

