Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id B8DBC2CD150
	for <lists+dm-devel@lfdr.de>; Thu,  3 Dec 2020 09:31:48 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-vLw7PXp-P1CsljuWUW6pEw-1; Thu, 03 Dec 2020 03:31:45 -0500
X-MC-Unique: vLw7PXp-P1CsljuWUW6pEw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE56B190A7A5;
	Thu,  3 Dec 2020 08:31:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 721CF5C1BD;
	Thu,  3 Dec 2020 08:31:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7E305180954D;
	Thu,  3 Dec 2020 08:31:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B38U2OM007950 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 03:30:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1376DD7DEC; Thu,  3 Dec 2020 08:30:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E1F2D7DF3
	for <dm-devel@redhat.com>; Thu,  3 Dec 2020 08:29:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D14E4108C0ED
	for <dm-devel@redhat.com>; Thu,  3 Dec 2020 08:29:58 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-579-YV26tvZzMECdWjyLL2fY3A-1;
	Thu, 03 Dec 2020 03:29:54 -0500
X-MC-Unique: YV26tvZzMECdWjyLL2fY3A-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8169467373; Thu,  3 Dec 2020 09:29:51 +0100 (CET)
Date: Thu, 3 Dec 2020 09:29:51 +0100
From: Christoph Hellwig <hch@lst.de>
To: Ming Lei <ming.lei@redhat.com>
Message-ID: <20201203082951.GA15581@lst.de>
References: <20201201165424.2030647-1-hch@lst.de>
	<20201201165424.2030647-4-hch@lst.de>
	<20201203063941.GA629758@T590> <20201203071055.GA633702@T590>
MIME-Version: 1.0
In-Reply-To: <20201203071055.GA633702@T590>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-s390@vger.kernel.org,
	linux-bcache@vger.kernel.org, Coly Li <colyli@suse.de>,
	linux-raid@vger.kernel.org, Song Liu <song@kernel.org>,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	Tejun Heo <tj@kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH 3/9] block: store a block_device pointer in
	struct bio
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

On Thu, Dec 03, 2020 at 03:10:55PM +0800, Ming Lei wrote:
> On Thu, Dec 03, 2020 at 02:40:04PM +0800, Ming Lei wrote:
> > On Tue, Dec 01, 2020 at 05:54:18PM +0100, Christoph Hellwig wrote:
> > > Replace the gendisk pointer in struct bio with a pointer to the newly
> > > improved struct block device.  From that the gendisk can be trivially
> > > accessed with an extra indirection, but it also allows to directly
> > > look up all information related to partition remapping.
> > 
> > The extra indirection is often done in fast path, so just wondering why
> > you don't consider to embed gendisk into block_device? Then the extra
> > indirection can be avoided.
> 
> oops, that is only possible for disk, and indirection is still needed
> for partitions.

I looked into that, but given that the block device is allocated as part
of the inode we'd need to tell ->alloc_inode if we want to allocate the
small inode without the gendisk, or the large one with it which doesn't
work with the current interface.  Beause the hd_struct is gone we're
still not using more structures in the I/O path than we did before.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

