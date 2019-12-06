Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id CCA0211550C
	for <lists+dm-devel@lfdr.de>; Fri,  6 Dec 2019 17:22:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575649334;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=arrWJ/2SqSCt3wMdAOAOhgK/zOKA7wTXgZa0UA4qfH8=;
	b=KKGJsT+vxHcuzVSjOSaenfSzMhD7+y/LraV4KytUhNk1Da/rYyXqkaiXIrhyfP4YLu1UFi
	UMc99fBilHIYGcTzdRYImILb2mlByWRQRFSK2VP3JftHHbropNKB6jMbSlhujmpKkja+yF
	xP7dP8NHW2EAsjIcQ00JoqS9kWh3Mt4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-ypEJvOMoNhGWNScUDyL-QA-1; Fri, 06 Dec 2019 11:22:13 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03D16800EB9;
	Fri,  6 Dec 2019 16:22:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B9426E702;
	Fri,  6 Dec 2019 16:21:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E697C18089CD;
	Fri,  6 Dec 2019 16:21:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB6GLQLW024481 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 6 Dec 2019 11:21:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7F2B320316E9; Fri,  6 Dec 2019 16:21:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79ED920316E0
	for <dm-devel@redhat.com>; Fri,  6 Dec 2019 16:21:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E6071022E7F
	for <dm-devel@redhat.com>; Fri,  6 Dec 2019 16:21:24 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-297-D-kuY7sVMGScFvuqAoLnhw-1; Fri, 06 Dec 2019 11:21:20 -0500
Received: by mail-qt1-f195.google.com with SMTP id g17so1669809qtp.11;
	Fri, 06 Dec 2019 08:21:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to;
	bh=Ke6/f8Ozljvge55sikuIXgQzZaNMQhAgPwVVVwqgnCc=;
	b=aMMj0i90emiMbpGoyyKkatXn31oSYCf0tcl+R0QvwDLwz/xXfXxLWGesa18LdqLe39
	bP+aZ2dFrS/QZe+KnqRrFV1nLcsjDnw2qu+Tbu3nH6Ac+CvY/hkTNn8sqz75t/zcNPgl
	F4ubTfHOyJdm0msjxEf3woq2COqj388oBNyl/wCAYOKLs/nFljDDyL+7IXP4rgTMiPVb
	NaVfaa3JrjEMYtGWot0n0kYkcjb340w6QWL1iUR8Fsf97i36QBIMJfg5SixtiUltfySb
	rCN99yM4UEtxXdYZWujI0b7l/ufT76JOeBdfU4LwfuzCG6UVzSn7TYIMLfXgAnRJ43Eb
	uBdQ==
X-Gm-Message-State: APjAAAWb6IKU1YixaMgfeCodH9/qh42PPtXws97/bBgSbmL/XeWsgp4Z
	t6XrAfNLevnblIUjAe+uajkE6tdz
X-Google-Smtp-Source: APXvYqzfoKzwC/ptpHXc7e4ovMqrYWi0VV0zh1uhlrlyUWWMHiFuLzMJwcKbL7edhU1yOgYRDunalg==
X-Received: by 2002:aed:204d:: with SMTP id 71mr13514068qta.116.1575649280119; 
	Fri, 06 Dec 2019 08:21:20 -0800 (PST)
Received: from localhost (nat-pool-bos-t.redhat.com. [66.187.233.206])
	by smtp.gmail.com with ESMTPSA id j1sm4759901qkl.86.2019.12.06.08.21.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Dec 2019 08:21:19 -0800 (PST)
Date: Fri, 6 Dec 2019 11:21:17 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <20191206162117.GB3090@lobo>
References: <20191204140654.26214-1-ntsironis@arrikto.com>
	<20191204140654.26214-4-ntsironis@arrikto.com>
	<20191205194651.GC95063@lobo> <20191205200747.GA6447@redhat.com>
	<7f5b0f44-2d16-db40-6d16-08929d5bebfe@arrikto.com>
	<20191205220915.GA7024@redhat.com>
	<09f5d4a1-1405-5304-105c-6140cdffa46b@arrikto.com>
MIME-Version: 1.0
In-Reply-To: <09f5d4a1-1405-5304-105c-6140cdffa46b@arrikto.com>
X-MC-Unique: D-kuY7sVMGScFvuqAoLnhw-1
X-MC-Unique: ypEJvOMoNhGWNScUDyL-QA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB6GLQLW024481
X-loop: dm-devel@redhat.com
Cc: vkoukis@arrikto.com, dm-devel@redhat.com, agk@redhat.com,
	iliastsi@arrikto.com
Subject: Re: [dm-devel] [PATCH 3/3] dm clone: Flush destination device
 before committing metadata
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Dec 05 2019 at  5:42P -0500,
Nikos Tsironis <ntsironis@arrikto.com> wrote:

> On 12/6/19 12:09 AM, Mike Snitzer wrote:
> > On Thu, Dec 05 2019 at  4:49pm -0500,
> > Nikos Tsironis <ntsironis@arrikto.com> wrote:
> > 
> > > For dm-thin, indeed, there is not much to gain by not using
> > > blkdev_issue_flush(), since we still allocate a new bio, indirectly, in
> > > the stack.
> > 
> > But thinp obviously could if there is actual benefit to avoiding this
> > flush bio allocation, via blkdev_issue_flush, every commit.
> > 
> 
> Yes, we could do the flush in thinp exactly the same way we do it in
> dm-clone. Add a struct bio field in struct pool_c and use that in the
> callback.
> 
> It would work since the callback is called holding a write lock on
> pmd->root_lock, so it's executed only by a single thread at a time.
> 
> I didn't go for it in my implementation, because I didn't like having to
> make that assumption in the callback, i.e., that it's executed under a
> lock and so it's safe to have the bio in struct pool_c.
> 
> In hindsight, maybe this was a bad call, since it's technically feasible
> to do it this way and we could just add a comment stating that the
> callback is executed atomically.
> 
> If you want I can send a new follow-on patch tomorrow implementing the
> flush in thinp the same way it's implemented in dm-clone.

I took care of it, here is the incremental:

diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
index 73d191ddbb9f..57626c27a54b 100644
--- a/drivers/md/dm-thin.c
+++ b/drivers/md/dm-thin.c
@@ -328,6 +328,7 @@ struct pool_c {
 	dm_block_t low_water_blocks;
 	struct pool_features requested_pf; /* Features requested during table load */
 	struct pool_features adjusted_pf;  /* Features used after adjusting for constituent devices */
+	struct bio flush_bio;
 };
 
 /*
@@ -3123,6 +3124,7 @@ static void pool_dtr(struct dm_target *ti)
 	__pool_dec(pt->pool);
 	dm_put_device(ti, pt->metadata_dev);
 	dm_put_device(ti, pt->data_dev);
+	bio_uninit(&pt->flush_bio);
 	kfree(pt);
 
 	mutex_unlock(&dm_thin_pool_table.mutex);
@@ -3202,8 +3204,13 @@ static void metadata_low_callback(void *context)
 static int metadata_pre_commit_callback(void *context)
 {
 	struct pool_c *pt = context;
+	struct bio *flush_bio = &pt->flush_bio;
 
-	return blkdev_issue_flush(pt->data_dev->bdev, GFP_NOIO, NULL);
+	bio_reset(flush_bio);
+	bio_set_dev(flush_bio, pt->data_dev->bdev);
+	flush_bio->bi_opf = REQ_OP_WRITE | REQ_PREFLUSH;
+
+	return submit_bio_wait(flush_bio);
 }
 
 static sector_t get_dev_size(struct block_device *bdev)
@@ -3374,6 +3381,7 @@ static int pool_ctr(struct dm_target *ti, unsigned argc, char **argv)
 	pt->data_dev = data_dev;
 	pt->low_water_blocks = low_water_blocks;
 	pt->adjusted_pf = pt->requested_pf = pf;
+	bio_init(&pt->flush_bio, NULL, 0);
 	ti->num_flush_bios = 1;
 
 	/*


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

