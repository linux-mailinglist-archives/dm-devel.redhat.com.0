Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 9F061173212
	for <lists+dm-devel@lfdr.de>; Fri, 28 Feb 2020 08:50:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582876225;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/02D3ygihEru/7alDmvXSCXDVCwe7NJk0Pvk00Xdt6M=;
	b=POdgJxMOVxHeluJAu6Pbh9ft3ExmYKOmbBUqP5bo0f9t3Xv3dsav5GF9G6RkH7DZNlniKe
	yyiGClW7CV/CPTaqT3BuwyOiJ0nRv9+IvCifF4Er+fTIHN9cYPlf9ME0ZRzkQU/YDbW5P+
	Qdgdrso3TR4dMRlsSHzco2IeL64ZpXM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-qA33BXfTMNStLLrC-nCGKQ-1; Fri, 28 Feb 2020 02:50:22 -0500
X-MC-Unique: qA33BXfTMNStLLrC-nCGKQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33F13107ACCA;
	Fri, 28 Feb 2020 07:50:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB1425C54A;
	Fri, 28 Feb 2020 07:50:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 45D1684489;
	Fri, 28 Feb 2020 07:50:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01S3cpam022216 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 27 Feb 2020 22:38:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5070C2026D69; Fri, 28 Feb 2020 03:38:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B47B202A940
	for <dm-devel@redhat.com>; Fri, 28 Feb 2020 03:38:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C1E185A31C
	for <dm-devel@redhat.com>; Fri, 28 Feb 2020 03:38:49 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-407-M1K-GuwnOgO7u03VSDr7Fw-1; Thu, 27 Feb 2020 22:38:44 -0500
X-MC-Unique: M1K-GuwnOgO7u03VSDr7Fw-1
Received: by mail-pl1-f196.google.com with SMTP id t14so668818plr.8;
	Thu, 27 Feb 2020 19:38:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0pbOxkoHUFOJzr3yeqDL8UUwF183CQiLAYRZHxlDHFE=;
	b=nCxijZsDkb42U6Fvv+SJKNx0DhaltF78MuztVFLSPo1v5wzvAOKyzuSF6PZZgPLZtj
	U3vSK63jHUcT18DG6+VR+xRAIzxfu/YbOCGxoqsSo5Yb5rj1eZPcpyczNeQP6pfK4JRP
	iC9Agewo5gXA/Ic1BwIFRgBAuzTon3nZ0cWB7NfdjZhuCixRVLUdCtwDjaI6ttgztBua
	OOX/TzKe3LGMFJLnrF1Kmagv9dEuuBTkDNZWkJO53r0J3OMQz5oL4bUeJ7lwZGDfqvPF
	b1rvhcfdZGLNyk2zSg6DhPVumFJSYhltdIOc2ySBZN5EWxhOiRSP/uixwtkemXkKjysf
	ZC0w==
X-Gm-Message-State: APjAAAV9fthJGqz6e7ptG0RIvnyLJLQ9kWyynvFJEwk2+piMm7mLMxQj
	yFTRyHA3aoSYwBiF90Hd1fN73RzlHu0=
X-Google-Smtp-Source: APXvYqyUPzmnjGXhMDsHbN20GTATdlqFeqPrlWAyQBxnndlepV0DgCT1ecjYEB2omJ8qgs2rgNHXqw==
X-Received: by 2002:a17:902:8f91:: with SMTP id
	z17mr2066090plo.234.1582861122924; 
	Thu, 27 Feb 2020 19:38:42 -0800 (PST)
Received: from localhost ([43.224.245.179])
	by smtp.gmail.com with ESMTPSA id l1sm136964pjb.28.2020.02.27.19.38.41
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Thu, 27 Feb 2020 19:38:42 -0800 (PST)
From: qiwuchen55@gmail.com
To: agk@redhat.com, snitzer@redhat.com
Date: Fri, 28 Feb 2020 11:38:29 +0800
Message-Id: <1582861109-17266-1-git-send-email-qiwuchen55@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01S3cpam022216
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 28 Feb 2020 02:49:50 -0500
Cc: dm-devel@redhat.com, chenqiwu <chenqiwu@xiaomi.com>
Subject: [dm-devel] [PATCH] md/dm-stats.c: use list_for_each_entry*() APIs
	to simplify code
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
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: chenqiwu <chenqiwu@xiaomi.com>

Use list_for_each_entry*() APIs instead of open-coding to
simplify code.

Signed-off-by: chenqiwu <chenqiwu@xiaomi.com>
---
 drivers/md/dm-stats.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/md/dm-stats.c b/drivers/md/dm-stats.c
index 7141704..34637d1 100644
--- a/drivers/md/dm-stats.c
+++ b/drivers/md/dm-stats.c
@@ -206,11 +206,10 @@ void dm_stats_init(struct dm_stats *stats)
 void dm_stats_cleanup(struct dm_stats *stats)
 {
 	size_t ni;
-	struct dm_stat *s;
+	struct dm_stat *s, *tmp;
 	struct dm_stat_shared *shared;
 
-	while (!list_empty(&stats->list)) {
-		s = container_of(stats->list.next, struct dm_stat, list_entry);
+	list_for_each_entry_safe(s, tmp, &stats->list, list_entry) {
 		list_del(&s->list_entry);
 		for (ni = 0; ni < s->n_entries; ni++) {
 			shared = &s->stat_shared[ni];
@@ -240,7 +239,6 @@ static int dm_stats_create(struct dm_stats *stats, sector_t start, sector_t end,
 			   void (*resume_callback)(struct mapped_device *),
 			   struct mapped_device *md)
 {
-	struct list_head *l;
 	struct dm_stat *s, *tmp_s;
 	sector_t n_entries;
 	size_t ni;
@@ -360,8 +358,7 @@ static int dm_stats_create(struct dm_stats *stats, sector_t start, sector_t end,
 
 	mutex_lock(&stats->mutex);
 	s->id = 0;
-	list_for_each(l, &stats->list) {
-		tmp_s = container_of(l, struct dm_stat, list_entry);
+	list_for_each_entry(tmp_s, &stats->list, list_entry) {
 		if (WARN_ON(tmp_s->id < s->id)) {
 			r = -EINVAL;
 			goto out_unlock_resume;
@@ -375,7 +372,7 @@ static int dm_stats_create(struct dm_stats *stats, sector_t start, sector_t end,
 		s->id++;
 	}
 	ret_id = s->id;
-	list_add_tail_rcu(&s->list_entry, l);
+	list_add_tail_rcu(&s->list_entry, &stats->list);
 	mutex_unlock(&stats->mutex);
 
 	resume_callback(md);
-- 
1.9.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

