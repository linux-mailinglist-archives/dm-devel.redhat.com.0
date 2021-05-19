Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 27B0B3888D4
	for <lists+dm-devel@lfdr.de>; Wed, 19 May 2021 09:58:09 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-KF3g6n8hO9aKFQVhkvCywQ-1; Wed, 19 May 2021 03:58:06 -0400
X-MC-Unique: KF3g6n8hO9aKFQVhkvCywQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15C968015F5;
	Wed, 19 May 2021 07:58:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0652A5D74A;
	Wed, 19 May 2021 07:58:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 347D655344;
	Wed, 19 May 2021 07:57:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14J7pcv5023851 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 May 2021 03:51:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 35FD66E1AC; Wed, 19 May 2021 07:51:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 30AA99C056
	for <dm-devel@redhat.com>; Wed, 19 May 2021 07:51:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C4D8101A531
	for <dm-devel@redhat.com>; Wed, 19 May 2021 07:51:35 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-424-oJ-5WKTuPpuV8qqtwpxf_w-1;
	Wed, 19 May 2021 03:51:33 -0400
X-MC-Unique: oJ-5WKTuPpuV8qqtwpxf_w-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id C3F5461353;
	Wed, 19 May 2021 07:42:06 +0000 (UTC)
From: Ard Biesheuvel <ardb@kernel.org>
To: stable@vger.kernel.org
Date: Wed, 19 May 2021 09:41:24 +0200
Message-Id: <20210519074124.49890-1-ardb@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 14J7pcv5023851
X-loop: dm-devel@redhat.com
Cc: snitzer@redhat.com, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>, agk@redhat.com,
	Ard Biesheuvel <ardb@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [dm-devel] [PATCH stable] dm ioctl: fix out of bounds array access
	when no devices
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Mikulas Patocka <mpatocka@redhat.com>

commit 4edbe1d7bcffcd6269f3b5eb63f710393ff2ec7a upstream.

If there are not any dm devices, we need to zero the "dev" argument in
the first structure dm_name_list. However, this can cause out of
bounds write, because the "needed" variable is zero and len may be
less than eight.

Fix this bug by reporting DM_BUFFER_FULL_FLAG if the result buffer is
too small to hold the "nl->dev" value.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Cc: stable@vger.kernel.org
Signed-off-by: Mike Snitzer <snitzer@redhat.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
Please apply to 4.4.y and 4.9.y

 drivers/md/dm-ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-ioctl.c b/drivers/md/dm-ioctl.c
index 836a2808c0c7..eb2659a12310 100644
--- a/drivers/md/dm-ioctl.c
+++ b/drivers/md/dm-ioctl.c
@@ -524,7 +524,7 @@ static int list_devices(struct dm_ioctl *param, size_t param_size)
 	 * Grab our output buffer.
 	 */
 	nl = get_result_buffer(param, param_size, &len);
-	if (len < needed) {
+	if (len < needed || len < sizeof(nl->dev)) {
 		param->flags |= DM_BUFFER_FULL_FLAG;
 		goto out;
 	}
-- 
2.20.1


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

