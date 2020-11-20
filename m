Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8A49B2BB63B
	for <lists+dm-devel@lfdr.de>; Fri, 20 Nov 2020 21:06:33 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-2JwhWWtsPguQAF92KEvtpg-1; Fri, 20 Nov 2020 15:06:28 -0500
X-MC-Unique: 2JwhWWtsPguQAF92KEvtpg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E75D107AD30;
	Fri, 20 Nov 2020 20:06:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA65E19C46;
	Fri, 20 Nov 2020 20:06:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 62D3B180954D;
	Fri, 20 Nov 2020 20:06:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKK5tBt028279 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 15:05:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CEDE0101F0BE; Fri, 20 Nov 2020 20:05:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CAFDB101F0B6
	for <dm-devel@redhat.com>; Fri, 20 Nov 2020 20:05:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81F40802A5D
	for <dm-devel@redhat.com>; Fri, 20 Nov 2020 20:05:53 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-294-w5ATznCmOf6w3M38lpw8-Q-1;
	Fri, 20 Nov 2020 15:05:50 -0500
X-MC-Unique: w5ATznCmOf6w3M38lpw8-Q-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2C646AE1F;
	Fri, 20 Nov 2020 20:05:49 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id C910C1E1319; Fri, 20 Nov 2020 21:05:48 +0100 (CET)
Date: Fri, 20 Nov 2020 21:05:48 +0100
From: Jan Kara <jack@suse.cz>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20201120200548.GA27360@quack2.suse.cz>
References: <20201118084800.2339180-1-hch@lst.de>
	<20201118084800.2339180-15-hch@lst.de>
	<20201119120525.GW1981@quack2.suse.cz>
	<20201120090820.GD21715@lst.de>
	<20201120112121.GB15537@quack2.suse.cz>
	<20201120153253.GA18990@lst.de>
	<20201120155956.GB4327@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20201120155956.GB4327@casper.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>,
	Mike Snitzer <snitzer@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Richard Weinberger <richard@nod.at>,
	Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-mtd@lists.infradead.org,
	linux-mm@kvack.org, Jan Kara <jack@suse.com>,
	Tejun Heo <tj@kernel.org>, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH 14/20] block: remove the nr_sects field in
 struct hd_struct
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri 20-11-20 15:59:56, Matthew Wilcox wrote:
> On Fri, Nov 20, 2020 at 04:32:53PM +0100, Christoph Hellwig wrote:
> > On Fri, Nov 20, 2020 at 12:21:21PM +0100, Jan Kara wrote:
> > > > > AFAICT bd_size_lock is pointless after these changes so we can just remove
> > > > > it?
> > > > 
> > > > I don't think it is, as reuqiring bd_mutex for size updates leads to
> > > > rather awkward lock ordering problems.
> > > 
> > > OK, let me ask differently: What is bd_size_lock protecting now? Ah, I see,
> > > on 32-bit it is needed to prevent torn writes to i_size, right?
> > 
> > Exactly.  In theory we could skip it for 64-bit, but as updating the
> > size isn't a fast path, and struct block_device isn't super size critical
> > I'd rather keep the same code for 32 vs 64-bit builds.
> 
> Is it better to switch to i_size_write() / i_size_read()?

The code is already switched to it AFAICT (the lock is really only used in
the two places that write i_size). But the problem is that in theory two
i_size_write() calls can race in a way that the resulting stored i_size is a
mix of two stored sizes. Now I have hard time imagining how this could
happen for a block device and if two reconfigurations of a block device
could race like that we'd have a large problems anyway...

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

