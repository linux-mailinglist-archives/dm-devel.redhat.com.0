Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DC2492C66B0
	for <lists+dm-devel@lfdr.de>; Fri, 27 Nov 2020 14:21:59 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-f0kMwaZfNg6MXpVlvqrzxA-1; Fri, 27 Nov 2020 08:21:56 -0500
X-MC-Unique: f0kMwaZfNg6MXpVlvqrzxA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47E008144E6;
	Fri, 27 Nov 2020 13:21:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 69C466085D;
	Fri, 27 Nov 2020 13:21:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C306B4A7C6;
	Fri, 27 Nov 2020 13:21:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ARDJA7T018884 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 27 Nov 2020 08:19:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E92C81018E6F; Fri, 27 Nov 2020 13:19:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2F0A1019269
	for <dm-devel@redhat.com>; Fri, 27 Nov 2020 13:19:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AAFA0800C00
	for <dm-devel@redhat.com>; Fri, 27 Nov 2020 13:19:07 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-494-NdfoxVwmMCOWK-wBJm2c2w-1;
	Fri, 27 Nov 2020 08:19:03 -0500
X-MC-Unique: NdfoxVwmMCOWK-wBJm2c2w-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E6B3BABD7;
	Fri, 27 Nov 2020 13:19:01 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 7BE0A1E1318; Fri, 27 Nov 2020 14:19:01 +0100 (CET)
Date: Fri, 27 Nov 2020 14:19:01 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20201127131901.GE27162@quack2.suse.cz>
References: <20201126130422.92945-1-hch@lst.de>
	<20201126130422.92945-44-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20201126130422.92945-44-hch@lst.de>
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
	Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.com>, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Tejun Heo <tj@kernel.org>, linux-bcache@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu 26-11-20 14:04:21, Christoph Hellwig wrote:
> Instead of having two structures that represent each block device with
> different life time rules, merge them into a single one.  This also
> greatly simplifies the reference counting rules, as we can use the inode
> reference count as the main reference count for the new struct
> block_device, with the device model reference front ending it for device
> model interaction.  The percpu refcount in struct hd_struct is entirely
> gone given that struct block_device must be opened and thus valid for
> the duration of the I/O.

The percpu refcount is long gone after the series refactoring...

> @@ -939,13 +910,13 @@ void blk_request_module(dev_t devt)
>   */
>  struct block_device *bdget_disk(struct gendisk *disk, int partno)
>  {
> -	struct hd_struct *part;
>  	struct block_device *bdev = NULL;
>  
> -	part = disk_get_part(disk, partno);
> -	if (part)
> -		bdev = bdget_part(part);
> -	disk_put_part(part);
> +	rcu_read_lock();
> +	bdev = __disk_get_part(disk, partno);
> +	if (bdev)
> +		bdgrab(bdev);

Again I think you need to accommodate for bdgrab() returning NULL here when
we race with partition destruction...

> +	rcu_read_unlock();
>  
>  	return bdev;
>  }

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

