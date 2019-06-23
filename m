Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A6ED34FA58
	for <lists+dm-devel@lfdr.de>; Sun, 23 Jun 2019 07:39:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 592EB30862BE;
	Sun, 23 Jun 2019 05:39:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BCD95C21F;
	Sun, 23 Jun 2019 05:39:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2276B1806B0F;
	Sun, 23 Jun 2019 05:39:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5N5ceRv029665 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 23 Jun 2019 01:38:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 172E65DA2E; Sun, 23 Jun 2019 05:38:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 123915D96E
	for <dm-devel@redhat.com>; Sun, 23 Jun 2019 05:38:37 +0000 (UTC)
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 91ADE83F4C
	for <dm-devel@redhat.com>; Sun, 23 Jun 2019 05:38:36 +0000 (UTC)
Received: from remote.user (localhost [127.0.0.1])
	by rere.qmqm.pl (Postfix) with ESMTPSA id 45Wh4c6WQxzBl
	for <dm-devel@redhat.com>; Sun, 23 Jun 2019 07:36:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
	t=1561268209; bh=k0b8TuD+nEoLtTpOMtff4P/AXVEYXio5wIpitPgG4O0=;
	h=Date:From:To:Subject:From;
	b=XDvqrlvtScH3aUky5Zn3Wgz7Aeo9ghMXwq97+RjRHAQVGg0YeipA+A4+DQUF2KRW6
	z3bO4aA88CNZiqioKMjwNZIK8QPLMygQHJBreLc1RBzjxiEv3uqzEcP89YUKn9G3Vg
	HLdulW2IdKRV3P0tmqLK5ksM+cm6TLLAZ3PlZ6JHxZwrJXJtJcutzJBAJUwRd1yBcC
	RdWNt2QjxSZVeYlM7A3RJEjLX7b94mA16u7yU5l0D/lGB/exu12Dn865w4K3Q3bBqD
	1/Ibz/zqONiBlRFWdKQMINi9L5AYm+oesQF7ukdDPkBIjGd7VhiXZr5lS77hbbrgxF
	qqjoQkm8feUrw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at mail
Date: Sun, 23 Jun 2019 07:38:33 +0200
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: dm-devel@redhat.com
Message-ID: <20190623053832.GA29748@qmqm.qmqm.pl>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender passed SPF test, ACL 242 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Sun, 23 Jun 2019 05:38:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Sun, 23 Jun 2019 05:38:37 +0000 (UTC) for IP:'91.227.64.183'
	DOMAIN:'rere.qmqm.pl' HELO:'rere.qmqm.pl'
	FROM:'mirq-linux@rere.qmqm.pl' RCPT:''
X-RedHat-Spam-Score: -0.102  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	SPF_HELO_PASS,
	SPF_PASS) 91.227.64.183 rere.qmqm.pl 91.227.64.183 rere.qmqm.pl
	<mirq-linux@rere.qmqm.pl>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Subject: [dm-devel] dm-cache (lack-of) efficiency
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Sun, 23 Jun 2019 05:39:53 +0000 (UTC)

Dear DM Developers,

I stumbled on a weird (and annoing) behaviour of dm-cache: after unclean
reboot (sysrq + s,u,b) it marks all the cache as dirty and starts to
write it back. This takes a few hours every time (cache data is on SSD,
but backing storage is very slow for random access) and mostly kills
interactivity for anything that touches the cached volume.

This seems to ignore cache mode: write-through is also affected, even when
it should not ever have a dirty state. Switching from write-through to
write-back also resets cache to all-dirty and generates the same situation.

Why is write-through cache considered dirty when switching to write-back?

Is there a way to sort the requests, so the writes are monotonic wrt
sector number?

Can the dirty state be written to metadata storage on SysRq+S?

Best Regards,
Micha=B3=A0Miros=B3aw

---
# uname -a
Linux qmqm 5.1.13mq+ #321 SMP PREEMPT Sun Jun 23 03:14:18 CEST 2019 x86_64 =
GNU/Linux

# dmsetup table |grep sources
fox-sources_corig: 0 335544320 linear 253:6 209717248
fox-sources_corig: 335544320 83886080 linear 253:6 1048578048
fox-sources_corig: 419430400 104857600 linear 253:6 1174407168
fox-c_sources_cdata: 0 31350784 linear 253:4 116736
fox-sources: 0 524288000 cache 253:12 253:11 253:13 64 2 metadata2 writethr=
ough smq 0
fox-c_sources_cmeta: 0 57344 linear 253:4 59392

# lvmcache-stats fox/sources
start              0
end                524288000
segment_type       cache
md_block_size      8
md_utilization     1480/7168
cache_block_size   64
cache_utilization  489856/489856
read_hits          2027069
read_misses        144887
read_hit_ratio     93.33%
write_hits         331428
write_misses       112870
write_hit_ratio    74.60%
demotions          0
promotions         0
dirty              314362
features           3

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
