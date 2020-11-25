Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4651A2C44D3
	for <lists+dm-devel@lfdr.de>; Wed, 25 Nov 2020 17:23:39 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-VOLm6meMP6KQwbR49yVm8w-1; Wed, 25 Nov 2020 11:23:35 -0500
X-MC-Unique: VOLm6meMP6KQwbR49yVm8w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D56E807337;
	Wed, 25 Nov 2020 16:23:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FA3A60855;
	Wed, 25 Nov 2020 16:23:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B23C7180954D;
	Wed, 25 Nov 2020 16:23:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0APGN2VI004910 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 25 Nov 2020 11:23:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 06F242166B2B; Wed, 25 Nov 2020 16:23:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 018132166B29
	for <dm-devel@redhat.com>; Wed, 25 Nov 2020 16:22:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D979B802A5D
	for <dm-devel@redhat.com>; Wed, 25 Nov 2020 16:22:59 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-591-vkmhNliJMzuVHu1K2LDw9g-1;
	Wed, 25 Nov 2020 11:22:55 -0500
X-MC-Unique: vkmhNliJMzuVHu1K2LDw9g-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 4507168B02; Wed, 25 Nov 2020 17:22:50 +0100 (CET)
Date: Wed, 25 Nov 2020 17:22:50 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Message-ID: <20201125162250.GA795@lst.de>
References: <20201124132751.3747337-1-hch@lst.de>
	<20201124132751.3747337-5-hch@lst.de>
	<20201125122953.GH16944@quack2.suse.cz>
MIME-Version: 1.0
In-Reply-To: <20201125122953.GH16944@quack2.suse.cz>
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-fsdevel@vger.kernel.org,
	Mike Snitzer <snitzer@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.com>, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
	Richard Weinberger <richard@nod.at>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, linux-mm@kvack.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Tejun Heo <tj@kernel.org>, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH 04/45] fs: simplify freeze_bdev/thaw_bdev
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 25, 2020 at 01:29:53PM +0100, Jan Kara wrote:
> >  	mutex_unlock(&bdev->bd_fsfreeze_mutex);
> > -	return sb;	/* thaw_bdev releases s->s_umount */
> > +	return error;	/* thaw_bdev releases s->s_umount */
> 
> The comment about thaw_bdev() seems to be stale? At least I don't see what
> it's speaking about...

Yes, this comment seems long stale.  I think in the very early days
we held s_umount on frozen file system, which caused all kinds of
problems.

> >  	mutex_unlock(&bdev->bd_fsfreeze_mutex);
> > -	return error;
> > +	return 0;
> 
> But we now won't return -EINVAL if this gets called e.g. with
> bd_fsfreeze_count == 0, right?

Yes.  I had tried to drop the return value as all the freeze_bdev
calls ignored it.  But I had missed the unpaired emergency thaw and put
it back and messed this up..

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

