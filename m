Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C36F3BAFCD
	for <lists+dm-devel@lfdr.de>; Mon, 23 Sep 2019 10:40:47 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1367E307D90D;
	Mon, 23 Sep 2019 08:40:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DDD5C5D713;
	Mon, 23 Sep 2019 08:40:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A0592180085A;
	Mon, 23 Sep 2019 08:40:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8MJdGqx022305 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 22 Sep 2019 15:39:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B24FB60C80; Sun, 22 Sep 2019 19:39:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC1EC60C63
	for <dm-devel@redhat.com>; Sun, 22 Sep 2019 19:39:14 +0000 (UTC)
Received: from gproxy1-pub.mail.unifiedlayer.com
	(gproxy1-pub.mail.unifiedlayer.com [69.89.25.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B1F7885360
	for <dm-devel@redhat.com>; Sun, 22 Sep 2019 19:39:13 +0000 (UTC)
Received: from cmgw15.unifiedlayer.com (unknown [10.9.0.15])
	by gproxy1.mail.unifiedlayer.com (Postfix) with ESMTP id 82C26DE693ABF
	for <dm-devel@redhat.com>; Sun, 22 Sep 2019 13:39:11 -0600 (MDT)
Received: from host449.hostmonster.com ([67.20.76.149]) by cmsmtp with ESMTP
	id C7hPiZaWdBeseC7hPiBWSX; Sun, 22 Sep 2019 13:39:11 -0600
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=YcOTGTZf c=1 sm=1 tr=0
	a=yEtxjLh4/o1uitG8KVajyg==:117 a=yEtxjLh4/o1uitG8KVajyg==:17
	a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=IkcTkHD0fZMA:10:nop_charset_1
	a=J70Eh1EUuV4A:10:nop_rcvd_month_year
	a=KDLhjfZvl3oA:10:endurance_base64_authed_username_1 a=qT-TnOy5AAAA:8
	a=h3Oyiwak1teKTfzpQGYA:9 a=QEXdDO2ut3YA:10:nop_charset_2
	a=0jIuqRY4CROcQgrwc8YH:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=petasan.org
	; s=default;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
	Message-ID:Cc:Subject:From:To:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=JI6/JCiXHi9iVljplCegRbIAKZK8KSZDY4hTRMmgzus=;
	b=vvgq+NVCPS8WrlLsIK2omDbU0s
	Jkna0uul5UVKAcvN35OVo9UdqlAlE5vwYjMEYo+y1vGaWJ75NPXgBzxFu2VTeOJ4Ek8/nQVa7J45G
	oHYatEKvmoG6RnueYjuDA+msFM35K333XI1Cxy03MSakd5on2WoD1Mu9Fl3SpmdkkF5AEn4vWgyRE
	fkUK7LwY3bC2fTRDjJk0FNFfstGXplyjkMIPsUfbqTKDdDOB6Vy1Be+iU7B4zfpaW0tid5sYKXD3v
	TJJ64e2WIHXqQGWtMPiyB4aUlh2sBJ+9hNKExXPtfJhaUq3nALVCS6Se8wwvJf3+CTNv4RpK6tb0y
	hnBAlIHA==;
Received: from [196.154.129.70] (port=44058 helo=[192.168.100.132])
	by host449.hostmonster.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
	(envelope-from <mmokhtar@petasan.org>)
	id 1iC7hO-000ivY-OM; Sun, 22 Sep 2019 13:39:11 -0600
To: mpatocka@redhat.com
From: Maged Mokhtar <mmokhtar@petasan.org>
Message-ID: <fa95f1f0-67d6-d02e-6999-ba1f90d70fe2@petasan.org>
Date: Sun, 22 Sep 2019 21:39:06 +0200
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
X-Source-IP: 196.154.129.70
X-Source-L: No
X-Exim-ID: 1iC7hO-000ivY-OM
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.100.132]) [196.154.129.70]:44058
X-Source-Auth: mmokhtar@petasan.org
X-Email-Count: 3
X-Source-Cap: cGV0YXNhbm87cGV0YXNhbm87aG9zdDQ0OS5ob3N0bW9uc3Rlci5jb20=
X-Local-Domain: yes
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.25]); Sun, 22 Sep 2019 19:39:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Sun, 22 Sep 2019 19:39:13 +0000 (UTC) for IP:'69.89.25.95'
	DOMAIN:'gproxy1-pub.mail.unifiedlayer.com'
	HELO:'gproxy1-pub.mail.unifiedlayer.com'
	FROM:'mmokhtar@petasan.org' RCPT:''
X-RedHat-Spam-Score: -0.101  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 69.89.25.95 gproxy1-pub.mail.unifiedlayer.com 69.89.25.95
	gproxy1-pub.mail.unifiedlayer.com <mmokhtar@petasan.org>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 23 Sep 2019 04:38:28 -0400
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm-writecache: change config parameters using
 messages
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Mon, 23 Sep 2019 08:40:46 +0000 (UTC)

Support changing configuration parameters using device-mapper messages
E.g.
    dmsetup message vg1/lv1 0 high_watermark 60

Signed-off-by: Maged Mokhtar <mmokhtar@petasan.org>
---
  drivers/md/dm-writecache.c |   68 +++++++++++++++++++++++++++++++++++
  1 file changed, 68 insertions(+)

--- a/drivers/md/dm-writecache.c	2019-08-25 16:13:54.000000000 +0200
+++ b/drivers/md/dm-writecache.c	2019-09-21 16:22:23.000000000 +0200
@@ -1009,6 +1009,69 @@ static int process_flush_on_suspend_mesg
  	return 0;
  }

+static int set_config_value(struct dm_writecache *wc, char *key, char *val)
+{
+	unsigned v,x;
+	if (sscanf(val, "%u", &v) != 1)
+		return -EINVAL;
+	if (!strcasecmp(key, "high_watermark")) {
+		if (v < 0 || v > 100)
+			return -EINVAL;
+		wc_lock(wc);
+		x = (uint64_t)wc->n_blocks * (100 - v);
+		x += 50;
+		do_div(x, 100);
+		if (wc->freelist_low_watermark < x) {
+			wc_unlock(wc);
+			return -EINVAL;
+		}
+		wc->freelist_high_watermark = x;
+		wc->high_wm_percent_set = true;
+		if (wc->freelist_size + wc->writeback_size
+			<= wc->freelist_high_watermark)
+			queue_work(wc->writeback_wq, &wc->writeback_work);
+		wc_unlock(wc);
+	}
+	else if (!strcasecmp(key, "low_watermark")) {
+		if (v < 0 || v > 100)
+			return -EINVAL;
+		wc_lock(wc);
+		x = (uint64_t)wc->n_blocks * (100 - v);
+		x += 50;
+		do_div(x, 100);
+		if (x < wc->freelist_high_watermark) {
+			wc_unlock(wc);
+			return -EINVAL;
+		}
+		wc->freelist_low_watermark = x;
+		wc->low_wm_percent_set = true;
+		wc_unlock(wc);
+	}
+	else if (!strcasecmp(key, "writeback_jobs")) {
+		wc_lock(wc);
+		wc->max_writeback_jobs = v;
+		wc->max_writeback_jobs_set = true;
+		wc_unlock(wc);
+	}
+	else if (!strcasecmp(key, "autocommit_blocks")) {
+		wc_lock(wc);
+		wc->autocommit_blocks = v;
+		wc->autocommit_blocks_set = true;
+		wc_unlock(wc);
+	}
+	else if (!strcasecmp(key, "autocommit_time")) {
+		if (v < 1 || v > 3600000)
+			return -EINVAL;
+		wc_lock(wc);
+		wc->autocommit_jiffies = msecs_to_jiffies(v);
+		wc->autocommit_time_set = true;
+		wc_unlock(wc);
+	}
+	else
+		return -EINVAL;
+	return 0;
+}
+
  static int writecache_message(struct dm_target *ti, unsigned argc, 
char **argv,
  			      char *result, unsigned maxlen)
  {
@@ -1019,6 +1082,11 @@ static int writecache_message(struct dm_
  		r = process_flush_mesg(argc, argv, wc);
  	else if (!strcasecmp(argv[0], "flush_on_suspend"))
  		r = process_flush_on_suspend_mesg(argc, argv, wc);
+	else if (argc==2) {
+		r = set_config_value(wc, argv[0], argv[1]);
+		if (r==-EINVAL)
+			DMERR("invalid message received: %s %s", argv[0], argv[1]);
+	}
  	else
  		DMERR("unrecognised message received: %s", argv[0]);

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
