Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D3DF91CE847
	for <lists+dm-devel@lfdr.de>; Tue, 12 May 2020 00:40:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589236836;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vt+t0bJLhhsm1eZnxixx3xMR9loGd6+00wD73SVerKs=;
	b=F8pKgCGgKd+PIGHx7ksDyF+uPUwdOqK0fg5g74Hbx/5VITUQ0Zx9k/7pGijxeB1cDvqL5y
	JN/CLqltnEPvyThWwQbWJ5KNjq7g7QLBeBJfLsKFq4V2Alg1jhnr/E2P3IWhzlZ46WCpbA
	EdxHOT+0lWZUUT/Zf/O0hWcOEaZYYdM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-02Ax8TFjNwObOGIrIJJ18w-1; Mon, 11 May 2020 18:40:33 -0400
X-MC-Unique: 02Ax8TFjNwObOGIrIJJ18w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B11D805726;
	Mon, 11 May 2020 22:40:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BF8C5D782;
	Mon, 11 May 2020 22:40:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0172A1809557;
	Mon, 11 May 2020 22:40:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04BMe0QS016093 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 18:40:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ADCC52156A22; Mon, 11 May 2020 22:40:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA5FA2156A3B
	for <dm-devel@redhat.com>; Mon, 11 May 2020 22:40:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95A12811768
	for <dm-devel@redhat.com>; Mon, 11 May 2020 22:40:00 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-508-SmuWsgl1Or6V9-7ltFbEcg-1;
	Mon, 11 May 2020 18:39:57 -0400
X-MC-Unique: SmuWsgl1Or6V9-7ltFbEcg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id B5EDDAE96;
	Mon, 11 May 2020 22:39:57 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue, 12 May 2020 00:39:31 +0200
Message-Id: <20200511223931.18261-12-mwilck@suse.com>
In-Reply-To: <20200511223931.18261-1-mwilck@suse.com>
References: <20200511223931.18261-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04BMe0QS016093
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 11/11] multipath-tools tests/directio: fix
	-Wmaybe-uninitalized warning
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Initialize aio_grp to satisfy gcc.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 tests/directio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/directio.c b/tests/directio.c
index 3cd7a520..66aaf0eb 100644
--- a/tests/directio.c
+++ b/tests/directio.c
@@ -316,7 +316,7 @@ static void test_init_free(void **state)
 {
 	int i, count = 0;
 	struct checker c[4096] = {0};
-	struct aio_group *aio_grp;
+	struct aio_group *aio_grp = NULL;
 
 	assert_true(list_empty(&aio_grp_list));
 	will_return(__wrap_io_setup, 0);
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

