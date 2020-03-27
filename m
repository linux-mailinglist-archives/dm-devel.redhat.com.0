Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id D631D195880
	for <lists+dm-devel@lfdr.de>; Fri, 27 Mar 2020 15:05:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585317922;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PQc5bT2cIjGgR6ToXARNn1tu6cVxejUHmPdS4MHM/gA=;
	b=faEyb3lEkdrnx/ke3ZiPgT/4wmcCkhK0wZGz/+C1K9+K7Ntk4yCTfREXTTSP24jlKGap8u
	zDMF75JsEbJtLeWNv10WYIkPUPLf7OdzIzW++28jQ20sXOfzcw29FYpRBOlaI9wLJAklvY
	sn7caB6QfpHsVzT/ATBNTAY0QN2wKtg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-KctgKaA8PDOutRQuFqZ5lw-1; Fri, 27 Mar 2020 10:05:19 -0400
X-MC-Unique: KctgKaA8PDOutRQuFqZ5lw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84480107ACCC;
	Fri, 27 Mar 2020 14:05:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C02310027AC;
	Fri, 27 Mar 2020 14:05:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 319AF1809567;
	Fri, 27 Mar 2020 14:05:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02RE2l24007373 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 27 Mar 2020 10:02:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 27A1D2166B2C; Fri, 27 Mar 2020 14:02:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23E572166B2B
	for <dm-devel@redhat.com>; Fri, 27 Mar 2020 14:02:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A1438F7853
	for <dm-devel@redhat.com>; Fri, 27 Mar 2020 14:02:47 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-487-c3sclVv9OyOh1q00ynCKFQ-1; Fri, 27 Mar 2020 10:02:44 -0400
X-MC-Unique: c3sclVv9OyOh1q00ynCKFQ-1
Received: by mail-pl1-f195.google.com with SMTP id s23so3464906plq.13
	for <dm-devel@redhat.com>; Fri, 27 Mar 2020 07:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xaosDm8ppIhl5+5QzS9SaIbdpa9cbjV5hMnDkIcgqb8=;
	b=lL8MxqZD2Tg18bGWCoTSE/vVfb5kEewt73+T9eSKsEuvDesWgPJv8JlU48NsmUj6ex
	Jur3cuJ2rsm+LJQPTVndDBbU4zJ8AUEoBSuNHb9tIhXCv8VkcTugL94IPD7OeNK3xFPR
	ZMQeI/XYVdDXzndcgRP/AFV7kkZdmaRXHMstD9d0/f3X0DKR58nxYDYewv5gHP0ttClv
	h/RypkMB0IwvfUd3CPnGiIM9dyp8kl0EhgnlUd1lEU391JNS0qzZm+Z/hvArmgbqBzUP
	wABXPUxn/92+iQeAG0LwHUF1BXItFaSlywRNEqu0lONcovTk63NBxddVw+EHmQIE0Teg
	lktg==
X-Gm-Message-State: ANhLgQ1V43/cByjWYadu2Oh/CtSrvfJ9l98B/gefl/ajnTf8xV/MCxfl
	qPmkPnl2qss4iPW3NCsx8yDDIw==
X-Google-Smtp-Source: ADFU+vvncOxNZ3U78mkhELkPUjrsFXEUD+KEx5k1rEla9DkyATWij4TrQ7z2ysDBCGwhtP/X/5l15Q==
X-Received: by 2002:a17:902:6945:: with SMTP id
	k5mr13279901plt.61.1585317763507; 
	Fri, 27 Mar 2020 07:02:43 -0700 (PDT)
Received: from snf-864.vm.snf.arr ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id l5sm3963399pgt.10.2020.03.27.07.02.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Mar 2020 07:02:41 -0700 (PDT)
From: Nikos Tsironis <ntsironis@arrikto.com>
To: agk@redhat.com, snitzer@redhat.com, dm-devel@redhat.com
Date: Fri, 27 Mar 2020 16:01:10 +0200
Message-Id: <20200327140111.7798-4-ntsironis@arrikto.com>
In-Reply-To: <20200327140111.7798-1-ntsironis@arrikto.com>
References: <20200327140111.7798-1-ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02RE2l24007373
X-loop: dm-devel@redhat.com
Cc: ntsironis@arrikto.com
Subject: [dm-devel] [PATCH 3/4] dm clone: Add missing casts to prevent
	overflows and data corruption
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add missing casts when converting from regions to sectors.

In case BITS_PER_LONG == 32, the lack of the appropriate casts can lead
to overflows and miscalculation of the device sector.

As a result, we could end up discarding and/or copying the wrong parts
of the device, thus corrupting the device's data.

Fixes: 7431b7835f55 ("dm: add clone target")
Cc: stable@vger.kernel.org # v5.4+
Signed-off-by: Nikos Tsironis <ntsironis@arrikto.com>
---
 drivers/md/dm-clone-target.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/md/dm-clone-target.c b/drivers/md/dm-clone-target.c
index 6ee85fb3388a..ca5020c58f7c 100644
--- a/drivers/md/dm-clone-target.c
+++ b/drivers/md/dm-clone-target.c
@@ -282,7 +282,7 @@ static bool bio_triggers_commit(struct clone *clone, struct bio *bio)
 /* Get the address of the region in sectors */
 static inline sector_t region_to_sector(struct clone *clone, unsigned long region_nr)
 {
-	return (region_nr << clone->region_shift);
+	return ((sector_t)region_nr << clone->region_shift);
 }
 
 /* Get the region number of the bio */
@@ -471,7 +471,7 @@ static void complete_discard_bio(struct clone *clone, struct bio *bio, bool succ
 	if (test_bit(DM_CLONE_DISCARD_PASSDOWN, &clone->flags) && success) {
 		remap_to_dest(clone, bio);
 		bio_region_range(clone, bio, &rs, &nr_regions);
-		trim_bio(bio, rs << clone->region_shift,
+		trim_bio(bio, region_to_sector(clone, rs),
 			 nr_regions << clone->region_shift);
 		generic_make_request(bio);
 	} else
@@ -804,11 +804,14 @@ static void hydration_copy(struct dm_clone_region_hydration *hd, unsigned int nr
 	struct dm_io_region from, to;
 	struct clone *clone = hd->clone;
 
+	if (WARN_ON(!nr_regions))
+		return;
+
 	region_size = clone->region_size;
 	region_start = hd->region_nr;
 	region_end = region_start + nr_regions - 1;
 
-	total_size = (nr_regions - 1) << clone->region_shift;
+	total_size = region_to_sector(clone, nr_regions - 1);
 
 	if (region_end == clone->nr_regions - 1) {
 		/*
-- 
2.11.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

