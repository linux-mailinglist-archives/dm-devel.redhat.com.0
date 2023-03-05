Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ED10E6AAE0C
	for <lists+dm-devel@lfdr.de>; Sun,  5 Mar 2023 04:37:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677987464;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1XNLmPNFaf3jY5+7sOC7M46fnavZx3v2VKI+IDK0pFg=;
	b=X88whHLYgqJrEv3haVAtzfDsPTNDRUdKlbcZcl98GXvN2CWv5k+g8K0DmnWpgEe/FykCNK
	TaY7QSqu0x4q4TpEG/DXpuQDdG1a/n2hEC+thDyzqdJGnaTU27alpEwioFuhrI20zMaupS
	nKouTN8pxN/V1421DE4kY0EukCyrR84=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-1MfNAUGYPTC6wPXjume4pA-1; Sat, 04 Mar 2023 22:37:43 -0500
X-MC-Unique: 1MfNAUGYPTC6wPXjume4pA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C8B03C0256C;
	Sun,  5 Mar 2023 03:37:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 89F1C408573E;
	Sun,  5 Mar 2023 03:37:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5AC7519452D2;
	Sun,  5 Mar 2023 03:37:38 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CDBDC1946586
 for <dm-devel@listman.corp.redhat.com>; Sun,  5 Mar 2023 03:37:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7BFEBC159BB; Sun,  5 Mar 2023 03:37:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 74271C16029
 for <dm-devel@redhat.com>; Sun,  5 Mar 2023 03:37:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41D7029AA3B8
 for <dm-devel@redhat.com>; Sun,  5 Mar 2023 03:37:36 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-VUBJM5izMCyiY24Aj7Th3A-1; Sat, 04 Mar 2023 22:37:34 -0500
X-MC-Unique: VUBJM5izMCyiY24Aj7Th3A-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5896FB80A08;
 Sun,  5 Mar 2023 03:37:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82B73C433D2;
 Sun,  5 Mar 2023 03:37:31 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: stable-commits@vger.kernel.org,
	snitzer@kernel.org
Date: Sat,  4 Mar 2023 22:37:29 -0500
Message-Id: <20230305033729.1766758-1-sashal@kernel.org>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [dm-devel] Patch "dm: remove flush_scheduled_work() during
 local_exit()" has been added to the 5.10-stable tree
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is a note to let you know that I've just added the patch titled

    dm: remove flush_scheduled_work() during local_exit()

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     dm-remove-flush_scheduled_work-during-local_exit.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.



commit 1db59f1bff5387206580fd6f9c1d4aa61ab15db2
Author: Mike Snitzer <snitzer@kernel.org>
Date:   Tue Feb 14 13:06:05 2023 -0500

    dm: remove flush_scheduled_work() during local_exit()
    
    [ Upstream commit 0b22ff5360f5c4e11050b89206370fdf7dc0a226 ]
    
    Commit acfe0ad74d2e1 ("dm: allocate a special workqueue for deferred
    device removal") switched from using system workqueue to a single
    workqueue local to DM.  But it didn't eliminate the call to
    flush_scheduled_work() that was introduced purely for the benefit of
    deferred device removal with commit 2c140a246dc ("dm: allow remove to
    be deferred").
    
    Since DM core uses its own workqueue (and queue_work) there is no need
    to call flush_scheduled_work() from local_exit().  local_exit()'s
    destroy_workqueue(deferred_remove_workqueue) handles flushing work
    started with queue_work().
    
    Fixes: acfe0ad74d2e1 ("dm: allocate a special workqueue for deferred device removal")
    Signed-off-by: Mike Snitzer <snitzer@kernel.org>
    Signed-off-by: Sasha Levin <sashal@kernel.org>

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 1005abf768609..7163ecc4d53fa 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -265,7 +265,6 @@ static int __init local_init(void)
 
 static void local_exit(void)
 {
-	flush_scheduled_work();
 	destroy_workqueue(deferred_remove_workqueue);
 
 	unregister_blkdev(_major, _name);

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

