Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BB465ADC8
	for <lists+dm-devel@lfdr.de>; Mon,  2 Jan 2023 08:44:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672645442;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=q9cMfP7OE6E07iR8fMmtUxxNGZgE/OhOLHQsR7JRTcE=;
	b=LtReYIYbRonwtOlb1tuR9cF7ohBmz0PXZKP99loBDH4m29OdfO7pLvutZ+CQl4EdQZs1+h
	EVGHcllJ4dz3lMoQqrJPVdsvdiMp7HBcD5JFRDKKJ1HGPFoaPLn0q0maZsykII6A4GqIgm
	nNbAzhpP7aNgFfzOSQTNOcYoKRuzSKc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-dU1qs9rkNN2whIhWXrMJEw-1; Mon, 02 Jan 2023 02:43:14 -0500
X-MC-Unique: dU1qs9rkNN2whIhWXrMJEw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B002C85C6E4;
	Mon,  2 Jan 2023 07:43:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9AE592166B26;
	Mon,  2 Jan 2023 07:43:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 574A319465A0;
	Mon,  2 Jan 2023 07:43:00 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C72051946587
 for <dm-devel@listman.corp.redhat.com>; Fri, 16 Dec 2022 04:41:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 45FAE2166B2A; Fri, 16 Dec 2022 04:41:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E65F2166B26
 for <dm-devel@redhat.com>; Fri, 16 Dec 2022 04:41:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 203B03C0F7F9
 for <dm-devel@redhat.com>; Fri, 16 Dec 2022 04:41:31 +0000 (UTC)
Received: from dggsgout11.his.huawei.com (hwsga01-in.huaweimarine.com
 [45.249.212.51]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-329-wgoD2j4CNH6lQvOjCR5VjA-1; Thu, 15 Dec 2022 23:41:28 -0500
X-MC-Unique: wgoD2j4CNH6lQvOjCR5VjA-1
Received: from mail02.huawei.com (unknown [172.30.67.153])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4NYGFR3GHhz4f3p1c;
 Fri, 16 Dec 2022 12:23:55 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.124.27])
 by APP4 (Coremail) with SMTP id gCh0CgD3Z9Xc8ptj4ChDCQ--.22309S4;
 Fri, 16 Dec 2022 12:23:58 +0800 (CST)
From: Hou Tao <houtao@huaweicloud.com>
To: dm-devel@redhat.com
Date: Fri, 16 Dec 2022 12:23:53 +0800
Message-Id: <20221216042353.3132139-1-houtao@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgD3Z9Xc8ptj4ChDCQ--.22309S4
X-Coremail-Antispam: 1UD129KBjvJXoW7uw4DKFWUArWkJF1DGr4fuFg_yoW8AF4Dpr
 4YgrWavrykJFsFgr4jvanxuF90gw1Yk3yUGryIk34Y93W5u3WUWay5GF92qFyrKFZ7AFWY
 gF1Ig3y5AF4DJwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUgCb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
 6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
 vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
 xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
 0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
 x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
 z7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zV
 AF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4l
 IxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s
 0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsG
 vfC2KfnxnUUI43ZEXa7IU1zuWJUUUUU==
X-CM-SenderInfo: xkrx3t3r6k3tpzhluzxrxghudrp/
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Mon, 02 Jan 2023 07:42:59 +0000
Subject: [dm-devel] [PATCH] dm: remove unnecessary check when using
 dm_get_mdptr()
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
Cc: Mike Snitzer <snitzer@kernel.org>, linux-kernel@vger.kernel.org,
 Alasdair Kergon <agk@redhat.com>, houtao1@huawei.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Hou Tao <houtao1@huawei.com>

__hash_remove() removes hash_cell with _hash_lock locked, so acquiring
_hash_lock can guarantee no-NULL hc returned from dm_get_mdptr() must
have not been removed and hc->md must still be md.

__hash_remove() also acquires dm_hash_cells_mutex before setting mdptr
as NULL, so in dm_copy_name_and_uuid() after acquiring
dm_hash_cells_mutex and ensuring returned hc is not NULL, the returned
hc must still be alive and hc->md must still be md.

So removing these unnecessary hc->md != md checks when using
dm_get_mdptr() with _hash_lock or dm_hash_cells_mutex acquired.

Signed-off-by: Hou Tao <houtao1@huawei.com>
---
 drivers/md/dm-ioctl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/md/dm-ioctl.c b/drivers/md/dm-ioctl.c
index 3bfc1583c20a..2a86524661d1 100644
--- a/drivers/md/dm-ioctl.c
+++ b/drivers/md/dm-ioctl.c
@@ -772,7 +772,7 @@ static struct dm_table *dm_get_inactive_table(struct mapped_device *md, int *src
 
 	down_read(&_hash_lock);
 	hc = dm_get_mdptr(md);
-	if (!hc || hc->md != md) {
+	if (!hc) {
 		DMERR("device has been removed from the dev hash table.");
 		goto out;
 	}
@@ -1476,7 +1476,7 @@ static int table_load(struct file *filp, struct dm_ioctl *param, size_t param_si
 	/* stage inactive table */
 	down_write(&_hash_lock);
 	hc = dm_get_mdptr(md);
-	if (!hc || hc->md != md) {
+	if (!hc) {
 		DMERR("device has been removed from the dev hash table.");
 		up_write(&_hash_lock);
 		r = -ENXIO;
@@ -2128,7 +2128,7 @@ int dm_copy_name_and_uuid(struct mapped_device *md, char *name, char *uuid)
 
 	mutex_lock(&dm_hash_cells_mutex);
 	hc = dm_get_mdptr(md);
-	if (!hc || hc->md != md) {
+	if (!hc) {
 		r = -ENXIO;
 		goto out;
 	}
-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

