Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5ADC03ACDA7
	for <lists+dm-devel@lfdr.de>; Fri, 18 Jun 2021 16:35:27 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-HDj-2oNXNy6156fmTnKOqg-1; Fri, 18 Jun 2021 10:35:24 -0400
X-MC-Unique: HDj-2oNXNy6156fmTnKOqg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D9B8C7420;
	Fri, 18 Jun 2021 14:35:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 375E160CC9;
	Fri, 18 Jun 2021 14:35:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 28BA81809C99;
	Fri, 18 Jun 2021 14:34:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15IEXkb9009691 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 18 Jun 2021 10:33:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4F1BE1009BB4; Fri, 18 Jun 2021 14:33:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AF32100BFD4
	for <dm-devel@redhat.com>; Fri, 18 Jun 2021 14:33:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81342805C1D
	for <dm-devel@redhat.com>; Fri, 18 Jun 2021 14:33:43 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-522-gngE01WuOzuy9Zmf1E0Yyw-1;
	Fri, 18 Jun 2021 10:33:39 -0400
X-MC-Unique: gngE01WuOzuy9Zmf1E0Yyw-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 36A0168D08; Fri, 18 Jun 2021 16:33:37 +0200 (CEST)
Date: Fri, 18 Jun 2021 16:33:36 +0200
From: Christoph Hellwig <hch@lst.de>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20210618143336.GB19284@lst.de>
References: <20210616130533.754248-1-ming.lei@redhat.com>
	<20210616130533.754248-5-ming.lei@redhat.com>
	<YMohOUlopTcO1Bzd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YMohOUlopTcO1Bzd@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Jeffle Xu <jefflexu@linux.alibaba.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [RFC PATCH 4/4] dm: support bio polling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 16, 2021 at 12:05:13PM -0400, Mike Snitzer wrote:
> In general I'm really happy to see polling switch over to using bios,
> nice job Christoph! Are you hoping for all this to land in time for
> 5.14 merge?

Yes, although time is running out.

> Once Ming responds to my review inlined below, and I Acked-by his
> set, would you be willing to fold it at the end of your patchset so
> that I don't need to rebase on block to get these changes in, etc?

In principle yes, but I need to take a look first.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

