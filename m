Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB92211246
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 19:58:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-BYCJiZYXOlONsZQGvFDoRg-1; Wed, 01 Jul 2020 13:58:22 -0400
X-MC-Unique: BYCJiZYXOlONsZQGvFDoRg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9BDF100A8E9;
	Wed,  1 Jul 2020 17:58:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D65BA4FA3F;
	Wed,  1 Jul 2020 17:58:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EE3A11809543;
	Wed,  1 Jul 2020 17:58:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 061HvtRd019281 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 13:57:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5DF7020182A5; Wed,  1 Jul 2020 17:57:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 58F67207ABFE
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 17:57:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F06888007CB
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 17:57:52 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-108-PqnA_bSVO4axIN1PaJ8hnA-1; Wed, 01 Jul 2020 13:57:50 -0400
X-MC-Unique: PqnA_bSVO4axIN1PaJ8hnA-1
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jqgzT-0003PE-FM; Wed, 01 Jul 2020 17:57:47 +0000
Date: Wed, 1 Jul 2020 18:57:47 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20200701175747.GT25523@casper.infradead.org>
References: <20200701090622.3354860-1-hch@lst.de>
	<20200701164103.GC27063@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200701164103.GC27063@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, linux-kernel@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-mm@kvack.org,
	linux-bcache@vger.kernel.org, cgroups@vger.kernel.org,
	drbd-dev@tron.linbit.com, Tejun Heo <tj@kernel.org>,
	Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Subject: Re: [dm-devel] remove dead bdi congestion leftovers
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Jul 01, 2020 at 12:41:03PM -0400, Mike Snitzer wrote:
> On Wed, Jul 01 2020 at  5:06am -0400,
> Christoph Hellwig <hch@lst.de> wrote:
> 
> > Hi Jens,
> > 
> > we have a lot of bdi congestion related code that is left around without
> > any use.  This series removes it in preparation of sorting out the bdi
> > lifetime rules properly.
> 
> I could do some git archeology to see what the fs, mm and block core
> changes were to stop using bdi congested but a pointer to associated
> changes (or quick recap) would save me some time.
> 
> Also, curious to know how back-pressure should be felt back up the IO
> stack now? (apologies if these are well worn topics, I haven't been
> tracking this area of development).

It isn't.  Jens declared the implementation was broken, and broke it
more.  So we're just living with stupid broken timeouts.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

