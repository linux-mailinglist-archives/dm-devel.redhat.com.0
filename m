Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 6170B1147C1
	for <lists+dm-devel@lfdr.de>; Thu,  5 Dec 2019 20:41:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575574897;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PIxBfm1KdbJ2rQPeWappXrwChB3C5lTqwi+AIVGdGWk=;
	b=TkHPTQCg7rAiYm56b6ZnfOJeMrwrh/TgQ5wSiwmSO6/VV+GMRbteav/VaG43pIWsuwKqCM
	P7jScxnhMduDV53GYqujMPM/ZNsvyjr9hsF44SbFSeHAlqw+tFwzMp7YPgeHJdxtoxZW9x
	6Qg23kzemKsyugpnwmsRJ+fiGOQxE9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-ZxybWWeFMo2DTLZvnk7Ktg-1; Thu, 05 Dec 2019 14:41:34 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B363A1005510;
	Thu,  5 Dec 2019 19:41:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF7AE5D9C9;
	Thu,  5 Dec 2019 19:41:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DB52065D2F;
	Thu,  5 Dec 2019 19:41:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB5Jexx0009538 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 5 Dec 2019 14:40:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 081AD2063203; Thu,  5 Dec 2019 19:40:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 037A42063205
	for <dm-devel@redhat.com>; Thu,  5 Dec 2019 19:40:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BEE3980300F
	for <dm-devel@redhat.com>; Thu,  5 Dec 2019 19:40:56 +0000 (UTC)
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
	[209.85.219.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-47-Uv4_bRt_PtCqBuYMXgVSDw-1; Thu, 05 Dec 2019 14:40:53 -0500
Received: by mail-qv1-f67.google.com with SMTP id i3so1749830qvv.7;
	Thu, 05 Dec 2019 11:40:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to;
	bh=BjjrpMRxX5hGg1S7PBEAW0TjJ5vlr4i5ED6EDa4MRf0=;
	b=KBzL1yspsX2nyUZxdFE0QhbFHgpcYr1V+YDeZXuyvgZF9K2oden13uLjIz1gA1M0kI
	ozDm2entSlYRoa4QmpVH36G6fV9e1PKICrCfy9gmU1bNXJtGLdwhm/6dV34TwF1S4qSB
	/PPK2fnJO3IUowO6yXHt1Sk0X72I8fmiXqF5B4c915Ic2KIhNh1bs2B/A2mBeJVpK/Sa
	d6T6XZh0dE8Yldyb/FZtjOja/udyonoNdhx0aN1yjlHBZ3/vrZNS8wVn7RfKInSl9jC1
	XZMpWiENaSLoCPPR8AFkRr+mR7WBsMRhDc5bRqowUGxOVt+/mkhoNLAmPoTJoOx6s11x
	KbQg==
X-Gm-Message-State: APjAAAW6SJQKFGNrVS0HT1+vqzD5j/D8r+GhOTUl1FcTpkqEho1xXKeD
	9BqDdNDEIT/5xD4bQdDxUcfBgjHd
X-Google-Smtp-Source: APXvYqxe5W8IhxC88ix19c+ouBl9U49pcCSiP93x5fa45zvXbdjOM2FVU6SGin0Iw08B8W1AoinQeg==
X-Received: by 2002:a0c:f68f:: with SMTP id p15mr9043835qvn.79.1575574852057; 
	Thu, 05 Dec 2019 11:40:52 -0800 (PST)
Received: from localhost (nat-pool-bos-t.redhat.com. [66.187.233.206])
	by smtp.gmail.com with ESMTPSA id
	p126sm5207688qke.108.2019.12.05.11.40.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 11:40:50 -0800 (PST)
Date: Thu, 5 Dec 2019 14:40:49 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <20191205193157.GA95063@lobo>
References: <20191204140742.26273-1-ntsironis@arrikto.com>
	<20191204140742.26273-2-ntsironis@arrikto.com>
MIME-Version: 1.0
In-Reply-To: <20191204140742.26273-2-ntsironis@arrikto.com>
X-MC-Unique: Uv4_bRt_PtCqBuYMXgVSDw-1
X-MC-Unique: ZxybWWeFMo2DTLZvnk7Ktg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB5Jexx0009538
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, thornber@redhat.com, agk@redhat.com
Subject: Re: [dm-devel] [PATCH 1/2] dm thin metadata: Add support for a
 pre-commit callback
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Dec 04 2019 at  9:07P -0500,
Nikos Tsironis <ntsironis@arrikto.com> wrote:

> Add support for one pre-commit callback which is run right before the
> metadata are committed.
> 
> This allows the thin provisioning target to run a callback before the
> metadata are committed and is required by the next commit.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Nikos Tsironis <ntsironis@arrikto.com>
> ---
>  drivers/md/dm-thin-metadata.c | 29 +++++++++++++++++++++++++++++
>  drivers/md/dm-thin-metadata.h |  7 +++++++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/drivers/md/dm-thin-metadata.c b/drivers/md/dm-thin-metadata.c
> index 4c68a7b93d5e..b88d6d701f5b 100644
> --- a/drivers/md/dm-thin-metadata.c
> +++ b/drivers/md/dm-thin-metadata.c
> @@ -189,6 +189,15 @@ struct dm_pool_metadata {
>  	sector_t data_block_size;
>  
>  	/*
> +	 * Pre-commit callback.
> +	 *
> +	 * This allows the thin provisioning target to run a callback before
> +	 * the metadata are committed.
> +	 */
> +	dm_pool_pre_commit_fn pre_commit_fn;
> +	void *pre_commit_context;
> +
> +	/*
>  	 * We reserve a section of the metadata for commit overhead.
>  	 * All reported space does *not* include this.
>  	 */
> @@ -826,6 +835,14 @@ static int __commit_transaction(struct dm_pool_metadata *pmd)
>  	if (unlikely(!pmd->in_service))
>  		return 0;
>  
> +	if (pmd->pre_commit_fn) {
> +		r = pmd->pre_commit_fn(pmd->pre_commit_context);
> +		if (r < 0) {
> +			DMERR("pre-commit callback failed");
> +			return r;
> +		}
> +	}
> +
>  	r = __write_changed_details(pmd);
>  	if (r < 0)
>  		return r;
> @@ -892,6 +909,8 @@ struct dm_pool_metadata *dm_pool_metadata_open(struct block_device *bdev,
>  	pmd->in_service = false;
>  	pmd->bdev = bdev;
>  	pmd->data_block_size = data_block_size;
> +	pmd->pre_commit_fn = NULL;
> +	pmd->pre_commit_context = NULL;
>  
>  	r = __create_persistent_data_objects(pmd, format_device);
>  	if (r) {
> @@ -2044,6 +2063,16 @@ int dm_pool_register_metadata_threshold(struct dm_pool_metadata *pmd,
>  	return r;
>  }
>  
> +void dm_pool_register_pre_commit_callback(struct dm_pool_metadata *pmd,
> +					  dm_pool_pre_commit_fn fn,
> +					  void *context)
> +{
> +	pmd_write_lock_in_core(pmd);
> +	pmd->pre_commit_fn = fn;
> +	pmd->pre_commit_context = context;
> +	pmd_write_unlock(pmd);
> +}
> +
>  int dm_pool_metadata_set_needs_check(struct dm_pool_metadata *pmd)
>  {
>  	int r = -EINVAL;
> diff --git a/drivers/md/dm-thin-metadata.h b/drivers/md/dm-thin-metadata.h
> index f6be0d733c20..7ef56bd2a7e3 100644
> --- a/drivers/md/dm-thin-metadata.h
> +++ b/drivers/md/dm-thin-metadata.h
> @@ -230,6 +230,13 @@ bool dm_pool_metadata_needs_check(struct dm_pool_metadata *pmd);
>   */
>  void dm_pool_issue_prefetches(struct dm_pool_metadata *pmd);
>  
> +/* Pre-commit callback */
> +typedef int (*dm_pool_pre_commit_fn)(void *context);
> +
> +void dm_pool_register_pre_commit_callback(struct dm_pool_metadata *pmd,
> +					  dm_pool_pre_commit_fn fn,
> +					  void *context);
> +
>  /*----------------------------------------------------------------*/
>  
>  #endif
> -- 
> 2.11.0
> 

I have this incremental, not seeing need to avoid using blkdev_issue_flush

---
 drivers/md/dm-thin.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
index 9c9a323c0c30..255a52f7bbf0 100644
--- a/drivers/md/dm-thin.c
+++ b/drivers/md/dm-thin.c
@@ -3203,18 +3203,8 @@ static void metadata_low_callback(void *context)
 static int metadata_pre_commit_callback(void *context)
 {
 	struct pool_c *pt = context;
-	struct bio bio;
-	int r;
-
-	bio_init(&bio, NULL, 0);
-	bio_set_dev(&bio, pt->data_dev->bdev);
-	bio.bi_opf = REQ_OP_WRITE | REQ_PREFLUSH;
-
-	r = submit_bio_wait(&bio);
 
-	bio_uninit(&bio);
-
-	return r;
+	return blkdev_issue_flush(pt->data_dev->bdev, GFP_NOIO, NULL);
 }
 
 static sector_t get_dev_size(struct block_device *bdev)
-- 
2.15.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

