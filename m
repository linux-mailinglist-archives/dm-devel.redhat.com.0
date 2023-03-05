Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACAF6AAE1D
	for <lists+dm-devel@lfdr.de>; Sun,  5 Mar 2023 05:03:57 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-Gb1aaqpYN8iZstWc4exCAw-1; Sat, 04 Mar 2023 23:03:52 -0500
X-MC-Unique: Gb1aaqpYN8iZstWc4exCAw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30B62811E6E;
	Sun,  5 Mar 2023 04:03:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1FD79401B290;
	Sun,  5 Mar 2023 04:03:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 255CD19452D2;
	Sun,  5 Mar 2023 04:03:48 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 24E0A1946586
 for <dm-devel@listman.corp.redhat.com>; Sun,  5 Mar 2023 04:03:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 13F5F1400B19; Sun,  5 Mar 2023 04:03:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C211140EBF6
 for <dm-devel@redhat.com>; Sun,  5 Mar 2023 04:03:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF5DB101A52E
 for <dm-devel@redhat.com>; Sun,  5 Mar 2023 04:03:46 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-111-ORxrZRczMgC3wfscBVAgAg-1; Sat, 04 Mar 2023 23:03:45 -0500
X-MC-Unique: ORxrZRczMgC3wfscBVAgAg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 50B3660A3B;
 Sun,  5 Mar 2023 04:03:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54C56C433EF;
 Sun,  5 Mar 2023 04:03:43 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: stable-commits@vger.kernel.org,
	snitzer@kernel.org
Date: Sat,  4 Mar 2023 23:03:41 -0500
Message-Id: <20230305040341.1788006-1-sashal@kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [dm-devel] Patch "dm thin: add cond_resched() to various workqueue
 loops" has been added to the 4.14-stable tree
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
Cc: dm-devel@redhat.com, Alasdair Kergon <agk@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is a note to let you know that I've just added the patch titled

    dm thin: add cond_resched() to various workqueue loops

to the 4.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     dm-thin-add-cond_resched-to-various-workqueue-loops.patch
and it can be found in the queue-4.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.



commit b54e930245daf206460880fdb59a4f7f85810a9c
Author: Mike Snitzer <snitzer@kernel.org>
Date:   Thu Feb 16 15:29:44 2023 -0500

    dm thin: add cond_resched() to various workqueue loops
    
    [ Upstream commit e4f80303c2353952e6e980b23914e4214487f2a6 ]
    
    Otherwise on resource constrained systems these workqueues may be too
    greedy.
    
    Signed-off-by: Mike Snitzer <snitzer@kernel.org>
    Signed-off-by: Sasha Levin <sashal@kernel.org>

diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
index 6c7fa790c8ae6..fcf1eaafec72d 100644
--- a/drivers/md/dm-thin.c
+++ b/drivers/md/dm-thin.c
@@ -2233,6 +2233,7 @@ static void process_thin_deferred_bios(struct thin_c *tc)
 			throttle_work_update(&pool->throttle);
 			dm_pool_issue_prefetches(pool->pmd);
 		}
+		cond_resched();
 	}
 	blk_finish_plug(&plug);
 }
@@ -2316,6 +2317,7 @@ static void process_thin_deferred_cells(struct thin_c *tc)
 			else
 				pool->process_cell(tc, cell);
 		}
+		cond_resched();
 	} while (!list_empty(&cells));
 }
 

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

