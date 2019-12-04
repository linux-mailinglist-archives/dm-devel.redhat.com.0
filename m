Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0710E11307D
	for <lists+dm-devel@lfdr.de>; Wed,  4 Dec 2019 18:07:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575479250;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PrBibkZwILvhFh4Kx+Ij0KN4rtkFokEQQVvaa6/W7Gs=;
	b=BxHnO5w/BsVrTY4CKsZ2MHd6W8mHKWtc38mfOqr7cVL+xvWDjNBxJ6vkR4VGIibiQky9K/
	wuzyUB2fMf3K+BgD0vS2ovhH002jPUbpi43tot+OzvQdXued6kBUveXiJXMwt+VO1vCP5h
	flyPUFrV36+tDD1kMZf3Z+P+CYUEREc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-tuRc5l60MXShofEjkA_mZQ-1; Wed, 04 Dec 2019 12:07:27 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 618B0800EB9;
	Wed,  4 Dec 2019 17:07:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FB555C1B2;
	Wed,  4 Dec 2019 17:07:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ACF235BC11;
	Wed,  4 Dec 2019 17:07:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB4H767L017880 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Dec 2019 12:07:06 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EB12F2026D67; Wed,  4 Dec 2019 17:07:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E62642022AC7
	for <dm-devel@redhat.com>; Wed,  4 Dec 2019 17:07:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D696906E38
	for <dm-devel@redhat.com>; Wed,  4 Dec 2019 17:07:03 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-79-mRkV9iYYP76iLKwLUAc2_Q-1; Wed, 04 Dec 2019 12:07:01 -0500
Received: by mail-lj1-f196.google.com with SMTP id 21so185531ljr.0
	for <dm-devel@redhat.com>; Wed, 04 Dec 2019 09:07:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YtvRfca1B9FfncqPc/9Q+cAAti2STDJrcaMPYGh1WOY=;
	b=oaNhxyAh+tJAl4s7IIr18XIXBedpw1kzj2rNuV+2sLSzo4Ugv2VZ6OkaILIdFlfcNk
	UjbW/t4+y7w3LE+g5OA2ZdJKoZ7LOi4+iwU54hzmg2S8D+DG3wEO16aGovd0fF620ebF
	VkASNKF1K1OcVJuiTnL6v3zZHXgoAk8zzvDyqEEpi3VuI9vB4aLQmCMjSwrXw7Hhmcu/
	t4LU6H8z4cYdQv1046e/M2tRkUKbuCD0YzzS0eumA++dXtoFXhV+LfO394251ejVP/zo
	p2bMT7CUWjDssT51D6RPpE8oHZD0+lYEaj+osuTMpqwTjjbaLyJX7fUqCytQsH6qz0AP
	jPvg==
X-Gm-Message-State: APjAAAVl7SjI4uUdmzq1O7SGQ1dth9BAXZl1KoAqKi4so/eikp4KoZcb
	Y09/VowFSyUjBi2kJ9wl4gWH+w==
X-Google-Smtp-Source: APXvYqxbH2w420jibn6UjYw26AYaLlmwCgMMoVu6kt9G5iBUIqy1acK5uvRoq4Fr71+Sq0ZGsqKgXA==
X-Received: by 2002:a2e:9b8f:: with SMTP id z15mr2731983lji.20.1575479220241; 
	Wed, 04 Dec 2019 09:07:00 -0800 (PST)
Received: from snf-864.vm.snf.arr ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	n19sm3570737lfl.85.2019.12.04.09.06.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2019 09:06:59 -0800 (PST)
From: Nikos Tsironis <ntsironis@arrikto.com>
To: snitzer@redhat.com, agk@redhat.com, dm-devel@redhat.com
Date: Wed,  4 Dec 2019 19:06:38 +0200
Message-Id: <20191204170638.28163-1-ntsironis@arrikto.com>
X-MC-Unique: mRkV9iYYP76iLKwLUAc2_Q-1
X-MC-Unique: tuRc5l60MXShofEjkA_mZQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB4H767L017880
X-loop: dm-devel@redhat.com
Cc: thornber@redhat.com, ntsironis@arrikto.com
Subject: [dm-devel] [PATCH] dm thin: Avoid flushing the data device twice
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since we flush the data device as part of a metadata commit, it's
redundant to then submit any deferred REQ_PREFLUSH bios.

Add a check in process_deferred_bios() for deferred REQ_PREFLUSH bios
and complete them immediately.

Signed-off-by: Nikos Tsironis <ntsironis@arrikto.com>
---
 drivers/md/dm-thin.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
index e0be545080d0..40d8a255dbc3 100644
--- a/drivers/md/dm-thin.c
+++ b/drivers/md/dm-thin.c
@@ -2383,8 +2383,18 @@ static void process_deferred_bios(struct pool *pool)
 	while ((bio = bio_list_pop(&bio_completions)))
 		bio_endio(bio);
 
-	while ((bio = bio_list_pop(&bios)))
-		generic_make_request(bio);
+	while ((bio = bio_list_pop(&bios))) {
+		if (bio->bi_opf & REQ_PREFLUSH) {
+			/*
+			 * We just flushed the data device as part of the
+			 * metadata commit, so there is no reason to send
+			 * another flush.
+			 */
+			bio_endio(bio);
+		} else {
+			generic_make_request(bio);
+		}
+	}
 }
 
 static void do_worker(struct work_struct *ws)
-- 
2.11.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

