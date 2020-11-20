Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 540AC2BABAF
	for <lists+dm-devel@lfdr.de>; Fri, 20 Nov 2020 15:09:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605881355;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SCFWnc7KHNmocesFP2J4HFzECIWr7aSG35Tn43ac4dg=;
	b=KMAI+AMNmYyQJMEnKvR4ekHRVaq+0LzjmuDG4Ua+5namP1ozb797xflrNvS021FR2vNKdU
	C2KLutNkfOBxAx2ODkuep61IgIhqTYnAV59aBdsURwRBHHw/4NRcPwWeQ1vsG9uO5E1jtV
	W118HiLrmYq7m0nvybO47KzpF7Moq1E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-Fn_gcJoAMTiVNnLR5P2BsQ-1; Fri, 20 Nov 2020 09:09:12 -0500
X-MC-Unique: Fn_gcJoAMTiVNnLR5P2BsQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 724DB1DDF2;
	Fri, 20 Nov 2020 14:09:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0DC960C05;
	Fri, 20 Nov 2020 14:09:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 70D41180954D;
	Fri, 20 Nov 2020 14:08:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKE8fb9002664 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 09:08:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0DA9C19D80; Fri, 20 Nov 2020 14:08:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7663519C46;
	Fri, 20 Nov 2020 14:08:37 +0000 (UTC)
Date: Fri, 20 Nov 2020 09:08:20 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20201120140819.GA7359@redhat.com>
References: <20201113225228.20563-1-rdunlap@infradead.org>
	<344abf76-9405-58ba-2dc4-27cab88c974d@de.ibm.com>
	<c29eeb5d-0683-49eb-f729-38b14fac7745@infradead.org>
	<20201117163147.GA27243@redhat.com>
	<20201118154944.GB545@redhat.com> <20201118160748.GA754@redhat.com>
	<alpine.LRH.2.02.2011181611470.16933@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2011181611470.16933@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>, Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	dm-devel@redhat.com, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] md: dm-writeback: add __noreturn to BUG-ging function
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 18 2020 at  4:24pm -0500,
Mikulas Patocka <mpatocka@redhat.com> wrote:

> 
> 
> On Wed, 18 Nov 2020, Mike Snitzer wrote:
> 
> > On Wed, Nov 18 2020 at 10:49am -0500,
> > Mike Snitzer <snitzer@redhat.com> wrote:
> > 
> > > I don't think my suggestion will help.. given it'd still leave
> > > persistent_memory_claim() without a return statement.
> > > 
> > > Think it worthwhile to just add a dummy 'return 0;' after the BUG().
> > 
> > Decided to go with this, now staged for 5.11:
> > https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.11&id=a1e4865b4dda7071f3707f7e551289ead66e38b1
> 
> Hi
> 
> I would just use "return -EOPNOTSUPP;" and drop the "#ifdef 
> DM_WRITECACHE_HAS_PMEM" that you added.
> 
> That BUG/return -EOPNOTSUPP code can't happen at all - if 
> DM_WRITECACHE_HAS_PMEM is not defined, WC_MODE_PMEM(wc) always returns 
> false - so persistent_memory_claim and BUG() can't ever be called. And if 
> it can't be called, you don't need to add a code that prints an error in 
> that case.
> 
> If we don't have DM_WRITECACHE_HAS_PMEM, the compiler optimizer will 
> remove all the code guarded with if (WC_MODE_PMEM(wc)) as unreachable.
> 
> Mikulas

Fair enough.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

