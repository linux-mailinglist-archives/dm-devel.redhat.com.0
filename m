Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1E5D22C5ADC
	for <lists+dm-devel@lfdr.de>; Thu, 26 Nov 2020 18:43:21 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-_HPocr8uNBqZHVQD7eb_-A-1; Thu, 26 Nov 2020 12:43:16 -0500
X-MC-Unique: _HPocr8uNBqZHVQD7eb_-A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE5BC1006C97;
	Thu, 26 Nov 2020 17:43:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CDBCB1000232;
	Thu, 26 Nov 2020 17:43:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 20079180954D;
	Thu, 26 Nov 2020 17:43:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AQHgoHp000815 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 26 Nov 2020 12:42:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 822BF112D405; Thu, 26 Nov 2020 17:42:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E34F112D404
	for <dm-devel@redhat.com>; Thu, 26 Nov 2020 17:42:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B904858EEC
	for <dm-devel@redhat.com>; Thu, 26 Nov 2020 17:42:47 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-381-KHjoTLWCORehp2qJvTsZHw-1;
	Thu, 26 Nov 2020 12:42:42 -0500
X-MC-Unique: KHjoTLWCORehp2qJvTsZHw-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 31C9868B05; Thu, 26 Nov 2020 18:42:39 +0100 (CET)
Date: Thu, 26 Nov 2020 18:42:38 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Message-ID: <20201126174238.GA24098@lst.de>
References: <20201126130422.92945-1-hch@lst.de>
	<20201126130422.92945-25-hch@lst.de>
	<20201126163341.GL422@quack2.suse.cz>
MIME-Version: 1.0
In-Reply-To: <20201126163341.GL422@quack2.suse.cz>
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
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
	linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.com>, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Tejun Heo <tj@kernel.org>, linux-bcache@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH 24/44] block: simplify bdev/disk lookup in
	blkdev_get
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

On Thu, Nov 26, 2020 at 05:33:41PM +0100, Jan Kara wrote:
> >  			bdev->bd_contains = whole;
> > -			bdev->bd_part = disk_get_part(disk, partno);
> > -			if (!(disk->flags & GENHD_FL_UP) ||
> > -			    !bdev->bd_part || !bdev->bd_part->nr_sects) {
> > +			bdev->bd_part = disk_get_part(disk, bdev->bd_partno);
> > +			if (!bdev->bd_part || !bdev->bd_part->nr_sects) {
> 
> AFAICT it is still possible that we see !(disk->flags & GENHD_FL_UP) here,
> isn't it? Is it safe to remove because the nr_sects check is already
> equivalent to it? Or something else?

At this point we already have the disk abd bdev reference, so we're not
closing any new race here.  That being said we might as well keep this
check to not bother going ahead when the disk is already torn down.

> I think bdget() above needs to be already under bdev_lookup_sem. Otherwise
> disk_to_dev(bdev->bd_disk)->kobj below is a potential use-after-free.

Yes.  I've fixed this and the other issues.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

