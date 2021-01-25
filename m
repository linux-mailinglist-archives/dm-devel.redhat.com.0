Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1CEFD3029DF
	for <lists+dm-devel@lfdr.de>; Mon, 25 Jan 2021 19:18:54 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-Tfm5clJOMuiX1T0zNG6vhg-1; Mon, 25 Jan 2021 13:18:50 -0500
X-MC-Unique: Tfm5clJOMuiX1T0zNG6vhg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B31A107ACFA;
	Mon, 25 Jan 2021 18:18:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EF665C1C5;
	Mon, 25 Jan 2021 18:18:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 40BBC5002C;
	Mon, 25 Jan 2021 18:18:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10PIIXpK004766 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 25 Jan 2021 13:18:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9852C2166B2C; Mon, 25 Jan 2021 18:18:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92FED2166B29
	for <dm-devel@redhat.com>; Mon, 25 Jan 2021 18:18:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F090858EEC
	for <dm-devel@redhat.com>; Mon, 25 Jan 2021 18:18:31 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-568-6PF6tQ9jNzicxRgXCxbbkQ-1;
	Mon, 25 Jan 2021 13:18:28 -0500
X-MC-Unique: 6PF6tQ9jNzicxRgXCxbbkQ-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2E85568B02; Mon, 25 Jan 2021 19:18:26 +0100 (CET)
Date: Mon, 25 Jan 2021 19:18:26 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <20210125181826.GA14957@lst.de>
References: <20210124100241.1167849-1-hch@lst.de>
	<20210124100241.1167849-6-hch@lst.de>
	<dfdff48c-c263-8e7c-cb52-28e7bee00c45@kernel.dk>
	<20210125175528.GA13451@lst.de>
	<2b600368-96fa-7caf-f05b-321de616f7c9@kernel.dk>
	<13667b22-029b-d7be-02da-96fce22cfd8f@kernel.dk>
	<20210125181349.GA14432@lst.de>
	<1c0fabdc-9b73-dfd7-f49d-c211d58cbf12@kernel.dk>
MIME-Version: 1.0
In-Reply-To: <1c0fabdc-9b73-dfd7-f49d-c211d58cbf12@kernel.dk>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linux-s390 <linux-s390@vger.kernel.org>,
	linux-bcache <linux-bcache@vger.kernel.org>, Coly Li <colyli@suse.de>,
	"open list:SOFTWARE RAID \(Multiple Disks\) SUPPORT"
	<linux-raid@vger.kernel.org>, Song Liu <song@kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	linux-block <linux-block@vger.kernel.org>,
	Tejun Heo <tj@kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH 05/10] block: do not reassig ->bi_bdev when
 partition remapping
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 25, 2021 at 11:15:04AM -0700, Jens Axboe wrote:
> On 1/25/21 11:13 AM, Christoph Hellwig wrote:
> > On Mon, Jan 25, 2021 at 11:03:24AM -0700, Jens Axboe wrote:
> >> Partition table entries are not in disk order.
> > 
> > And the issue shows up with the series just up to the this patch,
> > without any later patches?
> 
> At that patch specifically. I bisected it, and then I double checked
> by running the previous commit (boots fine), then apply this one, and
> then I run into that error. So it should be 100% reliable.

Ok, I have an idea.  With EOD message you mean this printk, right:

	pr_info_ratelimited("attempt to access beyond end of device\n"
                            "%s: rw=%d, want=%llu, limit=%llu\n",
			    ...

right?

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

