Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8C34E2C68F8
	for <lists+dm-devel@lfdr.de>; Fri, 27 Nov 2020 16:52:12 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-38hFjH-eOguNU4AoCvSfLQ-1; Fri, 27 Nov 2020 10:52:09 -0500
X-MC-Unique: 38hFjH-eOguNU4AoCvSfLQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AD361DE06;
	Fri, 27 Nov 2020 15:52:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE4265C1C2;
	Fri, 27 Nov 2020 15:51:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9CFB118095C7;
	Fri, 27 Nov 2020 15:51:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ARFlJw5003926 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 27 Nov 2020 10:47:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A2A392026D47; Fri, 27 Nov 2020 15:47:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DD832026D5D
	for <dm-devel@redhat.com>; Fri, 27 Nov 2020 15:47:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D7AA811E78
	for <dm-devel@redhat.com>; Fri, 27 Nov 2020 15:47:15 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-519-gvEuh3SgPvO4hP_KpI7ZTQ-1;
	Fri, 27 Nov 2020 10:47:12 -0500
X-MC-Unique: gvEuh3SgPvO4hP_KpI7ZTQ-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id C6DB768B05; Fri, 27 Nov 2020 16:47:09 +0100 (CET)
Date: Fri, 27 Nov 2020 16:47:09 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Message-ID: <20201127154709.GA8881@lst.de>
References: <20201126130422.92945-1-hch@lst.de>
	<20201126130422.92945-44-hch@lst.de>
	<20201127131901.GE27162@quack2.suse.cz>
MIME-Version: 1.0
In-Reply-To: <20201127131901.GE27162@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
	linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.com>, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Tejun Heo <tj@kernel.org>, linux-bcache@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH 43/44] block: merge struct block_device and
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 27, 2020 at 02:19:01PM +0100, Jan Kara wrote:
> The percpu refcount is long gone after the series refactoring...

True.

> > @@ -939,13 +910,13 @@ void blk_request_module(dev_t devt)
> >   */
> >  struct block_device *bdget_disk(struct gendisk *disk, int partno)
> >  {
> > -	struct hd_struct *part;
> >  	struct block_device *bdev = NULL;
> >  
> > -	part = disk_get_part(disk, partno);
> > -	if (part)
> > -		bdev = bdget_part(part);
> > -	disk_put_part(part);
> > +	rcu_read_lock();
> > +	bdev = __disk_get_part(disk, partno);
> > +	if (bdev)
> > +		bdgrab(bdev);
> 
> Again I think you need to accommodate for bdgrab() returning NULL here when
> we race with partition destruction...

For that we need to allow bdgrab to return NULL first, but otherwise
this seems like the right way.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

