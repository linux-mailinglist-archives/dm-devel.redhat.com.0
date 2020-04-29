Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 83E361BD779
	for <lists+dm-devel@lfdr.de>; Wed, 29 Apr 2020 10:45:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588149900;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=myzjTrxe4GozZhOazBkl13wXAq3dwmnnN+m4qhfsN1Y=;
	b=KY1CFmj0L4sjMpEf3Q4xCGjN+VN9nH8MLPv4D4wFLkcCauxLCZJSDU3Voqh2C5VovuQDjh
	n5LdTXQ4XaochkmU38DA/hPN9yJKqzNuaYLtN8C/UcV0piNkO38iFnrPb0G3yeN3gD9tLD
	0P10mIc+t1i4y4uHUOBOb8pFOb2m8Zs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-pmBS0EcpPJCh4kq4_NOrww-1; Wed, 29 Apr 2020 04:44:58 -0400
X-MC-Unique: pmBS0EcpPJCh4kq4_NOrww-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4D19835B40;
	Wed, 29 Apr 2020 08:44:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C25125D9E5;
	Wed, 29 Apr 2020 08:44:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 91E054CAA0;
	Wed, 29 Apr 2020 08:44:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03T1jfxK014974 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 28 Apr 2020 21:45:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9479D11701C0; Wed, 29 Apr 2020 01:45:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9068110166FC
	for <dm-devel@redhat.com>; Wed, 29 Apr 2020 01:45:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DAF3101A525
	for <dm-devel@redhat.com>; Wed, 29 Apr 2020 01:45:39 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-91-xwN6LF3IP8O3oIZlOho9tA-1; Tue, 28 Apr 2020 21:45:36 -0400
X-MC-Unique: xwN6LF3IP8O3oIZlOho9tA-1
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 39C73D156B92EE82E5D6;
	Wed, 29 Apr 2020 09:45:33 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS410-HUB.china.huawei.com
	(10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Wed, 29 Apr 2020
	09:45:22 +0800
From: Zheng Bin <zhengbin13@huawei.com>
To: <agk@redhat.com>, <snitzer@redhat.com>, <dm-devel@redhat.com>
Date: Wed, 29 Apr 2020 09:52:31 +0800
Message-ID: <20200429015231.107422-1-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03T1jfxK014974
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 29 Apr 2020 04:44:31 -0400
Cc: zhengbin13@huawei.com
Subject: [dm-devel] [PATCH] dm ebs: make symbol 'dm_ebs_init',
	'dm_ebs_exit' static
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

Fix sparse warnings:

drivers/md/dm-ebs-target.c:423:12: warning: symbol 'dm_ebs_init' was not declared. Should it be static?
drivers/md/dm-ebs-target.c:433:6: warning: symbol 'dm_ebs_exit' was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
---
 drivers/md/dm-ebs-target.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-ebs-target.c b/drivers/md/dm-ebs-target.c
index a412647b7acc..19125dd85214 100644
--- a/drivers/md/dm-ebs-target.c
+++ b/drivers/md/dm-ebs-target.c
@@ -420,7 +420,7 @@ static struct target_type ebs_target = {
 	.iterate_devices = ebs_iterate_devices,
 };

-int __init dm_ebs_init(void)
+static int __init dm_ebs_init(void)
 {
 	int r = dm_register_target(&ebs_target);

@@ -430,7 +430,7 @@ int __init dm_ebs_init(void)
 	return r;
 }

-void dm_ebs_exit(void)
+static void dm_ebs_exit(void)
 {
 	dm_unregister_target(&ebs_target);
 }
--
2.26.0.106.g9fadedd


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

