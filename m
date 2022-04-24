Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DAC50D520
	for <lists+dm-devel@lfdr.de>; Sun, 24 Apr 2022 22:43:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650832997;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/AM3XZ9zzeG+qMa/pFSxRRDd5D4u3JIzX+K6xUrwglM=;
	b=azH28bOEI1+aJcyb+kT8KuXxWwX/5+KSbPIUKNsH4vWVoJf/Q00C+nEyUj3YTSf2GLVsKR
	1EWbz3pBhjvwqOQf2n3xb79H0tY6bjFwVRbCDhV/eGPG+y17EwP5NZvHiqSkzjhC2Lk9iO
	Kx7kqYfZ8F6iQW/R66Axj9ugKw6C4lU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-62L9gnrENLCUc5IkxvFjYQ-1; Sun, 24 Apr 2022 16:43:15 -0400
X-MC-Unique: 62L9gnrENLCUc5IkxvFjYQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70E583C02182;
	Sun, 24 Apr 2022 20:43:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 48624C28103;
	Sun, 24 Apr 2022 20:43:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DC5F41940356;
	Sun, 24 Apr 2022 20:43:02 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 129211947BBB
 for <dm-devel@listman.corp.redhat.com>; Sun, 24 Apr 2022 20:43:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D8AD140CF8EC; Sun, 24 Apr 2022 20:43:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C810440CF8EB;
 Sun, 24 Apr 2022 20:43:00 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 23OKh0r4017285; Sun, 24 Apr 2022 16:43:00 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 23OKh0QG017281; Sun, 24 Apr 2022 16:43:00 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Sun, 24 Apr 2022 16:43:00 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>
Message-ID: <alpine.LRH.2.02.2204241642080.17244@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: [dm-devel] [PATCH] dm-stats: add cond_resched when looping over
 entries
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

dm-stats can be used with very large number of entries (it is only limited
by 1/4 of total system memory), so we should add rescheduling points to
the loops that iterate over the entries.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org

---
 drivers/md/dm-stats.c |    8 ++++++++
 1 file changed, 8 insertions(+)

Index: linux-2.6/drivers/md/dm-stats.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-stats.c	2022-04-24 18:51:25.000000000 +0200
+++ linux-2.6/drivers/md/dm-stats.c	2022-04-24 18:51:25.000000000 +0200
@@ -225,6 +225,7 @@ void dm_stats_cleanup(struct dm_stats *s
 				       atomic_read(&shared->in_flight[READ]),
 				       atomic_read(&shared->in_flight[WRITE]));
 			}
+			cond_resched();
 		}
 		dm_stat_free(&s->rcu_head);
 	}
@@ -330,6 +331,7 @@ static int dm_stats_create(struct dm_sta
 	for (ni = 0; ni < n_entries; ni++) {
 		atomic_set(&s->stat_shared[ni].in_flight[READ], 0);
 		atomic_set(&s->stat_shared[ni].in_flight[WRITE], 0);
+		cond_resched();
 	}
 
 	if (s->n_histogram_entries) {
@@ -342,6 +344,7 @@ static int dm_stats_create(struct dm_sta
 		for (ni = 0; ni < n_entries; ni++) {
 			s->stat_shared[ni].tmp.histogram = hi;
 			hi += s->n_histogram_entries + 1;
+			cond_resched();
 		}
 	}
 
@@ -362,6 +365,7 @@ static int dm_stats_create(struct dm_sta
 			for (ni = 0; ni < n_entries; ni++) {
 				p[ni].histogram = hi;
 				hi += s->n_histogram_entries + 1;
+				cond_resched();
 			}
 		}
 	}
@@ -497,6 +501,7 @@ static int dm_stats_list(struct dm_stats
 			}
 			DMEMIT("\n");
 		}
+		cond_resched();
 	}
 	mutex_unlock(&stats->mutex);
 
@@ -774,6 +779,7 @@ static void __dm_stat_clear(struct dm_st
 				local_irq_enable();
 			}
 		}
+		cond_resched();
 	}
 }
 
@@ -889,6 +895,8 @@ static int dm_stats_print(struct dm_stat
 
 		if (unlikely(sz + 1 >= maxlen))
 			goto buffer_overflow;
+
+		cond_resched();
 	}
 
 	if (clear)
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

