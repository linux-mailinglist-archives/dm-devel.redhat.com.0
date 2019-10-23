Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E3FB1E2C35
	for <lists+dm-devel@lfdr.de>; Thu, 24 Oct 2019 10:32:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571905935;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YtGaHHuFLg7rtxRQQyQOQ4cH1bri+CsmouwMHYfHuLk=;
	b=K5gQHuvE1DfIKsOdOzTNQ4/RVPqzanhP54hA6Q8RO2a8MvKCZb57eltYGV2LoZUBGu+eiw
	Uv/o21GDMgaI0KWR9txMd3h6Ri2MNWn3G+PzFyLUfghtiV6luwG0qgPTXbhoHjZElFbouW
	xz0p2pwdum+wYgp4pwAyga8L8Blhq18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-VAVLgiqGO2y3cQIByPCm5Q-1; Thu, 24 Oct 2019 04:32:10 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA01B5EC;
	Thu, 24 Oct 2019 08:32:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 99133600CC;
	Thu, 24 Oct 2019 08:32:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5EE2E4E58A;
	Thu, 24 Oct 2019 08:32:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9NKfU4E018744 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 23 Oct 2019 16:41:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 38BE060161; Wed, 23 Oct 2019 20:41:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 30C3760126
	for <dm-devel@redhat.com>; Wed, 23 Oct 2019 20:41:26 +0000 (UTC)
Received: from gproxy2-pub.mail.unifiedlayer.com (outbound-ss-879.bluehost.com
	[69.89.30.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0C467308A968
	for <dm-devel@redhat.com>; Wed, 23 Oct 2019 20:41:25 +0000 (UTC)
Received: from cmgw14.unifiedlayer.com (unknown [10.9.0.14])
	by gproxy2.mail.unifiedlayer.com (Postfix) with ESMTP id 3A7591E0DDB
	for <dm-devel@redhat.com>; Wed, 23 Oct 2019 14:41:23 -0600 (MDT)
Received: from host449.hostmonster.com ([67.20.76.149]) by cmsmtp with ESMTP
	id NNRbigFhwhwcbNNRbiqQim; Wed, 23 Oct 2019 14:41:23 -0600
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=O4YXQi1W c=1 sm=1 tr=0
	a=yEtxjLh4/o1uitG8KVajyg==:117 a=yEtxjLh4/o1uitG8KVajyg==:17
	a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=IkcTkHD0fZMA:10:nop_charset_1
	a=XobE76Q3jBoA:10:nop_rcvd_month_year
	a=KDLhjfZvl3oA:10:endurance_base64_authed_username_1 a=qT-TnOy5AAAA:8
	a=etLHE68Vm91fzu6RrPoA:9 a=QEXdDO2ut3YA:10:nop_charset_2
	a=0jIuqRY4CROcQgrwc8YH:22
Received: from [196.145.143.122] (port=9586 helo=[192.168.100.138])
	by host449.hostmonster.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
	(envelope-from <mmokhtar@petasan.org>)
	id 1iNNRa-001ACl-D4; Wed, 23 Oct 2019 14:41:23 -0600
To: Mikulas Patocka <mpatocka@redhat.com>, dm-devel@redhat.com
From: Maged Mokhtar <mmokhtar@petasan.org>
Message-ID: <be77e96c-5d37-a9de-b0ed-ee15d0c59215@petasan.org>
Date: Wed, 23 Oct 2019 22:41:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - host449.hostmonster.com
X-AntiAbuse: Original Domain - redhat.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - petasan.org
X-BWhitelist: no
X-Source-IP: 196.145.143.122
X-Source-L: No
X-Exim-ID: 1iNNRa-001ACl-D4
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.100.138]) [196.145.143.122]:9586
X-Source-Auth: mmokhtar@petasan.org
X-Email-Count: 3
X-Source-Cap: cGV0YXNhbm87cGV0YXNhbm87aG9zdDQ0OS5ob3N0bW9uc3Rlci5jb20=
X-Local-Domain: yes
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.41]); Wed, 23 Oct 2019 20:41:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Wed, 23 Oct 2019 20:41:25 +0000 (UTC) for IP:'69.89.30.202'
	DOMAIN:'outbound-ss-879.bluehost.com'
	HELO:'gproxy2-pub.mail.unifiedlayer.com'
	FROM:'mmokhtar@petasan.org' RCPT:''
X-RedHat-Spam-Score: -0.101  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 69.89.30.202 outbound-ss-879.bluehost.com 69.89.30.202
	outbound-ss-879.bluehost.com <mmokhtar@petasan.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 24 Oct 2019 04:29:52 -0400
Subject: [dm-devel]  [PATCH] dm writecache: handle REQ_FUA
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: VAVLgiqGO2y3cQIByPCm5Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

Call writecache_flush() on REQ_FUA.

Signed-off-by: Maged Mokhtar <mmokhtar@petasan.org>
---
  drivers/md/dm-writecache.c |    3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)

--- a/drivers/md/dm-writecache.c	2019-10-23 22:01:18.480115962 +0200
+++ b/drivers/md/dm-writecache.c	2019-10-23 22:02:08.616113729 +0200
@@ -1218,7 +1218,8 @@ bio_copy:
  			}
  		} while (bio->bi_iter.bi_size);

-		if (unlikely(wc->uncommitted_blocks >= wc->autocommit_blocks))
+		if (unlikely(bio->bi_opf & REQ_FUA ||
+				wc->uncommitted_blocks >= wc->autocommit_blocks))
  			writecache_flush(wc);
  		else
  			writecache_schedule_autocommit(wc);

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

