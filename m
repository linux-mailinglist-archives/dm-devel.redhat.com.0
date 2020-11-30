Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0850A2C8146
	for <lists+dm-devel@lfdr.de>; Mon, 30 Nov 2020 10:44:52 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-ko-8MQvrOw6SAgNAWM-w3g-1; Mon, 30 Nov 2020 04:44:49 -0500
X-MC-Unique: ko-8MQvrOw6SAgNAWM-w3g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2435C835B70;
	Mon, 30 Nov 2020 09:44:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75D2C5D6A8;
	Mon, 30 Nov 2020 09:44:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 900444A7C6;
	Mon, 30 Nov 2020 09:44:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AU9iVJu012616 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 30 Nov 2020 04:44:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0BBA12166B2B; Mon, 30 Nov 2020 09:44:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06E8B2166B2A
	for <dm-devel@redhat.com>; Mon, 30 Nov 2020 09:44:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BAFFE101A53F
	for <dm-devel@redhat.com>; Mon, 30 Nov 2020 09:44:27 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-358-jGCuLX-mNbC4gw8mqD0phg-1;
	Mon, 30 Nov 2020 04:44:23 -0500
X-MC-Unique: jGCuLX-mNbC4gw8mqD0phg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A7A4CACBA;
	Mon, 30 Nov 2020 09:44:21 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 3E43E1E131B; Mon, 30 Nov 2020 10:44:21 +0100 (CET)
Date: Mon, 30 Nov 2020 10:44:21 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20201130094421.GD11250@quack2.suse.cz>
References: <20201128161510.347752-1-hch@lst.de>
	<20201128161510.347752-31-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20201128161510.347752-31-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
	Jan Kara <jack@suse.cz>, Mike Snitzer <snitzer@redhat.com>,
	linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.com>, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Tejun Heo <tj@kernel.org>, linux-bcache@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 30/45] block: remove the nr_sects field in
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat 28-11-20 17:14:55, Christoph Hellwig wrote:
> Now that the hd_struct always has a block device attached to it, there is
> no need for having two size field that just get out of sync.
> 
> Additionally the field in hd_struct did not use proper serialization,
> possibly allowing for torn writes.  By only using the block_device field
> this problem also gets fixed.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Acked-by: Coly Li <colyli@suse.de>			[bcache]
> Acked-by: Chao Yu <yuchao0@huawei.com>			[f2fs]

...

> @@ -47,18 +57,22 @@ static void disk_release_events(struct gendisk *disk);
>  bool set_capacity_and_notify(struct gendisk *disk, sector_t size)
>  {
>  	sector_t capacity = get_capacity(disk);
> +	char *envp[] = { "RESIZE=1", NULL };
>  
>  	set_capacity(disk, size);
> -	revalidate_disk_size(disk, true);
> -
> -	if (capacity != size && capacity != 0 && size != 0) {
> -		char *envp[] = { "RESIZE=1", NULL };
> -
> -		kobject_uevent_env(&disk_to_dev(disk)->kobj, KOBJ_CHANGE, envp);
> -		return true;
> -	}
>  
> -	return false;
> +	/*
> +	 * Only print a message and send a uevent if the gendisk is user visible
> +	 * and alive.  This avoids spamming the log and udev when setting the
> +	 * initial capacity during probing.
> +	 */
> +	if (size == capacity ||
> +	    (disk->flags & (GENHD_FL_UP | GENHD_FL_HIDDEN)) != GENHD_FL_UP)
> +		return false;
> +	pr_info("%s: detected capacity change from %lld to %lld\n",
> +		disk->disk_name, size, capacity);
> +	kobject_uevent_env(&disk_to_dev(disk)->kobj, KOBJ_CHANGE, envp);
> +	return true;
>  }
>  EXPORT_SYMBOL_GPL(set_capacity_and_notify);

I know I'm like a broken record about this but I still don't understand
here... I'd expect the new code to be:

	if (size == capacity ||
	    (disk->flags & (GENHD_FL_UP | GENHD_FL_HIDDEN)) != GENHD_FL_UP)
		return false;
	pr_info("%s: detected capacity change from %lld to %lld\n",
		disk->disk_name, size, capacity);
+	if (!capacity || !size)
+		return false;
	kobject_uevent_env(&disk_to_dev(disk)->kobj, KOBJ_CHANGE, envp);
	return true;

At least that would be equivalent to the original functionality of
set_capacity_and_notify(). And if you indeed intend to change when
"RESIZE=1" events are sent, then I'd expect an explanation in the changelog
why this cannot break userspace (I remember we've already broken some udev
rules in the past by generating unexpected events and we had to revert
those changes in the partition code so I'm more careful now). The rest of
the patch looks good to me.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

