Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2CE2C68C7
	for <lists+dm-devel@lfdr.de>; Fri, 27 Nov 2020 16:36:53 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-xi92zWLkO16CIBGfGyTb3Q-1; Fri, 27 Nov 2020 10:36:49 -0500
X-MC-Unique: xi92zWLkO16CIBGfGyTb3Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73BB21007466;
	Fri, 27 Nov 2020 15:36:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23E321001281;
	Fri, 27 Nov 2020 15:36:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A8C571809C9F;
	Fri, 27 Nov 2020 15:36:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ARFaQi1001729 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 27 Nov 2020 10:36:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9C3642166B28; Fri, 27 Nov 2020 15:36:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 967EA2166B2C
	for <dm-devel@redhat.com>; Fri, 27 Nov 2020 15:36:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56846186E122
	for <dm-devel@redhat.com>; Fri, 27 Nov 2020 15:36:24 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-416-mWXVcRtWOJ-K-yw1620wZg-1;
	Fri, 27 Nov 2020 10:36:20 -0500
X-MC-Unique: mWXVcRtWOJ-K-yw1620wZg-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 5CA0168B05; Fri, 27 Nov 2020 16:36:16 +0100 (CET)
Date: Fri, 27 Nov 2020 16:36:15 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Message-ID: <20201127153615.GA7524@lst.de>
References: <20201126130422.92945-1-hch@lst.de>
	<20201126130422.92945-38-hch@lst.de>
	<20201126182219.GC422@quack2.suse.cz>
	<20201127094842.GA15984@lst.de>
	<20201127124537.GC27162@quack2.suse.cz>
MIME-Version: 1.0
In-Reply-To: <20201127124537.GC27162@quack2.suse.cz>
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
Cc: Jens Axboe <axboe@kernel.dk>, Chao Yu <yuchao0@huawei.com>,
	Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.com>, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Tejun Heo <tj@kernel.org>, linux-bcache@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH 37/44] block: switch partition lookup to use
 struct block_device
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 27, 2020 at 01:45:37PM +0100, Jan Kara wrote:
> > At this point the hd_struct is already allocated together with the
> > block_device, and thus only freed after the last block_device reference
> > goes away plus the inode freeing RCU grace period.  So the device model
> > ref to part is indeed gone, but that simply does not matter any more.
> 
> Well, but once device model ref to part is gone, we're going to free the
> bdev inode ref as well. Thus there's nothing which pins the bdev containing
> hd_struct?
> 
> But now as I'm thinking about it you later switch the device model reference
> to just pure inode reference and use igrab() which will reliably return
> NULL if the inode is on it's way to be destroyed so probably we are safe in
> the final state.

igrab always succeeds.  But we should switch to a tryget.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

