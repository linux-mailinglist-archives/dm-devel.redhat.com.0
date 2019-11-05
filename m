Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3045BF10EE
	for <lists+dm-devel@lfdr.de>; Wed,  6 Nov 2019 09:20:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573028437;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6lerOSNjMpVObrum8E5SKsbtMtV2XJBAluXcVrjGJSU=;
	b=WnnxFm4jqt0bwA/BT7Zwy5TqFbq84UhAZLAppy7VySrHwuTIO764sEqK4RFB5rKjbr+9t4
	U8C4OIuRGPiVU/ooS2ba3Vvwy/aKsQI2TeV83VkgY7AdlEERVVJKMhm/SFkkkGDysd7IhW
	6LY3dIMD7gEXkyT4vjfMafmydusWqx4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-K7bdWap5PHOlKrUSZ7fMQw-1; Wed, 06 Nov 2019 03:20:35 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D806C1005500;
	Wed,  6 Nov 2019 08:20:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9381260CDA;
	Wed,  6 Nov 2019 08:20:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C2A8518089CD;
	Wed,  6 Nov 2019 08:20:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA5KuHXA001432 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 5 Nov 2019 15:56:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1EF041001902; Tue,  5 Nov 2019 20:56:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx23.extmail.prod.ext.phx2.redhat.com
	[10.5.110.64])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1920210018FF
	for <dm-devel@redhat.com>; Tue,  5 Nov 2019 20:56:14 +0000 (UTC)
Received: from gateway22.websitewelcome.com (gateway22.websitewelcome.com
	[192.185.46.233])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 67BA81017C17
	for <dm-devel@redhat.com>; Tue,  5 Nov 2019 20:56:13 +0000 (UTC)
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
	by gateway22.websitewelcome.com (Postfix) with ESMTP id 0F6105EA9
	for <dm-devel@redhat.com>; Tue,  5 Nov 2019 14:56:13 -0600 (CST)
Received: from host2059.hostmonster.com ([67.20.112.233]) by cmsmtp with SMTP
	id S5s4iYwUWiJ43S5s4i8zZN; Tue, 05 Nov 2019 14:56:13 -0600
X-Authority-Reason: nr=8
Received: from [196.157.86.137] (port=16534 helo=[192.168.100.138])
	by host2059.hostmonster.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
	(envelope-from <mmokhtar@petasan.org>)
	id 1iS5s3-004He2-RG; Tue, 05 Nov 2019 13:56:12 -0700
To: msnitzer@redhat.com, Mikulas Patocka <mpatocka@redhat.com>,
	dm-devel@redhat.com
From: Maged Mokhtar <mmokhtar@petasan.org>
Message-ID: <10babc69-1bbf-bd98-23ba-a6f1dbf137a1@petasan.org>
Date: Tue, 5 Nov 2019 22:56:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - host2059.hostmonster.com
X-AntiAbuse: Original Domain - redhat.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - petasan.org
X-BWhitelist: no
X-Source-IP: 196.157.86.137
X-Source-L: No
X-Exim-ID: 1iS5s3-004He2-RG
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.100.138]) [196.157.86.137]:16534
X-Source-Auth: mmokhtar@petasan.org
X-Email-Count: 3
X-Source-Cap: cGV0YXNhbm87cGV0YXNhbm87aG9zdDIwNTkuaG9zdG1vbnN0ZXIuY29t
X-Local-Domain: yes
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.64]); Tue, 05 Nov 2019 20:56:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]);
	Tue, 05 Nov 2019 20:56:13 +0000 (UTC) for IP:'192.185.46.233'
	DOMAIN:'gateway22.websitewelcome.com'
	HELO:'gateway22.websitewelcome.com' FROM:'mmokhtar@petasan.org'
	RCPT:''
X-RedHat-Spam-Score: 0.551  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_PASS,
	SPF_NEUTRAL) 192.185.46.233 gateway22.websitewelcome.com 192.185.46.233
	gateway22.websitewelcome.com <mmokhtar@petasan.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.64
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 06 Nov 2019 03:19:57 -0500
Subject: [dm-devel]  [PATCH v1] dm writecache: handle REQ_FUA
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: K7bdWap5PHOlKrUSZ7fMQw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

Call writecache_flush() on REQ_FUA

Signed-off-by: Maged Mokhtar <mmokhtar@petasan.org>
Acked-By: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org	# 4.18+
---
  drivers/md/dm-writecache.c |    3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)

--- a/drivers/md/dm-writecache.c    2019-10-23 22:01:18.480115962 +0200
+++ b/drivers/md/dm-writecache.c    2019-10-23 22:02:08.616113729 +0200
@@ -1218,7 +1218,8 @@ bio_copy:
              }
          } while (bio->bi_iter.bi_size);

-        if (unlikely(wc->uncommitted_blocks >= wc->autocommit_blocks))
+        if (unlikely(bio->bi_opf & REQ_FUA ||
+                wc->uncommitted_blocks >= wc->autocommit_blocks))
              writecache_flush(wc);
          else
              writecache_schedule_autocommit(wc);

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

