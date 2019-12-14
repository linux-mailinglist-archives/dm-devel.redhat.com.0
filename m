Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0D73911F0A0
	for <lists+dm-devel@lfdr.de>; Sat, 14 Dec 2019 07:59:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576306763;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XbVj5ZPzIY+C/PsHMTlLrIcHo28cKpqxNlMqmS2FusQ=;
	b=D65wdZjVhgVibAyZ6WMRQkC3lBhtbD1gHq+9N57SPODjqkLnZbzPOdGLHTq0tNKc1O9zju
	kQwGxVn+UdEbEWeyhvKwfq8mXwm8FJxl9zO7Bqoct7skUtyQenfhHBdJy35YPZ5dmP/vmw
	xkHDl2LwbyvmlpGc7xhkLyYp28QXOeI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-Cri-6viTOQaSQOIg0i-Usg-1; Sat, 14 Dec 2019 01:59:21 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B11F91005502;
	Sat, 14 Dec 2019 06:59:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 684485C1D8;
	Sat, 14 Dec 2019 06:59:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BE17B18089CD;
	Sat, 14 Dec 2019 06:58:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBE6wbx6021139 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 14 Dec 2019 01:58:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E3A06167EFB; Sat, 14 Dec 2019 06:58:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF2481692C0
	for <dm-devel@redhat.com>; Sat, 14 Dec 2019 06:58:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4E758035A0
	for <dm-devel@redhat.com>; Sat, 14 Dec 2019 06:58:34 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-203-yjGtAMfwOyitjTE5KOj1uw-1;
	Sat, 14 Dec 2019 01:58:30 -0500
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
	[24.5.143.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id B09762465B;
	Sat, 14 Dec 2019 06:58:28 +0000 (UTC)
Date: Fri, 13 Dec 2019 22:58:27 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: zhou xianrong <zhou_xianrong@yeah.net>
Message-ID: <20191214065827.GA727@sol.localdomain>
References: <20191211033240.169-1-zhou_xianrong@yeah.net>
MIME-Version: 1.0
In-Reply-To: <20191211033240.169-1-zhou_xianrong@yeah.net>
X-MC-Unique: yjGtAMfwOyitjTE5KOj1uw-1
X-MC-Unique: Cri-6viTOQaSQOIg0i-Usg-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xBE6wbx6021139
X-loop: dm-devel@redhat.com
Cc: weimin.mao@transsion.com, haizhou.song@transsion.com, snitzer@redhat.com,
	wanbin.wang@transsion.com, xianrong.zhou@transsion.com,
	linux-kernel@vger.kernel.org, yuanjiong.gao@transsion.com,
	dm-devel@redhat.com, ruxian.feng@transsion.com, agk@redhat.com
Subject: Re: [dm-devel] [PATCH] dm-verity: unnecessary data blocks that need
 not read hash blocks
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
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Dec 11, 2019 at 11:32:40AM +0800, zhou xianrong wrote:
> From: "xianrong.zhou" <xianrong.zhou@transsion.com>
> 
> If check_at_most_once enabled, just like verity work the prefetching work
> should check for data block bitmap firstly before reading hash block
> as well. Skip bit-set data blocks from both ends of data block range
> by testing the validated bitmap. This can reduce the amounts of data 
> blocks which need to read hash blocks.
> 
> Launching 91 apps every 15s and repeat 21 rounds on Android Q.
> In prefetching work we can let only 2602/360312 = 0.72% data blocks
> really need to read hash blocks.
> 
> But the reduced data blocks range would be enlarged again by
> dm_verity_prefetch_cluster later.
> 
> Signed-off-by: xianrong.zhou <xianrong.zhou@transsion.com>
> Signed-off-by: yuanjiong.gao <yuanjiong.gao@transsion.com>
> Tested-by: ruxian.feng <ruxian.feng@transsion.com>
> ---
>  drivers/md/dm-verity-target.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/md/dm-verity-target.c b/drivers/md/dm-verity-target.c
> index 4fb33e7562c5..7b8eb754c0b6 100644
> --- a/drivers/md/dm-verity-target.c
> +++ b/drivers/md/dm-verity-target.c
> @@ -581,6 +581,22 @@ static void verity_prefetch_io(struct work_struct *work)
>  	struct dm_verity *v = pw->v;
>  	int i;
>  
> +	if (v->validated_blocks) {
> +		while (pw->n_blocks) {
> +			if (unlikely(!test_bit(pw->block, v->validated_blocks)))
> +				break;
> +			pw->block++;
> +			pw->n_blocks--;
> +		}
> +		while (pw->n_blocks) {
> +			if (unlikely(!test_bit(pw->block + pw->n_blocks - 1,
> +				v->validated_blocks)))
> +				break;
> +			pw->n_blocks--;
> +		}
> +		if (!pw->n_blocks)
> +			return;
> +	}

This is a good idea, but shouldn't this logic go in verity_submit_prefetch()
prior to the struct dm_verity_prefetch_work being allocated?  Then if no
prefeching is needed, allocating and scheduling the work object can be skipped.

Also note that you're currently leaking the work object with the early return.

- Eric


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

