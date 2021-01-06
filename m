Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D1B302EB7BA
	for <lists+dm-devel@lfdr.de>; Wed,  6 Jan 2021 02:40:11 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-8XiNs1kgOkSk0wf47nk5Mw-1; Tue, 05 Jan 2021 20:40:08 -0500
X-MC-Unique: 8XiNs1kgOkSk0wf47nk5Mw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A543C107ACE3;
	Wed,  6 Jan 2021 01:40:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DB7F7095D;
	Wed,  6 Jan 2021 01:39:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 374464A7C6;
	Wed,  6 Jan 2021 01:39:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1061dQGF019413 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 5 Jan 2021 20:39:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 08F4D2166B2B; Wed,  6 Jan 2021 01:39:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0360A2166B2A
	for <dm-devel@redhat.com>; Wed,  6 Jan 2021 01:39:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF231858281
	for <dm-devel@redhat.com>; Wed,  6 Jan 2021 01:39:20 +0000 (UTC)
Received: from chinatelecom.cn (prt-mail.chinatelecom.cn [42.123.76.227]) by
	relay.mimecast.com with ESMTP id us-mta-133-VmNab9akPWOIyXX8ZV7Lxw-1;
	Tue, 05 Jan 2021 20:39:18 -0500
X-MC-Unique: VmNab9akPWOIyXX8ZV7Lxw-1
HMM_SOURCE_IP: 172.18.0.92:39498.940160285
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-202.80.192.21?logid-3deb66b94880473280264ba746cc7a1c
	(unknown [172.18.0.92])
	by chinatelecom.cn (HERMES) with SMTP id BEF332800C0;
	Wed,  6 Jan 2021 09:39:14 +0800 (CST)
X-189-SAVE-TO-SEND: wucy11@chinatelecom.cn
Received: from  ([172.18.0.92])
	by App0021 with ESMTP id 3deb66b94880473280264ba746cc7a1c for
	zhangzijian@chinatelecom.cn; Wed Jan  6 09:39:15 2021
X-Transaction-ID: 3deb66b94880473280264ba746cc7a1c
X-filter-score: filter<0>
X-Real-From: wucy11@chinatelecom.cn
X-Receive-IP: 172.18.0.92
X-MEDUSA-Status: 0
From: Chongyun Wu <wucy11@chinatelecom.cn>
To: "mwilck@suse.com" <mwilck@suse.com>,
	"bmarzins@redhat.com" <bmarzins@redhat.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
Message-ID: <4a94424e-5fae-0f7f-b9be-56ccb5f1a0df@chinatelecom.cn>
Date: Wed, 6 Jan 2021 09:39:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.6.0
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: yubin1@chinatelecom.cn, zhangzijian@chinatelecom.cn
Subject: [dm-devel] [PATCH v3 resend] multipathd: fix path checkint not
 changed when path state changed from delay to failed
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Thank you, Ben and Martin, this is the resend version in text format.

 From 45dad5fa6a9fb42648c8f5f54d6db974974d9612 Mon Sep 17 00:00:00 2001
From: Chongyun Wu <wucy11@chinatelecom.cn>
Date: Wed, 16 Dec 2020 13:59:16 +0800
Subject: [PATCH] multipathd: fix path checkint not changed when path 
state changed from delay to failed

Check_path: when path state change back to failed from delay state, 
should change this path's check interval time to the shortest delay to 
faster path state check.

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
Signed-off-by: Chongyun Wu <wucy11@chinatelecom.cn>
---
  multipathd/main.c | 5 +++++
  1 file changed, 5 insertions(+)

diff --git a/multipathd/main.c b/multipathd/main.c
index a4abbb27..9fd34e97 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -2166,6 +2166,11 @@ check_path (struct vectors * vecs, struct path * 
pp, unsigned int ticks)
  			(pp->state == PATH_DELAYED)) {
  		/* If path state become failed again cancel path delay state */
  		pp->state = newstate;
+		/*
+		 * path state bad again should change the check interval time
+		 * to the shortest delay
+		 */
+		pp->checkint = checkint;
  		return 1;
  	}
  	if (!pp->mpp) {
-- 
2.29.2.windows.3

-- 
Best Regard,
Chongyun Wu

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

