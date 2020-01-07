Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2860F131DDF
	for <lists+dm-devel@lfdr.de>; Tue,  7 Jan 2020 04:15:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578366920;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AVPsQcU9bH4QC8g4X1twZpMJ9Fe1rnRdXX09DidmJzQ=;
	b=JTpbopHFZ09rVWNBdKNU/JRPXHp2ZL1e6AeVmnizcRjw8V7MU1xAZPFuXpYfqQl+wu1B2i
	bTGcVw7f6uie6JKRbpekMMlA1dsWWcsiEAmkoGarUYCNaMXtZe09xfzhFFqc3jf30L7o4A
	ew2HnHyx5mc+PGoxr5TLNy0pj0Hlt/s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-mpdPj9wdPyGyehjUVY0SIg-1; Mon, 06 Jan 2020 22:15:18 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BAE91800D4A;
	Tue,  7 Jan 2020 03:15:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27ECE7FB53;
	Tue,  7 Jan 2020 03:15:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A237181C76;
	Tue,  7 Jan 2020 03:14:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0073Eb4f026552 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 Jan 2020 22:14:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3EBA22166B2A; Tue,  7 Jan 2020 03:14:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AB292166B29
	for <dm-devel@redhat.com>; Tue,  7 Jan 2020 03:14:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCDBB8D7744
	for <dm-devel@redhat.com>; Tue,  7 Jan 2020 03:14:34 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-319-7a6ktPVeOIS7Oxdb1MTEDA-1;
	Mon, 06 Jan 2020 22:14:32 -0500
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
	[24.5.143.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id B182F2075A;
	Tue,  7 Jan 2020 03:14:30 +0000 (UTC)
Date: Mon, 6 Jan 2020 19:14:29 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: zhou_xianrong <zhou_xianrong@sohu.com>
Message-ID: <20200107031429.GA705@sol.localdomain>
References: <20200107024843.8660-1-zhou_xianrong@sohu.com>
MIME-Version: 1.0
In-Reply-To: <20200107024843.8660-1-zhou_xianrong@sohu.com>
X-MC-Unique: 7a6ktPVeOIS7Oxdb1MTEDA-1
X-MC-Unique: mpdPj9wdPyGyehjUVY0SIg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0073Eb4f026552
X-loop: dm-devel@redhat.com
Cc: haizhou.song@transsion.com, snitzer@redhat.com, wanbin.wang@transsion.com,
	"xianrong.zhou" <xianrong.zhou@transsion.com>,
	linux-kernel@vger.kernel.org,
	"yuanjiong . gao" <yuanjiong.gao@transsion.com>,
	dm-devel@redhat.com, "ruxian . feng" <ruxian.feng@transsion.com>,
	agk@redhat.com
Subject: Re: [dm-devel] [PATCH] dm-verity:unnecessary data blocks that need
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jan 07, 2020 at 10:48:43AM +0800, zhou_xianrong wrote:

> Subject: [PATCH] dm-verity:unnecessary data blocks that need not read

Please use a proper commit subject.  It should begin with "dm verity: " and use
the imperative tense to describe the change, e.g.

	dm verity: don't prefetch hash blocks for already-verified data

Also this should have been "PATCH v2", not simply PATCH, since you already sent
out a previous version.

You also sent out multiple copies of this email for some reason, so I just chose
one arbitrarily to reply to...

> diff --git a/drivers/md/dm-verity-target.c b/drivers/md/dm-verity-target.c
> index 4fb33e7..4127711 100644
> --- a/drivers/md/dm-verity-target.c
> +++ b/drivers/md/dm-verity-target.c
> @@ -611,8 +611,27 @@ static void verity_prefetch_io(struct work_struct *work)
>  
>  static void verity_submit_prefetch(struct dm_verity *v, struct dm_verity_io *io)
>  {
> +	sector_t block = io->block;
> +	unsigned int n_blocks = io->n_blocks;
>  	struct dm_verity_prefetch_work *pw;
>  
> +	if (v->validated_blocks) {
> +		while (n_blocks) {
> +			if (unlikely(!test_bit(block, v->validated_blocks)))
> +				break;
> +			block++;
> +			n_blocks--;
> +		}
> +		while (n_blocks) {
> +			if (unlikely(!test_bit(block + n_blocks - 1,
> +				v->validated_blocks)))
> +				break;
> +			n_blocks--;
> +		}
> +		if (!n_blocks)
> +			return;
> +	}

This looks fine now, though it's a bit more verbose than necessary, and I don't
think unlikely() will make any difference here.  Consider simplifying it to:

	if (v->validated_blocks) {
		while (n_blocks && test_bit(block, v->validated_blocks)) {
			block++;
			n_blocks--;
		}
		while (n_blocks && test_bit(block + n_blocks - 1,
					    v->validated_blocks))
			n_blocks--;
		if (!n_blocks)
			return;
	}


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

