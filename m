Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0CB76C56D
	for <lists+dm-devel@lfdr.de>; Wed,  2 Aug 2023 08:42:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690958523;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=b4L5Lq8vqSttwDVrur+Z+DBxQHqLF3/Mq8pmujD99pc=;
	b=EqjtEJ2+vPRGFw/zhkr15walzb7C5woDcC+JtPsXKu8unyWYVENttSCZPjCn0+LmX0Mfio
	M523I+7CDftMURLZ4aMZu6s4QyAmH2zXS/0w401fbKZsU9EPlIyw8Ka7iGRnbaw7nsIhiL
	oDl0vAisI/0uO9CWKwFKjmXTAT2YGnI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-_lwQ6bGHMdCa7SQWF7TrTw-1; Wed, 02 Aug 2023 02:42:00 -0400
X-MC-Unique: _lwQ6bGHMdCa7SQWF7TrTw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39E85101160F;
	Wed,  2 Aug 2023 06:41:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F3B831454149;
	Wed,  2 Aug 2023 06:41:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6BE301947209;
	Wed,  2 Aug 2023 06:41:51 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 963421946A43
 for <dm-devel@listman.corp.redhat.com>; Wed,  2 Aug 2023 06:41:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8FB6A112132D; Wed,  2 Aug 2023 06:41:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8727B1121325
 for <dm-devel@redhat.com>; Wed,  2 Aug 2023 06:41:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B13D185A78F
 for <dm-devel@redhat.com>; Wed,  2 Aug 2023 06:41:36 +0000 (UTC)
Received: from out-80.mta0.migadu.com (out-80.mta0.migadu.com
 [91.218.175.80]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-TWvKxH-OPGaxd5V7ODzIDg-1; Wed, 02 Aug 2023 02:41:34 -0400
X-MC-Unique: TWvKxH-OPGaxd5V7ODzIDg-1
Date: Wed, 2 Aug 2023 02:31:24 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Nitesh Shetty <nj.shetty@samsung.com>
Message-ID: <20230802063124.4652m3gfbhdmghlt@moria.home.lan>
References: <20230627183629.26571-1-nj.shetty@samsung.com>
 <CGME20230627184020epcas5p13fdcea52edead5ffa3fae444f923439e@epcas5p1.samsung.com>
 <20230627183629.26571-4-nj.shetty@samsung.com>
 <20230720075050.GB5042@lst.de>
 <20230801130702.2taecrgn4v66ehtx@green245>
MIME-Version: 1.0
In-Reply-To: <20230801130702.2taecrgn4v66ehtx@green245>
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [dm-devel] [PATCH v13 3/9] block: add emulation for copy
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Vincent Fu <vincent.fu@samsung.com>, linux-doc@vger.kernel.org,
 djwong@kernel.org, linux-nvme@lists.infradead.org, dm-devel@redhat.com,
 Christoph Hellwig <hch@lst.de>, Alasdair Kergon <agk@redhat.com>,
 Sagi Grimberg <sagi@grimberg.me>, linux-scsi@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, gost.dev@samsung.com,
 nitheshshetty@gmail.com, willy@infradead.org,
 Chaitanya Kulkarni <kch@nvidia.com>, Anuj Gupta <anuj20.g@samsung.com>,
 Mike Snitzer <snitzer@kernel.org>, ming.lei@redhat.com,
 linux-block@vger.kernel.org, dlemoal@kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, Keith Busch <kbusch@kernel.org>,
 bvanassche@acm.org, Jens Axboe <axboe@kernel.dk>,
 Christian Brauner <brauner@kernel.org>, martin.petersen@oracle.com,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Aug 01, 2023 at 06:37:02PM +0530, Nitesh Shetty wrote:
> On 23/07/20 09:50AM, Christoph Hellwig wrote:
> > > +static void *blkdev_copy_alloc_buf(sector_t req_size, sector_t *alloc_size,
> > > +		gfp_t gfp_mask)
> > > +{
> > > +	int min_size = PAGE_SIZE;
> > > +	void *buf;
> > > +
> > > +	while (req_size >= min_size) {
> > > +		buf = kvmalloc(req_size, gfp_mask);
> > > +		if (buf) {
> > > +			*alloc_size = req_size;
> > > +			return buf;
> > > +		}
> > > +		/* retry half the requested size */
> > > +		req_size >>= 1;
> > > +	}
> > > +
> > > +	return NULL;
> > 
> > Is there any good reason for using vmalloc instead of a bunch
> > of distcontiguous pages?
> > 
> 
> kvmalloc seemed convenient for the purpose. We will need to call alloc_page
> in a loop to guarantee discontigous pages. Do you prefer that over kvmalloc?

No, kvmalloc should be the preferred approach here now: with large
folios, we're now getting better about doing more large memory
allocations and avoiding fragmentation, so in practice this won't be a
vmalloc allocation except in exceptional circumstances, and performance
will be better and the code will be simpler doing a single large
allocation.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

