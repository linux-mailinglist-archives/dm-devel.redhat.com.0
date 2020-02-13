Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4571659BF
	for <lists+dm-devel@lfdr.de>; Thu, 20 Feb 2020 10:06:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582189583;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QWBdTdQk0qaeOgmZg1en38kRf90AAUc5voVwBxMDQNo=;
	b=XTTmkzO566pfwBkUDMEFkZoHFwqquBotNXfYuKlQJ/1gSa7MQV9h2POG3JbQ8Y/rSRRf0x
	kCUnDxBhTIyA/3sgGyEouNHc04bsXicCwqiTq4CEvzYB6hie8lbUN/yTXqiMT7v9f/U0Ec
	L3gfJa6oPEfgUSCUDc0e/SauRutSV+I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-c6TrTRTsNnSd9J_6hdWukA-1; Thu, 20 Feb 2020 04:06:20 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EFEB18AB2C6;
	Thu, 20 Feb 2020 09:06:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFB9B5DA7B;
	Thu, 20 Feb 2020 09:06:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 42CE98B2C8;
	Thu, 20 Feb 2020 09:06:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01D425Bc002121 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Feb 2020 23:02:06 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 644FC2093CFC; Thu, 13 Feb 2020 04:02:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EDF92093CC1
	for <dm-devel@redhat.com>; Thu, 13 Feb 2020 04:02:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFB7E1017E73
	for <dm-devel@redhat.com>; Thu, 13 Feb 2020 04:02:01 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-143-b2FzBfyAN0a7Il0-24SiDg-1; Wed, 12 Feb 2020 23:01:19 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 5FE231F777D9C80FF576;
	Thu, 13 Feb 2020 11:45:49 +0800 (CST)
Received: from huawei.com (10.175.101.78) by DGGEMS405-HUB.china.huawei.com
	(10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Thu, 13 Feb 2020
	11:45:41 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <dm-devel@redhat.com>
Date: Thu, 13 Feb 2020 12:11:26 +0800
Message-ID: <1581567086-17807-1-git-send-email-yangyingliang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.101.78]
X-CFilter-Loop: Reflected
X-MC-Unique: b2FzBfyAN0a7Il0-24SiDg-1
X-MC-Unique: c6TrTRTsNnSd9J_6hdWukA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01D425Bc002121
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 20 Feb 2020 04:05:51 -0500
Cc: snitzer@redhat.com, agk@redhat.com, yangyingliang@huawei.com
Subject: [dm-devel] [PATCH] dm crypt: use crypt_integrity_aead() helper
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Replace test_bit(CRYPT_MODE_INTEGRITY_AEAD, XXX) with
crypt_integrity_aead().

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/md/dm-crypt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index c6a5298..3df90da 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -230,6 +230,8 @@ struct crypt_config {
 static struct scatterlist *crypt_get_sg_data(struct crypt_config *cc,
 					     struct scatterlist *sg);
 
+static bool crypt_integrity_aead(struct crypt_config *cc);
+
 /*
  * Use this to access cipher attributes that are independent of the key.
  */
@@ -346,7 +348,7 @@ static int crypt_iv_benbi_ctr(struct crypt_config *cc, struct dm_target *ti,
 	unsigned bs;
 	int log;
 
-	if (test_bit(CRYPT_MODE_INTEGRITY_AEAD, &cc->cipher_flags))
+	if (crypt_integrity_aead(cc))
 		bs = crypto_aead_blocksize(any_tfm_aead(cc));
 	else
 		bs = crypto_skcipher_blocksize(any_tfm(cc));
@@ -712,7 +714,7 @@ static int crypt_iv_random_gen(struct crypt_config *cc, u8 *iv,
 static int crypt_iv_eboiv_ctr(struct crypt_config *cc, struct dm_target *ti,
 			    const char *opts)
 {
-	if (test_bit(CRYPT_MODE_INTEGRITY_AEAD, &cc->cipher_flags)) {
+	if (crypt_integrity_aead(cc)) {
 		ti->error = "AEAD transforms not supported for EBOIV";
 		return -EINVAL;
 	}
-- 
1.8.3


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

