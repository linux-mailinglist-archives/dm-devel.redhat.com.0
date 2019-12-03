Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D82F810FE1D
	for <lists+dm-devel@lfdr.de>; Tue,  3 Dec 2019 13:54:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575377642;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zNS+r7CIyZXVGsv7V07Ohsu49DoXW0gqoAbysWR/JHo=;
	b=iZV3HStMBmGMNmhnK3fnZ39sDKWaVryu3OSCSxka22F+cjxRYwyl15uQrPwjj2WOU16qUG
	Q0z0s/qTM40ywhs5dMLMevTaYrdUQvvika08/N8dLTsH+rwi4K88SG8m08IrqkS7B95dHU
	Q9BDwpXU+t7/DVA/8qf9ezArVR+sJ5I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-JFF8flohO3K3h-vg17xLcw-1; Tue, 03 Dec 2019 07:54:01 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E16ADB35;
	Tue,  3 Dec 2019 12:53:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EDF6E600CD;
	Tue,  3 Dec 2019 12:53:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9788F4EBC9;
	Tue,  3 Dec 2019 12:53:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB3Cqs5T014179 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 3 Dec 2019 07:52:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 061511001920; Tue,  3 Dec 2019 12:52:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.33.36.177])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3F2C91001902;
	Tue,  3 Dec 2019 12:52:49 +0000 (UTC)
Date: Tue, 3 Dec 2019 12:52:48 +0000
From: Joe Thornber <thornber@redhat.com>
To: Hou Tao <houtao1@huawei.com>
Message-ID: <20191203125248.5doseun32vmc3mrp@reti>
Mail-Followup-To: Hou Tao <houtao1@huawei.com>, dm-devel@redhat.com,
	agk@redhat.com, snitzer@redhat.com
References: <20191203114258.8912-1-houtao1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20191203114258.8912-1-houtao1@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, snitzer@redhat.com, agk@redhat.com
Subject: Re: [dm-devel] [PATCH] dm btree: increase rebalance threshold in
	__rebalance2()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: JFF8flohO3K3h-vg17xLcw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Ack.  Thank you.

On Tue, Dec 03, 2019 at 07:42:58PM +0800, Hou Tao wrote:
> We got the following warnings from thin_check during thin-pool setup:
> 
>   $ thin_check /dev/vdb
>   examining superblock
>   examining devices tree
>     missing devices: [1, 84]
>       too few entries in btree_node: 41, expected at least 42 (block 138, max_entries = 126)
>   examining mapping tree
> 
> The phenomenon is the number of entries in one node of details_info tree is
> less than (max_entries / 3). And it can be easily reproduced by the following
> procedures:
> 
>   $ new a thin pool
>   $ presume the max entries of details_info tree is 126
>   $ new 127 thin devices (e.g. 1~127) to make the root node being full
>     and then split
>   $ remove the first 43 (e.g. 1~43) thin devices to make the children
>     reblance repeatedly
>   $ stop the thin pool
>   $ thin_check
> 
> The root cause is that the B-tree removal procedure in __rebalance2()
> doesn't guarantee the invariance: the minimal number of entries in
> non-root node should be >= (max_entries / 3).
> 
> Simply fix the problem by increasing the rebalance threshold to
> make sure the number of entries in each child will be greater
> than or equal to (max_entries / 3 + 1), so no matter which
> child is used for removal, the number will still be valid.
> 
> Signed-off-by: Hou Tao <houtao1@huawei.com>
> ---
>  drivers/md/persistent-data/dm-btree-remove.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/md/persistent-data/dm-btree-remove.c b/drivers/md/persistent-data/dm-btree-remove.c
> index 21ea537bd55e..eff04fa23dfa 100644
> --- a/drivers/md/persistent-data/dm-btree-remove.c
> +++ b/drivers/md/persistent-data/dm-btree-remove.c
> @@ -203,7 +203,13 @@ static void __rebalance2(struct dm_btree_info *info, struct btree_node *parent,
>  	struct btree_node *right = r->n;
>  	uint32_t nr_left = le32_to_cpu(left->header.nr_entries);
>  	uint32_t nr_right = le32_to_cpu(right->header.nr_entries);
> -	unsigned threshold = 2 * merge_threshold(left) + 1;
> +	/*
> +	 * Ensure the number of entries in each child will be greater
> +	 * than or equal to (max_entries / 3 + 1), so no matter which
> +	 * child is used for removal, the number will still be not
> +	 * less than (max_entries / 3).
> +	 */
> +	unsigned int threshold = 2 * (merge_threshold(left) + 1);
>  
>  	if (nr_left + nr_right < threshold) {
>  		/*
> -- 
> 2.22.0
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

