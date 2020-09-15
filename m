Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5D31A26AA7A
	for <lists+dm-devel@lfdr.de>; Tue, 15 Sep 2020 19:24:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600190677;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=duI19bXWan5faDotoSSaivCd1uc8yXYmSld4bIwY2yQ=;
	b=HjnuqyjrTuWSjwKA8JUvz0itrGMMBp5M944uu/004xrA0QBA8hbrzrWJUTV0uWyh+VNF85
	ME96IhbolZHg620pKNw4iME5fvkNdn+dw4+fPYneaqZ24+5Q3vXOSGxcjAoMuFt+f+aNSE
	+AQo7sEUepyIpaFyP6uFHYjulhViX6Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-hgByiibrO_20XlZUlo-fOg-1; Tue, 15 Sep 2020 13:24:34 -0400
X-MC-Unique: hgByiibrO_20XlZUlo-fOg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CE2810219E4;
	Tue, 15 Sep 2020 17:24:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 628611992D;
	Tue, 15 Sep 2020 17:24:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1D77F183D021;
	Tue, 15 Sep 2020 17:24:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08FHOBSE003171 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 13:24:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9E3CC2166B44; Tue, 15 Sep 2020 17:24:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 996D02166B28
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 17:24:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5328718AE947
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 17:24:09 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-178-4sw-Ih6cOZOdWSxUmQeojA-1; Tue, 15 Sep 2020 13:24:05 -0400
X-MC-Unique: 4sw-Ih6cOZOdWSxUmQeojA-1
Received: by mail-qk1-f195.google.com with SMTP id 16so5059448qkf.4;
	Tue, 15 Sep 2020 10:24:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=7cplhJ+CMOio2eKSlQ3A9qenyuRaLVK7gDFC2tp/7iE=;
	b=eXeTau/IFU65YS77Z5gwQR9rgosuspOhCaFMTxo2UkwxlJwTY2x8TTx76J8bdvJM+i
	DqXbqrRUAofvmATaL8lN5PQ45/OofX+9giEnDgud0VhGI3uGbgbAAtVsdI+P62GFrrM9
	aCdQK4Byy0Jvj6xaSK3IwHenmh/GuoywhCKJVjHr+SZKsd3/qvI8cXw57gytuMf0e9bw
	xqs9VX+04MDK5cPeknv8Q8HYaAP8kP+ibE2wSSUFbfXta5H/bQgTJPIBYOMc2tJfn/mT
	iU0N6beJxt2vKQ5p6IIJQVDIwe13CNMFHKLyWtQ+onimbGRriRqOEfU3xxtXs6DoGOVf
	VaoA==
X-Gm-Message-State: AOAM531Cc4KWytIVt8Yl5nVvmRIsquZx6tJZRnOJmsEJAwQvZHN+C1xn
	oaEmCEn2n0sx4faPpzKyTp/Q8vR6gYI=
X-Google-Smtp-Source: ABdhPJy0pc0fArTWbJ7e53JSflriiZAjMa8KQwK/gnTN75ljPFBUSMbdOP8I6gyV5ZGZiH5h588Kgg==
X-Received: by 2002:a37:2f42:: with SMTP id v63mr17521380qkh.261.1600190644615;
	Tue, 15 Sep 2020 10:24:04 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52]) by smtp.gmail.com with ESMTPSA id
	t1sm17823515qtj.12.2020.09.15.10.24.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 15 Sep 2020 10:24:03 -0700 (PDT)
From: Mike Snitzer <snitzer@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 15 Sep 2020 13:23:57 -0400
Message-Id: <20200915172357.83215-5-snitzer@redhat.com>
In-Reply-To: <20200915172357.83215-1-snitzer@redhat.com>
References: <20200915172357.83215-1-snitzer@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Vijayendra Suman <vijayendra.suman@oracle.com>,
	Ming Lei <ming.lei@redhat.com>
Subject: [dm-devel] [PATCH v2 4/4] dm: unconditionally call
	blk_queue_split() in dm_process_bio()
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

blk_queue_split() has become compulsory from .submit_bio -- regardless
of whether it is recursing.  Update DM core to always call
blk_queue_split().

dm_queue_split() is removed because __split_and_process_bio() handles
splitting as needed.

Signed-off-by: Mike Snitzer <snitzer@redhat.com>
---
 drivers/md/dm.c | 45 +--------------------------------------------
 1 file changed, 1 insertion(+), 44 deletions(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index fb0255d25e4b..0bae9f26dc8e 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1530,22 +1530,6 @@ static int __send_write_zeroes(struct clone_info *ci, struct dm_target *ti)
 	return __send_changing_extent_only(ci, ti, get_num_write_zeroes_bios(ti));
 }
 
-static bool is_abnormal_io(struct bio *bio)
-{
-	bool r = false;
-
-	switch (bio_op(bio)) {
-	case REQ_OP_DISCARD:
-	case REQ_OP_SECURE_ERASE:
-	case REQ_OP_WRITE_SAME:
-	case REQ_OP_WRITE_ZEROES:
-		r = true;
-		break;
-	}
-
-	return r;
-}
-
 static bool __process_abnormal_io(struct clone_info *ci, struct dm_target *ti,
 				  int *result)
 {
@@ -1723,23 +1707,6 @@ static blk_qc_t __process_bio(struct mapped_device *md, struct dm_table *map,
 	return ret;
 }
 
-static void dm_queue_split(struct mapped_device *md, struct dm_target *ti, struct bio **bio)
-{
-	unsigned len, sector_count;
-
-	sector_count = bio_sectors(*bio);
-	len = min_t(sector_t, max_io_len((*bio)->bi_iter.bi_sector, ti), sector_count);
-
-	if (sector_count > len) {
-		struct bio *split = bio_split(*bio, len, GFP_NOIO, &md->queue->bio_split);
-
-		bio_chain(split, *bio);
-		trace_block_split(md->queue, split, (*bio)->bi_iter.bi_sector);
-		submit_bio_noacct(*bio);
-		*bio = split;
-	}
-}
-
 static blk_qc_t dm_process_bio(struct mapped_device *md,
 			       struct dm_table *map, struct bio *bio)
 {
@@ -1759,17 +1726,7 @@ static blk_qc_t dm_process_bio(struct mapped_device *md,
 		}
 	}
 
-	/*
-	 * If in ->queue_bio we need to use blk_queue_split(), otherwise
-	 * queue_limits for abnormal requests (e.g. discard, writesame, etc)
-	 * won't be imposed.
-	 */
-	if (current->bio_list) {
-		if (is_abnormal_io(bio))
-			blk_queue_split(&bio);
-		else
-			dm_queue_split(md, ti, &bio);
-	}
+	blk_queue_split(&bio);
 
 	if (dm_get_md_type(md) == DM_TYPE_NVME_BIO_BASED)
 		return __process_bio(md, map, bio, ti);
-- 
2.15.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

