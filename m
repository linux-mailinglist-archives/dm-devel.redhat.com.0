Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB907B973A
	for <lists+dm-devel@lfdr.de>; Thu,  5 Oct 2023 00:15:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696457732;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uR4yJfTJj1T6tmdPrgyk1eq0SIJPNGOGFlC0MeX9S3o=;
	b=YOuzJuB6biFnY/s+8SZr1qvYnrATqbVEVKA89zvNTeEppHBBnbNDW2jD4xlkqVpYOacLvz
	Q/6auRVpxk4DJM++HZbKOxuByCJ3di9s/oUDrGAVJDpEKCNcsDjFioFr6k4SCqc6cMj+l7
	C/s6K3zKwg+fe4egqPq3Pb/EmNqk0z8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-y9gtz0UrP8uuGHjaX9zDrw-1; Wed, 04 Oct 2023 18:15:28 -0400
X-MC-Unique: y9gtz0UrP8uuGHjaX9zDrw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B675538012E6;
	Wed,  4 Oct 2023 22:15:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 461C240C6EA8;
	Wed,  4 Oct 2023 22:15:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A6D3519466FF;
	Wed,  4 Oct 2023 22:15:15 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 711E719465A2
 for <dm-devel@listman.corp.redhat.com>; Wed,  4 Oct 2023 22:15:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 636582026D17; Wed,  4 Oct 2023 22:15:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BB132026D76
 for <dm-devel@redhat.com>; Wed,  4 Oct 2023 22:15:13 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-inbound-delivery-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B1FF3C1477B
 for <dm-devel@redhat.com>; Wed,  4 Oct 2023 22:15:13 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
 relay.mimecast.com with ESMTP id us-mta-68-W6pebIhLMQC6oK_iXcRang-1; Wed,
 04 Oct 2023 18:15:10 -0400
X-MC-Unique: W6pebIhLMQC6oK_iXcRang-1
Received: by linux.microsoft.com (Postfix, from userid 1052)
 id C517A20B74D6; Wed,  4 Oct 2023 15:09:50 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C517A20B74D6
From: Fan Wu <wufan@linux.microsoft.com>
To: corbet@lwn.net, zohar@linux.ibm.com, jmorris@namei.org, serge@hallyn.com,
 tytso@mit.edu, ebiggers@kernel.org, axboe@kernel.dk, agk@redhat.com,
 snitzer@kernel.org, eparis@redhat.com, paul@paul-moore.com
Date: Wed,  4 Oct 2023 15:09:38 -0700
Message-Id: <1696457386-3010-12-git-send-email-wufan@linux.microsoft.com>
In-Reply-To: <1696457386-3010-1-git-send-email-wufan@linux.microsoft.com>
References: <1696457386-3010-1-git-send-email-wufan@linux.microsoft.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [dm-devel] [RFC PATCH v11 11/19] dm verity: set DM_TARGET_SINGLETON
 feature flag
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
Cc: dm-devel@redhat.com, linux-doc@vger.kernel.org, roberto.sassu@huawei.com,
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, audit@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, Fan Wu <wufan@linux.microsoft.com>,
 linux-integrity@vger.kernel.org
MIME-Version: 1.0
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.microsoft.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The device-mapper has a flag to mark targets as singleton, which is a
required flag for immutable targets. Without this flag, multiple
dm-verity targets can be added to a mapped device, which has no
practical use cases and will let dm_table_get_immutable_target return
NULL. This patch adds the missing flag, restricting only one
dm-verity target per mapped device.

Signed-off-by: Fan Wu <wufan@linux.microsoft.com>

---
v1-v10:
  + Not present
---
 drivers/md/dm-verity-target.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-verity-target.c b/drivers/md/dm-verity-target.c
index 26adcfea0302..80673b66c194 100644
--- a/drivers/md/dm-verity-target.c
+++ b/drivers/md/dm-verity-target.c
@@ -1503,7 +1503,7 @@ int dm_verity_get_root_digest(struct dm_target *ti, u8 **root_digest, unsigned i
 
 static struct target_type verity_target = {
 	.name		= "verity",
-	.features	= DM_TARGET_IMMUTABLE,
+	.features	= DM_TARGET_SINGLETON | DM_TARGET_IMMUTABLE,
 	.version	= {1, 9, 0},
 	.module		= THIS_MODULE,
 	.ctr		= verity_ctr,
-- 
2.25.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

